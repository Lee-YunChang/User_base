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

import com.google.common.util.concurrent.ExecutionError;
import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.SangsUtil;
import com.webapp.academy.service.BoardService;

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
public class BoardController { 

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "boardService")
    private BoardService boardService; 

    /**
     * 안내공간 > 공지사항 게시판 리스트
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 안내공간 > 공지사항 게시판 리스트
    @RequestMapping(value = "/academy/helpdesk/noticeList.do")
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
    			
    	return "academy/board/notice_list";
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
    @RequestMapping(value = "/academy/helpdesk/noticeView.do")
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
    	
    	return "academy/board/notice_view";
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
    @RequestMapping(value = "/academy/helpdesk/boardDataList.do")
    public String boardDataList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
			
    		request.setAttribute("categoryData", boardService.getBoardCategoryList(rMap));
			request.setAttribute("listData", boardService.getBoardList(rMap));
			request.setAttribute("resultCount", boardService.getBoardListCnt(rMap));
			
			request.setAttribute("menu_nm", "helpdesk");
	    	request.setAttribute("lnb_menu", "data"+rMap.getString("bcateno"));
	    	if(rMap.getInt("bcateno") == 4){
	    		rMap.setString("title", SangsProperties.getProperty("Globals.eduNews"));
	    	} else if(rMap.getInt("bcateno") == 6){
	    		rMap.setString("title", SangsProperties.getProperty("Globals.financeInfo"));
	    	}
	    	request.setAttribute("REQUEST_DATA", rMap);
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }		
    			
    	return "academy/board/data_list";
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
    @RequestMapping(value = "/academy/helpdesk/boardDataView.do")
    public String boardDataView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
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
    	
    	return "academy/board/data_view";
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
    @RequestMapping(value = "/academy/helpdesk/faqList.do")
    public String faqList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
			rMap.putString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteFaq"));
			if(rMap.getInt("tabNo") == 1){
				rMap.set("cateCode", SangsProperties.getProperty("Globals.mtCode_Faq_Cate04"));
			} else if(rMap.getInt("tabNo") == 2){
				rMap.set("cateCode", SangsProperties.getProperty("Globals.mtCode_Faq_Cate01"));
			} else if(rMap.getInt("tabNo") == 3){
				rMap.set("cateCode", SangsProperties.getProperty("Globals.mtCode_Faq_Cate02"));
			} else if(rMap.getInt("tabNo") == 4){
				rMap.set("cateCode", SangsProperties.getProperty("Globals.mtCode_Faq_Cate03"));
			} else if(rMap.getInt("tabNo") == 5){
				rMap.set("cateCode", SangsProperties.getProperty("Globals.mtCode_Faq_Cate05"));
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
    			
    	return "academy/board/faq_list";
    }
    
    
    /**
     * 안내공간 > 금융상식test
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 안내공간 > 금융상식test
    @RequestMapping(value = "/academy/helpdesk/comsenTestList.do")
    public String comsenTestList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{

			request.setAttribute("menu_nm", "dataroom");
	    	request.setAttribute("lnb_menu", "comsenTest");
	    	
	    	rMap.setString("title", SangsProperties.getProperty("Globals.comsenTest"));
			request.setAttribute("REQUEST_DATA", rMap);
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }		
    			
    	return "academy/board/comsen_test_list";
    }
    
    /**
     * 안내공간 > 금융상식test 답 제출
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/helpdesk/comsenTest_submit.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	String tmpRadioQno = "";
    	String tmpRadioArr = "";
    	ArrayList<Object> Qno = new ArrayList<Object>();
    	ArrayList<Object> Arr = new ArrayList<Object>();
    	try {

    		tmpRadioQno = SangsUtil.nvl(rMap.getString("radioQno"));//130 ,
    		tmpRadioArr = SangsUtil.nvl(rMap.getString("radioArr"));//130 , null
    		
    		int tmpRadioQnolength = tmpRadioQno.split(",").length;
    		String  radioQno[] = new String[tmpRadioQnolength];
    		radioQno = tmpRadioQno.split(",");
    		for(int i = 0; i< radioQno.length; i++){
    			Qno.add(radioQno[i]);
    		}
    		
    		int radioArrlength =tmpRadioArr.split(",").length;
        	String  radioArr[]= new String[radioArrlength];
        	radioArr = tmpRadioArr.split(",");
        	for(int i = 0; i< radioArr.length; i++){
    			Arr.add(radioArr[i]);
    		}
    		
            
        } catch (Exception e) { 
        	log.debug(e.getMessage());
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }
    	
    	request.setAttribute("menu_nm", "helpdesk");
    	request.setAttribute("lnb_menu", "comsenTest");
        request.setAttribute("rMsg", "금융상식 TEST가 완료되었습니다");
        request.setAttribute("tmpRadioQno", Qno);
        request.setAttribute("tmpRadioArr", Arr);
        request.setAttribute("REQUEST_DATA", rMap);
        
        return "academy/board/comsen_review_form";
    }
 
    /**
     * 자료실( 금융 생활 정보, 웹툰, 카드뉴스, 경제수업 자료실 )
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 자료실( 금융 생활 정보, 웹툰, 카드뉴스, 경제수업 자료실 )
    @RequestMapping(value = "/academy/dataRoom/dataroomBoardList.do")
    public String dataroomBoardList(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
    	try{
			
    		request.setAttribute("categoryData", boardService.getBoardCategoryList(rMap));
			request.setAttribute("listData", boardService.getBoardList(rMap));
			request.setAttribute("resultCount", boardService.getBoardListCnt(rMap));
			
			request.setAttribute("menu_nm", "dataroom");
	    	request.setAttribute("lnb_menu", "data"+rMap.getString("bcateno"));
	    	if(rMap.getInt("bcateno") == 6){
	    		rMap.setString("title", SangsProperties.getProperty("Globals.financeInfo"));
	    	} else if(rMap.getInt("bcateno") == 1041){
	    		rMap.setString("title", SangsProperties.getProperty("Globals.webtoon"));
	    	} else if(rMap.getInt("bcateno") == 1042){
	    		rMap.setString("title", SangsProperties.getProperty("Globals.cardNews"));
	    	} else if(rMap.getInt("bcateno") == 1043){
	    		rMap.setString("title", SangsProperties.getProperty("Globals.economyClass"));
	    	}
	    	request.setAttribute("REQUEST_DATA", rMap);
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }		
    			
    	return "academy/board/dataroom_board_list";
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
    @RequestMapping(value = "/academy/dataRoom/dataroomBoardView.do")
    public String dataroomBoardView(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
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
			
			request.setAttribute("menu_nm", "dataroom");
	    	request.setAttribute("lnb_menu", "data"+rMap.getString("bcateno"));
    		request.setAttribute("categoryData", boardService.getBoardCategoryList(rMap));
	    	rMap.setString("title", SangsProperties.getProperty("Globals.boardList"));
			request.setAttribute("REQUEST_DATA", rMap);
			
    	} catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }
    	
    	return "academy/board/dataroom_board_view";
    }
}