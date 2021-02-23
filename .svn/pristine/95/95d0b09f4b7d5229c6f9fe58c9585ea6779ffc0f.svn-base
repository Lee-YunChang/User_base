package com.webapp.classdesk.ctrl;

import java.util.Date;
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

import com.ibm.icu.text.SimpleDateFormat;
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
public class ClassdeskUserDiscussController {
	
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
    @RequestMapping(value = "/classdesk/user/discuss/list.do") 
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
        try {
        	
        	rMap.putString("bcateno", SangsProperties.getProperty("Globals.bbsBcateClassDiscuss"));
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "discuss");
        	
        	//토론 등록기준체크
        	SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
        	Date currentTime = new Date ( );
        	String compareDate = formatter.format ( currentTime );
        	rMap.setString("compareDate" , compareDate);
        	
        	request.setAttribute("discussList", classdeskTutorDiscussService.getTopDiscussList(rMap));
        	request.setAttribute("discussListCount", classdeskTutorDiscussService.getTopDiscussListCount(rMap));
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        rMap.setString("title", SangsProperties.getProperty("Globals.discussList"));
        request.setAttribute("REQUEST_DATA", rMap);
        
        return "classdesk/user/discuss_list";
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
    @RequestMapping(value = "/classdesk/user/discuss/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
    	try {
    		 request.setAttribute("menu_nm", "classdesk");
         	 request.setAttribute("lnb_menu", "discuss");
             String qu = rMap.getString("qu");
             
             request.setAttribute("topData", classdeskTutorDiscussService.getDiscussTopView(rMap));
             if(qu.equals("update") || qu.equals("reply")){
            	 request.setAttribute("rowData", classdeskTutorDiscussService.getDiscussRowView(rMap));
                 request.setAttribute("listData", classdeskTutorDiscussService.getFileList(rMap));	
             }
         } catch (Exception e) { log.debug(e.getMessage());
             throw new FrontException(e);
         }
         request.setAttribute("REQUEST_DATA", rMap);
    	 
        return "classdesk/user/discuss_form";
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
    
    
    @RequestMapping(value = "/classdesk/user/discuss/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
        try {
            rMap.setString("title", StringUtil.setContent(rMap.getString("title")));
            
            classdeskTutorDiscussService.saveBbs(request, rMap);

            rMap.putString("rMsg", "등록되었습니다.");
            rMap.putString("rUrl", "/classdesk/user/discuss/list.do");

        } catch (Exception e) { log.debug(e.getMessage());
             
            rMap.putString("rMsg", "에러가 발생했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec2";    	 
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
    @RequestMapping(value = "/classdesk/user/discuss/view.do")
    public String view(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
        try {
            //세션 아이디를 이용해서 추천반대 교육게시판에 넣을 사용자 일련번호 불러오기
            String unityId = (String) rMap.get("SES_USERID");
            rMap.addString("unityId", unityId);
            
            String unityMberno = classdeskTutorDiscussService.getUnityMberno(unityId);
            rMap.addString("unityMberno", unityMberno);
            request.setAttribute("checkRcmnd", classdeskTutorDiscussService.checkRcmnd(rMap));
            request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "discuss");
        	request.setAttribute("topData", classdeskTutorDiscussService.getDiscussTopView(rMap));
            request.setAttribute("rowData", classdeskTutorDiscussService.getDiscussRowView(rMap));
            request.setAttribute("rcmndCount", classdeskTutorDiscussService.getRcmndCount(rMap));
            
            //삭제시 체크값
            int delCheckNum = classdeskTutorDiscussService.getDeleteCheck(rMap).size();
            request.setAttribute("delCheck", delCheckNum);
            
            // 게시물 카운트
            classdeskTutorDiscussService.updateDiscussViewCnt(rMap);
            
        } catch (Exception e) { log.debug(e.getMessage()); 
            throw new FrontException(e);
        }
        rMap.setString("title", SangsProperties.getProperty("Globals.discussList"));
        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/discuss_view";
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
    @RequestMapping(value = "/classdesk/user/discuss/rcmnd.do")
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
            
         request.setAttribute("checkRcmnd", classdeskTutorDiscussService.checkRcmnd(rMap));
       	 request.setAttribute("rowData", classdeskTutorDiscussService.getDiscussRowView(rMap));
         request.setAttribute("listData", classdeskTutorDiscussService.getFileList(rMap));
         request.setAttribute("rcmndCount", classdeskTutorDiscussService.getRcmndCount(rMap));
         request.setAttribute("menu_nm", "classdesk");
     	 request.setAttribute("lnb_menu", "discuss");
     	 
         // 게시물 카운트 
         if (rMap.getString("SES_GRADENO").equals(SangsProperties.getProperty("Globals.userGradeNo_normal"))) {
         	classdeskTutorDiscussService.updateDiscussViewCnt(rMap);
         }
         rMap.putString("rMsg", "투표되었습니다.");
         rMap.putString("rUrl", "/classdesk/user/discuss/view.do");

        } catch (Exception e) { log.debug(e.getMessage());
             
        }
    	
        request.setAttribute("REQUEST_DATA", rMap);
        return "classdesk/cmmn/classdeskExec2";
    }
    
    /**
     * 토론글 삭제
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/discuss/delete.do")
    public String delete(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	try {
    		//삭제
    		classdeskTutorDiscussService.deleteDiscussInfo(rMap);
    		
    		rMap.putString("rMsg", "삭제되었습니다.");
            rMap.putString("rUrl", "/classdesk/user/discuss/list.do");
    	}
	    catch (Exception e) { log.debug(e.getMessage());
	         
	    }
    	request.setAttribute("REQUEST_DATA", rMap);
    	return "classdesk/cmmn/classdeskExec2";
    }
}
