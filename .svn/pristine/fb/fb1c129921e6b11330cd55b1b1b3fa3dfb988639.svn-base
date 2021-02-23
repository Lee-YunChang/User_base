package com.webapp.academy.ctrl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.crypto.Cipher;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import sun.misc.BASE64Decoder;

import com.google.gson.Gson;
import com.ibm.icu.util.Calendar;
import com.sangs.session.UserSessionManager;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.sangs.util.RandomUtil;
import com.sangs.util.SangsCryptUtil;
import com.sangs.util.SangsUtil;
import com.sangs.util.StringUtil;
import com.webapp.academy.service.CommonService;
import com.webapp.academy.service.UserService;
import com.webapp.common.service.CommonEmsService;
import com.webapp.common.service.CommonUserService;

/**
 * Description : 회원 관련 컨트롤러
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2015.06.01 	SANGS			최초작성
 *
 */

@Controller
public class MemberController {
	
    private Logger  log = LogManager.getLogger(MemberController.class);

    @Resource(name = "userService")
    private UserService       userService;

    @Resource(name = "commonUserService")
    private CommonUserService commonUserService;

    @Resource(name = "commonService")
    private CommonService commonService;

    @Resource(name = "commonEmsService")
    private CommonEmsService commonEmsService;


    /**
     * 회원가입 > 약관동의
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
   
    // TODO: 회원가입 > 약관동의
    //@RequestMapping(value = "/academy/user/memberJoinAgree.do")
    public String memberJoinAgree(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        if ("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0) {
            request.setAttribute("msg", "로그인 상태에서는 회원가입을 할 수 없습니다.");
            request.setAttribute("url", "/academy/main/main.do");
            return "forward:/common/msgForward.do";
        }

        String authKey = "";
        authKey = request.getParameter("authKey");
        if(!"".equals(authKey)){
            rMap.setString("authKey", authKey);
        }

        request.setAttribute("menu_nm", "mypage");
        request.setAttribute("lnb_menu", "memberJoin");
        rMap.setString("title", SangsProperties.getProperty("Globals.memberJoinAgree"));
        
        request.setAttribute("REQUEST_DATA", rMap);

        return "academy/member/member_join_agree";
    }
    */
    

