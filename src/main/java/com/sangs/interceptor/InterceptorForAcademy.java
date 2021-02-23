package com.sangs.interceptor;

import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.sangs.util.SangsUtil;
import com.webapp.academy.service.CommonService;
import com.webapp.common.service.CommonAccessLogService;
import com.webapp.common.service.CommonUserService;

/**
 * Description : 아카데미 인터셉터
 * 
 * Modification Information
 * 수정일		수정자			수정내용
 * -------	-----------------------------------
 * 2014.04.01  wibo				수정
 *
 */
public class InterceptorForAcademy extends HandlerInterceptorAdapter {

	private final Logger log = LogManager.getLogger(InterceptorForAcademy.class);
	
    @Resource(name = "commonAccessLogService")
    private CommonAccessLogService commonAccessLogService;
    
    @Resource(name = "commonService")
    private CommonService     commonService;
    
    @Resource(name = "commonUserService")
    private CommonUserService commonUserService;
    
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
    	
    	//20180809 SSL 핸들러 처리 
    	/*if("http".equals(request.getScheme())){
    		String url = request.getRequestURL().toString();
    		url = url.replace("http://", "https://");
    		if(!"edu.kinfa.or.kr:2443".contains(request.getRequestURL().toString())){
    			url = url.replace("edu.kinfa.or.kr", "edu.kinfa.or.kr:2443");
    		}
    		response.sendRedirect(url);
    	}else{
    		if(!"https://edu.kinfa.or.kr:2443".contains(request.getRequestURL().toString())){
    			String url = request.getRequestURL().toString();
    			url = url.replace("edu.kinfa.or.kr", "edu.kinfa.or.kr:2443");
    			response.sendRedirect(url);
    		}
    	}*/
    	
    	/*HttpServletResponse res = ((HttpServletResponse) response);
  	   //교차 프레임 스크립팅 방어 누락
  	   res.addHeader("X-Frame-Options", "DENY");
  	   //HTTP Strict-Transport-Security 헤더 누락
  	   res.addHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
  	   //Missing "X-Content-Type-Options" header
  	   res.addHeader("X-Content-Type-Options", "nosniff");*/
    	
    	/** [공통] 접속로그 등록 **/
    	commonAccessLogService.insertAccessLog(request, "WWW");
    	// 중복로그인체크
    	
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
				}else if(!sessionid.equals(thisSessionId) && sessionid.equals("empty")){
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
    			
        return true;
    }

    /**
     * view로 포워드되기전 처리 
     */
    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	
    	/*HttpServletResponse res = ((HttpServletResponse) response);
    	   //교차 프레임 스크립팅 방어 누락
    	   res.addHeader("X-Frame-Options", "DENY");
    	   //HTTP Strict-Transport-Security 헤더 누락
    	   res.addHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains; preload");
    	   //Missing "X-Content-Type-Options" header
    	   res.addHeader("X-Content-Type-Options", "nosniff");
    	   //Missing "X-XSS-Protection" header
    	   res.addHeader("X-XSS-Protection", "1");*/
    	
    	/** 메뉴조회관련 **/
    	/*DataMap rMap = new DataMap();
    	rMap.setString("menuGradeCode", SangsProperties.getProperty("Globals.mtGradeUserCode"));

    	String rootMenuCd = req.getParameter("rootMenuCd");
    	String subMenuCd = req.getParameter("subMenuCd");
    	if(("").equals(rootMenuCd) || SangsUtil.isEmpty(rootMenuCd) ){
    		rootMenuCd = (String) req.getAttribute("rootMenuCd");
    	}
    	rMap.setString("rootMenuCd", rootMenuCd);
    	
    	if( !("").equals(rMap.getString("rootMenuCd")) && rMap.getString("rootMenuCd") != null) {
    		// 서브메뉴 목록
    		req.setAttribute("subMenuList", commonService.selectSubMenuList(rMap));
    		EduMap currentTopMenuData = commonService.getCurrentMenuInfo(rMap);
    		if(("").equals(subMenuCd) || SangsUtil.isEmpty(subMenuCd) ){
    			subMenuCd = currentTopMenuData.getString("SUB_CODE");
    		}
    		rMap.setString("subMenuCd", subMenuCd);
    	}

    	// 대메뉴 목록
    	req.setAttribute("rootMenuList", commonService.selectRootMenuList(rMap));
    	req.setAttribute("rootMenuCd",rMap.getString("rootMenuCd"));
    	req.setAttribute("subMenuCd",subMenuCd);*/
    }

}
