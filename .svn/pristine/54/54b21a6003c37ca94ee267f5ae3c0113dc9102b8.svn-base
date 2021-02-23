package com.webapp.classdesk.ctrl;

import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.webapp.classdesk.service.ClassdeskTutorMainService;
import com.webapp.classdesk.service.ClassdeskUserProgressService;

@Controller
public class ClassdeskUserProgressController {

    @Resource(name = "classdeskTutorMainService")
    private ClassdeskTutorMainService    classdeskTutorMainService;

    @Resource(name = "classdeskUserProgressService")
    private ClassdeskUserProgressService classdeskUserProgressService;

    
    	
	/**
     * 온라인학습  메인
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/progress/treeMain.do")
    public String treeMain(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
    	
        try {
        	UserSessionVO userSessionVO = UserSessionManager.getUserSessionVO(request);
        	
        	if(!("").equals(rMap.getString("courseSelect"))){ // 수강과목 변경해서 리로드 하는 값이 있는 경우 
				String[] select = rMap.getString("courseSelect").split(",");
				rMap.setString("paramcUserNo" , select[0]);
				rMap.setString("paramcSeqNo" , select[1]);
				rMap.setString("paramCourseNo" , select[2]);
				rMap.setString("CLASSDESK" , select[3]);
				rMap.setString("seqTitle" , select[4]);
				rMap.setString("ctypeName" , select[5]);
	    	}
        	else if(("").equals(rMap.getString("courseSelect")) &&
        			!("").equals(rMap.getString("paramcUserNo")) && !("").equals(rMap.getString("paramcSeqNo")) ) {
	        	rMap.setString("paramCourseNo" , rMap.getString("paramCourseNo"));
	    		rMap.setString("paramcSeqNo" , rMap.getString("paramcSeqNo"));
	    		rMap.setString("paramcUserNo" , rMap.getString("paramcUserNo"));
	    		rMap.setString("CLASSDESK" , rMap.getString("CLASSDESK"));
	    		rMap.setString("seqTitle" , URLDecoder.decode(rMap.getString("seqTitle"), "UTF-8"));
	    		rMap.setString("ctypeName" , URLDecoder.decode(rMap.getString("ctypeName"), "UTF-8"));
        	}
        	rMap.setString("paramUserNo" , rMap.getString("SES_USERNO"));
        	

    		userSessionVO.setCourseNo(Integer.parseInt(rMap.getString("paramCourseNo")));
    		userSessionVO.setcSeqNo(Integer.parseInt(rMap.getString("paramcSeqNo")));
    		userSessionVO.setcUserNo(Integer.parseInt(rMap.getString("paramcUserNo")));
    		userSessionVO.setUserNo(Integer.parseInt(rMap.getString("paramUserNo")));
    		userSessionVO.setSeqTitle(rMap.getString("seqTitle"));
    		userSessionVO.setSeqTitle(rMap.getString("ctypeName"));
    		UserSessionManager.setUserSessionVO(request, userSessionVO);
        	
        	// 과정정보
            request.setAttribute("rowData", classdeskTutorMainService.getCourseMainController(rMap));
            

            // 수강중인 온라인 과정 목록 
            rMap.setString("schOnline", SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE"));
        	rMap.setString("eduInfoCode", SangsProperties.getProperty("Globals.mtCode_MT_CPSEDU_INFO_CODE"));
            List<EduMap> courseList =  classdeskTutorMainService.getCourseList(rMap);
            request.setAttribute("courseList", courseList);
            
        	// 차시 목록
            request.setAttribute("listData", classdeskTutorMainService.getOnlineTreeList(rMap));
            
            request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) { 
            throw new FrontException(e);
        }
        request.setAttribute("REQUEST_DATA", rMap);
        return "classdesk/user/progress_tree_main";
    }


    
    /**
     * 온라인학습 > 서브 차시페이지
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/progress/treeSubList.do")
    public String treeMobileList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
    	
        try {
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "progress");
        	
            request.setAttribute("listData", classdeskUserProgressService.getEdCourseTreeList(rMap));
            request.setAttribute("rowData", classdeskUserProgressService.getEduseqYnInfo(rMap));
            request.setAttribute("progData", classdeskTutorMainService.getProgInfo(rMap));
    		EduMap dateData = classdeskUserProgressService.getDateInfo(rMap);
    		//오늘 날짜 저장.
        	Date today = new Date();
            Date startDate = (Date) dateData.get("SDATE");
            Date endDate = (Date) dateData.get("EDATE");
            
            if (today.before(startDate)) {
        		request.setAttribute("progExecYn", "N");
            } else if (today.after(endDate)) {
            	request.setAttribute("progExecYn", "N");
            } else {
            	request.setAttribute("progExecYn", "Y");
            }
            
            rMap.setString("title", SangsProperties.getProperty("Globals.treeList"));
            request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) { 
            throw new FrontException(e);
        }
        request.setAttribute("REQUEST_DATA", rMap);
        return "classdesk/user/progress_tree_sub";
    	
    }
    
    /**
     * 온라인학습> 모바일 차시 목록
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/progress/treeList.do")
    public String treeList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        
    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
    	
        try {
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "progress");
        	
            request.setAttribute("listData", classdeskUserProgressService.getEdCourseTreeList(rMap));
            request.setAttribute("rowData", classdeskUserProgressService.getEduseqYnInfo(rMap));
            request.setAttribute("progData", classdeskTutorMainService.getProgInfo(rMap));
    		EduMap dateData = classdeskUserProgressService.getDateInfo(rMap);
    		//오늘 날짜 저장.
        	Date today = new Date();
            Date startDate = (Date) dateData.get("SDATE");
            Date endDate = (Date) dateData.get("EDATE");
            
            if (today.before(startDate)) {
        		request.setAttribute("progExecYn", "N");
            } else if (today.after(endDate)) {
            	request.setAttribute("progExecYn", "N");
            } else {
            	request.setAttribute("progExecYn", "Y");
            }
            
            rMap.setString("title", SangsProperties.getProperty("Globals.treeList"));
            request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) { 
            throw new FrontException(e);
        }
        request.setAttribute("REQUEST_DATA", rMap);
        return "classdesk/user/progress_tree_list";
        
    }
} 