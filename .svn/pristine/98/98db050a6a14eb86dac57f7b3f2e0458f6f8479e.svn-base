package com.webapp.classdesk.ctrl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.service.ClassdeskBoardService;
import com.webapp.classdesk.service.ClassdeskTutorMainService;
import com.webapp.common.service.CommonUserService;

/**
 * Description : 클래스데스크 메인
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskTutorMainController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskTutorMainService")
    private ClassdeskTutorMainService classdeskTutorMainService;

    @Resource(name = "classdeskBoardService")
    private ClassdeskBoardService     classdeskBoardService;

    @Resource(name = "commonUserService")
    private CommonUserService commonUserService;
    
    /**
     * 메인
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping({"/classdesk/main.do"})
    public String main(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
        try {
        	UserSessionVO userSessionVO = UserSessionManager.getUserSessionVO(request);
        	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/academy/common/login.do");
                return "forward:/common/msgForward.do";
            }
        	int CSEQNO = 0;
        	int COURSENO = 0;
        	int CUSERNO = 0;
        	int CLASSDESK = 0;
        	List<EduMap> courseList =  classdeskTutorMainService.getCourseList(rMap);
        	if(courseList.size() == 0){
        		request.setAttribute("msg", "수강중인 과목이 없습니다..");
                request.setAttribute("url", "/academy/main/main.do");
                return "forward:/common/msgForward.do";
        	}
        	else {
                EduMap studyInfo = (EduMap)courseList.get(0);
                CSEQNO = studyInfo.getInt("CSEQNO");
                COURSENO = studyInfo.getInt("COURSENO");
                CUSERNO = studyInfo.getInt("CUSERNO");
                CLASSDESK = studyInfo.getInt("CLASS_DESK");
                
        	}
        	
    		rMap.setString("CLASSDESK" , Integer.toString(CLASSDESK));
        	rMap.setString("paramCourseNo" , Integer.toString(COURSENO));
    		rMap.setString("paramcSeqNo" , Integer.toString(CSEQNO));
    		rMap.setString("paramcUserNo" , Integer.toString(CUSERNO));
    		
    		// 수강과목 변경
    		if(rMap.containsKey("select")){
    			String[] select = rMap.getString("select").split(",");
    			rMap.setString("paramcUserNo" , select[0]);
    			rMap.setString("paramcSeqNo" , select[1]);
    			rMap.setString("paramCourseNo" , select[2]);
    			rMap.setString("CLASSDESK" , select[3]);
        	}
    		
    		userSessionVO.setCourseNo(Integer.parseInt(rMap.getString("paramCourseNo")));
    		userSessionVO.setcSeqNo(Integer.parseInt(rMap.getString("paramcSeqNo")));
    		userSessionVO.setcUserNo(Integer.parseInt(rMap.getString("paramcUserNo")));
    		
    		UserSessionManager.setUserSessionVO(request, userSessionVO);
        	request.setAttribute("courseList", courseList);
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "myCourse");
        	
            request.setAttribute("tchItem", classdeskTutorMainService.getCourseMainTchInfo(rMap));

            request.setAttribute("cuserItem", classdeskTutorMainService.getCuserInfo(rMap));

            request.setAttribute("progItem", classdeskTutorMainService.getProgInfo(rMap));
            
            //공지사항 
            rMap.putInt("pbcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsPcateClassNotice")));
            rMap.putInt("bcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsBcateClassNotice")));
            rMap.putInt("startNo", 1); // 최근 게시물 5개 조회
            rMap.putInt("endNo", 6);
            request.setAttribute("boardList", classdeskBoardService.getCourseBbsList(rMap));
            
            //자료실
            rMap.putInt("pbcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsPcateClassData")));
            rMap.putInt("bcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsBcateCourseData")));
            request.setAttribute("courselistData", classdeskBoardService.getCourseBbsList(rMap));
            
            //진도
            request.setAttribute("progList", classdeskTutorMainService.getCourseMainprogress(rMap));
            //과제
            request.setAttribute("reportList", classdeskTutorMainService.getCourseMainReportList(rMap));
            //설문
            //EduMap COMMON_DATA = (EduMap) request.getAttribute("COMMON_DATA");
            
        	//rMap.setString("openType", COMMON_DATA.getString("OPENTYPE"));// 설문 상시 / 기간 노출
            request.setAttribute("pollList", classdeskTutorMainService.getCourseMainPollList(rMap));
            //시험
            request.setAttribute("examList", classdeskTutorMainService.getCourseMainLectExamList(rMap));
            request.setAttribute("CLASSDESK", rMap.getString("CLASSDESK"));
            request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
        return "classdesk/main/main";
    }
    
    
    /**
     * 관리자 > 클래스 데스크 접근 가능 인증 
     * 
     * @param req
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdeskAdm/defaultAuth.do")
    public String defaultAuth(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
        //String beforeUrl = request.getHeader("referer");
        UserSessionVO userSessionVO =  UserSessionManager.getUserSessionVO(request);
    	try {
    		
			/*
			 * 1. 사용자 userNo, sessionId & 강사등급 이상 체크 
			 * 2. 넘어온 헤더 이전페이지 정보가 관리자 페이지였는지 체크
			 * 3. userSessionManager 세션 할당하기
			 * 
			*/
    		
    		EduMap map = commonUserService.getLoginSessionInfo(rMap);
    		String mtGradeAdminCode = SangsProperties.getProperty("Globals.mtGradeAdminCode");
    		String mtGradeTutorCode = SangsProperties.getProperty("Globals.mtGradeTutorCode");
    		
    	 	if(!("").equals(map) && (map.getString("MT_GRADE_CODE").equals(mtGradeAdminCode) || map.getString("MT_GRADE_CODE").equals(mtGradeTutorCode))){
    	 		
    	 		//if(beforeUrl.contains("/admin/")) {
    	 			                    
                	//int courseNo = Integer.parseInt(request.getParameter("paramCourseNo"));
                    int userNo = Integer.parseInt( rMap.getString("SES_USERNO"));
                    //int cSeqNo =  Integer.parseInt(request.getParameter("paramcSeqNo"));
                    String sessionId = rMap.getString("SES_USERID");
                    
                    DataMap paramDataMap = new DataMap();
                    //paramDataMap.add("courseNo", courseNo);
                    //paramDataMap.add("cSeqNo", cSeqNo);
                    paramDataMap.add("userNo", userNo);
                    
                    if (userNo > 0 && userNo > 0) {
        	            // 세션 할당
        	            //userSessionVO.setCourseNo(courseNo);
        	            //userSessionVO.setcSeqNo(cSeqNo);
        	            userSessionVO.setUserNo(userNo);
        	            userSessionVO.setSessionId(sessionId);
        	            UserSessionManager.setUserSessionVO(request, userSessionVO);
        	            UserSessionManager.getUserSessionInsert(request, commonUserService, userNo);
        	        }
                }
               /* else {
                    return "forward:/classdesk/cmmn/login.do";
                }  */ 
    	}
              
        catch (Exception e) { log.debug(e.getMessage());
        	 
            throw new FrontException(e);
        }
    	return "forward:/classdesk/main.do";
    }
}
