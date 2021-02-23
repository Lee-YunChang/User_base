package com.webapp.classdesk.ctrl;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.BookMarkType;
import com.webapp.classdesk.service.ClassdeskProgService;
import com.webapp.classdesk.service.ClassdeskTutorProgressService;
import com.webapp.classdesk.service.ClassdeskTutorResultService;
import com.webapp.common.mapper.CommonAccessLogMapper;

/**
 * Description : 클래스데스트 진도처리
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskProgController {

	private final Logger log = LogManager.getLogger(ClassdeskProgController.class);
	
    @Resource(name = "classdeskTutorProgressService")
    private ClassdeskTutorProgressService classdeskTutorProgressService;
    
    @Resource(name = "classdeskTutorResultService")
    private ClassdeskTutorResultService classdeskTutorResultService;
    
    @Resource(name = "classdeskProgService")
    private ClassdeskProgService          classdeskProgService;
    
    @Resource(name = "commonAccessLogMapper")
    private CommonAccessLogMapper commonAccessLogMapper;
    
/**
     * 진도처리
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/online/prog.do")
    public String prog(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "세션이 만료되어 자동 로그아웃되었습니다. 다시 로그인 하여 주시기 바랍니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
    	
    	String returnUrl = null;
    	
    	try {
    		
    		
    		request.setAttribute("rowData", classdeskTutorProgressService.getConurlInfo(rMap));
    		request.setAttribute("treeData", classdeskProgService.getEdCourseTreeInfo(rMap));
    		request.setAttribute("treeHistData", classdeskProgService.getLeCourseTreeHistInfo(rMap));
    		returnUrl = "classdesk/online/progress_popup";
    		
    		// 임시주석
//    		String contentsRootPath = SangsProperties.getProperty("Globals.ContentsRootPath");
//			EduMap indexHtmlFilePathMap = classdeskProgService.getEdCourseTreeInfo(rMap);
//			
			
			
		/*	indexHtmlFilePathMap.get("FILE_PATH");
			String indexHtmlFilePath = contentsRootPath + (String) indexHtmlFilePathMap.get("FILE_PATH");
			*/
			
//			String indexHtmlFilePath = contentsRootPath + "/mobile"+(String) indexHtmlFilePathMap.get("MOBILE_FILE_PATH");
    		
    		// 임시주석
			/*String indexHtmlFilePath = contentsRootPath + "/mobile/index.html";
			
			log.debug("indexHtmlFilePath==>" + indexHtmlFilePath);
			
			
			String type = "nothing";
			type = BookMarkType.getType(indexHtmlFilePath);
			rMap.setString("BOOK_MARK_TYPE", type);
			request.setAttribute("BOOK_MARK_TYPE", type);
			
			int sday = indexHtmlFilePathMap.getInt("SDAY");
			request.setAttribute("SDAY", sday);*/
    		 
			
		} catch (Exception e) { 
			log.error(e);
			e.printStackTrace();
			throw new FrontException(e);
		}
    	rMap.setString("title", SangsProperties.getProperty("Globals.treeList"));
        request.setAttribute("REQUEST_DATA", rMap);

        return returnUrl;
    } 

    
    /**
     * 모바일 북마크 유형 체크
     * @param request
     * @param res
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/classdesk/online/bookmarkType.do")
    public void bookmarkType(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
    	
    	String contentsRootPath = SangsProperties.getProperty("Globals.ContentsRootPath");
    	String courseno = rMap.getString("courseno");
    	String treeDir = "01";
    	/*treeDir = rMap.getString("treeDir");
    	if (treeDir.length() < 2) {
    		treeDir = "0" + treeDir;
    	}*/
    	
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        
        String type = "nothing";
        String indexHtmlFilePath = contentsRootPath + "/" + courseno + "/resources/" + treeDir + "/" + "index.html";
        type = BookMarkType.getType(indexHtmlFilePath);

        out.write(type);
        out.flush();
        out.close();
    }

    /**
     * 진도처리 (onload, unload)
     * 
     * @param req
     * @param requestMap
     * @param res
     * @throws Exception
     */
    @RequestMapping(value = "/classdesk/online/progExec.do")
    private String progExec(Model model, DataMap rMap) throws Exception {
    	
		/* {cuserNo=[3266], treeno=[4], courseno=[35], cseqno=[8], frameseq=[1], studytime=[81], val=[], sdate=[], edate=[], studycnt=[], movsec=[82]
		 * , compDate=[], lastFrameseq=[1], frameCompStatus=[1], oldFrameCompStatus=[], CLASSDESK=[101011], progExecYn=[Y], seqTitle=[사업타당성 분석], isPass=[N]
		 * , SES_USERNO=[2], SES_USERID=[user], SES_USERNAME=[사용자], SES_GRADENO=[2], SES_MOBILE=[010-1234-1234], SES_EMAIL=[sweetjy09@sangs.co.kr], SES_MBER_REG_GB=[], SES_STATUS_GB=[], SES_COURSENO=[35], SES_CUSERNO=[3266], SES_CSEQNO=[8], SES_CYBER_BIZNO=[], SES_CYBER_LAYOUT_BW_TITLE=[], SES_CYBER_LAYOUT_BW_LOGO=[], SES_CYBER_LAYOUT_MAIN_IMG=[], SES_CYBER_LAYOUT_HOMEPAGE=[], SES_CYBER_LAYOUT_SITENAME=[], SES_CYBER_GRADE_NO=[0], SES_TUTOR_AT=[Y]}*/
		 
		 /* 모바일 진도체크 */
		 /*StringBuilder realFrameCompStatus = new StringBuilder(rMap.getString("oldFrameCompStatus"));
		 
		 if(!rMap.getString("oldFrameCompStatus").equals("")) {
			 if( !rMap.getString("oldFrameCompStatus").equals("P")) {
				 for(int i = 0 ; i < rMap.getString("oldFrameCompStatus").length() ; i ++) {
					 if(rMap.getString("oldFrameCompStatus").charAt(i) != rMap.getString("frameCompStatus").charAt(i)) {
						 realFrameCompStatus.setCharAt(i, '1');
					 }
				 }
				 rMap.setString("frameCompStatus", realFrameCompStatus.toString());
			 } 
		 } */
		 
		if(rMap.getString("progExecYn").equals("Y") && rMap.getString("isPass").equals("N")){//학습 기간 중이고 학습 중이라면(복습하기가 아니라면)
			
			classdeskProgService.progExec(rMap);
		}
		
		/*model.setAttribute("rowData", classdeskTutorProgressService.getConurlInfo(rMap));
		request.setAttribute("treeData", classdeskProgService.getEdCourseTreeInfo(rMap));
		request.setAttribute("treeHistData", classdeskProgService.getLeCourseTreeHistInfo(rMap));*/
		
        model.addAttribute("REQUEST_DATA", rMap);
        
        System.out.println("###############"+model.toString());
        
        return "jsonView";
    }
    
    
    
    // 진도체크 
    
    @RequestMapping(value = "/classdesk/online/onlineEdu.do")
    public String onlineEdu(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

    	
    	String returnUrl = null;
    	
    	try {
    		returnUrl = "academy/course/edu_pop";
    		
		} catch (Exception e) {
			// TODO: handle exception
		}
        return returnUrl;
    }   
    
    
    
    
    
    
    
    
    
}