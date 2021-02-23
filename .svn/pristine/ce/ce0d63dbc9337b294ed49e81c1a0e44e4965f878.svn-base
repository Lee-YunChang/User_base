package com.webapp.classdesk.ctrl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.DataMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.sangs.util.StringUtil;
import com.webapp.classdesk.service.ClassdeskBoardService;

/**
 * Description : 클래스데스트 > 학생모드 > 게시판
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskBbsController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskBoardService")
    private ClassdeskBoardService classdeskBoardService;

    /**
     * 공지사항
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/bbs/list.do")
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
        try {
        	request.setAttribute("menu_nm", "classdesk");
        	if(!rMap.getString("select").equals(null) && rMap.getString("select").equals("list1")){
        		rMap.putInt("bcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsBcateClassNotice")));
        		request.setAttribute("lnb_menu", "bbslist1");
        		rMap.setString("title", SangsProperties.getProperty("Globals.bbsList1"));
        	}else if(!rMap.getString("select").equals(null) && rMap.getString("select").equals("list2")){
        		rMap.putInt("bcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsBcateClassData")));
        		request.setAttribute("lnb_menu", "bbslist2");
        		rMap.setString("title", SangsProperties.getProperty("Globals.bbsList2"));
        	}
            request.setAttribute("courselistData", classdeskBoardService.getCourseBbsList(rMap));
            request.setAttribute("courselistCount", classdeskBoardService.getCourseBbsListCount(rMap));
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
        return "classdesk/bbs/bbs_list";
    }

    /**
     * 등록/수정 양식
     * 
     * @param request
     * @param res
     * @param rMap
     * @return 
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/bbs/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	request.setAttribute("menu_nm", "classdesk");
        	if(!rMap.getString("select").equals(null) && rMap.getString("select").equals("list1")){
        		rMap.putInt("bcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsBcateClassNotice")));
        		request.setAttribute("lnb_menu", "bbslist1");
        	}else if(!rMap.getString("select").equals(null) && rMap.getString("select").equals("list2")){
        		rMap.putInt("bcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsBcateClassData")));
        		request.setAttribute("lnb_menu", "bbslist2");
        	}
            request.setAttribute("rowData", classdeskBoardService.getBoardView(rMap));
            request.setAttribute("listData", classdeskBoardService.getFileList(rMap));
            request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/bbs/bbs_form";
    }

    /**
     * 상세보기 양식
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/bbs/view.do")
    public String view(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	request.setAttribute("menu_nm", "classdesk");
        	if(!rMap.getString("select").equals(null) && rMap.getString("select").equals("list1")){
        		rMap.putInt("bcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsBcateClassNotice")));
        		request.setAttribute("lnb_menu", "myLecture");
        		rMap.setString("title", SangsProperties.getProperty("Globals.bbsList1"));
        	}else if(!rMap.getString("select").equals(null) && rMap.getString("select").equals("list2")){
        		rMap.putInt("bcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsBcateClassData")));
        		request.setAttribute("lnb_menu", "myLecture");
        		rMap.setString("title", SangsProperties.getProperty("Globals.bbsList2"));
        	}
        	// 게시물 카운트 
        	classdeskBoardService.updateBoardViewCnt(rMap);
        	
            request.setAttribute("rowData", classdeskBoardService.getBoardView(rMap));
            request.setAttribute("listData", classdeskBoardService.getFileList(rMap));
            
        } catch (Exception e) { log.debug(e.getMessage()); 
            throw new FrontException(e);
        }
        request.setAttribute("REQUEST_DATA", rMap);
        
        return "classdesk/bbs/bbs_view";
    }

    /**
     * 등록, 수정실행
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */ 
    @RequestMapping(value = "/classdesk/bbs/exec.do" )
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	request.setAttribute("menu_nm", "classdesk");
        	if(!rMap.getString("select").equals(null) && rMap.getString("select").equals("list1")){
        		rMap.putInt("bcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsBcateClassNotice")));
        		request.setAttribute("lnb_menu", "bbslist1");
        	}else if(!rMap.getString("select").equals(null) && rMap.getString("select").equals("list2")){
        		rMap.putInt("bcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsBcateClassData")));
        		request.setAttribute("lnb_menu", "bbslist2");
        	}
        	
            // 특수문자 치환 (insert)
            rMap.setString("title", StringUtil.setContent(rMap.getString("title")));
            int bbsNo = ParamUtil.getIntParam(rMap.getString("bbsNo"), 0);
            int fileCnt = rMap.getInt("UPLOAD_FILE_CNT"); //파일 개수 Cnt
            
            classdeskBoardService.saveBbs(request, rMap);
            
            rMap.putString("rMsg", "등록되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) { log.debug(e.getMessage());
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }

    /**
     * 삭제 실행
     * 
     * @param request
     * @param res
     * @param rMap
     * @return 
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/bbs/del_exec.do")
    public String delExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            classdeskBoardService.deleteBoardInfo(rMap);

            rMap.putString("rMsg", "삭제되었습니다.");
            rMap.putString("rScript", "fnList()");

        } catch (Exception e) { log.debug(e.getMessage());
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/cmmn/classdeskExec";
    }
}
