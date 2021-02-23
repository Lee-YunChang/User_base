package com.webapp.academy.ctrl;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;

/**
 * Description : 사용자 교육안내
 * 
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2015.04.01 	SANGS		최초작성
 *
 */

@Controller
public class IntroController {

    protected UserSessionVO userSessionVO;
    
    /**
     * 교육체계
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 교육체계
    @RequestMapping(value = "/academy/intro/eduSystm.do")
    public String eduSystm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	request.setAttribute("menu_nm", "intro");
    	request.setAttribute("lnb_menu", "eduSystm");
        rMap.setString("title", SangsProperties.getProperty("Globals.eduSystm"));
    	request.setAttribute("REQUEST_DATA", rMap);
        
        return "academy/intro/intro_systm";
    }
    
    /**
     * 원장님 인사말
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 원장님 인사말
    @RequestMapping(value = "/academy/intro/intro.do")
    public String intro(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	request.setAttribute("menu_nm", "intro");
    	request.setAttribute("lnb_menu", "intro");
        rMap.setString("title", SangsProperties.getProperty("Globals.intro"));
    	request.setAttribute("REQUEST_DATA", rMap);
        
        return "academy/intro/intro_main";
    }
    
    /**
     * 오시는길
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 오시는길
    @RequestMapping(value = "/academy/intro/introGuide.do")
    public String intro2(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	request.setAttribute("menu_nm", "footer");
    	request.setAttribute("lnb_menu", "agree4");
    	rMap.setString("title", SangsProperties.getProperty("Globals.introGuide"));
        request.setAttribute("REQUEST_DATA", rMap);

        return "academy/intro/intro_guide";
    }
    
    /**
     * 샘플플레이어
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 샘플 플레이어
    @RequestMapping(value = "/academy/intro/introSample.do")
    public String intro5(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

    	request.setAttribute("menu_nm", "intro");
    	request.setAttribute("lnb_menu", "sample");
        request.setAttribute("REQUEST_DATA", rMap);
        
        return "academy/intro/intro_sample";
    }
    

    /**
     * 기타 > 사이트맵
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 사이트맵
    @RequestMapping(value = "/academy/intro/siteMap.do")
    public String siteMap(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		
    		/*request.setAttribute("menu_nm", "footer");
	    	request.setAttribute("lnb_menu", "siteMap");*/
    		
    		request.setAttribute("menu_nm", "footer");
	    	request.setAttribute("lnb_menu", "agree5");
	    	rMap.setString("title", SangsProperties.getProperty("Globals.siteMap"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { 
            throw new FrontException(e);
        }
    	
    	return "academy/intro/site_map";
    }
    
    
    /**
     * 기타 > 이용약관
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 이용약관
    @RequestMapping(value = "/academy/intro/agree1.do")
    public String agree1(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		request.setAttribute("menu_nm", "footer");
	    	request.setAttribute("lnb_menu", "agree1");
	    	rMap.setString("title", SangsProperties.getProperty("Globals.agree1"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { 
            throw new FrontException(e);
        }
    	//return "academy/course/gg_intro";
    	return "academy/intro/agree1";
    }
    
    /**
     * 기타 > 개인정보보호
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 개인정보보호
    @RequestMapping(value = "/academy/intro/agree2.do")
    public String agree2(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		
    		request.setAttribute("menu_nm", "footer");
    		request.setAttribute("lnb_menu", "agree2");
	    	
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { 
            throw new FrontException(e);
        }
    	
    	return "academy/intro/agree2";
    }
    
    /**
     * 기타 > 저작권보호정책
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 저작권보호정책
    @RequestMapping(value = "/academy/intro/agree3.do")
    public String agree3(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		
    		request.setAttribute("menu_nm", "footer");
    		request.setAttribute("lnb_menu", "agree3");
    		rMap.setString("title", SangsProperties.getProperty("Globals.agree3"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) {
            throw new FrontException(e);
        }
    	
    	return "academy/intro/agree3";
    }
    
    /**
     * 기타 > 저작권보호정책
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 저작권보호정책
    @RequestMapping(value = "/academy/intro/eduGuide.do")
    public String eduGuide(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		
    		request.setAttribute("menu_nm", "edu");
    		request.setAttribute("lnb_menu", "eduGuide");
	    	
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) {
            throw new FrontException(e);
        }
    	
    	return "academy/intro/edu_guide";
    }
    
    /**
     * 기타 > 이용약관
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 이용약관
    @RequestMapping(value = "/gg.do")
    public String ggIntro(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		request.setAttribute("menu_nm", "footer");
	    	request.setAttribute("lnb_menu", "agree1");
	    	rMap.setString("title", SangsProperties.getProperty("Globals.agree1"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { 
            throw new FrontException(e);
        }
    	return "academy/course/gg_intro";
    }
}