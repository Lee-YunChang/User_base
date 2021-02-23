package com.sangs.interceptor;

import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.sangs.session.SessionManager;
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
 * Description : 클래스데스크 인터셉터
 * 
 * Modification Information
 * 수정일      수정자         수정내용
 * -------  -----------------------------------
 * 2014.04.01  SANGS             수정
 *
 */
public class InterceptorForClassdesk extends HandlerInterceptorAdapter {

    private Logger log = LogManager.getLogger(InterceptorForClassdesk.class);
    
    @Resource(name = "classdeskTutorMainService")
    private ClassdeskTutorMainService classdeskTutorMainService;
    
    @Resource(name = "commonAccessLogService")
    private CommonAccessLogService commonAccessLogService;

    @Resource(name = "commonUserService")
    private CommonUserService commonUserService;
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	HttpServletResponse res = ((HttpServletResponse) response);
   	   //교차 프레임 스크립팅 방어 누락
   	   //res.addHeader("X-Frame-Options", "DENY");
   	   //HTTP Strict-Transport-Security 헤더 누락
   	   //res.addHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
   	   //Missing "X-Content-Type-Options" header
   	   //res.addHeader("X-Content-Type-Options", "nosniff");
    	
	   	SessionManager sessionManager = SessionManager.getInstance();
		if(sessionManager != null ) {
			int sessionResult = sessionManager.executeFrontSessionCheck(request);
			
			UserSessionVO reqVo = UserSessionManager.getUserSessionVO(request);//세션클러스트링 오류 db로 임시 처리
			String userid = reqVo.getUserId();
			if(!(userid.equals(null) || userid.equals(""))){
				String sessionid = commonUserService.getSessionId2(userid);
				String thisSessionId = reqVo.getSessionId();
				if(!sessionid.equals(thisSessionId)){
					sessionResult = -1;
					UserSessionManager.deleteUserSessionVO(request);//중복시 세션 제거
				}
			}
			
			if (sessionResult == SessionManager.SESS_RCODE_DOUBLE) {
				ModelAndView modelAndView = new ModelAndView("forward:/common/msgForward.do");	
				modelAndView.addObject("msg", "중복로그인으로 자동 로그아웃되었습니다");
				modelAndView.addObject("url", "/academy/common/login.do");	
				throw new ModelAndViewDefiningException(modelAndView);
	
			}
		}
   	   
    	/** [공통] 접속로그 등록 **/
    	/*
    	commonAccessLogService.insertAccessLog(request, SangsProperties.getProperty("Globals.MBR_TRANS_SYS_GB_ACADEMY"));
    	
        *//** 세션정보 **/
        /*UserSessionVO userSessionVO = UserSessionManager.getUserSessionVO(request);
        //boolean _isAdmin = false;

        if (userSessionVO.getGradeNum() >= Integer.parseInt(SangsProperties.getProperty("Globals.userGradeNo_eduMan"))) {
        	//_isAdmin = true;
        } else {
        	
        	
        }
        if ("".equals(userSessionVO.getUserNo()) || "N".equals(userSessionVO.getIsLogin())) { // 로그인 안했다면
    		
    		ModelAndView modelAndView = new ModelAndView("forward:/common/msgForward.do");	
			modelAndView.addObject("msg", "세션이 만료되어 자동 로그아웃되었습니다. 다시 로그인 하여 주시기 바랍니다.");
			modelAndView.addObject("url", "/academy/common/login.do");	
			throw new ModelAndViewDefiningException(modelAndView); */
    		
			//response.setContentType("text/html;charset=utf-8");
			//PrintWriter out = response.getWriter();            
			//out.println("<script>alert('세션이 만료되어 자동 로그아웃되었습니다. 다시 로그인 하여 주시기 바랍니다.');</script>");
			//out.flush();
        /*}*/
        
        /*
         * 부모창에서 클릭하여 들어온경우 (강의실입장 파라메터)
         * -------------------------------------------------------
         *  paramcUserNo 수강코드
            paramCourseNo 과정코드
            paramcSeqNo 과정개설코드 
            paramUserNo 회원번호
         */
        
