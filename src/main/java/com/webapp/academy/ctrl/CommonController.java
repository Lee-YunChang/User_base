package com.webapp.academy.ctrl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kcb.module.v3.exception.OkCertException;
import kcb.org.json.JSONObject;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.google.gson.Gson;
import com.sangs.session.SessionManager;
import com.sangs.session.UserSessionManager;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.AES256Util;
import com.sangs.util.DownloadServlet;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsCryptUtil;
import com.sangs.util.SangsUtil;
import com.webapp.academy.mapper.BoardMapper;
import com.webapp.academy.service.CommonService;
import com.webapp.academy.service.UserService;
import com.webapp.classdesk.mapper.ClassdeskBoardMapper;
import com.webapp.classdesk.service.ClassdeskBoardService;
import com.webapp.classdesk.service.ClassdeskTutorDiscussService;
import com.webapp.classdesk.service.ClassdeskTutorReportService;
import com.webapp.common.service.CommonUserService;

/**
 * Description : 사용자 공통 관련 컨트롤러
 *
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.06.01   SANGS           최초작성
 *
 */

@Controller
public class CommonController {

    @Resource(name = "commonService")
    private CommonService     commonService;

    @Resource(name = "commonUserService")
    private CommonUserService commonUserService;

    @Resource(name = "userService")
    private UserService userService;

    @Resource(name = "boardMapper")
    private BoardMapper       boardMapper;
    
    @Resource(name = "classdeskTutorDiscussService")
    private ClassdeskTutorDiscussService classdeskTutorDiscussService;
    
    @Resource(name = "classdeskBoardService")
    private ClassdeskBoardService classdeskBoardService;

    @Resource(name = "classdeskBoardMapper")
    private ClassdeskBoardMapper classdeskBoardMapper;
    
    @Resource(name = "classdeskTutorReportService")
    private ClassdeskTutorReportService classdeskTutorReportService;
    
    
    private Logger log = LogManager.getLogger(CommonController.class);

    /**
     * 로그인 폼
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 로그인 폼
    @RequestMapping(value = "/academy/common/login.do")
    private String login(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        if (!("").equals(rMap.getString("SES_USERID"))) {// 로그인 했다면
            req.setAttribute("msg", "이미 로그인 상태 입니다.");
            req.setAttribute("url", "/academy/main/main.do");
            return "forward:/common/msgForward.do";
        }

        KeyPairGenerator generator;
        try {

            generator = KeyPairGenerator.getInstance("RSA");
            generator.initialize(2048);

            KeyPair keyPair = generator.genKeyPair();
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");

            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();

            HttpSession session = req.getSession();
            // 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
            session.setAttribute("__rsaPrivateKey__", privateKey);

            // 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
            req.setAttribute("publicKeyModulus", publicKeyModulus);
            req.setAttribute("publicKeyExponent", publicKeyExponent);
            req.setAttribute("returnUrl", ParamUtil.getStrParam(rMap.getString("returnUrl"),"/academy/main/main.do") );
            
            req.setAttribute("menu_nm", "mypage");
            req.setAttribute("lnb_menu", "login");
            rMap.setString("title", SangsProperties.getProperty("Globals.login"));
            
            req.setAttribute("REQUEST_DATA", rMap);

        }
        catch (NoSuchAlgorithmException e) {
            throw new FrontException(e);
        } catch (InvalidKeySpecException e) {
            throw new FrontException(e);
        }
        return "academy/cmmn/member_login";
    }

    
    
    /**
     * 간편 로그인 폼
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 로그인 폼
    @RequestMapping(value = "/academy/common/nonLogin.do")
    private String nonLogin(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        req.setAttribute("returnUrl", ParamUtil.getStrParam(rMap.getString("returnUrl"),"/academy/main/main.do") );
        req.setAttribute("menu_nm", "mypage");
        req.setAttribute("lnb_menu", "login");
        rMap.setString("title", "간편 로그인");
        
        req.setAttribute("REQUEST_DATA", rMap);

        return "academy/cmmn/nonmbr_login";
    }
    
    /**
     * 간편 로그인 실행
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 비회원 로그인 실행
    @RequestMapping(value = "/academy/user/nonMemberLoginExec.do")
    private String nonMemberloginExec(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
    	try {
    		
    		EduMap map = commonUserService.getNonMberLoginUserInfo(rMap);
    			
    		if(map != null){
    				
    				//세션에 저장.
    				UserSessionManager.getUserSessionInsert(req, commonUserService, map.getInt("UNITY_MBERNO"));
    				// 로그인정보등록(중복로그인처리관련)
    				req.setAttribute("USERNAME", map.getString("USERNAME"));
    				
    				/** [공통] 로그인이력 등록 **/
    				commonUserService.insertMbrLoginLog(
    						req,
    						SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY"),
    						SangsProperties.getProperty("Globals.MBR_LOGIN_GB_SUCESS"),
    						"로그인실행"
    						);
    				
