package com.sangs.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.service.ClassdeskTutorMainService;
import com.webapp.common.service.CommonAccessLogService;
import com.webapp.common.service.CommonUserService;

/**
 * 
 * Description : 모바일 페이지 인터셉터
 * 
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2015. 7. 21. 이진영			최초작성
 *
 */
public class InterceptorForMobile extends HandlerInterceptorAdapter {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Resource(name = "classdeskTutorMainService")
    private ClassdeskTutorMainService classdeskTutorMainService;
    
    @Resource(name = "commonAccessLogService")
    private CommonAccessLogService commonAccessLogService;

    @Resource(name = "commonUserService")
    private CommonUserService commonUserService;
    /*
    @Resource(name = "accessLogService")
    private AccessLogService accessLogService;
    */

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
            Object handler) throws Exception {

        HttpSession session = request.getSession(true);
        String curPage = request.getRequestURI();
        
        /** [공통] 접속로그 등록 **/
    	commonAccessLogService.insertAccessLog(request, SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY"));
    	
        /** 세션정보 **/
        UserSessionVO userSessionVO = UserSessionManager.getUserSessionVO(request);

        int courseNo = ParamUtil.getIntParam(request.getParameter("paramCourseNo"), userSessionVO.getCourseNo());
        int cUserNo = ParamUtil.getIntParam(request.getParameter("paramcUserNo"), userSessionVO.getcUserNo());
        int cSeqNo = ParamUtil.getIntParam(request.getParameter("paramcSeqNo"), userSessionVO.getcSeqNo());
        int userNo = ParamUtil.getIntParam(request.getParameter("paramUserNo"), userSessionVO.getUserNo());
        String sessionId = ParamUtil.getStrParam(request.getParameter("paramSessionId"), userSessionVO.getSessionId());
        
        if (courseNo > 0 && cSeqNo > 0){
        	DataMap paramDataMap = new DataMap();
            paramDataMap.add("courseNo", courseNo);
            paramDataMap.add("cSeqNo", cSeqNo);
            paramDataMap.add("cUserNo", cUserNo);
            
            DataMap rMap = new DataMap();
            rMap.add("paramSessionId", sessionId);
            rMap.add("paramUserNo", userNo);
            EduMap map = commonUserService.getLoginSessionInfo(rMap);

        	EduMap authCntMap = classdeskTutorMainService.getCourseUSerCount(paramDataMap);
        	if (authCntMap.getInt("COURSECNT") > 0 || !("").equals(map)) {
        	
	        	// 강의실 초기 공통데이터 
	        	EduMap classdeskMainMap = classdeskTutorMainService.getCourseMainController(paramDataMap);
	            request.setAttribute("COMMON_DATA", classdeskMainMap);
	            
	            // 세션 할당
	            userSessionVO.setCourseNo(courseNo);
	            userSessionVO.setcUserNo(cUserNo);
	            userSessionVO.setcSeqNo(cSeqNo);
	            UserSessionManager.setUserSessionVO(request, userSessionVO);
        	}
        }

        if ("GET".equals(request.getMethod().toUpperCase())) {
            if (request.getQueryString() != null) curPage = curPage + "?" + request.getQueryString();
            session.setAttribute("mob_session_cur_page", curPage);
        }
        return true;

    }

    /**
     * view로 포워드되기전 처리 
     */
    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
    }

}
