package com.webapp.academy.ctrl;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.google.common.util.concurrent.ExecutionError;
import com.google.gson.Gson;
import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.DownloadServlet;
import com.sangs.util.SangsUtil;
import com.sangs.util.StringUtil;
import com.webapp.academy.mapper.BoardMapper;
import com.webapp.academy.mapper.CounselorMapper;
import com.webapp.academy.service.BoardService;
import com.webapp.academy.service.CommonService;
import com.webapp.academy.service.CounselorService;

/**
 * Description : 게시판 관련 컨트롤러
 * 
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2015.04.01 	SANGS			최초작성
 *
 */

@Controller
public class CounselorController { 

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "boardService")
    private BoardService boardService; 
    
    @Resource(name = "counselorService")
    private CounselorService counselorService;
    
    @Resource(name = "boardMapper")
    private BoardMapper       boardMapper;
    
    @Resource(name = "counselorMapper")
    private CounselorMapper       counselorMapper;
    
    @Resource(name = "commonService")
    private CommonService   commonService;
    
    /**
     * 재무상담 (본인 글 리스트)
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 교육센터 (뉴스언론보도, 교육사전자료)
    @RequestMapping(value = "/academy/counselor/boardList.do")
    public String dataList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		rMap.add("bcateno", 1036);
    		request.setAttribute("categoryData", boardService.getBoardCategoryList(rMap));
    		
    		List<EduMap> list = counselorService.getPersonalCounselorList(rMap);
    		
    		BASE64Encoder base64Encoder = new BASE64Encoder();
    		
    		for(int i=0;i<list.size();i++){
    			EduMap counsellist = list.get(i);
    			// Base64 인코딩
    	        String base64Txt = base64Encoder.encode(counsellist.get("BBSNO").toString().getBytes());
    	        
    	        counsellist.put("BBSNO", base64Txt);
    	        list.set(i, counsellist);
    		}
			request.setAttribute("listData", list);
			request.setAttribute("resultCount", counselorService.getPersonalCounselorListCnt(rMap));
			
			// 상담분야
            rMap.setString("mtCode", "CC");
            request.setAttribute("mtLecCounselCode", commonService.selectMtCodeSub(rMap));
			
			request.setAttribute("menu_nm", "counsel");
			request.setAttribute("lnb_menu", "counselList");
	    	
			rMap.setString("title", SangsProperties.getProperty("Globals.boardData"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }		
    			
    	return "academy/counselor/data_list";
    }
    
    /**
     * 안내공간 > 자료실( 뉴스언론보도, 교육사전자료, 자료실, 금융용어사전 ) 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 안내공간> 자료실( 자료실, 금융용어사전 )
    @RequestMapping(value = "/academy/counselor/boardDataView.do")
    public String boardDataView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		rMap.add("bcateno", 1036);
    		
    		BASE64Decoder base64Decoder = new BASE64Decoder();
    		String bbsNo = new String(base64Decoder.decodeBuffer(rMap.get("bbsNo").toString().trim())); 
    		
    		rMap.setInt("bbsNo", Integer.parseInt(bbsNo));
    		
    		boardService.updateBoardViewCnt(rMap);
	    	EduMap boardMap = counselorService.getCounselorBoardView(rMap);
	    	request.setAttribute("rowData", boardMap);
	    	
	    	BASE64Encoder base64Encoder = new BASE64Encoder();
	    	request.setAttribute("listData", counselorService.getFileList(rMap.getInt("bbsNo")));
	    	List<EduMap> list = counselorService.getFileList(rMap.getInt("bbsNo"));
	    	if(list != null){
	    		for(int i=0;i<list.size();i++){
	    			EduMap counsellist = list.get(i);
	    			counsellist.put("BBSNO", base64Encoder.encode(counsellist.get("BBSNO").toString().getBytes()));
	    			list.set(i, counsellist);
	    		}
	    		request.setAttribute("listData", list);
	    	}
			
			int bbsnoPrev = boardMap.getInt("BBSNO_PREV");
			int bbsnoNext = boardMap.getInt("BBSNO_NEXT");
			
			// 이전글
			rMap.setInt("bbsNo", bbsnoPrev);
			request.setAttribute("prevData", boardService.getBoardView(rMap));
			
			EduMap prevData = boardService.getBoardView(rMap);
			if(prevData != null){
				prevData.put("BBSNO", base64Encoder.encode(prevData.get("BBSNO").toString().getBytes()));
				request.setAttribute("prevData", prevData);
			}
			
			// 다음글
			rMap.setInt("bbsNo", bbsnoNext);
			request.setAttribute("nextData", boardService.getBoardView(rMap));
			
			EduMap nextData = boardService.getBoardView(rMap);
			if(nextData != null){
			nextData.put("BBSNO", base64Encoder.encode(nextData.get("BBSNO").toString().getBytes()));
			request.setAttribute("nextData", nextData);
			}
			
			request.setAttribute("menu_nm", "counsel");
			request.setAttribute("lnb_menu", "counselList");
    		request.setAttribute("categoryData", boardService.getBoardCategoryList(rMap));
	    	rMap.setString("title", SangsProperties.getProperty("Globals.boardList"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
    	
    	return "academy/counselor/data_view";
    }
    
    /**
     * 인권안내터 공지사항 파일다운로드
     * @param url
     * @param msg
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/academy/counselorFiledown.do")
    public String counselorFiledown(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        DownloadServlet filedown = new DownloadServlet();
        boolean result;

        try {
            //rMap.setString("filename", "../6BAE7B3F1CBB415FBE6A15D65DB18BE7.xls");
            rMap.setString("filename", SangsUtil.replaceAll(rMap.getString("filename"), "../", ""));
            //상위경로 진입 방지
            
            BASE64Decoder base64Decoder = new BASE64Decoder();
    		String bbsNo = new String(base64Decoder.decodeBuffer(rMap.get("bbsNo").toString().trim())); 
    		
    		rMap.setInt("bbsNo", Integer.parseInt(bbsNo));
            
            rMap.setString("fileId", req.getParameter("fileId"));
            rMap.setString("fileSeq", req.getParameter("fileSeq"));
            
			result = filedown.downLoadFile(req, res, counselorMapper.getFileInfo(rMap));
			
            if (result) {
                return null;
            } else {
                return "/common/cmmn_error";
            }

        } catch (Exception e) { log.debug(e.getMessage());
            return "common/cmmn_error";
        }
    }
    
    /**
     * 방문교육 > 등록 폼
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws Exception 
     */
    // TODO: 방문교육  > 등록 폼
    @RequestMapping(value = "/academy/counselor/counselorForm.do")
    public String aprsltForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try {
        	if ("N".equals(rMap.getString("SES_ISLOGIN")) || ("").equals(rMap.getString("SES_USERID"))) {// 로그인 안했다면
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/academy/common/login.do?returnUrl=/academy/counselor/main.do");
                return "forward:/common/msgForward.do";
            }
            rMap.addInt("userNo", rMap.getInt("SES_USERNO"));
            request.setAttribute("memberInfo", commonService.getUserInfo(rMap));
            request.setAttribute("menu_nm", "course");
            request.setAttribute("lnb_menu", "apply");
            rMap.setString("title", SangsProperties.getProperty("Globals.lectureForm"));
            request.setAttribute("REQUEST_DATA", rMap);
            
            String mtCode = "";
            
            // 영역구분1
            /*mtCode = SangsProperties.getProperty("Globals.mtCode_MT_SP_AREA_CODE");
            rMap.setString("mtCode", mtCode);
            request.setAttribute("codeList", commonService.selectMtCodeSub(rMap));*/

            // 상담분야
            rMap.setString("mtCode", "CC");
            request.setAttribute("mtLecCounselCode", commonService.selectMtCodeSub(rMap));
            
            // 직종코드
            rMap.setString("mtCode", "CJ");
            request.setAttribute("mtJobCode", commonService.selectMtCodeSub(rMap));
            
          //이메일 주소
            rMap.setString("mtCode", SangsProperties.getProperty("Globals.mtCode_MT_MAIL_SUB_CODE"));
            request.setAttribute("categoryData", commonService.selectMtCodeSub(rMap));

            request.setAttribute("REQUEST_DATA", rMap);
            
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
        
        return "academy/counselor/counselor_form";
    }
    
    /**
     * 게시글 등록/수정/삭제 실행
     * 
     * @date	: 2016. 4. 15.					
     * @author	: 이진영, sweetjy09@sangs.co.kr 
     *
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws Exception
     */
    // TODO: 게시글 등록/수정/삭제 실행
    @RequestMapping(value = "/academy/counselor/counselorExec.do", method = RequestMethod.POST)
    public String counselBoardExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	UserSessionVO userVo = UserSessionManager.getUserSessionVO(request);
        	
        	// 특수문자 치환 (insert)
        	rMap.setString("title", StringUtil.setContent(rMap.getString("title")));
        	rMap.setString("writer", userVo.getUserName()); 
        	rMap.setInt("userNo", userVo.getUserNo());
        	rMap.setString("topYn", "N"); 
    	   	 
        	String qu = rMap.getString("qu");
    	   		//삭제부분
    		   	if(qu.equals("delete")){
    		   		//게시글 삭제
    		   		boardService.tutorDeleteBoardInfo(rMap);
//    		   		adminTutorService.deleteEdDataFile(rMap);
    		   		
    		   	} else if (qu.equals("insert") || qu.equals("update")){
    		   		
    			   	if(qu.equals("insert")){
    			    	
    			   		int bbsNo = boardService.getMaxBoardNo(rMap);
    			   		rMap.setInt("bcateno", 1036);
    			   		rMap.set("counselStatCode", "CS0001");
    				   	rMap.setInt("bbsNo", bbsNo);
    				   	rMap.setString("writer", userVo.getUserName());
    				   	
    				   	counselorService.insertCounselUserInfo(rMap);
    				  //수정부분 
    			   	} else if(qu.equals("update")) {
    			   		boardService.updateBoardInfo(request, rMap);
    			   	}
    		}
    		   	
    		request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) {
            
            throw new Exception(e);
        }

       return "redirect:/academy/counselor/boardList.do";
    }
    
    
    /**
     * 재무상담 (본인 글 리스트)
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 교육센터 (뉴스언론보도, 교육사전자료)
    @RequestMapping(value = "/academy/counselor/bestList.do")
    public String bestDataList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		rMap.add("bcateno", 1037);
    		request.setAttribute("categoryData", boardService.getBoardCategoryList(rMap));
    		
    		request.setAttribute("listData", boardService.getBoardList(rMap));
			request.setAttribute("resultCount", counselorService.getPersonalCounselorListCnt(rMap));
			
			request.setAttribute("menu_nm", "counsel");
			request.setAttribute("lnb_menu", "bestcslist");
	    	
			// 상담분야
            rMap.setString("mtCode", "CC");
            request.setAttribute("mtLecCounselCode", commonService.selectMtCodeSub(rMap));
			
			rMap.setString("title", SangsProperties.getProperty("Globals.boardData"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }		
    			
    	return "academy/counselor/best_data_list";
    }
    
    /**
     * 안내공간 > 자료실( 뉴스언론보도, 교육사전자료, 자료실, 금융용어사전 ) 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 안내공간> 자료실( 자료실, 금융용어사전 )
    @RequestMapping(value = "/academy/counselor/BestboardDataView.do")
    public String bestBoardDataView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		rMap.add("bcateno", 1037);
    		boardService.updateBoardViewCnt(rMap);
	    	EduMap boardMap = boardService.getBoardView(rMap);
	    	request.setAttribute("rowData", boardMap);
			request.setAttribute("listData", counselorService.getFileList(rMap.getInt("bbsNo")));
			
			int bbsnoPrev = boardMap.getInt("BBSNO_PREV");
			int bbsnoNext = boardMap.getInt("BBSNO_NEXT");
			
			// 이전글
			rMap.setInt("bbsNo", bbsnoPrev);
			request.setAttribute("prevData", boardService.getBoardView(rMap));
			
			// 다음글
			rMap.setInt("bbsNo", bbsnoNext);
			request.setAttribute("nextData", boardService.getBoardView(rMap));
			
			request.setAttribute("menu_nm", "counsel");
			request.setAttribute("lnb_menu", "bestcslist");
    		request.setAttribute("categoryData", boardService.getBoardCategoryList(rMap));
	    	rMap.setString("title", SangsProperties.getProperty("Globals.boardList"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
    	
    	return "academy/counselor/best_data_view";
    }
    
    
    /**
     * 온라인교육 > 교육소개
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 온라인교육 > 교육소개
    @RequestMapping(value = "/academy/counselor/counselorIntro.do")
    public String onGuide(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try {

            request.setAttribute("menu_nm", "course");
            request.setAttribute("lnb_menu", "intro");

        	rMap.setString("title", SangsProperties.getProperty("Globals.onMain"));
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (RuntimeException e) {
        } catch (Exception e) { log.debug(e.getMessage());
        }

        return "academy/counselor/counselor_intro";
    }
    
    /**
     * 온라인교육 > 교육소개
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 온라인교육 > 교육소개
    @RequestMapping(value = "/academy/counselor/onMain.do")
    public String onMain(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
        try {

            request.setAttribute("menu_nm", "course");
            request.setAttribute("lnb_menu", "onMain");

        	rMap.setString("title", SangsProperties.getProperty("Globals.onMain"));
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (RuntimeException e) {
        } catch (Exception e) { log.debug(e.getMessage());
        }

        return "academy/counselor/on_main";
    }
    
    /**
     * 안내공간 > 자주묻는질문
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 안내공간 > 자주묻는질문
    @RequestMapping(value = "/academy/counselor/faqList.do")
    public String counselFaqList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
			rMap.putString("bcateno", "1038");
			if(rMap.getInt("tabNo") == 1){
				rMap.set("cateCode", "SS0001");
			} else if(rMap.getInt("tabNo") == 2){
				rMap.set("cateCode", "SS0002");
			} else if(rMap.getInt("tabNo") == 3){
				rMap.set("cateCode", "SS0003");
			} else {
				rMap.setInt("tabNo",0);
			}
			rMap.setString("topYn", "N");
			request.setAttribute("listData", boardService.getFaqBoardList(rMap));
			
			request.setAttribute("menu_nm", "helpdesk");
	    	request.setAttribute("lnb_menu", "faq");
	    	
	    	rMap.setString("title", SangsProperties.getProperty("Globals.faqList"));
			request.setAttribute("REQUEST_DATA", rMap);
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }		
    			
    	return "academy/counselor/news/faq_list";
    }
    
    /**
     * 안내공간 > 공지사항 게시판 리스트
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 안내공간 > 공지사항 게시판 리스트
    @RequestMapping(value = "/academy/counselor/helpdesk/noticeList.do")
    public String noticeList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		
			rMap.putString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteNotice"));
			
			request.setAttribute("listData", boardService.getBoardList(rMap));
			request.setAttribute("resultCount", boardService.getBoardListCnt(rMap));
			
			request.setAttribute("menu_nm", "helpdesk");
	    	request.setAttribute("lnb_menu", "notice");
	    	rMap.setString("title", SangsProperties.getProperty("Globals.noticeList"));
			request.setAttribute("REQUEST_DATA", rMap);
    	} 
    	catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }		
    			
    	return "academy/counselor/news/notice_list";
    }
    
    /**
     * 안내공간 > 공지사항 게시판 상세
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 안내공간 > 공지사항 게시판상세
    @RequestMapping(value = "/academy/counselor/helpdesk/noticeView.do")
    public String noticeView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		rMap.putString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteNotice"));
    		
	    	boardService.updateBoardViewCnt(rMap);
	    	EduMap boardMap = boardService.getBoardView(rMap);
	    	
	    	request.setAttribute("rowData", boardMap);
			request.setAttribute("listData", boardService.getFileList(rMap.getInt("bbsNo")));
			if(boardMap != null){
				int bbsnoPrev = boardMap.getInt("BBSNO_PREV");
				int bbsnoNext = boardMap.getInt("BBSNO_NEXT");
				
				// 이전글
				rMap.setInt("bbsNo", bbsnoPrev);
				request.setAttribute("prevData", boardService.getBoardView(rMap));
				
				// 다음글
				rMap.setInt("bbsNo", bbsnoNext);
				request.setAttribute("nextData", boardService.getBoardView(rMap));
			}
			
			request.setAttribute("menu_nm", "helpdesk");
	    	request.setAttribute("lnb_menu", "notice");
	    	
	    	rMap.setString("title", SangsProperties.getProperty("Globals.noticeList"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
    	
    	return "academy/counselor/news/notice_view";
    }
    
    /**
     * 안내공간> 자료실( 자료실, 금융용어사전 )
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 안내공간> 자료실( 자료실, 금융용어사전 )
    @RequestMapping(value = "/academy/counselor/helpdesk/boardDataList.do")
    public String counselBoardDataList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
			
    		request.setAttribute("categoryData", boardService.getBoardCategoryList(rMap));
			request.setAttribute("listData", boardService.getBoardList(rMap));
			request.setAttribute("resultCount", boardService.getBoardListCnt(rMap));
			
			request.setAttribute("menu_nm", "helpdesk");
	    	request.setAttribute("lnb_menu", "data"+rMap.getString("bcateno"));
	    	if(rMap.getInt("bcateno") == 4){
	    		rMap.setString("title", "진흥원소식");
	    	} else if(rMap.getInt("bcateno") == 6){
	    		rMap.setString("title", "금융생활정보");
	    	}
	    	request.setAttribute("REQUEST_DATA", rMap);
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }		
    			
    	return "academy/counselor/news/data_list";
    }
    
    /**
     * 안내공간 > 자료실( 뉴스언론보도, 교육사전자료, 자료실, 금융용어사전 ) 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 안내공간> 자료실( 자료실, 금융용어사전 )
    @RequestMapping(value = "/academy/counselor/helpdesk/boardDataView.do")
    public String counselBoardDataView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		
    		boardService.updateBoardViewCnt(rMap);
	    	EduMap boardMap = boardService.getBoardView(rMap);
	    	request.setAttribute("rowData", boardMap);
			request.setAttribute("listData", boardService.getFileList(rMap.getInt("bbsNo")));
			
			int bbsnoPrev = boardMap.getInt("BBSNO_PREV");
			int bbsnoNext = boardMap.getInt("BBSNO_NEXT");
			
			// 이전글
			rMap.setInt("bbsNo", bbsnoPrev);
			request.setAttribute("prevData", boardService.getBoardView(rMap));
			
			// 다음글
			rMap.setInt("bbsNo", bbsnoNext);
			request.setAttribute("nextData", boardService.getBoardView(rMap));
			
			request.setAttribute("menu_nm", "helpdesk");
	    	request.setAttribute("lnb_menu", "data"+rMap.getString("bcateno"));
    		request.setAttribute("categoryData", boardService.getBoardCategoryList(rMap));
	    	rMap.setString("title", SangsProperties.getProperty("Globals.boardList"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
    	
    	return "academy/counselor/news/data_view";
    }
    
    /**
     * 안내공간 > 자료실( 뉴스언론보도, 교육사전자료, 자료실, 금융용어사전 ) 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 안내공간> 자료실( 자료실, 금융용어사전 )
    @RequestMapping(value = "/academy/counselor/counselDataForm.do")
    public String boardDataForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		rMap.add("bcateno", 1036);
    		
	    	EduMap boardMap = counselorService.getCounselorBoardView(rMap);
	    	request.setAttribute("rowData", boardMap);
	    	
	    	request.setAttribute("listData", counselorService.getFileList(rMap.getInt("bbsNo")));
	    	List<EduMap> list = counselorService.getFileList(rMap.getInt("bbsNo"));
    		request.setAttribute("listData", list);
			
			request.setAttribute("menu_nm", "counsel");
			request.setAttribute("lnb_menu", "counselList");
    		request.setAttribute("categoryData", boardService.getBoardCategoryList(rMap));
	    	rMap.setString("title", SangsProperties.getProperty("Globals.boardList"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
    	
    	return "academy/counselor/counsel_data_form";
    }
    
    	/**
         * 게시글 등록/수정/삭제 실행
         * 
         * @date	: 2016. 4. 15.					
         * @author	: 이진영, sweetjy09@sangs.co.kr 
         *
         * @param request
         * @param res
         * @param rMap
         * @return
         * @throws Exception
         */
        // TODO: 게시글 등록/수정/삭제 실행
    @RequestMapping(value = "/academy/counselor/counselDataFormExec.do", method = RequestMethod.POST)
	public String counselDataFormExec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {

        try {
        	UserSessionVO userVo = UserSessionManager.getUserSessionVO(request);
        	
        	// 특수문자 치환 (insert)
        	rMap.setString("title", StringUtil.setContent(rMap.getString("title")));
        	rMap.setString("writer", userVo.getUserName()); 
        	rMap.setInt("userNo", userVo.getUserNo());
        	rMap.setString("topYn", "N"); 
        	
	   		
    		request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) {
            
            throw new Exception(e);
        }

       return "redirect:/academy/counselor/boardList.do";
    }	
    
    /**
     * 재무상담 (본인 글 리스트)
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 교육센터 (뉴스언론보도, 교육사전자료)
    @RequestMapping(value = "/academy/counselor/openBoardList.do")
    public String openDataList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		rMap.add("bcateno", 1036);
    		request.setAttribute("categoryData", boardService.getBoardCategoryList(rMap));
    		
    		List<EduMap> list = counselorService.getOpenCounselorList(rMap);
    		
    		BASE64Encoder base64Encoder = new BASE64Encoder();
    		
    		for(int i=0;i<list.size();i++){
    			EduMap counsellist = list.get(i);
    			// Base64 인코딩
    	        String base64Txt = base64Encoder.encode(counsellist.get("BBSNO").toString().getBytes());
    	        
    	        counsellist.put("BBSNO", base64Txt);
    	        list.set(i, counsellist);
    		}
			request.setAttribute("listData", list);
			request.setAttribute("resultCount", counselorService.getOpenCounselorListCnt(rMap));
			
			// 상담분야
            rMap.setString("mtCode", "CC");
            request.setAttribute("mtLecCounselCode", commonService.selectMtCodeSub(rMap));
			
			request.setAttribute("menu_nm", "counsel");
			request.setAttribute("lnb_menu", "opencslist");
	    	
			rMap.setString("title", SangsProperties.getProperty("Globals.boardData"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }		
    			
    	return "academy/counselor/data_list";
    }
    
    /**
     * 안내공간 > 자료실( 뉴스언론보도, 교육사전자료, 자료실, 금융용어사전 ) 
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 안내공간> 자료실( 자료실, 금융용어사전 )
    @RequestMapping(value = "/academy/counselor/openBoardDataView.do")
    public String openBoardDataView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
    		rMap.add("bcateno", 1036);
    		
    		BASE64Decoder base64Decoder = new BASE64Decoder();
    		String bbsNo = new String(base64Decoder.decodeBuffer(rMap.get("bbsNo").toString().trim())); 
    		
    		rMap.setInt("bbsNo", Integer.parseInt(bbsNo));
    		
    		boardService.updateBoardViewCnt(rMap);
	    	EduMap boardMap = counselorService.getCounselorOpenBoardView(rMap);
	    	request.setAttribute("rowData", boardMap);
	    	
	    	BASE64Encoder base64Encoder = new BASE64Encoder();
	    	request.setAttribute("listData", counselorService.getFileList(rMap.getInt("bbsNo")));
	    	List<EduMap> list = counselorService.getFileList(rMap.getInt("bbsNo"));
	    	if(list != null){
	    		for(int i=0;i<list.size();i++){
	    			EduMap counsellist = list.get(i);
	    			counsellist.put("BBSNO", base64Encoder.encode(counsellist.get("BBSNO").toString().getBytes()));
	    			list.set(i, counsellist);
	    		}
	    		request.setAttribute("listData", list);
	    	}
			
			int bbsnoPrev = boardMap.getInt("BBSNO_PREV");
			int bbsnoNext = boardMap.getInt("BBSNO_NEXT");
			
			// 이전글
			rMap.setInt("bbsNo", bbsnoPrev);
			request.setAttribute("prevData", boardService.getBoardView(rMap));
			
			EduMap prevData = boardService.getBoardView(rMap);
			if(prevData != null){
				prevData.put("BBSNO", base64Encoder.encode(prevData.get("BBSNO").toString().getBytes()));
				request.setAttribute("prevData", prevData);
			}
			
			// 다음글
			rMap.setInt("bbsNo", bbsnoNext);
			request.setAttribute("nextData", boardService.getBoardView(rMap));
			
			EduMap nextData = boardService.getBoardView(rMap);
			if(nextData != null){
			nextData.put("BBSNO", base64Encoder.encode(nextData.get("BBSNO").toString().getBytes()));
			request.setAttribute("nextData", nextData);
			}
			
			request.setAttribute("menu_nm", "counsel");
			request.setAttribute("lnb_menu", "opencslist");
    		request.setAttribute("categoryData", boardService.getBoardCategoryList(rMap));
	    	rMap.setString("title", SangsProperties.getProperty("Globals.boardList"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
    	
    	return "academy/counselor/data_open_view";
    }
}