    				// req.setAttribute("returnUrl", ParamUtil.getStrParam(rMap.getString("returnUrl"),"/academy/myclass/myclassList.do") );
    				req.setAttribute("returnUrl", ParamUtil.getStrParam(rMap.getString("returnUrl"),"/academy/main/main.do"));
    				
    			} else { //비회원 정보 불일치
    				rMap.setString("msg", "등록된 사용자가 없습니다.");  
    				req.setAttribute("msg", rMap.getString("msg"));
    				req.setAttribute("returnUrl", "/academy/common/login.do" );
    			} 
    			
            
        } catch (Exception e) { log.debug(e.getMessage());
        	rMap.setString("msg", "로그인 실패");
        	req.setAttribute("msg", rMap.getString("msg"));
        	req.setAttribute("returnUrl", "/academy/common/login.do" );
            throw new FrontException(e);
        }
        return "academy/cmmn/login_exec";
    }
    

    /**
     * 로그인 실행
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 로그인 실행
    @RequestMapping(value = "/academy/common/loginExec.do")
    private String loginExec(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

    	HttpSession session = req.getSession();
        try {
            BASE64Decoder base64Decoder = new BASE64Decoder();
            
            String securedUserId = req.getParameter("securedUserId");
            String securedPassword = req.getParameter("securedPassword");

            PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
            session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
            if (privateKey == null) {
                throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
            }
            
            String user_Id = decryptRsa(privateKey, securedUserId);
            String pass_word = decryptRsa(privateKey, securedPassword);
            
           
            
            String userId = new String(base64Decoder.decodeBuffer(user_Id.trim()));
            
            // 웹취약점  > 인코딩 & 디코딩 주석 > 20190508
//            String password = new String(base64Decoder.decodeBuffer(pass_word.toString().trim())); 
            String password = pass_word.toString().trim(); 
            
			  
            rMap.setString("userId", userId);
            rMap.setString("pwd",  password);  
//            
            int loginFailCnt = 0; // 로그인 실패 카운트
            EduMap map = commonUserService.getLoginUserInfo(rMap);
            if(map!=null){
                rMap.setString("regUserId", userId);
                rMap.setInt("comNo", map.getInt("COMNO"));
                loginFailCnt = map.getInt("LOGIN_FAIL_CNT");
            }	      	      	
	      	
            // 사용자 비밀번호가 맞고, 회원승인여부가 승인(Y)이거나 비밀번호5회 입력오류로 비밀번호를 새로 찾은 회원 이고
            if ( map != null && SangsCryptUtil.isMatch(password, map.getString("PWD"))
                    && ("Y".equals(map.getString("REG_AT")) && "Y".equals(map.getString("KCB_AUTH_YN"))|| "P".equals(map.getString("REG_AT"))) && loginFailCnt < 5) 
            {
            	
            	int jsssionChk = 0;
                Cookie[] cookies = req.getCookies();
    			for (int i = 0; i < cookies.length; i++) {
    				cookies[i].getName(); 
    				cookies[i].getValue();
    				
    				if(cookies[i].getName().equals("JSESSIONID")){
    					jsssionChk=i;
    				}
    			
    			}
    			String JSESSIONID = cookies[jsssionChk].getValue();
    			rMap.putString("jessionId", JSESSIONID);
    			commonUserService.updateJsessionId(rMap);
    			
                //세션에 저장.
                UserSessionManager.getUserSessionInsert(req, commonUserService, map.getInt("USERNO"));
                // 로그인정보등록(중복로그인처리관련)
                SessionManager sessionManager = SessionManager.getInstance();
                sessionManager.setLoginSessionFront(req, userId);
                req.setAttribute("USERNAME", map.getString("USERNAME"));
                
                /** [공통] 로그인이력 등록 **/
                commonUserService.insertMbrLoginLog(
                        req,
                        SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY"),
                        SangsProperties.getProperty("Globals.MBR_LOGIN_GB_SUCESS"),
                        "로그인실행"
                );
                
                //로그인 성공 시 로그인 실패횟수는 0으로 초기화
                commonUserService.updateLoginSuccessInfo(rMap);
               
                //비밀번호5회 입력오류로 비밀번호를 새로찾은회원-> 승인변경
                if("P".equals(map.getString("REG_AT"))) {
                    commonUserService.updateRegAtYesInfo(rMap);
                }
                // 미수료자 수강정보 삭제후 알림
            	rMap.setInt("USERNO", map.getInt("USERNO"));
                
                req.setAttribute("returnUrl", ParamUtil.getStrParam(rMap.getString("returnUrl"),"/academy/main/main.do") );
                
                if(!rMap.getString("paramcSeqNo").equals("") && !rMap.getString("paramcSeqNo").equals(null)){//기수정보가있다면(설문 Url)
                	EduMap eMap = commonUserService.getCuserNo(rMap);
                
                }
            }
            else if(map != null && SangsCryptUtil.isMatch(password, map.getString("PWD")) && map !=null  && "R".equals(map.getString("REG_AT")) )
            {

                req.setAttribute("msg", "이메일 인증이 필요합니다. 가입 승인 메일이 오지 않은 경우 02-6671-9305 로 문의바랍니다" );
                req.setAttribute("returnUrl", "/academy/common/login.do" );

            } 
            else if(map != null && SangsCryptUtil.isMatch(password, map.getString("PWD")) && ("N".equals(map.getString("KCB_AUTH_YN")))) {
            	
            	req.setAttribute("REQUEST_DATA", rMap);
            	return "forward:/academy/common/oldMemberAuthLogin.do";
            }
            else 
            {
            	
                rMap.setString("msg", "아이디 또는 비밀번호를 다시 확인하세요.");

                /** [공통] 로그인이력 등록 **/
                commonUserService.insertMbrLoginLog(
                        req,
                        SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY"),
                        SangsProperties.getProperty("Globals.MBR_LOGIN_GB_FAIL"),
                        "로그인실패"
                );
                
                // 비밀번호 입력오류로 로그인 제한 및 회원승인상태 대기로 변경
                commonUserService.updateLoginFailCntInfo(rMap);
                loginFailCnt = loginFailCnt + 1; // 실패카운트 증가
                
                // 로그인 실패횟수 업데이트 후 다시 재조회
                if(loginFailCnt > 4) {
                    req.setAttribute("msg", "비밀번호 5회 입력 오류로 로그인이 제한됩니다. 비밀번호 찾기를 통해 비밀번호를 재설정해주세요.");
                    req.setAttribute("returnUrl", "/academy/user/memberIdPw.do" );
                }
                else {
                    req.setAttribute("msg", rMap.getString("msg"));
                    req.setAttribute("returnUrl", "/academy/common/login.do" );
                }
            }
            

        } catch (Exception e) { log.debug(e.getMessage());
             
            throw new FrontException(e);
        }
        req.setAttribute("REQUEST_DATA", rMap);

        return "academy/cmmn/login_exec";
    }

    private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        Cipher cipher = Cipher.getInstance("RSA");
        byte[] encryptedBytes = hexToByteArray(securedValue);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의
        return decryptedValue;
    }
    
    /**
     * 16진 문자열을 byte 배열로 변환한다.
     *
     * @param hex
     * @return
     */
    public static byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[]{};
        }

        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte)Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }
    
    
    
    /**
     * 기존회원 - 기존 회원 본인인증 폼
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 로그인 폼
    @RequestMapping(value = "/academy/common/oldMemberAuthLogin.do")
    private String oldMemKcbAutoForm(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {
        
    	
    	req.setAttribute("menu_nm", "mypage");
    	req.setAttribute("lnb_menu", "memberJoin");
        rMap.setString("title", SangsProperties.getProperty("Globals.memberJoinAgree"));
        
        
        return "academy/cmmn/old_member_auth_login";
    }
    
    /**
     *  기존회원 및 회원가입 - 기존 회원 및 회원가입 > 핸드폰 본인인증모듈
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 기존 회원 및 회원가입 > 핸드폰 본인인증모듈
    @RequestMapping(value = "/academy/common/kcbMobile.do")
    private String kcbMobile(HttpServletRequest request, HttpServletResponse res, DataMap rMap , HttpSession session) throws FrontException {
    	
    	String SITE_NAME = "사이트명"; 		// 요청사이트명 
//    	String SITE_URL = "localhost:8085";
    	String SITE_URL = "192.168.20.152:8085";

    	String CP_CD = "V39930000000";	// 회원사코드
		session.setAttribute("PHONE_CP_CD", CP_CD);

    	String RETURN_URL = "http://localhost:8085/academy/common/kcbMobileResult.do";// 인증 완료 후 리턴될 URL (도메인 포함 full path)
//    	String RETURN_URL = "http://192.168.20.152:8085/academy/common/kcbMobileResult.do";// 인증 완료 후 리턴될 URL (도메인 포함 full path)
    	
    	String RQST_CAUS_CD = "00";
    	
    	String target = "PROD";	// 테스트="TEST", 운영="PROD"
    	String popupUrl = "https://safe.ok-name.co.kr/CommonSvl";// 운영 URL
    	
    	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        //' 라이센스 파일
        //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    	String license = "C:\\okcert3_license\\V39930000000_IDS_01_PROD_AES_license.dat";
//    	String license = "C:\\okcert3_license\\" + CP_CD + "_IDS_01_" + target + "_AES_license.dat";
    	
    	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        //' 서비스명 (고정값)
        //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    	String svcName = "IDS_HS_POPUP_START";
    	
    	/**************************************************************************
    	okcert3 요청 정보
    	**************************************************************************/
    	JSONObject reqJson = new JSONObject();
    	reqJson.put("RETURN_URL", RETURN_URL);
    	reqJson.put("SITE_NAME", SITE_NAME);
    	reqJson.put("SITE_URL", SITE_URL);
    	reqJson.put("RQST_CAUS_CD", RQST_CAUS_CD);
    	
    	String reqStr = reqJson.toString();
    	
    	/**************************************************************************
    	okcert3 실행
    	**************************************************************************/
    	kcb.module.v3.OkCert okcert = new kcb.module.v3.OkCert();
    	
    	
    	try {
    		
    		String resultStr = okcert.callOkCert(target, CP_CD, svcName, license,  reqStr);
    		
    		JSONObject resJson = new JSONObject(resultStr);

    	    String RSLT_CD =  resJson.getString("RSLT_CD");
    	    String RSLT_MSG = resJson.getString("RSLT_MSG");
    	    String MDL_TKN = "";
    	    
    		boolean succ = false;
    		
    	    if ("B000".equals(RSLT_CD) && resJson.has("MDL_TKN") ) {
    			MDL_TKN = resJson.getString("MDL_TKN");
    			
    			succ = true;
    			
    			request.setAttribute("CP_CD", CP_CD);
    			request.setAttribute("MDL_TKN", MDL_TKN);
    			request.setAttribute("succ", succ);
    			request.setAttribute("popupUrl", popupUrl);

    			request.setAttribute("RSLT_CD", RSLT_CD);
    			request.setAttribute("RSLT_MSG", RSLT_MSG);
    			
    			request.setAttribute("authType", "PHONE");
    			
    	    }
    	    
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
    	
    	return "/academy/cmmn/kcb_check";
    }
    
    
    
    /**
     * 기존회원 - 기존 회원 > 핸드폰 본인인증모듈 > 결과
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 기존 회원 > 핸드폰 본인인증모듈 > 결과
    @RequestMapping(value = "/academy/common/kcbMobileResult.do")
    private String kcbMobileResult(HttpServletRequest request, HttpServletResponse res, DataMap rMap , HttpSession session) throws FrontException {
    	
    	
    	try {
			
    		String MDL_TKN = request.getParameter("mdl_tkn");

    		String CP_CD = (String)session.getAttribute("PHONE_CP_CD");
    		
    		String target = "PROD";	// 테스트="TEST", 운영="PROD"
    		
    		String license = "C:\\okcert3_license\\V39930000000_IDS_01_PROD_AES_license.dat";
//    		String license = "C:\\okcert3_license\\" + CP_CD + "_IDS_01_" + target + "_AES_license.dat";

    		String svcName = "IDS_HS_POPUP_RESULT";
    		
    		/**************************************************************************
    		okcert3 요청 정보
    		**************************************************************************/
    		JSONObject reqJson = new JSONObject();
    		
    		reqJson.put("MDL_TKN", MDL_TKN);
    		String reqStr = reqJson.toString();
    		
    		/**************************************************************************
    		okcert3 실행
    		**************************************************************************/
    		kcb.module.v3.OkCert okcert = new kcb.module.v3.OkCert();
    		
    		String resultStr = okcert.callOkCert(target, CP_CD, svcName, license,  reqStr);
    		
    		JSONObject resJson = new JSONObject(resultStr);
    		
    	    String RSLT_CD =  resJson.getString("RSLT_CD");
    	    String RSLT_MSG =  resJson.getString("RSLT_MSG");
    		String TX_SEQ_NO =  resJson.getString("TX_SEQ_NO");
    		
    		String RSLT_NAME = "";
    		String RSLT_BIRTHDAY = "";
    		String RSLT_SEX_CD = "";
    		String RSLT_NTV_FRNR_CD = "";
    		
    		String DI = "";
    		String CI = "";
    		String CI_UPDATE = "";
    		String TEL_COM_CD = "";
    		String TEL_NO = "";
    		
    		String RETURN_MSG= "";
    		if(resJson.has("RETURN_MSG")) RETURN_MSG =  resJson.getString("RETURN_MSG");
    		
    		if ("B000".equals(RSLT_CD)){
    			
    			RSLT_NAME = resJson.getString("RSLT_NAME");
    			RSLT_BIRTHDAY = resJson.getString("RSLT_BIRTHDAY");
    			RSLT_SEX_CD = resJson.getString("RSLT_SEX_CD");
    			RSLT_NTV_FRNR_CD = resJson.getString("RSLT_NTV_FRNR_CD");
    			
    			DI = resJson.getString("DI");
    			CI = resJson.getString("CI");
    			CI_UPDATE = resJson.getString("CI_UPDATE");
    			TEL_COM_CD = resJson.getString("TEL_COM_CD");
    			TEL_NO = resJson.getString("TEL_NO");
    			
    			request.setAttribute("CP_CD", CP_CD);
    			request.setAttribute("TX_SEQ_NO", TX_SEQ_NO);
    			request.setAttribute("RSLT_CD", RSLT_CD);
    			request.setAttribute("RSLT_CD", RSLT_CD);
    			request.setAttribute("RSLT_MSG", RSLT_MSG);
    			request.setAttribute("RSLT_NAME", RSLT_NAME);
    			request.setAttribute("RSLT_BIRTHDAY", RSLT_BIRTHDAY);
    			request.setAttribute("RSLT_SEX_CD", RSLT_SEX_CD);
    			request.setAttribute("RSLT_NTV_FRNR_CD", RSLT_NTV_FRNR_CD);
    			request.setAttribute("DI", DI);
    			request.setAttribute("CI", CI);
    			request.setAttribute("CI_UPDATE", CI_UPDATE);
    			request.setAttribute("TEL_NO", TEL_NO);
    			request.setAttribute("RETURN_MSG", RETURN_MSG);
    			request.setAttribute("authType", "PHONE");
    			
    		}
    		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	
    	return "/academy/cmmn/kcb_result";
    	
    }
    
    
    
    
    /**
     *  기존회원 및 회원가입 - 기존 회원 > 아이핀 본인인증모듈
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 기존 회원 > 아이핀 본인인증모듈
    @RequestMapping(value = "/academy/common/kcbIpin.do")
    private String kcbIpin(HttpServletRequest request, HttpServletResponse res, DataMap rMap , HttpSession session) throws FrontException {
    	
    	String SITE_NAME = "사이트명"; 		// 요청사이트명 
    	String SITE_URL = "www.test.co.kr";

    	String CP_CD = "V39930000000";	// 회원사코드
    	session.setAttribute("IPIN_CP_CD", CP_CD);

    	String RTN_URL = "http://localhost:8085/academy/common/kcbIpinResult.do";
//    	String RTN_URL = "http://192.168.20.152:8085/academy/common/kcbIpinResult.do";
    	
    	String RQST_CAUS_CD = "00";
    	String RETURN_MSG = "";
    	
    	String target = "PROD"; // 테스트="TEST", 운영="PROD"
    	//String popupUrl = "https://tmpin.ok-name.co.kr:5443/CommonSvl";// 테스트 URL
    	String popupUrl = "https://ipin.ok-name.co.kr/CommonSvl";// 운영 URL
    	
    	//'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
        //' 라이센스 파일
        //'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
//    	String license = "C:\\okcert3_license\\" + CP_CD + "_TIS_01_" + target + "_AES_license.dat";
    	String license = "C:\\okcert3_license\\V39930000000_TIS_01_PROD_AES_license.dat";
    		
    	String svcName = "TIS_IPIN_POPUP_START";
    	
    	/**************************************************************************
    	okcert3 요청 정보
    	**************************************************************************/
    	JSONObject reqJson = new JSONObject();
    	reqJson.put("RTN_URL", RTN_URL);
    	reqJson.put("SITE_NAME", SITE_NAME);
    	reqJson.put("SITE_URL", SITE_URL);
    	reqJson.put("RQST_CAUS_CD", RQST_CAUS_CD);
    	
    	reqJson.put("RETURN_MSG", RETURN_MSG);
    	
    	String reqStr = reqJson.toString();
    	
    	/**************************************************************************
    	okcert3 실행
    	**************************************************************************/
    	kcb.module.v3.OkCert okcert = new kcb.module.v3.OkCert();
    	
    	
    	try {
    		
    		String resultStr = okcert.callOkCert(target, CP_CD, svcName, license,  reqStr);
    		
    		JSONObject resJson = new JSONObject(resultStr);

    	    String RSLT_CD =  resJson.getString("RSLT_CD");
    	    String RSLT_MSG = resJson.getString("RSLT_MSG");
    	    String MDL_TKN = "";
    	   
    		boolean succ = false;
    		
    	    if ("T300".equals(RSLT_CD) && resJson.has("MDL_TKN") ) {
    	    	
    	    	MDL_TKN = resJson.getString("MDL_TKN");
	    		succ = true;
	    		
	    		request.setAttribute("CP_CD", CP_CD);
	        	request.setAttribute("MDL_TKN", MDL_TKN);
	        	request.setAttribute("succ", succ);
	        	request.setAttribute("popupUrl", popupUrl);
	
	        	request.setAttribute("RSLT_CD", RSLT_CD);
	        	request.setAttribute("RSLT_MSG", RSLT_MSG);
	        	request.setAttribute("authType", "IPIN");
        			
    	    }
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	
    	return "/academy/cmmn/kcb_check";
    }
    
    
    
    /**
     * 기존회원 - 기존 회원 > 아이핀 본인인증모듈 > 결과
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 기존 회원 > 아이핀 본인인증모듈 > 결과
    @RequestMapping(value = "/academy/common/kcbIpinResult.do")
    private String kcbIpinResult(HttpServletRequest request, HttpServletResponse res, DataMap rMap , HttpSession session) throws FrontException {
    	
    	
    	try {
			
    		String MDL_TKN = request.getParameter("MDL_TKN");
    		String CP_CD = "V39930000000";	// 회원사코드
    		
    		String target = "PROD"; // 테스트="TEST", 운영="PROD"
//    		String license = "C:\\okcert3_license\\" + CP_CD + "_TIS_01_" + target + "_AES_license.dat";
    		String license = "C:\\okcert3_license\\V39930000000_TIS_01_PROD_AES_license.dat";
    		String svcName = "TIS_IPIN_POPUP_RESULT";
    		
    		/**************************************************************************
    		okcert3 요청 정보
    		**************************************************************************/
    		JSONObject reqJson = new JSONObject();
    		
    		reqJson.put("MDL_TKN", MDL_TKN);
    		String reqStr = reqJson.toString();
    		
    		/**************************************************************************
    		okcert3 실행
    		**************************************************************************/
    		kcb.module.v3.OkCert okcert = new kcb.module.v3.OkCert();
    		
    		String resultStr = okcert.callOkCert(target, CP_CD, svcName, license,  reqStr);
    		
    		JSONObject resJson = new JSONObject(resultStr);
    		
    	    String RSLT_CD =  resJson.getString("RSLT_CD");
    	    String RSLT_MSG =  resJson.getString("RSLT_MSG");
    		String TX_SEQ_NO = resJson.getString("TX_SEQ_NO");

    		String RSLT_NAME = "";
    		String RSLT_BIRTHDAY = "";
    		String RSLT_SEX_CD = "";
    		String RSLT_NTV_FRNR_CD = "";
    		
    		String DI = "";
    		String CI = "";
    		String CI2 = "";
    		String CI_UPDATE = "";
    		String VSSN = "";
    		
    		String RETURN_MSG = "";
    		if(resJson.has("RETURN_MSG")) RETURN_MSG =  resJson.getString("RETURN_MSG");
    		
    		if ("T000".equals(RSLT_CD)){
    			RSLT_NAME = resJson.getString("RSLT_NAME");
    			RSLT_BIRTHDAY = resJson.getString("RSLT_BIRTHDAY");
    			RSLT_SEX_CD = resJson.getString("RSLT_SEX_CD");
    			RSLT_NTV_FRNR_CD = resJson.getString("RSLT_NTV_FRNR_CD");
    			
    			DI = resJson.getString("DI");
    			CI = resJson.getString("CI");
    			CI2 = resJson.getString("CI2");
    			CI_UPDATE = resJson.getString("CI_UPDATE");
    			VSSN = resJson.getString("VSSN");
    			
    			
    			
    			request.setAttribute("RSLT_CD", RSLT_CD);
    			request.setAttribute("RSLT_NAME", RSLT_NAME);
    			request.setAttribute("RSLT_BIRTHDAY",RSLT_BIRTHDAY);
    			request.setAttribute("RSLT_SEX_CD", RSLT_SEX_CD);
    			request.setAttribute("DI", DI);
    			request.setAttribute("CI_UPDATE", CI_UPDATE);
    			request.setAttribute("authType", "IPIN");
    		}
    			
    		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	
    	return "/academy/cmmn/kcb_result";
    	
    }
    
    
    
    /**
     *  회원가입 - 회원가입 > 카드 본인인증모듈
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 회원가입 > 카드 본인인증모듈
    @RequestMapping(value = "/academy/common/kcbCard.do")
    private String kcbCard(HttpServletRequest request, HttpServletResponse res, DataMap rMap , HttpSession session) throws FrontException {
    	
    	String REQ_SITE_NM = "사이트명";
    	
    	String CP_CD = "V39930000000";			// 회원사코드
    	session.setAttribute("CARD_CP_CD", CP_CD);
        
    	String RTN_URL = "http://localhost:8085/academy/common/kcbCardResult.do";		// 본인인증 완료 후 리턴될 URL (도메인 포함 full path)
//    	String RTN_URL = "http://192.168.20.152:8085/academy/common/kcbCardResult.do";		// 본인인증 완료 후 리턴될 URL (도메인 포함 full path)
    	
    	String target = "PROD"; // 테스트="TEST", 운영="PROD"
    	String popupUrl = "https://card.ok-name.co.kr/popup/main/start.do";           // 운영 URL
    	
    	
    	
//    	String license = "C:\\okcert3_license\\" + CP_CD + "_CID_01_" + target +"_AES_license.dat";
    	String license = "C:\\okcert3_license\\V39930000000_CID_01_PROD_AES_license.dat";
    	String svcName = "CID_CARD_POPUP_START";


    	
    	
    	/**************************************************************************
    	OkCert3 요청 정보
    	**************************************************************************/
        JSONObject reqJson = new JSONObject();
        reqJson.put("RTN_URL", RTN_URL);
        reqJson.put("REQ_SITE_NM", REQ_SITE_NM);
    	//reqJson.put("CHNL_CD", CHNL_CD);
    	//reqJson.put("RETURN_MSG", RETURN_MSG);
    	//reqJson.put("REQ_URL", REQ_URL);
    	
    	//' 거래일련번호는 기본적으로 모듈 내에서 자동 채번되고 채번된 값을 리턴해줌.
    	//'	회원사가 직접 채번하길 원하는 경우에만 아래 코드를 주석 해제 후 사용.
    	//' 각 거래마다 중복 없는 String 을 생성하여 입력. 최대길이:20
    	//reqJson.put("TX_SEQ_NO", "123456789012345"); 

        String reqStr = reqJson.toString();
    	
    	/**************************************************************************
    	okcert3 실행
    	**************************************************************************/
    	kcb.module.v3.OkCert okcert = new kcb.module.v3.OkCert();
    	
    	// '************ IBM JDK 사용 시, 주석 해제하여 호출 ************
    	// okcert.setProtocol2type("22");
    	// '객체 내 license를 리로드해야 될 경우에만 주석 해제하여 호출. (v1.1.7 이후 라이센스는 파일위치를 key로 하여 static HashMap으로 사용됨)
    	// okcert.delLicense(license);
    	
    	//' callOkCert 메소드호출 : String license 파일 path로 라이센스 로드
    	
    	
    	
    	try {
    		
    		String resultStr = okcert.callOkCert(target, CP_CD, svcName, license,  reqStr);
    		
    		JSONObject resJson = new JSONObject(resultStr);

    	    String RSLT_CD =  resJson.getString("RSLT_CD");
    	    String RSLT_MSG = resJson.getString("RSLT_MSG");
    	    String MDL_TKN = "";
    	   
    		boolean succ = false;
    		
            if ("T300".equals(RSLT_CD) && resJson.has("MDL_TKN") ) { // 정상적으로 모듈 호출 성공한 경우
                    MDL_TKN = resJson.getString("MDL_TKN");
        			succ = true;
        			
        			request.setAttribute("CP_CD", CP_CD);
        			request.setAttribute("MDL_TKN", MDL_TKN);
        			request.setAttribute("succ", succ);
        			request.setAttribute("popupUrl", popupUrl);
        			
        			request.setAttribute("RSLT_CD", RSLT_CD);
        			request.setAttribute("RSLT_MSG", RSLT_MSG);
        			request.setAttribute("authType", "CARD");
            }
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    	
    	return "/academy/cmmn/kcb_check";
    }
    
    
    
    /**
     * 기존회원 - 기존 회원 > 핸드폰 본인인증모듈 > 결과
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 기존 회원 > 핸드폰 본인인증모듈 > 결과
    @RequestMapping(value = "/academy/common/kcbCardResult.do")
    private String kcbCardResult(HttpServletRequest request, HttpServletResponse res, DataMap rMap , HttpSession session) throws FrontException {
    	
    	
    	try {
    		
    	    String MDL_TKN = request.getParameter("MDL_TKN");
    		String CP_CD = (String)session.getAttribute("CARD_CP_CD");
    		String target = "PROD"; // 테스트="TEST", 운영="PROD"
    		
//    		String license = "C:\\okcert3_license\\" + CP_CD + "_CID_01_" + target + "_AES_license.dat";
    		String license = "C:\\okcert3_license\\V39930000000_CID_01_PROD_AES_license.dat";
    		String svcName = "CID_CARD_POPUP_RESULT";
    		
    		JSONObject reqJson = new JSONObject();
    		reqJson.put("MDL_TKN", MDL_TKN);
    		
    		String reqStr = reqJson.toString();
    		
    		/**************************************************************************
    		okcert3 실행
    		**************************************************************************/
    		kcb.module.v3.OkCert okcert = new kcb.module.v3.OkCert();
    		
    		String resultStr = okcert.callOkCert(target, CP_CD, svcName, license,  reqStr);

    		JSONObject resJson = new JSONObject(resultStr);
    		
    		String TX_SEQ_NO = resJson.getString("TX_SEQ_NO");
    	    String RSLT_CD =  resJson.getString("RSLT_CD");
    	    String RSLT_MSG =  resJson.getString("RSLT_MSG");
    		
    		String CRD_CD = "";
    		String CI_RQST_DT_TM = "";
    	    String RSLT_NAME = "";
    	    String RSLT_BIRTHDAY = "";
    	    String RSLT_SEX_CD = "";
    	    String RSLT_NTV_FRNR_CD = "";
    	    String DI = "";
    		String CI = "";
    		String CI_UPDATE = "";
    		
    		String RETURN_MSG = "";
    		
    		if ( resJson.has("CRD_CD") && !resJson.isNull("CRD_CD"))	CRD_CD = resJson.getString("CRD_CD");
    		if ( resJson.has("RETURN_MSG") && !resJson.isNull("RETURN_MSG"))	RETURN_MSG = resJson.getString("RETURN_MSG");
    		//***************************************************************************************
    		// RSLT_CD (결과코드)가 T000 인 경우, 인증에 성공한 것이므로 그에 맞는 비즈니스 처리 요망. 그외 결과코드는 설명서 참고.
    		//***************************************************************************************
	    	if ("T000".equals(RSLT_CD)) {
	    		CI_RQST_DT_TM = resJson.getString("CI_RQST_DT_TM");
	    	    RSLT_NAME =  resJson.getString("RSLT_NAME");
	    	    RSLT_BIRTHDAY =  resJson.getString("RSLT_BIRTHDAY");
	    	    RSLT_SEX_CD =  resJson.getString("RSLT_SEX_CD");
	    	    RSLT_NTV_FRNR_CD =  resJson.getString("RSLT_NTV_FRNR_CD");
	    	    DI =  resJson.getString("DI");
	    		CI =  resJson.getString("CI");
	    		CI_UPDATE =  resJson.getString("CI_UPDATE");
	    		
	    		request.setAttribute("RSLT_CD", RSLT_CD);
				request.setAttribute("RSLT_NAME", RSLT_NAME);
				request.setAttribute("RSLT_BIRTHDAY",RSLT_BIRTHDAY);
				request.setAttribute("RSLT_SEX_CD", RSLT_SEX_CD);
				request.setAttribute("DI", DI);
				request.setAttribute("CI_UPDATE", CI_UPDATE);
				request.setAttribute("authType", "CARD");
	    	}
	    			
    		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
    	
    	return "/academy/cmmn/kcb_result";
    	
    }
    
    /**
     * 로그아웃
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 로그아웃
    @RequestMapping(value = "/academy/common/logout.do")
    private String logout(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	commonUserService.deleteJsessionId(rMap);
            /** [공통] 로그인이력 등록 **/
            commonUserService.insertMbrLoginLog(
                    req,
                    SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY"),
                    SangsProperties.getProperty("Globals.MBR_LOGIN_GB_LOGOUT"),
                    "로그아웃"
            );
        } catch (Exception e){ throw new FrontException(e);}

        /** 세션 정보를 삭제한다. */
        UserSessionManager.deleteUserSessionVO(req);

        return "redirect:/";
    }
    
    /**
     * 로그아웃
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 로그아웃
    @RequestMapping(value = "/academy/counselor/logout.do")
    private String counbselLogout(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	commonUserService.deleteJsessionId(rMap);
            /** [공통] 로그인이력 등록 **/
            commonUserService.insertMbrLoginLog(
                    req,
                    SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY"),
                    SangsProperties.getProperty("Globals.MBR_LOGIN_GB_LOGOUT"),
                    "로그아웃"
            );
        } catch (Exception e){ throw new FrontException(e);}

        /** 세션 정보를 삭제한다. */
        UserSessionManager.deleteUserSessionVO(req);

        return "redirect:/academy/counselor/main.do";
    }

    @RequestMapping(value = "/academy/common/common/image.do")
    private void image(HttpServletRequest req, DataMap rMap, HttpServletResponse res) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;

        try {
            //int fileCnt = rMap.getInt("UPLOAD_FILE_CNT");

            //DataMap fileMap = (DataMap)rMap.get("UPLOAD_FILE");

            //String tempImg = ParamUtil.getStrParam(fileMap.get("uploadFileSaveName").toString(), "");

            res.setContentType("text/html; charset=utf-8");

            json = gson.toJson("SUCCESS!!");

        } catch (Exception ex) {
             
            json = gson.toJson("FAIL");
        } finally {
            out.print(json);
            out.flush();
            out.close();
        }

    }

    /**
     * 우편번호 찾기
     * @param params
     * @param req
     * @param res
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/academy/common/common/post.do")
    private String post(HttpServletRequest request, DataMap rMap) throws FrontException {
        try {
            //request.setAttribute("listData", commonService.getPostcodeList(rMap));

        	rMap.setString("title", SangsProperties.getProperty("Globals.post"));
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) { log.debug(e.getMessage());
             
            throw new FrontException(e);
        }

        return "academy/cmmn/jsp/post_pop";
    }

    /**
     * 우편번호 찾기 회원가입시
     * @param params
     * @param req
     * @param res
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/academy/common/common/postJoin.do")
    private String postJoin(HttpServletRequest request, DataMap rMap) throws FrontException {
        try {
            //request.setAttribute("listData", commonService.getPostcodeList(rMap));

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) { log.debug(e.getMessage());
             
            throw new FrontException(e);
        }

        return "academy/cmmn/jsp/post_pop_join";
    }

    /**
     * 우편번호 찾기 실행
     * @param params
     * @param req
     * @param res
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/common/getPostAjax.do")
    public void getPost(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, ModelMap model) throws Exception {

        String sendUrl = null;
        StringBuffer query = new StringBuffer();
        String searchSe = SangsUtil.nchk(params.get("searchSe"));

        if ("oldpost".equals(searchSe)) {
            sendUrl = SangsProperties.getProperty("Globals.lotNumberAdressUrl");
            searchSe = "dong";
        } else {
            sendUrl = SangsProperties.getProperty("Globals.newAdressUrl");
        }

        query.append("searchSe=");
        query.append(searchSe);
        query.append("&");
        String temp = URLEncoder.encode(SangsUtil.nchk(params.get("srchText")), "EUC-KR");

        temp = URLDecoder.decode(temp, "ISO-8859-1");
        String srchwrd = URLEncoder.encode(temp, "UTF-8");

        query.append("srchwrd=");
        query.append(srchwrd);
        query.append("&");
        query.append("serviceKey=");
        query.append(URLEncoder.encode(SangsProperties.getProperty("Globals.serviceKey"), "UTF-8"));

        URL url = new URL(sendUrl + "?" + query);
        HttpURLConnection conn = (HttpURLConnection)url.openConnection();

        if (conn.getResponseCode() != 200) {
            throw new IOException(conn.getResponseMessage());
        }

        // Buffer the result into a string
        BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();

        conn.disconnect();


        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();

        out.print(sb.toString());
        out.flush();
        out.close();
    }


    /**
     * 새 우편번호 검색 (5자리)
     * @param  currentPage : 현재 페이지. 기본값은 1
     * @param  countPerPage : 페이지당 출력 목록 수. 기본값은 10
     * @param  confmKey : 부여 받은 승인키 (승인 중인 경우 테스트키)
     * @param  keyword : 입력 검색어
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/common/getNewPostAjax.do")
    public void getNewPostAjax(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, ModelMap model) throws Exception {

    	
    	try{
    	String currentPage = req.getParameter("currentPage");
        String countPerPage = req.getParameter("countPerPage");
        String newZipcodeUrl = SangsProperties.getProperty("Globals.newZipcodeUrl");
        String confmKey = SangsProperties.getProperty("Globals.confmKey"); // 인증키
        String srchText = URLEncoder.encode(req.getParameter("srchText"), "UTF-8"); // 검색

        String apiUrl = newZipcodeUrl
                + "?currentPage="+currentPage
                + "&countPerPage="+countPerPage
                + "&keyword="+srchText
                + "&confmKey="+confmKey;

        URL url = new URL(apiUrl);
        BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
        StringBuffer sb = new StringBuffer();
        String tempStr = null;
        while(true){
            tempStr = br.readLine();
            if(tempStr == null) break;
            sb.append(tempStr);
        }

        br.close();
        res.setCharacterEncoding("UTF-8");
        res.setContentType("text/xml");
        res.getWriter().write(sb.toString());
        
    	}catch(Exception e){
    		e.printStackTrace();
    		throw new Exception(e);
    	}
    }



    /**
     * 새 우편번호 검색 회원가입 폼에서 접근 (5자리)
     * @param  currentPage : 현재 페이지. 기본값은 1
     * @param  countPerPage : 페이지당 출력 목록 수. 기본값은 10
     * @param  confmKey : 부여 받은 승인키 (승인 중인 경우 테스트키)
     * @param  keyword : 입력 검색어
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/common/getNewPostAjaxJoin.do")
    public void getNewPostAjaxJoin(@RequestParam Map<String, String> params, HttpServletRequest req, HttpServletResponse res, ModelMap model) throws Exception {

        String currentPage = req.getParameter("currentPage");
        String countPerPage = req.getParameter("countPerPage");
        String newZipcodeUrl = SangsProperties.getProperty("Globals.newZipcodeUrl");
        String confmKey = URLEncoder.encode(SangsProperties.getProperty("Globals.confmKey"), "UTF-8"); // 인증키
         String srchText = URLEncoder.encode(req.getParameter("srchText"), "UTF-8"); // 검색

        String apiUrl = newZipcodeUrl
                + "?currentPage="+currentPage
                + "&countPerPage="+countPerPage
                + "&keyword="+srchText
                + "&confmKey="+confmKey;

        URL url = new URL(apiUrl);
        BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
        StringBuffer sb = new StringBuffer();
        String tempStr = null;
        while(true){
            tempStr = br.readLine();
            if(tempStr == null) break;
            sb.append(tempStr);
        }

        br.close();
        res.setCharacterEncoding("UTF-8");
        res.setContentType("text/xml");
        res.getWriter().write(sb.toString());
    }



    /**
     * 메시지를 alert 뿌리고 url에 해당하는 페이지로 이동한다.
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/common/msgForward.do")
    public String msgForward(HttpServletRequest req, DataMap rMap) throws FrontException {

        req.setAttribute("msg", (String)req.getAttribute("msg"));
        req.setAttribute("url", (String)req.getAttribute("url"));
        return "/common/msg_forward";
    }

    /**
     * 파일 다운
     * 
     * @param request
     * @param res
     * @param rMap
     * @throws FrontException
     */
    @RequestMapping(value = "/academy/course/filedown.do")
    @ResponseBody
    public void fileDown(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	 DownloadServlet filedown = new DownloadServlet();
         boolean result;
         
        try {
            
            //result = filedown.downLoadFile(request, res, courseMapper.getFileInfoByCourseInfo(rMap));
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
    }
    
    /**
     * 파일 다운로드
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/academy/filedown.do")
    public String filedown(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        DownloadServlet filedown = new DownloadServlet();
        boolean result;

        try {
            //rMap.setString("filename", "../6BAE7B3F1CBB415FBE6A15D65DB18BE7.xls");
            rMap.setString("filename", SangsUtil.replaceAll(rMap.getString("filename"), "../", ""));
            //상위경로 진입 방지
            if(rMap.containsKey("sampleDown")){
                req.setAttribute("REQUEST_DATA", rMap);
                return "/common/file_down";
            }
            if (rMap.containsKey("urlDown")) { // 자료실. 파일다운로드
                result = filedown.urlDownLoadFile(req, res);
            } else if (rMap.containsKey("bbsDown")) { // 게시판. 파일 다운로드
                result = filedown.bbsDownLoadFile(req, res);
            }else if(rMap.containsKey("lecturedown")){ // 강의이력 다운로드 파일
            	result = filedown.bbsDownLoadFile(req, res);
            }else if(rMap.containsKey("reportdown")){ // 보고서 다운로드 파일
            	result = filedown.bbsDownLoadFile(req, res);
            }else if(rMap.containsKey("discussdown")){ // 토론 다운로드 파일
            	result = filedown.bbsDownLoadFile(req, res);
            	if(rMap.containsKey("bbsNo") && !rMap.getString("bbsNo").equals(null)){
            		classdeskTutorDiscussService.updateDiscussFileCount(rMap);
            	}
            }else if(rMap.containsKey("movieFileDown")){ // 인권영화신청양식 다운로드 파일
            	result = filedown.bbsDownLoadFile(req, res);
            }else if(rMap.containsKey("broDown")){
            	result = filedown.bbsDownLoadFile(req, res);
        	}else{
                result = filedown.downLoadFile(req, res, boardMapper.getFileInfo(ParamUtil.getIntParam(req.getParameter("fileno"))));
            }

            if (result) {
                return null;
            } else {
                return "/common/cmmn_error";
            }

        } catch (Exception e) { log.debug(e.getMessage());
            return "common/cmmn_error";
        }
    }
    
    /**
     * 공통 콤보파일 ajax
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    // TODO: 공통 콤보파일 ajax
    @RequestMapping(value = "/academy/common/ajaxCategory.do")
	public String ajaxCategory(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
		try{
			
			List<EduMap> resultList = commonService.selectMtCodeSub(rMap);
			request.setAttribute("resultList", resultList);
		}
		catch (Exception e) { log.debug(e.getMessage());
		}
		
		request.setAttribute("REQUEST_DATA", rMap);
		return "academy/tutor/ajaxComboCategory";
	}
    
    
    /**
     * 비밀번호 일괄변경 및 확인
     * @param
     * @return
     * @throws Exception
     */
    // TODO : 비밀번호 일괄변경 및 확인
    @RequestMapping(value = "/academy/common/pwdUpdate.do")
    public String pwdUpdate(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	
        	List<EduMap> userList = commonUserService.getLoginUserList(rMap);
        	
        	for(int i=0; i<userList.size(); i++){

                  EduMap userInfo = (EduMap)userList.get(i);
                  rMap.setInt("userno", userInfo.getInt("USERNO"));
                  
                  if(!("").equals(userInfo.getString("PWD_BAK"))) {
                	  
                	  rMap.setString("newpwd", SangsCryptUtil.crypt(userInfo.getString("PWD_BAK")));  
                  }
                  
                  userService.updateAllPwd(rMap);
                 
                  if ( i == userList.size()-1 ) {
                      break;
                 }             
            }
        	
        	req.setAttribute("msg", "비밀번호가 정상적으로 암호화 되었습니다.");
            req.setAttribute("returnUrl", "/academy/main/main.do" );
            
            
        } catch (Exception e) { log.debug(e.getMessage());
             
            throw new FrontException(e);
        }

        req.setAttribute("REQUEST_DATA", rMap);
        return "academy/cmmn/login_exec";
    }
    
    
    public static String Base64Encode(String result) {
     
    	BASE64Encoder base64Encoder = new BASE64Encoder();
 
        // Base64 인코딩
        String base64Txt = base64Encoder.encode(result.getBytes());
        return base64Txt;
    }
    
    public static String Base64Decode(String result) {
        
        BASE64Decoder base64Decoder = new BASE64Decoder();

        try {
            // Base64 디코딩
            result = new String(base64Decoder.decodeBuffer(result));
             
        } catch (IOException e) {
        }
        
        return result;
    }
    
    public static String encodeURIComponent(String s) throws IOException {
      String result = null;
   
      result = s.replaceAll("\\%2525", "%")
	        .replaceAll("%2525", "%")
	        //.replaceAll("\\%27", "'")
	        //.replaceAll("\\%28", "(")
	        //.replaceAll("\\%29", ")")
	        //.replaceAll("\\%7E", "~")
	        ;
   
      return result;
    }
    
    /**
	 * String UnEscape 처리
	 * 
	 * @param src
	 * @return
	 */
	public static String unescape(String src) {
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length());
		int lastPos = 0, pos = 0;
		char ch;
		while (lastPos < src.length()) {
			pos = src.indexOf("%", lastPos);
			if (pos == lastPos) {
				if (src.charAt(pos + 1) == 'u') {
					ch = (char) Integer.parseInt(src
							.substring(pos + 2, pos + 6), 16);
					tmp.append(ch);
					lastPos = pos + 6;
				} else {
					ch = (char) Integer.parseInt(src
							.substring(pos + 1, pos + 3), 16);
					tmp.append(ch);
					lastPos = pos + 3;
				}
			} else {
				if (pos == -1) {
					tmp.append(src.substring(lastPos));
					lastPos = src.length();
				} else {
					tmp.append(src.substring(lastPos, pos));
					lastPos = pos;
				}
			}
		}
		return tmp.toString();
	}

	/**
	 * String Escape 처리
	 * @param src
	 * @return
	 */
	public static String escape(String src) {
		int i;
		char j;
		StringBuffer tmp = new StringBuffer();
		tmp.ensureCapacity(src.length() * 6);
		for (i = 0; i < src.length(); i++) {
			j = src.charAt(i);
			if (Character.isDigit(j) || Character.isLowerCase(j)
					|| Character.isUpperCase(j))
				tmp.append(j);
			else if (j < 256) {
				tmp.append("%");
				if (j < 16)
					tmp.append("0");
				tmp.append(Integer.toString(j, 16));
			} else {
				tmp.append("%u");
				tmp.append(Integer.toString(j, 16));
			}
		}
		return tmp.toString();
	}
}