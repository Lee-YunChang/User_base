package com.webapp.academy.ctrl;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.StringUtil;
import com.webapp.academy.service.CommonService;
import com.webapp.academy.service.UserService;

/**
 * Description : 기업정보 관련 컨트롤러
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2015.06.01 	SANGS			최초작성
 *
 */ 

@Controller
public class CompanyController {  

    private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "userService")
    private UserService       userService;

    @Resource(name = "commonService")
    private CommonService       commonService;

    /**
     * 마이페이지 > 기업정보 - 기업정보 폼
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/academy/myclass/companyForm.do")
    public String companyForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try {

            if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/academy/common/login.do");
                return "forward:/common/msgForward.do";
            }

            if (rMap.getInt("SES_GRADENO") != 2  || rMap.getInt("SES_USERNO") < 1) {//기업 담당자가 아닐경우
                request.setAttribute("msg", "기업담당자만 볼수 있습니다.");
                request.setAttribute("url", "/academy/main/main.do");
                return "forward:/common/msgForward.do";
            }

            request.setAttribute("menu_nm", "mypage");
            request.setAttribute("lnb_menu", "company");
            request.setAttribute("lnb_menu_sub", "company_info");

            //개인정보 호출
            EduMap userInfo = userService.selectUserInfo(rMap);
            rMap.setInt("COMNO", userInfo.getInt("COMNO"));
            rMap.setString("BIZNO", userInfo.getString("BIZNO"));

            //회사정보 호출
            EduMap companyInfo = userService.selectCompanyInfo(rMap);

            companyInfo.put("COMNAME", StringUtil.getContent2(companyInfo.getString("COMNAME")));

            companyInfo.put("tel1",companyInfo.getString("TEL").split("-")[0]);
                if(companyInfo.getString("tel1").split("-").length== 2){
                    companyInfo.put("tel2",companyInfo.getString("TEL").split("-")[1]);
                }
                else if(companyInfo.getString("TEL").split("-").length == 3){
                    companyInfo.put("tel2",companyInfo.getString("TEL").split("-")[1]);
                    companyInfo.put("tel3",companyInfo.getString("TEL").split("-")[2]);
                }

             rMap.setString("mtCode", SangsProperties.getProperty("Globals.mtCode_MT_ORG_CODE"));

             //기업 관할 리스트 호출
             request.setAttribute("companyOrgList", commonService.selectMtCodeSub(rMap));

             request.setAttribute("REQUEST_DATA", rMap);
            request.setAttribute("userInfo", userInfo);
            request.setAttribute("companyInfo", companyInfo);

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
        return "academy/company/company_form";
    }

    /**
     * 마이페이지 > 기업정보 > 기업정보 수정
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/academy/myclass/companyExec.do")
    public String updateCompanyInfo(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try {

            if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/academy/common/login.do");
                return "forward:/common/msgForward.do";
            }

            if (rMap.getInt("SES_GRADENO") != 2  || rMap.getInt("SES_USERNO") < 1) {//기업 담당자가 아닐경우
                request.setAttribute("msg", "기업담당자만 볼수 있습니다.");
                request.setAttribute("url", "/academy/main/main.do");
                return "forward:/common/msgForward.do";
            }

            request.setAttribute("menu_nm", "mypage");
            request.setAttribute("lnb_menu", "company");
            request.setAttribute("lnb_menu_sub", "company_info");

            //기업정보 수정
            rMap.setString("comName", StringUtil.getContent2(rMap.getString("comName")));
            userService.updateCompanyInfo(rMap);

            rMap.setString("msg", "수정되었습니다.");

            rMap.setString("url", "/academy/myclass/companyForm.do");

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
        return "academy/cmmn/academyExec";
    }

    /**
     * 마이페이지 > 기업정보 > 기업회원관리 > 기업담당자 변경 팝업
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/academy/myclass/comGradeChn.do")
    public String comGradeChn(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/academy/common/login.do");
                return "forward:/common/msgForward.do";
            }

            if (rMap.getInt("SES_GRADENO") != 2  || rMap.getInt("SES_USERNO") < 1) {//기업 담당자가 아닐경우
                request.setAttribute("msg", "기업담당자만 볼수 있습니다.");
                request.setAttribute("url", "/academy/main/main.do");
                return "forward:/common/msgForward.do";
            }
            //로그인 한사람의 comNo 호출
            EduMap userInfo = userService.selectUserInfo(rMap);
            rMap.setInt("comNo", userInfo.getInt("COMNO"));
            rMap.setString("bizNo", userInfo.getString("BIZNO"));

            //해당 기업 회원 조회
            List<EduMap> resultList = userService.selectComEmpList(rMap);

            request.setAttribute("resultList", resultList);
            request.setAttribute("REQUEST_DATA", rMap);

            for(int i=0; i< resultList.size(); i++){

                EduMap map = (EduMap)resultList.get(i);
            }


        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/company/company_grade_chn";

    }


    /**
     * 기업담당자 가입권유메일 하루 100건으로 제한 체크
     * @param req
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/myclass/comMngrChnAjax.do")
    public void comMngrChnAjax(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;
        int resultStat = 1;

        try {

            if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/academy/common/login.do");
                resultStat = 0;
            }

            if (rMap.getInt("SES_GRADENO") != 2  || rMap.getInt("SES_USERNO") < 1) {//기업 담당자가 아닐경우
                request.setAttribute("msg", "기업담당자만 볼수 있습니다.");
                request.setAttribute("url", "/academy/main/main.do");
                resultStat = 0;
            }

            //현재기업담당자 일반 회원으로 변경 후 신규 기업담당자 변경
            rMap.setString("mtCode1", SangsProperties.getProperty("Globals.mtGradeUserCode"));
            rMap.setString("mtCode2", SangsProperties.getProperty("Globals.mtGradeCompMngrCode"));
            userService.updateComMngrExec(rMap);

            json = gson.toJson(String.valueOf(resultStat));
        } catch (Exception ex) {
            resultStat = 0;
            json = gson.toJson(resultStat);
        }

        out.print(json);
        out.flush();
        out.close();

    }

}