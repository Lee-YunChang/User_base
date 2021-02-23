package com.webapp.classdesk.ctrl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.service.ClassdeskCommonService;
import com.webapp.classdesk.service.ClassdeskTutorPollService;

/**
 * Description : 클래스데스트 > 강사모드 > 설문
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskTutorPollController {

    @Resource(name = "classdeskTutorPollService")
    private ClassdeskTutorPollService classdeskTutorPollService;

    @Resource(name = "classdeskCommonService")
    private ClassdeskCommonService    classdeskCommonService;

    /**
     * 설문목록
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/list.do")
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            EduMap eduMap = classdeskTutorPollService.getPollMainList(rMap);

            if (eduMap != null) {

                if ("Y".equals(ParamUtil.getStrParam(eduMap.getString("OPENYN"), ""))) {
                    rMap.putString("resultUrl", "/classdesk/tutor/poll/stats.do");
                } else {
                    rMap.putString("resultUrl", "/classdesk/tutor/poll/form.do");
                }
            } else {
                rMap.putString("resultUrl", "/classdesk/tutor/poll/form.do");
            }

        } catch (Exception e) { 
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_list";
    }

    /**
     * 설문FORM
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "tutorpoll");
            List list = classdeskTutorPollService.getPollList(rMap);
            request.setAttribute("listData", list);

        } catch (Exception e) { 
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_form";
    }

    /**
     * 설문 마스터 일괄저장
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/mts_call_exec.do")
    public String mtscallExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorPollService.mtscallExec(rMap);

            EduMap eMap = classdeskTutorPollService.selectMstPollQuizCnt(rMap);

            if (eMap.getInt("POLL_QUIZ_CNT") > 0) {
                rMap.putString("rMsg", "설문마스터 정보를 일괄 등록했습니다.");

            } else {
                rMap.putString("rMsg", "설문마스터 정보가 없습니다.");
            }

        } catch (Exception e) { 
            rMap.putString("rMsg", "등록중 에러가 발생하였습니다. 다시 시도해주세요.");
        }

        rMap.putString("rScript", "window.document.location.reload()");

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 설문등록FORM
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/q_form.do")
    public String qForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("rowData", classdeskTutorPollService.getPollItem(rMap));

        } catch (Exception e) { 
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_q_form";
    }

    /**
     * 설문항목 저장
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/q_exec.do")
    public String qExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorPollService.qExec(request, rMap, "CU");

        } catch (Exception e) { 
            rMap.putString("rMsg", "에러가 발생하였습니다. 다시 시도해주세요.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 설문항목 삭제
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/q_del_exec.do")
    public String qDelExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorPollService.qExec(request, rMap, "D");

        } catch (Exception e) { 
            rMap.putString("rMsg", "에러가 발생하였습니다. 다시 시도해주세요.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 설문 임시저장/ 설문개시
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskTutorPollService.updatePoll(rMap);

            if ("Y".equals(rMap.getString("openYn"))) {
                rMap.putString("rMsg", "설문개시 되었습니다.");
                rMap.putString("rScript", "fnStatsList()");
            } else {
                rMap.putString("rMsg", "임시 저장되었습니다.");
                rMap.putString("rScript", "window.document.location.reload()");
            }

        } catch (Exception e) { 
            rMap.putString("rMsg", "에러가 발생하였습니다. 다시 시도해주세요.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 설문통계
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/stats.do")
    public String stats(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("listData", classdeskTutorPollService.getPollStatList(rMap));

            // 답변중 주관식 리스트만 추출
            rMap.setString("mtCpollCode", SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE_DES"));
            int pollcSeqNo = (Integer)classdeskTutorPollService.getPollcSeqNoInfo(rMap);
            rMap.setInt("pollcSeqNo", pollcSeqNo);

            request.setAttribute("desListData", classdeskTutorPollService.getPollStatDesList(rMap));

        } catch (Exception e) { 
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_stats";
    }

    /**
     * 설문 엑셀 다운로드
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/poll/poll_excel.do")
    public String pollExcel(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            request.setAttribute("listData", classdeskTutorPollService.getPollStatList(rMap));

            // 답변중 주관식 리스트만 추출
            rMap.setString("mtCpollCode", SangsProperties.getProperty("Globals.mtCode_MT_CPOLL_CODE_DES"));
            int pollcSeqNo = classdeskTutorPollService.getPollcSeqNoInfo(rMap);
            rMap.setInt("pollcSeqNo", pollcSeqNo);

            request.setAttribute("desListData", classdeskTutorPollService.getPollStatDesList(rMap));

            // 과정정보
            request.setAttribute("rowData", classdeskCommonService.getEdCourseSeqInfo(rMap));
            EduMap COMMON_DATA = (EduMap) request.getAttribute("COMMON_DATA");
        	
        	// 설문 상시 / 기간 노출
            request.setAttribute("openType", COMMON_DATA.getString("OPENTYPE"));

        } catch (Exception e) { 
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/poll_excel";
    }
}
