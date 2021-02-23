package com.webapp.classdesk.ctrl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.pattern.IntegerPatternConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.StringUtil;
import com.webapp.classdesk.service.ClassdeskTutorDiscussService;

/**
 * Description : 클래스데스트 > 강사모드 > 토론
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2016.08.19   황두은           최초작성
 *
 */

@Controller
public class ClassdeskTutorDiscussController {
	
	private Logger log = LogManager.getLogger(this.getClass());
	
	@Resource(name = "classdeskTutorDiscussService")
    private ClassdeskTutorDiscussService classdeskTutorDiscussService;
	
	/**
     * 토론 목록
     * 
     * @param request
     * @param model
     * @param rMap 
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/discuss/list.do") 
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try {
        	rMap.putString("pbcateno", SangsProperties.getProperty("Globals.bbsBcateSiteDiscuss"));
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "discuss");
        	
        	request.setAttribute("topDiscussList", classdeskTutorDiscussService.getTopDiscussList(rMap));
            request.setAttribute("courselistData", classdeskTutorDiscussService.getCourseDiscussList(rMap));

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);
        
        return "classdesk/tutor/discuss_list";
    }
    
    /**
     * 토론 등록폼
     * 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/discuss/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
       
    	 try {
    		 request.setAttribute("menu_nm", "classdesk");
         	 request.setAttribute("lnb_menu", "discuss");
             String qu = rMap.getString("qu");
             if(qu.equals("update")){
            	 request.setAttribute("rowData", classdeskTutorDiscussService.getDiscussRowView(rMap));
                 request.setAttribute("listData", classdeskTutorDiscussService.getFileList(rMap));	
             }

         } catch (Exception e) { log.debug(e.getMessage());
             throw new FrontException(e);
         }

         request.setAttribute("REQUEST_DATA", rMap);
    	 
        return "classdesk/tutor/discuss_form";
    }
 
    /**
     * 토론 등록/수정 실행
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시글 등록/수정/삭제 실행
    
    
    @RequestMapping(value = "/classdesk/tutor/discuss/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            rMap.setString("title", StringUtil.setContent(rMap.getString("title")));
            classdeskTutorDiscussService.saveBbs(request, rMap);

            rMap.putString("rMsg", "등록되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) { log.debug(e.getMessage());
            rMap.putString("rMsg", "에러가 발생했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";    	 
    }    
    
    /**
     * 토론 상세보기
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/discuss/view.do")
    public String view(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	
            request.setAttribute("rowData", classdeskTutorDiscussService.getDiscussRowView(rMap));
            request.setAttribute("listData", classdeskTutorDiscussService.getFileList(rMap));
            request.setAttribute("rcmndCount", classdeskTutorDiscussService.getRcmndCount(rMap));
            //세션 아이디를 이용해서 추천반대 교육게시판에 넣을 사용자 일련번호 불러오기
            String unityId = (String) rMap.get("SES_USERID");
            rMap.addString("unityId", unityId);
            
            String unityMberno = classdeskTutorDiscussService.getUnityMberno(unityId);
            rMap.addString("unityMberno", unityMberno);
            
            request.setAttribute("checkRcmnd", classdeskTutorDiscussService.checkRcmnd(rMap));
            
            // 게시물 카운트 
            if (rMap.getString("SES_GRADENO").equals(SangsProperties.getProperty("Globals.userGradeNo_normal"))) {
            	classdeskTutorDiscussService.updateDiscussViewCnt(rMap);
            }

        } catch (Exception e) { log.debug(e.getMessage()); 
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/tutor/discuss_view";
    }
    
    /**
     * 토론 추천/반대 실행
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/tutor/discuss/rcmnd.do")
    public String rcmnd(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	try {
    		
    		rMap.setString("title", StringUtil.setContent(rMap.getString("title")));
    		
            //세션 아이디를 이용해서 추천반대 교육게시판에 넣을 사용자 일련번호 불러오기
            String unityId = (String) rMap.get("SES_USERID");
            rMap.addString("unityId", unityId);
            
            String unityMberno = classdeskTutorDiscussService.getUnityMberno(unityId);
            rMap.addString("unityMberno", unityMberno);
            
            // 추천/반대 등록
            classdeskTutorDiscussService.insertRcmndInfo(request, rMap);

       	 request.setAttribute("rowData", classdeskTutorDiscussService.getDiscussRowView(rMap));
         request.setAttribute("listData", classdeskTutorDiscussService.getFileList(rMap));
         request.setAttribute("rcmndCount", classdeskTutorDiscussService.getRcmndCount(rMap));
         // 게시물 카운트 
         if (rMap.getString("SES_GRADENO").equals(SangsProperties.getProperty("Globals.userGradeNo_normal"))) {
         	classdeskTutorDiscussService.updateDiscussViewCnt(rMap);
         }

        } catch (Exception e) { log.debug(e.getMessage());
        }
    	
        request.setAttribute("REQUEST_DATA", rMap);
        return "classdesk/tutor/discuss_view";   
    }
    
}