    /**
     * 회원가입 > 약관동의
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입 > 약관동의
    @RequestMapping(value = "/academy/user/memberJoinAgree.do")
    public String memberJoinAgree(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        if ("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0) {
            request.setAttribute("msg", "로그인 상태에서는 회원가입을 할 수 없습니다.");
            request.setAttribute("url", "/academy/main/main.do");
            return "forward:/common/msgForward.do";
        }

        String authKey = "";
        authKey = request.getParameter("authKey");
        if(!"".equals(authKey)){
            rMap.setString("authKey", authKey);
        }

        request.setAttribute("menu_nm", "mypage");
        request.setAttribute("lnb_menu", "memberJoin");
        rMap.setString("title", SangsProperties.getProperty("Globals.memberJoinAgree"));
        
        request.setAttribute("REQUEST_DATA", rMap);
        
        return "academy/member/member_join_agree";
    }
    
    
    /**
     * 회원가입 > 약관동의 > 본인인증
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입 > 약관동의 > 본인인증
    @RequestMapping(value = "/academy/user/memberJoinAuth.do")
    public String memberJoinAuth(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        if ("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0) {
            request.setAttribute("msg", "로그인 상태에서는 회원가입을 할 수 없습니다.");
            request.setAttribute("url", "/academy/main/main.do");
            return "forward:/common/msgForward.do";
        }

        String authKey = "";
        authKey = request.getParameter("authKey");
        if(!"".equals(authKey)){
            rMap.setString("authKey", authKey);
        }

        request.setAttribute("menu_nm", "mypage");
        request.setAttribute("lnb_menu", "memberJoin");
        rMap.setString("title", SangsProperties.getProperty("Globals.memberJoinAgree"));
        
        request.setAttribute("REQUEST_DATA", rMap);
        
        return "academy/member/member_join_auth";
    }
    


    /**
     * 회원가입 > 회원정보 등록 폼
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입 > 등록 폼
    @RequestMapping(value = "/academy/user/memberJoinForm.do")
    public String memberJoinForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        if ("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0) {// 로그인 안했다면
            request.setAttribute("msg", "로그인 상태에서는 회원가입을 할 수 없습니다.");
            request.setAttribute("url", "/academy/main/main.do");
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

            HttpSession session = request.getSession();
            // 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
            session.setAttribute("__rsaPrivateKey__", privateKey);

            // 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
            request.setAttribute("publicKeyModulus", publicKeyModulus);
            request.setAttribute("publicKeyExponent", publicKeyExponent);
            request.setAttribute("returnUrl", ParamUtil.getStrParam(rMap.getString("returnUrl"),"/academy/main/main.do") );
            
        	
        	rMap.setString("mtCode", SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SUB_CODE"));
            request.setAttribute("categoryData", commonService.selectMtCodeSub(rMap));
            
        	Calendar cal = Calendar.getInstance();

	        rMap.setInt("year", cal.get(Calendar.YEAR));
            rMap.setString("mtCode",SangsProperties.getProperty("Globals.mtCode_MT_GRADE_CODE"));
            request.setAttribute("jobKndCodeList", userService.selectJobKndCodeList(rMap));
            
            request.setAttribute("menu_nm", "mypage");
            request.setAttribute("lnb_menu", "memberJoin");
            rMap.setString("title", SangsProperties.getProperty("Globals.memberJoinAgree"));
            
            request.setAttribute("REQUEST_DATA", rMap);
        } 
        catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
        
        return "academy/member/member_join_form";
    }
    

    /**
     * 회원가입 > 회원정보 등록 폼 실행 (EXEC)
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입 > 회원정보 등록 폼 실행
    @RequestMapping(value = "/academy/user/memberJoinExec.do")
    public String memberJoinExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	if ("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0) {// 로그인 안했다면
            request.setAttribute("msg", "로그인 상태에서는 회원가입을 할 수 없습니다.");
            request.setAttribute("url", "/academy/main/main.do");
            return "forward:/common/msgForward.do";
        }
        
        HttpSession session = request.getSession();
        try {
        	
//			BASE64Decoder base64Decoder = new BASE64Decoder();
            String securedPassword = request.getParameter("securedPassword");
            PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
            session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
            if (privateKey == null) {
                throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
            }
            
            String pass_word = decryptRsa(privateKey, securedPassword);
            
//			String password = new String(base64Decoder.decodeBuffer(pass_word.toString().trim())); 
            String password = pass_word.toString().trim();
			
        	if(!request.getParameter("empSeq").equals("Y")){
        		request.setAttribute("msg", "중복회원가입은 가능하지 않습니다.");
                request.setAttribute("url", "/academy/main/main.do");
                return "forward:/common/msgForward.do";
        	}
        	
        	// 웹 취약성 > 자바스크립트 -> 자바
//        	if(Integer.parseInt(request.getParameter("formChk")) == 0) {
//        		request.setAttribute("msg", "정보가 누락되었습니다.");
//                request.setAttribute("url", "/academy/user/memberJoinAgree.do");
//                return "forward:/common/msgForward.do";
//        	}
        	

        	
        	String result = SangsUtil.isRegPassword(rMap.getString("userId"), password);
        	if( "fail".equals(result) ) {
         		request.setAttribute("msg", "정보가 누락되었습니다.");
                  request.setAttribute("url", "/academy/user/memberJoinAgree.do");
                return "forward:/common/msgForward.do";
        	}
        	
            rMap.setInt("userNo",userService.getMaxMberNo(rMap));
            rMap.setString("userPassword", SangsCryptUtil.crypt(password));
            
            //승인상태 Y
            rMap.setString("regAt", "Y");
            rMap.setString("regUserId", rMap.getString("userId"));
            rMap.setString("regDate",SangsUtil.getToday());
            
//            int checkList = userService.getUnityInfo(rMap);
//            
//            if(checkList > 0){
//            	
//            	rMap.setString("rMap", "중복회원가입은 방지되었습니다.");
//            	rMap.setString("url", "/academy/main/main.do");
//            	
//            }else{
            	userService.insertUnityMber(rMap);
            	rMap.setString("url", "/academy/user/memberJoinResult.do");
            	
//            }
            request.setAttribute("empSeq", "X");
            request.setAttribute("menu_nm", "mypage");
            request.setAttribute("lnb_menu", "memberJoin");
            request.setAttribute("REQUEST_DATA", rMap);
            
        } 
        catch (Exception e) {
			log.error(e.getMessage());
			throw new FrontException(e);
		}
        return "redirect:/academy/user/memberJoinResult.do?joinYn=Y";
    }



    /**
     * 회원가입 > 기관 찾기 팝업
     * @param params
     * @param request
     * @param res
     * @param model
     * @return
     * @throws Exception
     */
    // TODO: 회원가입 > 기관 찾기 팝업
    @RequestMapping(value = "/academy/user/memberCompanyJoin.do")
    private String memberCompanyJoin(HttpServletRequest request, DataMap rMap) throws FrontException {
        
    	try {
    		
    		List<EduMap> resultList = null;
    		int totalCnt = 0;
        	if(!rMap.getString("orgName").equals("") || !rMap.getString("searchWord").equals("")){
        		rMap.setInt("rowCount", 20);
               
        		resultList = commonService.getCompanyCodeList(rMap);
        		totalCnt = commonService.getCompanyCodeCount(rMap);
        	}
        	request.setAttribute("resultList", resultList);
            request.setAttribute("resultCount", totalCnt);
             
            rMap.setString("title", SangsProperties.getProperty("Globals.memberCompanyJoin"));
        	request.setAttribute("REQUEST_DATA", rMap);
        } 
    	catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/cmmn/jsp/company_pop_join";
    }
    /**
     * 회원가입 > 회원가입 완료
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입  완료
    @RequestMapping(value = "/academy/user/memberJoinResult.do")
    public String memberJoinResult(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        if ("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0) {
            request.setAttribute("msg", "로그인 상태에서는 회원가입을 할 수 없습니다.");
            request.setAttribute("url", "/academy/main/main.do");
            return "forward:/common/msgForward.do";
        }
        
        if (!"Y".equals(rMap.getString("joinYn"))) {
            return "redirect:/academy/main/main.do";
        }
        
        
        
        try{
            rMap.setString("msg", "회원가입 되었습니다.");
            //rMap.setString("url", "/academy/user/memberJoinResult.do");

            request.setAttribute("menu_nm", "mypage");
            request.setAttribute("lnb_menu", "memberJoin");
            rMap.setString("title", SangsProperties.getProperty("Globals.memberJoinAgree"));

            request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
        return "academy/member/member_join_result";
    }


    /**
     * 마이페이지 > 개인정보수정 > 개인정보 수정 폼
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 마이페이지 > 개인정보수정 > 개인정보 수정 폼
    @RequestMapping(value = "/academy/myclass/memberModifyForm.do")
    public String memberModify(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        if ("N".equals(rMap.getString("SES_ISLOGIN")) || ("").equals(rMap.getString("SES_USERID"))) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
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

            HttpSession session = request.getSession();
            // 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
            session.setAttribute("__rsaPrivateKey__", privateKey);
            
            // 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
            request.setAttribute("publicKeyModulus", publicKeyModulus);
            request.setAttribute("publicKeyExponent", publicKeyExponent);
            request.setAttribute("returnUrl", ParamUtil.getStrParam(rMap.getString("returnUrl"),"/academy/main/main.do") );
            

            rMap.setInt("userNo", rMap.getInt("SES_USERNO"));
            EduMap unityMberInfo =  userService.selectUserInfo(rMap);

            //휴대폰번호 나누기
            unityMberInfo.put("MOBLPHON1", unityMberInfo.getString("MOBILE").split("-")[0]);
            if(unityMberInfo.getString("MOBILE").split("-").length == 2){
                unityMberInfo.put("MOBLPHON2", unityMberInfo.getString("MOBILE").split("-")[1]);
            }
            else if(unityMberInfo.getString("MOBILE").split("-").length == 3){
                unityMberInfo.put("MOBLPHON2", unityMberInfo.getString("MOBILE").split("-")[1]);
                unityMberInfo.put("MOBLPHON3", unityMberInfo.getString("MOBILE").split("-")[2]);
            }

            if(unityMberInfo.getString("EMAIL") != null && unityMberInfo.getString("EMAIL").length() > 1){
                unityMberInfo.put("EMAIL1", unityMberInfo.getString("EMAIL").split("@")[0]);
                if(unityMberInfo.getString("EMAIL").split("@").length == 2){
                    unityMberInfo.put("EMAIL2", unityMberInfo.getString("EMAIL").split("@")[1]);
                }
            }

            rMap.setString("mtCode", SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SUB_CODE"));
            request.setAttribute("categoryData", commonService.selectMtCodeSub(rMap));
            
            request.setAttribute("unityMberInfo", unityMberInfo);

            // 회원구분
            rMap.setString("mtCode",SangsProperties.getProperty("Globals.mtCode_MT_GRADE_CODE"));
            request.setAttribute("jobKndCodeList", userService.selectJobKndCodeList(rMap));

            request.setAttribute("menu_nm", "mypage");
            request.setAttribute("lnb_menu", "member");
            rMap.setString("title", SangsProperties.getProperty("Globals.memberModifyAuthForm"));
            request.setAttribute("REQUEST_DATA", rMap);
            
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/member/member_modify_form";
    }

    /**
     * 마이페이지 > 개인정보수정 > 회원정보 수정 실행
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/academy/myclass/memberModifyExec.do")
    public String memberModifyExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        
    	 HttpSession session = request.getSession();
         try {
         	
//             BASE64Decoder base64Decoder = new BASE64Decoder();
             String securedPassword = request.getParameter("securedPassword");

             PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
             session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
             if (privateKey == null) {
                 throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
             }

             String pass_word = decryptRsa(privateKey, securedPassword);
//             String password = new String(base64Decoder.decodeBuffer(pass_word.toString().trim()));
        	
            rMap.setInt("userNo", UserSessionManager.getUserSessionVO(request).getUserNo());
        	
            // 웹 취약성 추가 20190508 START
//        	if(Integer.parseInt(request.getParameter("formChk")) == 0) {
//        		request.setAttribute("msg", "정보가 누락되었습니다.");
//                request.setAttribute("url", "/academy/myclass/memberModifyAuthForm.do");
//                return "forward:/common/msgForward.do";
//        	}
//            
        	String result = SangsUtil.isRegPassword(rMap.getString("userId"), pass_word);
        	if( "fail".equals(result) ) {
        		request.setAttribute("msg", "정보가 누락되었습니다.");
                request.setAttribute("url", "/academy/myclass/memberModifyAuthForm.do");
                return "forward:/common/msgForward.do";
        	}
        	
        	// 웹 취약성 추가 20190508 END
            
            
            //비밀번호 변경사항이 있을 경우에만 입력받은 비밀번호 암호화 실행
            if (!"".equals(rMap.getString("userPassword"))) {
//                rMap.setString("newUnityPassword", SangsCryptUtil.crypt(password));
                rMap.setString("newUnityPassword", SangsCryptUtil.crypt(pass_word));
            }
            
            //회원정보 변경 실행
            userService.updateUnityInfo(rMap);
            
            request.setAttribute("msg", "회원정보가 변경 되었습니다.");
            
            request.setAttribute("returnUrl", "/academy/main/main.do");
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/cmmn/login_exec";
    }

    /**
     * 기타 > 아이디 비밀번호찾기 폼
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/academy/user/memberIdPw.do")
    public String memberIdPw(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        if ("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0) {// 로그인 안했다면
            request.setAttribute("msg", "로그인 상태에서는 아이디/비밀번호 찾기를 할 수 없습니다.");
            request.setAttribute("url", "/academy/main/main.do");
            return "forward:/common/msgForward.do";
        }

        rMap.setString("mtCode", SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SUB_CODE"));
        request.setAttribute("categoryData", commonService.selectMtCodeSub(rMap));
        
        request.setAttribute("lnb_menu", "find");
        rMap.setString("title", SangsProperties.getProperty("Globals.memberIdPw"));
        
        request.setAttribute("REQUEST_DATA", rMap);
        
        return "academy/member/member_idpw";
    }

    /**
     * 기타 > 비밀번호수정 폼
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception 
     */
    @RequestMapping(value = "/academy/user/memberUpdatePwForm.do")
    public String memberUpdatePwForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        if ("Y".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") > 0) {// 로그인 안했다면
            request.setAttribute("msg", "로그인 상태에서는 아이디/비밀번호 찾기를 할 수 없습니다.");
            request.setAttribute("url", "/academy/main/main.do");
            return "forward:/common/msgForward.do";
        }

