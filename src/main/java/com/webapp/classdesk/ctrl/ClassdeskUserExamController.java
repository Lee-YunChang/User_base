package com.webapp.classdesk.ctrl;

import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.webapp.classdesk.service.ClassdeskTutorExamService;
import com.webapp.classdesk.service.ClassdeskTutorMainService;
import com.webapp.classdesk.service.ClassdeskUserExamService;

/**
 * Description : 클래스데스트 > 학생모드 > 시험
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskUserExamController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskUserExamService")
    private ClassdeskUserExamService  classdeskUserExamService;

    @Resource(name = "classdeskTutorExamService")
    private ClassdeskTutorExamService classdeskTutorExamService;

    @Resource(name = "classdeskTutorMainService")
    private ClassdeskTutorMainService classdeskTutorMainService;

    /**
     * 시험 목록
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/exam/list.do")
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
        try {
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "tutorexam");
            request.setAttribute("listData", classdeskUserExamService.getUserLectExamList(rMap));
            request.setAttribute("rowData", classdeskUserExamService.getOpenTypeInfo(rMap));
            request.setAttribute("progData", classdeskTutorMainService.getProgInfo2(rMap));
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
        rMap.setString("title", SangsProperties.getProperty("Globals.examList"));
        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/exam_list";
    }

    /**
	 * 사전/사후시험 등록여부 체크
	 * @param res
	 * @param rMap
	 * @throws Exception
	 */
	@RequestMapping(value = "/classdesk/user/exam/leExamBeAfterCheck.do")
	public void leExamBeAfterCheck(HttpServletResponse res, DataMap rMap) throws Exception {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		Gson gson = new Gson();
		String json = null;
		
		try {
			rMap.setString("examType", "B");
			//사전시험 존재유무 체크
			int beCheckYn = classdeskUserExamService.getLeExamBeChkYn(rMap);
			int beCheckCnt = 0;
			if(beCheckYn > 0){
				beCheckCnt = classdeskUserExamService.getLeExamBeAfterCnt(rMap);
			} else {
				beCheckCnt = 1;
			}
			
			rMap.setString("examType", "A");
			int afCheckCnt = classdeskUserExamService.getLeExamBeAfterCnt(rMap);
			
			rMap.putInt("beCheckCnt", beCheckCnt);
			rMap.putInt("afCheckCnt", afCheckCnt);
			json =  gson.toJson(rMap);

		} catch (Exception e) {
			log.error(e);
		}

		out.print(json);
		out.flush();
		out.close();
	}
	
    /**
     * 시험 양식 폼
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/exam/submit_form.do")
    public String submitForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	EduMap examMap = classdeskTutorExamService.getLectExamItem(rMap);
            EduMap userExamCntMap = classdeskUserExamService.getUserLectExamAppCnt(rMap);
            
            rMap.putString("examEdate" , rMap.getString("examEdate").substring(0,rMap.getString("examEdate").lastIndexOf("-")+3));
            if (userExamCntMap.getInt("EXAM_APP_CNT") == 0) {
                classdeskUserExamService.saveUserExamInfo(examMap, rMap);
            }

            /** 관리자 체점할때도 쓰이기때문에 일반 파라미터로 보냄 */
            rMap.putInt("cUserNo", rMap.getInt("SES_CUSERNO"));
            
            // 문항 수
            request.setAttribute("itemCnt", classdeskUserExamService.getItemCnt(rMap));
            
            /*세트/랜덤 구분*/
            List<EduMap> listData = classdeskUserExamService.getUserLectExamRdmAppHistList(rMap);
            
            /* if ("R".equals(examMap.getString("PUB_TYPE"))) {
                request.setAttribute("listData", classdeskUserExamService.getUserLectExamRdmAppHistList(rMap));
            } else if ("S".equals(examMap.getString("PUB_TYPE"))) {
                request.setAttribute("listData", classdeskUserExamService.getUserLectExamSetAppHistList(rMap));
            } else {
                request.setAttribute("listData", classdeskUserExamService.getUserLectExamBinderAppHistList(rMap));
            }*/
            if ("R".equals(examMap.getString("PUB_TYPE"))) {
            	//랜덤출제일경우 보기의 순서를 변경하는 기능
            	Collections.shuffle(listData);
            }
            rMap.setString("pubType", examMap.getString("PUB_TYPE"));
            request.setAttribute("listData", listData);
            /*request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "tutorexam");*/
            request.setAttribute("menu_nm", "mypage");
            request.setAttribute("lnb_menu", "myLecture");
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
        rMap.setString("title", SangsProperties.getProperty("Globals.examList"));
        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/exam_submit_form";
    }

    /**
     * 시험 다시보기
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/exam/review_form.do")
    public String reviewForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	
        	EduMap eMap = classdeskTutorExamService.getLectExamItem(rMap);
        	request.setAttribute("examData", eMap);
        	
        	rMap.putInt("cUserNo", rMap.getInt("SES_CUSERNO"));
        	
        	request.setAttribute("ListDataB", classdeskUserExamService.getUserLectExamRdmAppHistListB(rMap));
        	
        	request.setAttribute("listData", classdeskUserExamService.getUserLectExamRdmAppHistList(rMap));
        	
        	
        } catch (Exception e) {
            throw new FrontException(e);
        }
        
        rMap.setString("title", SangsProperties.getProperty("Globals.examList"));
        /*request.setAttribute("menu_nm", "classdesk");
    	request.setAttribute("lnb_menu", "tutorexam");
    	*/
        request.setAttribute("menu_nm", "mypage");
        request.setAttribute("lnb_menu", "myLecture");
        request.setAttribute("REQUEST_DATA", rMap);
        return "classdesk/user/exam_review_form";
    }
    
    /**
     * 실시간 시험저장
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/exam/ajaxSaveRealTmAns.do")
    @ResponseBody
    public void ajaxSaveRealTmAns(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = null;
        Gson gson = new Gson();
        String json = null;

        try {
            out = res.getWriter();
            classdeskUserExamService.saveExamRealTmAns(rMap);

            json = gson.toJson("SUCCESS");
        } catch (Exception ex) {
            json = gson.toJson("FAIL");
        }

        out.print(json);
        out.flush();
        out.close();
    }

    /**
     * 시험제출
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/exam/submit_exec.do")
    public String submitExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
        try {
            classdeskUserExamService.submitExec(rMap);

            rMap.putString("rMsg", "응시가 완료되었습니다.");
            //rMap.putString("rUrl", "/classdesk/user/progress/treeList.do");
            rMap.putString("rUrl", "/classdesk/main/main.do");
            
        } catch (Exception e) { log.debug(e.getMessage());
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec2";
    }

    /**
     * 시험결과
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/exam/result.do")
    public String result(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	/** 관리자 체점할때도 쓰이기때문에 일반 파라미터로 보냄 */
            rMap.putInt("cUserNo", rMap.getInt("SES_CUSERNO"));
            
            if ("R".equals(rMap.getString("pubType"))) {
                request.setAttribute("listData", classdeskUserExamService.getUserLectExamRdmAppHistList(rMap));
            } else if ("S".equals(rMap.getString("pubType"))) {
                request.setAttribute("listData", classdeskUserExamService.getUserLectExamSetAppHistList(rMap));
            } else {
                request.setAttribute("listData", classdeskUserExamService.getUserLectExamBinderAppHistList(rMap));
            }
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/exam_result";
    }
}