        /*int courseNo = ParamUtil.getIntParam(request.getParameter("paramCourseNo"), userSessionVO.getCourseNo());
        int cUserNo = ParamUtil.getIntParam(request.getParameter("paramcUserNo"), userSessionVO.getcUserNo());
        int cSeqNo = ParamUtil.getIntParam(request.getParameter("paramcSeqNo"), userSessionVO.getcSeqNo());
        int userNo = ParamUtil.getIntParam(request.getParameter("paramUserNo"), userSessionVO.getUserNo());
        String sessionId = ParamUtil.getStrParam(request.getParameter("paramSessionId"), userSessionVO.getSessionId());
        
        DataMap paramDataMap = new DataMap();
        paramDataMap.add("courseNo", courseNo);
        paramDataMap.add("cSeqNo", cSeqNo);
        paramDataMap.add("cUserNo", cUserNo);
        
        DataMap rMap = new DataMap();
        rMap.add("paramSessionId", sessionId);
        rMap.add("paramUserNo", userNo);
        rMap.add("SES_USERNO", userNo);
        rMap.add("SES_USERID", userSessionVO.getUserId());
        
        EduMap map = commonUserService.getLoginSessionInfo(rMap);
        String mtGradeAdminCode = SangsProperties.getProperty("Globals.mtGradeAdminCode");
		String mtGradeTutorCode = SangsProperties.getProperty("Globals.mtGradeTutorCode");

		EduMap authCntMap = classdeskTutorMainService.getCourseUSerCount(paramDataMap);
    	
    	if (!("").equals(map)) {
        	// 강의실 초기 공통데이터 
        	EduMap classdeskMainMap = classdeskTutorMainService.getCourseMainController(paramDataMap);
            request.setAttribute("COMMON_DATA", classdeskMainMap);

            // 세션 할당
            userSessionVO.setCourseNo(courseNo);
            userSessionVO.setcUserNo(cUserNo);
            userSessionVO.setcSeqNo(cSeqNo);
            userSessionVO.setIsLogin(userSessionVO.getIsLogin());
            UserSessionManager.setUserSessionVO(request, userSessionVO);
            
    	} else {
            ModelAndView modelAndView = new ModelAndView("classdesk/cmmn/login");
            request.setAttribute("msg", "강의실 접근 권한이 없습니다.");
            request.setAttribute("url", "/academy/common/login.do");
            throw new ModelAndViewDefiningException(modelAndView);
            
    	}*/
		
		
        /*if ((courseNo > 0 && cSeqNo > 0)){
        	
        	EduMap authCntMap = classdeskTutorMainService.getCourseUSerCount(paramDataMap);
        	
        	if (!("").equals(map)) {
        	
	        	// 강의실 초기 공통데이터 
	        	EduMap classdeskMainMap = classdeskTutorMainService.getCourseMainController(paramDataMap);
	            request.setAttribute("COMMON_DATA", classdeskMainMap);

	            // 세션 할당
	            userSessionVO.setCourseNo(courseNo);
	            userSessionVO.setcUserNo(cUserNo);
	            userSessionVO.setcSeqNo(cSeqNo);
	            userSessionVO.setIsLogin(userSessionVO.getIsLogin());
	            UserSessionManager.setUserSessionVO(request, userSessionVO);
	            
        	} else {
	            ModelAndView modelAndView = new ModelAndView("classdesk/cmmn/login");
	            request.setAttribute("msg", "강의실 접근 권한이 없습니다.");
	            request.setAttribute("url", "/academy/common/login.do");
	            throw new ModelAndViewDefiningException(modelAndView);
	            
        	}
            
        } else {
            ModelAndView modelAndView = new ModelAndView("classdesk/cmmn/login");
            rMap.setString("msg", "교육수강자만 접근할 수 있습니다.");
            rMap.setString("url", "/academy/common/login.do");
            request.setAttribute("REQUEST_DATA", rMap);
            request.setAttribute("msg", "교육수강자만 접근할 수 있습니다.");
            request.setAttribute("url", "/academy/common/login.do");
            throw new ModelAndViewDefiningException(modelAndView);
            
        }*/
    
        return true;
    }

    /**
     * view로 포워드되기전 처리 
     */
    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
    	
    	HttpServletResponse res = ((HttpServletResponse) response);
    	   //교차 프레임 스크립팅 방어 누락
    	   //res.addHeader("X-Frame-Options", "DENY");
    	   //HTTP Strict-Transport-Security 헤더 누락
    	   //res.addHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
    	   //Missing "X-Content-Type-Options" header
    	   //res.addHeader("X-Content-Type-Options", "nosniff");
    	   //Missing "X-XSS-Protection" header
    	   //res.addHeader("X-XSS-Protection", "1");
  	   
    }

}