        rMap.setString("mtCode", SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SUB_CODE"));
        request.setAttribute("categoryData", commonService.selectMtCodeSub(rMap));
        request.setAttribute("lnb_menu", "find");
        rMap.setString("title", SangsProperties.getProperty("Globals.memberIdPw"));
        request.setAttribute("REQUEST_DATA", rMap);
        
        return "academy/member/member_idpw_form";
    }
    
    /**
     * 마이페이지 > 개인정보수정> 소속업체 검색 팝업
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/academy/user/member/popFindCompany.do")
    public String popFindCompany(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            //검색이면 조회
            if("Y".equals(rMap.getString("searchYn"))){
                userService.selectCompanyList(rMap);
                request.setAttribute("resultList", userService.selectCompanyList(rMap));
            }

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/member/popup_find_company";
    }

    /**
     * 마이페이지 > 개인정보수정 > 회원탈퇴 폼
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/academy/myclass/memberCancel.do")
    public String memberCancel(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
     	 KeyPairGenerator generator;
    	try {

            if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/academy/common/login.do");
                return "forward:/common/msgForward.do";
            }
            HttpSession session=request.getSession();
            //탈퇴 사유 호출
            rMap.setString("mtCode", SangsProperties.getProperty("Globals.mtCode_MT_CANCEL_CODE"));
            request.setAttribute("mtCancelCodeList", commonService.selectMtCodeSub(rMap));
            request.setAttribute("unityMberInfo", userService.selectUserInfo(rMap));


            request.setAttribute("menu_nm", "mypage");
            request.setAttribute("lnb_menu", "member");
            rMap.setString("title", SangsProperties.getProperty("Globals.memberModifyAuthForm"));


            generator = KeyPairGenerator.getInstance("RSA");
            generator.initialize(2048);

            KeyPair keyPair = generator.genKeyPair();
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");

            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();

            // 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
            session.setAttribute("__rsaPrivateKey__", privateKey);

            // 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
            request.setAttribute("publicKeyModulus", publicKeyModulus);
            request.setAttribute("publicKeyExponent", publicKeyExponent);
            request.setAttribute("REQUEST_DATA", rMap);

            
            
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/member/member_cancel";
    }

    /**
     * 마이페이지 > 개인정보수정 > 회원탈퇴 실행
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/academy/myclass/memberCancelExec.do")
    public String memberCancelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            //탈퇴 업데이트문 실행
            userService.updateCencelMember(rMap);

        	request.setAttribute("msg", "탈퇴되었습니다. 회원의 모든 기업정보는 삭제됩니다.");
        	request.setAttribute("returnUrl", "/academy/main/main.do");

            /** 세션 정보를 삭제한다. */
            UserSessionManager.deleteUserSessionVO(request);
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/cmmn/login_exec";
    }

    /**
     * 마이페이지 > 개인정보수정 > 본인인증
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 마이페이지 > 개인정보수정 > 본인인증
    @RequestMapping(value = "/academy/myclass/memberModifyAuthForm.do")
    public String memberModifyAuthForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || ("").equals(rMap.getString("SES_USERID"))) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
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

            HttpSession session = request.getSession();
            // 세션에 공개키의 문자열을 키로하여 개인키를 저장한다.
            session.setAttribute("__rsaPrivateKey__", privateKey);

            // 공개키를 문자열로 변환하여 JavaScript RSA 라이브러리 넘겨준다.
            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);

            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
            request.setAttribute("publicKeyModulus", publicKeyModulus);
            request.setAttribute("publicKeyExponent", publicKeyExponent);
            request.setAttribute("returnUrl", ParamUtil.getStrParam(rMap.getString("returnUrl"),"/academy/main/main.do") );
            
	        request.setAttribute("menu_nm", "mypage");
	        request.setAttribute("lnb_menu", "member");
	        
	        rMap.setString("title", SangsProperties.getProperty("Globals.memberModifyAuthForm"));
	        request.setAttribute("REQUEST_DATA", rMap);
        }
        catch (NoSuchAlgorithmException e) {
            throw new FrontException(e);
        } catch (InvalidKeySpecException e) {
            throw new FrontException(e);
        }

        return "/academy/member/member_auth_form";
    }

    /**
     * 마이페이지 > 개인정보수정 > 비밀번호 변경 팝업
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/academy/user/member/popFindPw.do")
    public String popFindPw(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

             if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
                 request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                 request.setAttribute("url", "/academy/common/login.do");
                 return "forward:/common/msgForward.do";
             }

            rMap.setInt("userNo", UserSessionManager.getUserSessionVO(request).getUserNo());

            request.setAttribute("unityMberInfo", userService.selectUserInfo(rMap));
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/member/popup_find_pw";
    }

    /**
     * 회원 비밀번호 찾기 -> 비밀번호 변경 팝업
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/modifyPwdPop.do")
    public String modifyPwdPop(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        request.setAttribute("REQUEST_DATA", rMap);
        return "academy/member/modify_pwd_pop";

    }

    /**
     * 회원 비밀번호 찾기 -> 비밀번호 변경실행 (팝업)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/modifyPwdPopExec.do")
    public String modifyPwdPopExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

           request.setAttribute("REQUEST_DATA", rMap);
           
//           BASE64Decoder base64Decoder = new BASE64Decoder();
           String securedPassword = request.getParameter("securedPassword");
//           String password = new String(base64Decoder.decodeBuffer(securedPassword.toString().trim())); 
           String password = securedPassword.toString().trim(); 
           rMap.setString("newUnityPassword", SangsCryptUtil.crypt(password));
           
           
           // 웹 취약성 보완 -> 20190507 추가 START
           String authCode = "";
           
           if("S".equals(rMap.getString("confirmBtn")) || "P".equals(rMap.getString("confirmBtn")) ) {
        	   authCode = rMap.getString("smsAuthCode");
           } else if("M".equals(rMap.getString("confirmBtn") )) {
        	   authCode = rMap.getString("emailAuthCode");
           }
           
           
           
          
           String[] confirmCodeArr = request.getParameterValues("confirmCode2");
           String strConfirmCode = "";
           
           // 담겨올때, [, "사용자가 입력한 값"] 넘어온다.
           for(int i = 0; i < confirmCodeArr.length; i++) {
        	   strConfirmCode = confirmCodeArr[1];
           }

           if( !(authCode.trim().equals(strConfirmCode.trim())) ) {
        	   request.setAttribute("msg", "인증번호를 확인해주시기 바랍니다.");
               request.setAttribute("url", "/academy/user/memberIdPw.do");
               return "forward:/common/msgForward.do";
           }
           
           String result = SangsUtil.isRegPassword(rMap.getString("userId"), password);
           
           if( "fail".equals(result) ) {
        	   request.setAttribute("msg", "비밀번호를 확인해주시기 바랍니다.");
               request.setAttribute("url", "/academy/user/memberIdPw.do");
               return "forward:/common/msgForward.do";
       		}
           
           // 웹 취약성 보완 -> 20190507 추가 END
           
           userService.updatePwdPopExec(rMap);

           // 로그인 실패 횟수 0으로 초기화
           commonUserService.updateLoginSuccessInfo(rMap);

           request.setAttribute("msg", "변경되었습니다.");
           request.setAttribute("url", "/academy/common/login.do");

 
       } catch (Exception e) { log.debug(e.getMessage());
           throw new FrontException(e);
       }

        return "forward:/common/msgForward.do";
    }

    /**
     * 마이페이지 > 나의수강현황 > 수료증 출력 안내 팝업
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/academy/member/findFormHelpPop.do")
    public String findFormHelpPop(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try {

            request.setAttribute("menu_nm", "mypage");
            request.setAttribute("lnb_menu", "myCourse");

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/member/find_form_help_pop";
    }

    /**
     * 기업정보 검색(ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/memberSearchCompany.do")
    public void memberSearchCompany(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;


        try {

            int companyCnt = userService.selectStatusGbYnCnt(rMap);

            List<EduMap> resultList = userService.seachCompanyList(rMap);
            Map<String, Object>  tempMap= new HashMap<String, Object>();
            int resultCnt = resultList.size();
            List tempList = new ArrayList();
            for(int i=0; i <resultList.size(); i++){
                EduMap map= resultList.get(i);

                tempMap.put("COMNAME", map.getString("COMNAME"));//사업장명
                tempMap.put("BIZNO", map.getString("BIZNO"));//사업자번호
                tempMap.put("ZIP", map.getString("ZIP"));//우편번호

                if(map.getString("ZIP").length() > 5){
                    tempMap.put("ZIP1",map.getString("ZIP").substring(0,3));
                    tempMap.put("ZIP2",map.getString("ZIP").substring(3,6));
                }

                tempMap.put("ADDR01", map.getString("ADDR01"));//주소1
                tempMap.put("ADDR02", map.getString("ADDR02"));//주소2
                tempMap.put("CEO", map.getString("CEO"));//대표자명
                tempMap.put("TEL", map.getString("TEL"));//회사전화번호

                tempMap.put("TEL1",map.getString("TEL").split("-")[0]);
                if(map.getString("TEL").split("-").length == 2){
                     tempMap.put("TEL2",map.getString("TEL").split("-")[1]);
                }
                if(map.getString("TEL").split("-").length == 3){
                    tempMap.put("TEL2",map.getString("TEL").split("-")[1]);
                    tempMap.put("TEL3",map.getString("TEL").split("-")[2]);
                }

                tempMap.put("BIZCND", map.getString("BIZCND"));//업태
                tempMap.put("INDUTY", map.getString("INDUTY"));//업종
                tempMap.put("COM_REG_GB", map.getString("COM_REG_GB"));//개인/법인
                //tempMap.put("COM_REG_DATE", map.getString("COM_REG_DATE"));//설립일
                tempMap.put("COMPMNGR", map.getString("COMPMNGR"));//기업담당자
                tempMap.put("MT_ORG_CODE", map.getString("MT_ORG_CODE"));//관할기관
                tempMap.put("resultCnt", resultCnt);//관할기관
                tempMap.put("STATUS_GB", map.getString("STATUS_GB"));//승인여부
                tempMap.put("companyCnt", companyCnt);//승인카운트
                tempList.add(tempMap);
            }
            if(resultList.size() < 1) {
                tempMap.put("companyCnt", companyCnt);//사업자번호유무)
                tempList.add(tempMap);
            }
            json = gson.toJson(tempList);

        }catch (Exception ex) {
            json = gson.toJson("FAIL");
        }
        out.print(json);
        out.flush();
        out.close();

    }

    /**
     * 회원 가입 아이디 중복체크 (ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/searchId.do")
    public void searchId(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;

        try {

            request.setAttribute("userId", userService.searchMberId(rMap));

            int checkStat = 0;

            //중복값 존재
            if (request.getAttribute("userId") != null) {
                checkStat = 1;

                //검색결과 없음
            } else {
                checkStat = 0;
            }
            json = gson.toJson(String.valueOf(checkStat));
        } catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

    }

    /**
     * 회원 가입 이메일 중복체크 및 인증이메일 발송 (ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/searchEmail.do")
    public void searchEmail(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;

//        Properties p = new Properties();
//        p.put("mail.smtp.user", SangsProperties.getProperty("Globals.mail.smtp.auth.user")); // Google계정@gmail.com으로 설정
//        p.put("mail.smtp.host", SangsProperties.getProperty("Globals.mail.smtp.host"));
//        p.put("mail.smtp.port", SangsProperties.getProperty("Globals.mail.smtp.port"));
//        p.put("mail.smtp.starttls.enable","true");
//        p.put( "mail.smtp.auth", "true");
//       
//        p.put("mail.smtp.debug", "true");
        /*p.put("mail.smtp.socketFactory.port", SangsProperties.getProperty("Globals.mail.smtp.port")); 
        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
        p.put("mail.smtp.socketFactory.fallback", "false");*/
        
        try {
        	
        	List<EduMap> tempMail = userService.searchMberEmail2(rMap);
            request.setAttribute("email", userService.searchMberEmail2(rMap));
            
            String authCode = "N";
            
            if(tempMail.get(0).get("AUTH_MODE").equals("M")){
            	
            	// 중복이메일 없음, 인증메일 발송
            	if (tempMail.size() > 0) {
            		//메일발송 테스트
            		
            		//인증번호 생성(6자리)
            		RandomUtil ranUtil = new RandomUtil();
//            		String tmpCode = ranUtil.getRandomInt(6);
            		
            		String tmpCode = "123456";
            		authCode = tmpCode ;
            		
            		rMap.setString("authCode", tmpCode);
            		String subject = "서민금융진흥원 아이디 찾기";
            		String content = "[서민금융진흥원 교육포털] Email 인증 번호 입니다. [ " + authCode + " ]를 입력해 주세요." ; 
            		
            		userService.authSendMail(rMap);
            		
            		/*Authenticator auth = new SMTPAuthenticator();
                Session session = Session.getInstance(p, auth);
                session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
              
                //session = Session.getDefaultInstance(p);
                MimeMessage msg = new MimeMessage(session);
                msg.setSubject(subject);
                Address fromAddr = new InternetAddress(SangsProperties.getProperty("Globals.mail.smtp.auth.user")); // 보내는 사람의 메일주소
                msg.setFrom(fromAddr);
                Address toAddr = new InternetAddress(rMap.getString("email"));  // 받는 사람의 메일주소
                msg.addRecipient(Message.RecipientType.TO, toAddr); 
                msg.setContent(content, "text/plain;charset=KSC5601");
                Transport.send(msg); */
            		rMap.setString("title", subject);
            		rMap.setString("summary", content );
            		rMap.setString("senderName", SangsProperties.getProperty("Globals.mailSenderAliasName"));
            		rMap.setString("senderEmail", SangsProperties.getProperty("Globals.mailSenderMailAddr"));
            		
            		//로그에 저장
                    commonEmsService.insertSendEmailLog(rMap);
            	}
           
            } else {
            	authCode = "X";
            }

            json = gson.toJson(String.valueOf(authCode));
        } catch (Exception ex) {
            json = gson.toJson("N");
        }

        out.print(json);
        out.flush();
        out.close();

    }
    
    private static class SMTPAuthenticator extends javax.mail.Authenticator {
	  public PasswordAuthentication getPasswordAuthentication() {
	   return new PasswordAuthentication("",""); // Google id, pwd, 주의) @gmail.com 은 제외하세요
	  }
	 } 

    
    /**
     * 아이디 비번찾기 찾기
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/searchEmailIdPw.do")
    public void searchEmailIdPw(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        
        Properties p = new Properties();
        p.put("mail.smtp.user", SangsProperties.getProperty("Globals.mail.smtp.auth.user")); // Google계정@gmail.com으로 설정
        p.put("mail.smtp.host", SangsProperties.getProperty("Globals.mail.smtp.host"));
        p.put("mail.smtp.port", SangsProperties.getProperty("Globals.mail.smtp.port"));
        p.put("mail.smtp.starttls.enable","true");
        p.put( "mail.smtp.auth", "true");
       
        p.put("mail.smtp.debug", "true");
        /*p.put("mail.smtp.socketFactory.port", SangsProperties.getProperty("Globals.mail.smtp.port")); 
        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
        p.put("mail.smtp.socketFactory.fallback", "false");*/
        
        try {
        	
            EduMap tempMail = userService.searchMberEmail(rMap);
            request.setAttribute("email", tempMail);
            String authCode = "N";
            
            // 중복이메일 없음, 인증메일 발송 , 개인정보 수정
            if (tempMail == null) {
                //인증번호 생성(6자리)
                RandomUtil ranUtil = new RandomUtil();
                String tmpCode = ranUtil.getRandomInt(6);

                rMap.setString("authCode", tmpCode);
                
                authCode = tmpCode;
                userService.authSendMail(rMap);
                
                String subject = "서민금융진흥원 이메일 인증입니다.";
                String content = "[서민금융진흥원 교육포털] Email 인증 번호 입니다. [ " + authCode + " ]를 입력해 주세요." ; 
                
                /*Authenticator auth = new SMTPAuthenticator();
                Session session = Session.getInstance(p, auth);
                session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
              
                //session = Session.getDefaultInstance(p);
                MimeMessage msg = new MimeMessage(session);
                msg.setSubject(subject);
                Address fromAddr = new InternetAddress(SangsProperties.getProperty("Globals.mail.smtp.auth.user")); // 보내는 사람의 메일주소
                msg.setFrom(fromAddr);
                Address toAddr = new InternetAddress(rMap.getString("email"));  // 받는 사람의 메일주소
                msg.addRecipient(Message.RecipientType.TO, toAddr); 
                msg.setContent(content, "text/plain;charset=KSC5601");
                Transport.send(msg);
                */
                
                rMap.setString("title", subject);
                rMap.setString("summary", content );
	            rMap.setString("senderName", SangsProperties.getProperty("Globals.mailSenderAliasName"));
	            rMap.setString("senderEmail", SangsProperties.getProperty("Globals.mailSenderMailAddr"));
	            
	            //로그에 저장
                commonEmsService.insertSendEmailLog(rMap);
                
                //로그rec에 저장
                //commonEmsService.insertSendEmailLogRec(rMap);
            }else if(tempMail == null){
            	//회원가입시 이메일인증
            	
            	RandomUtil ranUtil = new RandomUtil();
                String tmpCode = ranUtil.getRandomInt(6);

                rMap.setString("authCode", tmpCode);
                authCode = tmpCode;
                //userService.authSendMail(rMap);
            }

            json = gson.toJson(String.valueOf(authCode));
        } 
        catch (Exception ex) {
            json = gson.toJson("N");
        }

        out.print(json);
        out.flush();
        out.close();

    }
    
    /**
     * 회원 가입 이메일 인증 번호 발송(ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/authEmailCheckJoin.do")
    public String authEmailCheckJoin(Model model,HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
    	
    	res.setContentType("text/html; charset=utf-8");
        Gson gson = new Gson();
        String json = null;
        
        HttpSession session = request.getSession();
        
        Properties p = new Properties();
        p.put("mail.smtp.user", SangsProperties.getProperty("Globals.mail.smtp.auth.user")); // Google계정@gmail.com으로 설정
        p.put("mail.smtp.host", SangsProperties.getProperty("Globals.mail.smtp.host"));
        p.put("mail.smtp.port", SangsProperties.getProperty("Globals.mail.smtp.port"));
        p.put("mail.smtp.starttls.enable","true");
        p.put( "mail.smtp.auth", "true");
       
        p.put("mail.smtp.debug", "true");
    	
    	//TODO : 이메일 인증 적용해야함. 현재는 메일인증 안하고있음. 기존소스 /academy/user/member/searchEmailIdPw.do  참고
    	
        String result = "";
	    String authCode = "";
	    
        try {
            EduMap map = (EduMap)userService.searchMberEmail(rMap);
            request.setAttribute("email", map);
            
             //중복값 없음 -> SMS 발송
            if (map == null) {
                RandomUtil ranUtil = new RandomUtil();
                String tmpCode = ranUtil.getRandomInt(6);
                authCode =tmpCode;
                result = "Y";
                
                rMap.setString("authCode", tmpCode);
                
                authCode = tmpCode;
                //userService.authSendMail(rMap);
                
                String subject = "서민금융진흥원 이메일 인증입니다.";
                String content = "[서민금융진흥원 교육포털] Email 인증 번호 입니다. [ " + authCode + " ]를 입력해 주세요." ; 
                
                session.setAttribute("authCode",authCode);
                
                rMap.setString("title", subject);
                rMap.setString("summary", content );
	            rMap.setString("senderName", SangsProperties.getProperty("Globals.mailSenderAliasName"));
	            rMap.setString("senderEmail", SangsProperties.getProperty("Globals.mailSenderMailAddr"));
	            
	            //로그에 저장
                commonEmsService.insertSendEmailLog(rMap);
            }
            else {
            	result = "DUP";
            }

        } catch (Exception ex) {
        	result = "FAIL";
        
        }finally{
        	model.addAttribute("result", result);
        	model.addAttribute("authCode", authCode);
        	
        }
        
        return "jsonView";
    }
    
    /**
     * 회원 가입 보호자 SMS 인증 번호 발송(ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/authAgeSmsCheckJoin.do")
    public String authAgeSmsCheckJoin(Model model, DataMap rMap,HttpServletRequest request) throws Exception {
	    String result = "";
	    String authCode = "";
	    HttpSession session = request.getSession();
        try {
                RandomUtil ranUtil = new RandomUtil();
                String tmpCode = ranUtil.getRandomInt(6);

                authCode =tmpCode;
                
        		String mobile = rMap.getString("AgeMobile").replace("-", "");
        		
                rMap.setString("summary", "[서민금융진흥원] SMS 인증 번호 입니다. [ " + authCode + " ]를 입력해 주세요.");
                rMap.setString("tranType", "4");
                rMap.setString("callBack", "15444691");
                rMap.setString("userInfo", "joinUser"+"^"+mobile);
                //로그에 저장
                commonEmsService.insertSendMessageLog(rMap);
                
                session.setAttribute("smsAgeAuthCode",authCode);
                
                result = "Y";
                
                //MSG_DATA에 저장
                //commonEmsService.insertSmsData(rMap);

        } catch (Exception ex) {
        	result = "FAIL";
        
        }finally{
        	model.addAttribute("result", result);
        	model.addAttribute("authCode", authCode);
        	
        }
        
        return "jsonView";
        
    }
    
    /**
     * 회원 가입 SMS 인증 번호 발송(ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/authSmsCheckJoin.do")
    public String authSmsCheckJoin(Model model, DataMap rMap, HttpServletRequest request) throws Exception {
	    String result = "";
	    String authCode = "";
	    
        try {
        	/*휴대폰 번호 중복체크*/
        	rMap.setString("memberYn", "Y"); //회원여부
            EduMap map = (EduMap)userService.selectPwdSearchUserInfo(rMap);
            
            HttpSession session = request.getSession();
            
            Enumeration params = session.getAttributeNames();
            
             //중복값 없음 -> SMS 발송
            if (map == null) {
                RandomUtil ranUtil = new RandomUtil();
                String tmpCode = ranUtil.getRandomInt(6);

                authCode =tmpCode;
                
        		String mobile = rMap.getString("mobile").replace("-", "");
        		
                rMap.setString("summary", "[서민금융진흥원] SMS 인증 번호 입니다. [ " + authCode + " ]를 입력해 주세요.");
                rMap.setString("tranType", "4");
                rMap.setString("callBack", "15444691");
                rMap.setString("userInfo", "joinUser"+"^"+mobile);
                
                session.setAttribute("authCode",authCode);
                
                //로그에 저장
                commonEmsService.insertSendMessageLog(rMap);
                
                result = "Y";
                
                //MSG_DATA에 저장
                //commonEmsService.insertSmsData(rMap);

            }
            else {
            	result = "DUP";
            }

        } catch (Exception ex) {
        	result = "FAIL";
        
        }finally{
        	model.addAttribute("result", result);
        	model.addAttribute("authCode", authCode);
        	
        }


        
        return "jsonView";
        
    }

    /**
     * 회원 가입 SMS 인증 번호 발송(ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/authSmsCheckJoin2.do")
    public String authSmsCheckJoin2(Model model, DataMap rMap) throws Exception {
	    String result = "";
	    String authCode = "";
	    
        try {
        	/*휴대폰 번호 중복체크
        	rMap.setString("memberYn", "Y"); //회원여부
            EduMap map = (EduMap)userService.selectPwdSearchUserInfo(rMap);
           */
             //중복값 없음 -> SMS 발송
        	
        	EduMap map = commonUserService.getNonMberLoginUserInfo(rMap);
        	String chkYn = "Y";
        	if(!chkYn.equals(map.get("SECSN_AT"))){
        		if (map != null) {
        			RandomUtil ranUtil = new RandomUtil();
        			String tmpCode = ranUtil.getRandomInt(6);
        			
        			String mobile = rMap.getString("moblphon").replace("-", "");
        			
        			authCode =tmpCode;
        			rMap.setString("summary", "[서민금융진흥원] SMS 인증 번호 입니다. [ " + authCode + " ]를 입력해 주세요.");
        			rMap.setString("tranType", "4");
        			rMap.setString("callBack", "15444691");
        			rMap.setString("userInfo", rMap.getString("mbernm")+"^"+mobile);
        			
        			//로그에 저장
        			commonEmsService.insertSendMessageLog(rMap);
        			
        			result = "Y";
        			
        			//MSG_DATA에 저장
        			//commonEmsService.insertSmsData(rMap);
        			
        		} else {
        			result = "DUP";
        		}
        		
        	} else {
        		result = "NOT";
        	}

        } catch (Exception ex) {
        	result = "FAIL";
        
        }finally{
        	model.addAttribute("result", result);
        	model.addAttribute("authCode", authCode);
        	
        }


        
        return "jsonView";
        
    }
    
    

    /**
     * 회원 수정 SMS 인증 번호 발송(ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/authSmsCheck.do")
    public void authSmsCheck(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        HttpSession session = request.getSession();
        try {
            //휴대폰 번호 중복체크
            //EduMap map = (EduMap)userService.searchMberMobile2(rMap);
            String authCode = "N";
            
                RandomUtil ranUtil = new RandomUtil();
                String tmpCode = ranUtil.getRandomInt(6);
                authCode =tmpCode;
            	String mobile = rMap.getString("mobile").replace("-", "");
            	rMap.setString("mobile", mobile);
                rMap.setString("userId", rMap.getString("SES_USERID"));
                rMap.setString("summary", "[서민금융진흥원] SMS 인증 번호 입니다. [ " + authCode + " ]를 입력해 주세요.");
                rMap.setString("tranType", "4");
                rMap.setString("callBack", "15444691");
                rMap.setString("userInfo", rMap.getString("userName")+"^"+mobile);
                
                //로그에 저장
                commonEmsService.insertSendMessageLog(rMap);
                session.setAttribute("authCode", authCode);
                //MSG_DATA에 저장
                //commonEmsService.insertSmsData(rMap);

            json = gson.toJson(String.valueOf(authCode));
        } catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

    }

    /**
     * 회원 비밀번호찾기 SMS 인증 번호 발송(ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/pwdSearchauthSmsCheck.do")
    public void pwdSearchauthSmsCheck(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;

        try {
            //사용자 검색
            //아이디, 이름, 휴대폰번호
            EduMap map = userService.selectPwdSearchUserInfo(rMap);

            String authCode = "N";
            
            //중복값 없음 -> SMS 발송
            if (map != null) {
            	
            	if(map.getString("AUTH_MODE").equals("S")){
            	
            		
            		RandomUtil ranUtil = new RandomUtil();
//            		String tmpCode = ranUtil.getRandomInt(6);
            		
            		// TEST
            		String tmpCode = "123456";
            		
            		authCode =tmpCode;
            		
            		rMap.setString("userId", map.getString("UNITY_ID"));
            		rMap.setString("mobile", map.getString("MOBLPHON"));
            		String mobile = map.getString("MOBLPHON").replace("-", "");
                	rMap.setString("mobile", mobile);
            		rMap.setString("summary", "[서민금융진흥원] SMS 인증 번호 입니다. [ " + authCode + " ]를 입력해 주세요.");
            		rMap.setString("tranType", "4");
            		rMap.setString("callBack", "15444691");
            		rMap.setString("userInfo", rMap.getString("userName")+"^"+mobile);
            		
            		
            		//로그에 저장
            		commonEmsService.insertSendMessageLog(rMap);
            		
            		//MSG_DATA에 저장
//            		commonEmsService.insertSmsData(rMap);
            		
            	}else {
                	authCode = "X"; 
            	} 
            }
            
            json = gson.toJson(String.valueOf(authCode));
        } catch (Exception ex) {
        	ex.printStackTrace();
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

    }
    
    /**
     * 회원 아이디찾기 SMS 아이디 조회(ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/idSearchauthSmsResult.do")
    public void idSearchauthSmsResult(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;

        try {
            //사용자 검색
            //아이디, 이름, 휴대폰번호
        	
            EduMap map = (EduMap)userService.selectPwdSearchUserInfo(rMap);

            String authCode = "N";

             //중복값 없음 -> SMS 발송
            if (map != null) {

                RandomUtil ranUtil = new RandomUtil();
                String tmpCode = ranUtil.getRandomInt(6);

                authCode =tmpCode;
                 
                 rMap.setString("userId", map.getString("UNITY_ID"));
                 rMap.setString("summary", "[서민금융진흥원] SMS 인증 번호 입니다. [ " + authCode + " ]를 입력해 주세요.");
                 rMap.setString("tranType", "4");
                 rMap.setString("callBack", "15444691");
                 
                 //로그에 저장
                 commonEmsService.insertSendMessageLog(rMap);
                 
                 //MSG_DATA에 저장
                 //commonEmsService.insertSmsData(rMap);

            }

            json = gson.toJson(String.valueOf(authCode));
        } catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

    }
    
    @RequestMapping(value = "/academy/user/member/searchPwd2.do")
	public String searchPwd3(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
    	HttpSession session = request.getSession();
    	
    	try {
            int checkStat = 0;
            PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
            //session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
            if (privateKey == null) {
                throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
            }
            String pass_word = decryptRsa(privateKey, rMap.getString("pwd"));
            
            // 취약성 -> 인코딩 및 디코딩 주석 20190508
//            BASE64Decoder base64Decoder = new BASE64Decoder();
//            String infoPass = new String(base64Decoder.decodeBuffer(pass_word.trim()));
            
            String infoPass = pass_word.trim();
            
            EduMap map = commonUserService.getLoginUserInfo(rMap);
            //잠시 제거 && SangsCryptUtil.isMatch(infoPass, map.getString("PWD"))
            //올바른 비밀번호
            if ( map != null && SangsCryptUtil.isMatch(infoPass, map.getString("PWD")) ) {
            	request.setAttribute("REQUEST_DATA", rMap);
            	return "forward:/academy/myclass/memberModifyForm.do";
            } 
            else { // 틀린 비밀번호
            	rMap.set("checkStat", 1);
            	request.setAttribute("REQUEST_DATA", rMap);
        		return "forward:/academy/myclass/memberModifyAuthForm.do?checkStat=1";
            }
            
            
        } 
        catch (Exception ex) {
        	rMap.set("checkStat", 2);
        	request.setAttribute("REQUEST_DATA", rMap);
        	return "forward:/academy/myclass/memberModifyAuthForm.do?checkStat=2";
        }
	}
    
    /**
     * 회원 비밀번호 확인 (ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/searchPwd.do")
    public void searchPwd(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        HttpSession session = request.getSession();
        try {
            int checkStat = 0;
            PrivateKey privateKey = (PrivateKey) session.getAttribute("__rsaPrivateKey__");
            //session.removeAttribute("__rsaPrivateKey__"); // 키의 재사용을 막는다. 항상 새로운 키를 받도록 강제.
            if (privateKey == null) {
                throw new RuntimeException("암호화 비밀키 정보를 찾을 수 없습니다.");
            }
           
            String pass_word = decryptRsa(privateKey, rMap.getString("pwd"));
            BASE64Decoder base64Decoder = new BASE64Decoder();
            String infoPass = new String(base64Decoder.decodeBuffer(pass_word.trim()));
            EduMap map = commonUserService.getLoginUserInfo(rMap);
            //잠시 제거 && SangsCryptUtil.isMatch(infoPass, map.getString("PWD"))
            //올바른 비밀번호
            if ( map != null && SangsCryptUtil.isMatch(infoPass, map.getString("PWD")) ) {
                checkStat = 1;
            } 
            else { // 틀린 비밀번호
                checkStat = 0;
            }
            
            json = gson.toJson(String.valueOf(checkStat));
            
        } 
        catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

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
     * 회원 아이디 비밀번호 찾기 (ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/findIdPw.do")
    public void findIdPw(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;

        try {

            String resultText = "";//리턴해줄 변수 생성
            //찾고자 하는것이 아이디 일 경우
            if ("ID".equals(rMap.getString("pmode"))) {
            	List<EduMap> emap = userService.selectFindId2(rMap);
                //검색한 아이디를 넣어줌
                if (emap != null) resultText = emap.get(0).getString("USERID");
                else if (emap == null) resultText = "NOT_FIND";

                //찾고자 하는것이 비밀번호 일 경우
            } else if ("PWD".equals(rMap.getString("pmode"))) {

                rMap.setString("userName", rMap.getString("PWD_userName"));

                //비밀번호 암호화
                RandomUtil ranUtil = new RandomUtil();
                //String tmpPwd = ranUtil.getRandomStr(9); //10자리의 랜덤 비밀번호 추출

                //영문2자+숫자2자+특수문자2자+영문3자 (총 9자리)
                String randomVal = ranUtil.getRandomAbc(2);
                String randomint = ranUtil.getRandomInt(2);
                String randomSpec = ranUtil.getRandomSpec(2);
                String randomAbc = ranUtil.getRandomAbc(3);

                String tmpPwd = "";
                if (Integer.parseInt(randomint) < 100) {
                    tmpPwd = randomVal+randomint+randomSpec+randomAbc;
                }

                //임시 비밀번호 이메일로 발송
                //회원가입 SMS, MAIL 발송
                EduMap emap = userService.selectFindId(rMap);

                if (emap != null) {

                    rMap.setString("rPwd", SangsCryptUtil.crypt(tmpPwd));
                    rMap.setString("rPwdOrg", tmpPwd); //바뀐 원본 비밀번호(메일발송용)
                    rMap.setString("eUserName", emap.getString("USERNAME"));//이름
                    rMap.setString("rUserId", emap.getString("USERID"));//아이디
                    rMap.setString("rEmail", emap.getString("EMAIL"));//이메일

                    userService.updateFindPwd(rMap);//비밀번호 변경 실행 및 이메일발송

                    // 로그인 실패 횟수 0으로 초기화
                    rMap.setString("userId", emap.getString("USERID"));//아이디
                    commonUserService.updateLoginSuccessInfo(rMap);

                    resultText = "FIND_PWD";
                    //DB 조회결과 없음
                } else {
                    resultText = "NOT_FIND";
                }

            }

            json = gson.toJson(String.valueOf(resultText));

        } catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();
    }

    /**
     * 기관/단체 검색 팝업
     *
     * @date	: 2016. 11. 01.
     * @author	: 이진영, sweetjy09@sangs.co.kr
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 기관/단체 검색 팝업
    @RequestMapping(value = "/academy/user/officeSearchList.do")
    public String officeSearchList(Model model, DataMap rMap) throws Exception {

        rMap.setString("mtCode", SangsProperties.getProperty("Globals.mtCode_MT_OFFICE_CODE"));
       // rMap.setInt("rowCount", 20);
        
        log.debug("===> " + commonService.getOfficeCodeList(rMap));
        
        model.addAttribute("list",  commonService.getOfficeCodeList(rMap));
        //request.setAttribute("resultCount", commonService.getOfficeCodeCount(rMap));
        //request.setAttribute("REQUEST_DATA", rMap);
        
        

        //return "academy/cmmn/jsp/office_search_pop";
        
        return "jsonView";
    }
    
    /**
     * 우편번호
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    // TODO: 우편번호
    @RequestMapping(value = "/academy/user/postEtc.do")
	public String postEtc(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

		request.setAttribute("REQUEST_DATA", rMap);
		return "academy/cmmn/jsp/post_pop";
	}
    
    /**
     * 우편번호 찾기 실행
     * @param params
     * @param request
     * @param res
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/getPostAjax.do")
    public void getPost(@RequestParam Map<String, String> params, HttpServletRequest request, HttpServletResponse res, ModelMap model) throws Exception {

    	String currentPage = request.getParameter("currentPage");
		String countPerPage = request.getParameter("countPerPage");
		String newZipcodeUrl = SangsProperties.getProperty("Globals.newZipcodeUrl");
		String confmKey = URLEncoder.encode(SangsProperties.getProperty("Globals.confmKey"), "UTF-8"); // 인증키
 		String srchText = URLEncoder.encode(request.getParameter("srchText"), "UTF-8"); // 검색
 		
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
     * 비회원 로그인 SMS 인증 번호 발송(ajax)
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/noMberAuthSmsCheckJoin.do")
    public void noMberAuthSmsCheckJoin(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;

        try {
            //휴대폰 번호 중복체크
            EduMap map = (EduMap)userService.searchMberMobile(rMap);

            String authCode = "N";
            
             //중복값 없음 -> SMS 발송
            if (map != null) {

                RandomUtil ranUtil = new RandomUtil();
                String tmpCode = ranUtil.getRandomInt(6);

                authCode =tmpCode;
                rMap.setString("summary", "[서민금융진흥원] SMS 인증 번호 입니다. [ " + authCode + " ]를 입력해 주세요.");
                rMap.setString("tranType", "4");
                rMap.setString("callBack", "15444691");
                
                //로그에 저장
                commonEmsService.insertSendMessageLog(rMap);
                
                //MSG_DATA에 저장
                //commonEmsService.insertSmsData(rMap);

            }

            json = gson.toJson(String.valueOf(authCode));
        } catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

    }
    
	/**
     * 개인정보 수정 이메일 인증
     * @param request
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/user/member/authEmaiCheck.do")
    public void authEmaiCheck(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        HttpSession session = request.getSession();
        
        Properties p = new Properties();
        p.put("mail.smtp.user", SangsProperties.getProperty("Globals.mail.smtp.auth.user")); // Google계정@gmail.com으로 설정
        p.put("mail.smtp.host", SangsProperties.getProperty("Globals.mail.smtp.host"));
        p.put("mail.smtp.port", SangsProperties.getProperty("Globals.mail.smtp.port"));
        p.put("mail.smtp.starttls.enable","true");
        p.put( "mail.smtp.auth", "true");
       
        p.put("mail.smtp.debug", "true");
        /*p.put("mail.smtp.socketFactory.port", SangsProperties.getProperty("Globals.mail.smtp.port")); 
        p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); 
        p.put("mail.smtp.socketFactory.fallback", "false");*/
        
        try {
        	
            String authCode = "N";
            // 인증메일 발송 , 개인정보 수정
                //인증번호 생성(6자리)
                RandomUtil ranUtil = new RandomUtil();
                String tmpCode = ranUtil.getRandomInt(6);

                rMap.setString("authCode", tmpCode);
                
                authCode = tmpCode;
                userService.authSendMail(rMap);
                
                String subject = "서민금융진흥원 이메일 인증입니다.";
                String content = "[서민금융진흥원 교육포털] Email 인증 번호 입니다. [ " + authCode + " ]를 입력해 주세요." ; 
                
                /*Authenticator auth = new SMTPAuthenticator();
                Session session = Session.getInstance(p, auth);
                session.setDebug(true); // 메일을 전송할 때 상세한 상황을 콘솔에 출력한다.
              
                //session = Session.getDefaultInstance(p);
                MimeMessage msg = new MimeMessage(session);
                msg.setSubject(subject);
                Address fromAddr = new InternetAddress(SangsProperties.getProperty("Globals.mail.smtp.auth.user")); // 보내는 사람의 메일주소
                msg.setFrom(fromAddr);
                Address toAddr = new InternetAddress(rMap.getString("email"));  // 받는 사람의 메일주소
                msg.addRecipient(Message.RecipientType.TO, toAddr); 
                msg.setContent(content, "text/plain;charset=KSC5601");
                Transport.send(msg);
                */
                
                rMap.setString("title", subject);
                rMap.setString("summary", content );
	            rMap.setString("senderName", SangsProperties.getProperty("Globals.mailSenderAliasName"));
	            rMap.setString("senderEmail", SangsProperties.getProperty("Globals.mailSenderMailAddr"));
	            
	            //로그에 저장
                commonEmsService.insertSendEmailLog(rMap);
                
                session.setAttribute("authCode", authCode);
                
                //로그rec에 저장
                //commonEmsService.insertSendEmailLogRec(rMap);

            json = gson.toJson(String.valueOf(authCode));
        } 
        catch (Exception ex) {
            json = gson.toJson("N");
        }

        out.print(json);
        out.flush();
        out.close();

    }    	
    
    @RequestMapping(value = "/academy/user/member/searchAgePwdmatch.do")
    public void searchAgePwdMatch(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        HttpSession session = request.getSession();
        try {
            int checkStat = 0;
            System.out.println("@@@@@@@@@@@rMap:"+session.getAttribute("smsAgeAuthCode"));
            if(session.getAttribute("smsAgeAuthCode").equals(rMap.get("ageConfirmCode"))){
            	checkStat=0;
            	System.out.println("일치");
            	session.removeAttribute("smsAgeAuthCode");
            }else{
            	checkStat=1;
            	System.out.println("불일치");
            }
            json = gson.toJson(String.valueOf(checkStat));
            
        } 
        catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

    }
    
    @RequestMapping(value = "/academy/user/member/searchPwdmatch.do")
    public void searchPwdMatch(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        HttpSession session = request.getSession();
        try {
            int checkStat = 0;
            System.out.println("@@@@@@@@@@@rMap:"+session.getAttribute("authCode"));
            if(session.getAttribute("authCode").equals(rMap.get("confirmCode"))){
            	checkStat=0;
            	System.out.println("일치");
            	session.setAttribute("resultYn", "Y");
//            	session.removeAttribute("authCode");
            }else{
            	checkStat=1;
            	System.out.println("불일치");
            }
            json = gson.toJson(String.valueOf(checkStat));
            
        } 
        catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

    }
    
    /**
     * 회원가입 > DI값 비교 후, 회원정보 이력 여부 판단
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 회원가입 > DI값 비교 후, 회원정보 이력 여부 판단
    @RequestMapping(value = "/academy/user/memberAuthCheckJoin.do")
    public void memberAuthCheckJoin(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        
        try {
        	
            int checkJoin = 0;
            
            if("adult".equals(rMap.getString("memberType")))
            {
            	checkJoin = userService.chkJoinYn(rMap);
            } else if("child".equals(rMap.getString("memberType"))) {
            	checkJoin = 0;
            }
            
            json = gson.toJson(String.valueOf(checkJoin));
            
        } 
        catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

    }
    
    /**
     * 기존회원 > LMS_CT_UNITY_MBER 개인정보 비교
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 기존회원 > LMS_CT_UNITY_MBER 개인정보 비교
    @RequestMapping(value = "/academy/user/memberCompareInfo.do")
    public void memberCompareInfo(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        
        try {
        	
            int checkJoin = 0;
            checkJoin = userService.chkInfoCompare(rMap);
            json = gson.toJson(String.valueOf(checkJoin));
            
        } 
        catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

    }
    
    
    /**
     * 기존회원 > LMS_CT_UNITY_MBER 개인정보 비교
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 기존회원 > LMS_CT_UNITY_MBER 개인정보 비교
    @RequestMapping(value = "/academy/user/memberUpdateInfo.do")
    public void memberUpdateInfo(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        
        try {
        	
        	userService.mebmerUpdateInfo(rMap);
            json = gson.toJson("SUCCESS");
            
        } 
        catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();

    }
    
}