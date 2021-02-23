package com.webapp.classdesk.ctrl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.DataMap;
import com.sangs.support.FrontException;
import com.sangs.util.DateUtil;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.service.ClassdeskCommonService;
import com.webapp.classdesk.service.ClassdeskTutorResultService;

/**
 * Description : 클래스데스트 > 강사모드 > 과제
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskTutorResultController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskCommonService")
    private ClassdeskCommonService      classdeskCommonService;

    @Resource(name = "classdeskTutorResultService")
    private ClassdeskTutorResultService classdeskTutorResultService;

    /**
     * 성적등록 양식
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_form.do")
    public String resultForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("rowData", classdeskCommonService.getEdCourseSeqInfo(rMap));
            request.setAttribute("listData", classdeskTutorResultService.getLeCourseUSerList(rMap));

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/result_form";
    }

    /**
     * 성적 다운로드 (엑셀)
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_excel.do")
    public String resultExcel(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("rowData", classdeskCommonService.getEdCourseSeqInfo(rMap));
            request.setAttribute("listData", classdeskTutorResultService.getLeCourseUSerList(rMap));

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/result_excel";
    }

    /**
     * 수강자별 성적 실행
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_exec.do")
    public String resultExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorResultService.resultExec(request, rMap);

            rMap.putString("rMsg", "저장되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) { log.debug(e.getMessage());
             
            rMap.putString("rMsg", "실패하였습니다.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 전체 성적 실행(최종반영)
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_final_exec.do")
    public String resultFinalExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorResultService.resultFinalExec(request, rMap);

            rMap.putString("rMsg", "저장되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) { log.debug(e.getMessage());
             
            rMap.putString("rMsg", "실패하였습니다.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 상시 성적등록 양식
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_always_form.do")
    public String resultAlwaysForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("rowData", classdeskCommonService.getEdCourseSeqInfo(rMap));

            rMap.setString("sdate", ParamUtil.getStrParam(rMap.getString("sdate"), DateUtil.getMonthAgoDate(-2)));
            rMap.setString("edate", ParamUtil.getStrParam(rMap.getString("edate"), DateUtil.getNowDate()));

            request.setAttribute("listData", classdeskTutorResultService.getLeCourseAlwaysUSerList(rMap));

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/result_always_form";
    }

    /**
     * 상시 수강자별 성적 실행
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_always_exec.do")
    public String resultAlwaysExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorResultService.resultAlwaysExec(request, rMap, false);

        } catch (Exception e) { log.debug(e.getMessage());
             
            rMap.putString("rMsg", "실패하였습니다.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 상시 전체 성적 실행(최종반영)
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/result/result_always_final_exec.do")
    public String resultAlwaysFinalExec(HttpServletRequest request, HttpServletResponse res,
            DataMap rMap) throws FrontException {

        try {

            classdeskTutorResultService.resultAlwaysExec(request, rMap, true);

        } catch (Exception e) { log.debug(e.getMessage());
             
            rMap.putString("rMsg", "실패하였습니다.");
            rMap.putString("rScript", "fnList()");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }
}
