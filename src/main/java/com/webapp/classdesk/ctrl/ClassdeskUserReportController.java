package com.webapp.classdesk.ctrl;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.DataMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.webapp.classdesk.service.ClassdeskTutorReportService;
import com.webapp.classdesk.service.ClassdeskUserReportService;

/**
 * Description : 클래스데스트 > 학생모드 > 과제
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskUserReportController {

    @Resource(name = "classdeskUserReportService")
    private ClassdeskUserReportService  classdeskUserReportService;

    @Resource(name = "classdeskTutorReportService")
    private ClassdeskTutorReportService classdeskTutorReportService;

    /**
     * 과제목록
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/report/list.do")
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "report");
        	
        	 Date date = new Date();
             SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
             rMap.setString("standardDay", sdf.format(date).replace("-", ""));
             
            request.setAttribute("listData", classdeskUserReportService.getUserReportList(rMap));
        } catch (Exception e) { 
            throw new FrontException(e);
        }
        rMap.setString("title", SangsProperties.getProperty("Globals.reportList"));
        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/report_list";
    }

    /**
     * 과제 제출양식
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/report/submit_form.do")
    public String submitForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "report");
            request.setAttribute("reportData", classdeskTutorReportService.getReportItem(rMap));
            rMap.setInt("cUserNo", rMap.getInt("SES_CUSERNO"));
            request.setAttribute("reportApplyData", classdeskTutorReportService.getReportApplyInfo(rMap));
            request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "report");
            request.setAttribute("listData", classdeskUserReportService.getUserReportList(rMap));
        } catch (Exception e) { 
            throw new FrontException(e);
        }
        rMap.setString("title", SangsProperties.getProperty("Globals.reportList"));
        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/report_submit_form";
    }
    
    /**
     * 과제 결과 상세보기
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/report/submit_view.do")
    public String submitView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "report");
            request.setAttribute("reportData", classdeskTutorReportService.getReportItem(rMap));
            rMap.setInt("cUserNo", rMap.getInt("SES_CUSERNO"));
            request.setAttribute("reportApplyData", classdeskTutorReportService.getReportApplyInfo(rMap));
            request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "report");
            request.setAttribute("listData", classdeskUserReportService.getUserReportList(rMap));
        } catch (Exception e) { 
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/report_submit_view";
    }

    /**
     * 제출실행(임시/완료)
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/report/submit_exec.do")
    public String submitExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "report");
        	
            // 저장
            classdeskUserReportService.saveReportApply(request, rMap);

            if ("Y".equals(rMap.getString("openYn"))) {
                rMap.putString("rMsg", "과제 제출되었습니다.");
                rMap.putString("rUrl", "/classdesk/user/report/list.do");
            } else {
                rMap.putString("rMsg", "임시 저장되었습니다.");
                rMap.putString("rUrl", "/classdesk/user/report/list.do");
            }
        } catch (Exception e) { 
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec2";
    }

    /**
     * 과제 평가 양식
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/report/result.do")
    public String result(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "report");
            request.setAttribute("reportData", classdeskTutorReportService.getReportItem(rMap));
            request.setAttribute("rowData", classdeskTutorReportService.getReportApplyInfo(rMap));
        } catch (Exception e) { 
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/report_result";
    }
}
