package com.sangs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * Description : 사용자페이지 인터셉터
 * 
 * Modification Information
 * 수정일		수정자			수정내용
 * -------	-----------------------------------
 * 2014.04.01  wibo				수정
 *
 */
public class InterceptorForFront extends HandlerInterceptorAdapter {

    private Logger log = LoggerFactory.getLogger(this.getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
            Object handler) throws Exception {
        HttpSession session = request.getSession(true);
        String curPage = request.getRequestURI();

        // 중복로그인체크
        /*
        SessionManager sessionManager = SessionManager.getInstance();
        int sessionResult = sessionManager.executeFrontSessionCheck(request);
        if (sessionResult == SessionManager.SESS_RCODE_DOUBLE) {
            ModelAndView modelAndView = new ModelAndView("forward:/common/msgForward.do");
            modelAndView.addObject("msg", "중복로그인으로 자동 로그아웃되었습니다");
            modelAndView.addObject("url", "/front/login/login.do");
            throw new ModelAndViewDefiningException(modelAndView);
        }
        */

        /*  //TODO 
        if(!UserSessionManager.isLogin()) {
        SangsMap testMap = new SangsMap();
        
        testMap.put("userId", "test1");
        testMap.put("userNm", "테스터");
        
        UserSessionManager.setUserSession(testMap);
        }*/

        // 세션에 전페이지 정보를 셋팅한다.
        if ("GET".equals(request.getMethod().toUpperCase())) {
            if (request.getQueryString() != null) curPage = curPage + "?" + request.getQueryString();

            session.setAttribute("frt_session_cur_page", curPage);
        }
        return true;
    }

    /**
     * view로 포워드되기전 처리 
     */
    @Override
    public void postHandle(HttpServletRequest req, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        // 접속 이력 저장 로그 메인 쪽 업무
        //String uri = req.getRequestURI();
        try {
            /*
            if(uri.indexOf(".jsp") == -1) 
                accessLogService.insertFrontAccessLogInfo(req);
            */
        } catch (Exception e) { log.debug(e.getMessage()); ;
        	 
        }

    }

}
