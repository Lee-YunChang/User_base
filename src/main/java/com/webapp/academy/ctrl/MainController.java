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

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsUtil;
import com.webapp.academy.service.BoardService;
import com.webapp.academy.service.CommonService;
import com.webapp.academy.service.MainService;
import com.webapp.common.service.CommonEmsService;
import com.webapp.common.vo.SendMsgVO;

/**
 * Description : 사용자 메인 관련 컨트롤러
 *
 * Modification Information
 * 수정일			수정자			수정내용
 * -------		-----------------------------------
 * 2015.06.01 	SANGS			최초작성
 *
 */

@Controller
public class MainController {

    private Logger log = LogManager.getLogger(this.getClass());

    @Resource(name = "mainService")
    private MainService      mainService;

    @Resource(name = "commonService")
    private CommonService    commonService;

    @Resource(name = "boardService")
    private BoardService     boardService;

    @Resource(name = "commonEmsService")
    private CommonEmsService commonEmsService;

    /**
     * 메인 페이지
     * (사용)
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 메인페이지
    @RequestMapping(value = "/academy/main/main.do")
    public String main(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	String returnJsp = "";
        try {
        	
        	// 메뉴조회 (박진만)
        	rMap.setString("menuGradeCode", SangsProperties.getProperty("Globals.mtGradeAdminCode"));

        	// 대메뉴 목록(박진만)
        	request.setAttribute("rootMenuList", commonService.selectRootMenuList(rMap));
        	// 중ㆍ소메뉴 목록
        	request.setAttribute("subMenuList", commonService.selectSubMenuList(rMap));
        	
            // 공지사항
            rMap.putString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteNotice"));
            request.setAttribute("noticeList", boardService.getLateBoardList(rMap));

            // 교육안내
            /*rMap.putString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteGuide"));
            request.setAttribute("guideList", boardService.getLateBoardList(rMap));*/
            
            // 금융생활정보
            rMap.putString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteData"));
            request.setAttribute("dataList", boardService.getLateBoardList(rMap));
            
            // 팝업
            request.setAttribute("noticePopCount", boardService.getMainPopBoardCount(rMap));
            request.setAttribute("noticePopList", boardService.getMainPopBoardView(rMap));
            
            // 배너
            request.setAttribute("bannerList", boardService.getBannerList(rMap));
            rMap.setString("title", SangsProperties.getProperty("Globals.academyMain"));
            request.setAttribute("REQUEST_DATA", rMap);
            
            returnJsp = "academy/main/main" ;
            
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return returnJsp;
    }

    // 테스트 메인페이지
    @RequestMapping(value = "/academy/main/main2.do")
    public String main2(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	    	
        	Calendar cal = Calendar.getInstance();
       	 
        	String strYear = request.getParameter("year");
        	String strMonth = request.getParameter("month");
        	int year = cal.get(Calendar.YEAR);
        	int month = cal.get(Calendar.MONTH);
        	int date = cal.get(Calendar.DATE);
        	if(strYear != null)
        	{
        	  year = Integer.parseInt(strYear);
        	  month = Integer.parseInt(strMonth);
        	 
        	}else{
        		strYear = Integer.toString(year);
        		strMonth = Integer.toString(month);
        	}
        	//년도/월 셋팅
        	cal.set(year, month, 1);
        	 
        	int startDay = cal.getMinimum(java.util.Calendar.DATE);
        	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
        	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
        	int newLine = 0;
        	//오늘 날짜 저장.
        	Calendar todayCal = Calendar.getInstance();
        	SimpleDateFormat sdf = new SimpleDateFormat("yyyMMdd");
        	int intToday = Integer.parseInt(sdf.format(todayCal.getTime()));
        	int intOpenday = Integer.parseInt("20170109");
        	
        	rMap.setInt("year", year);
        	rMap.setInt("month", month);
        	rMap.setInt("startDay", startDay);
        	rMap.setInt("endDay", endDay);
        	rMap.setInt("start", start);
        	rMap.setInt("newLine", newLine);
        	rMap.setInt("intToday", intToday);
    	
        	
            // 공지사항
            rMap.putString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteNotice"));
            request.setAttribute("noticeList", boardService.getLateBoardList(rMap));

            // 교육안내
            rMap.putString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteGuide"));
            request.setAttribute("guideList", boardService.getLateBoardList(rMap));
            
            // 팝업
            request.setAttribute("noticePopCount", boardService.getMainPopBoardCount(rMap));
            request.setAttribute("noticePopList", boardService.getMainPopBoardView(rMap));
            
            //상시설문
            request.setAttribute("alwaysPollPop", boardService.getMainPollPopBoardView(rMap));
            
            // 배너
            request.setAttribute("bannerList", boardService.getBannerList(rMap));
            
            
            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/main/main";
    }
    
    /**
     * 메인 팝업
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 메인팝업
    @RequestMapping(value = "/academy/main/main/notice_pop.do")
    public String notice_pop(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            rMap.putString("pbcateno", SangsProperties.getProperty("Globals.bbsBcateSiteNotice"));
            request.setAttribute("rowData", boardService.getMainPopBoardView(rMap).get(0));
            request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/main/pop_main_notice";
    }
    
    /**
     * 메인 상시설문 팝업
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 메인 상시설문팝업
    @RequestMapping(value = "/academy/main/poll/pollPop.do")
    public String alwaysPollPop(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	request.setAttribute("alwaysPollPop", boardService.getMainPollPopBoardView(rMap));
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/main/poll_pop";
    }
    
    /**
     * 메인 팝업
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 메인팝업
    @RequestMapping(value = "/academy/poll/pollForm.do")
    public String alwaysPollForm(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	String reUrl = "academy/main/poll_form";
        try {
        	UserSessionVO userSessionVO = UserSessionManager.getUserSessionVO(request);
        	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/academy/common/login.do");
                return "forward:/common/msgForward.do";
            }
        	EduMap map = boardService.getMainPollPopBoardView(rMap);
        	request.setAttribute("pollTopData", map);
        	int pno = map.getInt("POLLCSEQNO");
        	rMap.setInt("pollcseqno", pno);
        	
        	//참여여부 조회
        	EduMap pollInfo = boardService.getPollInfoData(rMap);
        	if( pollInfo != null){
        		request.setAttribute("msg", "설문에 이미 참여하셨습니다.");
                request.setAttribute("returnUrl", "/academy/main/main.do");
                reUrl = "academy/cmmn/login_exec";
        	}
        	
        	
        	request.setAttribute("REQUEST_DATA", rMap);
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return reUrl;
    }
    
   

    /**
     * 테스트용 메서드
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/academy/main/main/test.do")
    public String test(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {

            rMap.setString("url", "/academy/main/main.do");

            request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/member/member_redirect";
    }

    /**
     * SMS 발송 Test
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: SMS 발송 Test
    @RequestMapping(value = "/academy/main/main/smsTest.do")
    public String smsTest(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
            SendMsgVO sendMsgVO = new SendMsgVO();
            sendMsgVO.setTranPr(1);
            sendMsgVO.setRcvphns("010-3389-9709");
            sendMsgVO.setCallback("010-3389-9709");
            sendMsgVO.setIsreserve("N");
            sendMsgVO.setTranType("4");
            sendMsgVO.setMessage("테스트용 메시지");

            //commonEmsService.insertEmTran(sendMsgVO);
            
        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/main/main";
    }

    /**
     * send Mail 테스트
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: mail 발송 Test
    @RequestMapping(value = "/academy/main/main/emailTest.do")
    public String emailTest(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	
            //메일발송 테스트
            commonService.testSendMail(rMap);

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return "academy/main/main";
    }


    /**
     * 메뉴정보 검색(ajax)
     * @param req
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/main/main/searchMenuInfo.do")
    public void memberSearchCompany(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null;

        try {

            List<EduMap> menuInfo = commonService.getSearchMenuInfo(rMap);

            Map<String, Object> tempMap= new HashMap<String, Object>();
            int resultCnt = menuInfo.size();
            List tempList = new ArrayList();

            for(int i=0; i <menuInfo.size(); i++){
                 EduMap map= menuInfo.get(i);
                tempMap.put("MENU_CODE", map.getString("MENU_CODE"));
                tempMap.put("MENU_NAME", map.getString("MENU_NAME"));
                tempMap.put("DEFAULT_LINK", map.getString("DEFAULT_LINK"));
                tempMap.put("ORDR", map.getInt("ORDR"));
                tempMap.put("P_MENU_CODE", map.getString("P_MENU_CODE"));
            }

            json = gson.toJson(tempMap);

        }catch (Exception ex) {
            json = gson.toJson("FAIL");
        }
        out.print(json);
        out.flush();
        out.close();
    }
    
    /**
     * 메뉴정보 검색(ajax)
     * @param req
     * @param rMap
     * @throws Exception
     */
    @RequestMapping(value = "/academy/main/ajaxCalcMethod.do")
    public void ajaxCalcMethod(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws Exception {
        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = res.getWriter();
        Gson gson = new Gson();
        String json = null ;
        Calendar cal = Calendar.getInstance();
        int year = Integer.parseInt(request.getParameter("year"));
        int month = Integer.parseInt(request.getParameter("month"));
        
        if(rMap.getString("mod").equals("prev")){
        	month = month -2;
        	if(month <= 0){
        		month = 13-2 ; 
        		year = year-1;
        	}
        }
        
        //년도/월 셋팅
        cal.set(year, month, 1);
    	int endDay = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
    	int start = cal.get(java.util.Calendar.DAY_OF_WEEK);
    	int month2 = cal.get(java.util.Calendar.MONTH);
    	int newLine = 0;
    	
        String calcDate = "";
        try {
        	
        	for(int index = 1; index < start; index++ )
			{
        		calcDate +="<td>&nbsp;</td>" ;
			    newLine++;
			}
			 
			for(int index = 1; index <= endDay; index++) {
			      
			      // if(newLine == 0){          color = "";
			      // }else if(newLine == 6){    color = "";
			      // }else{                     color = ""; };
			 
			       calcDate +="<td id='day"+index+"'><a href='#' check='"+index+"'>"+index+"</a></td>";
			       newLine++;
			 
			       if(newLine == 7)
			       {
			         calcDate += "</tr>";
			         if(index <= endDay)
			         {
			           calcDate+="<tr>";
			         }
			         newLine=0;
			       }
			}
			//마지막 공란 LOOP
			while(newLine > 0 && newLine < 7)
			{
			  calcDate += "<td>&nbsp; </td>";
			  newLine++;
			}
			
			if(rMap.getString("mod").equals("next")){
	    		month = month + 1;
	    	}
			if( month > 12){
	    		month = 1;
	    		year = year + 1;
	    	}
			if(rMap.getString("mod").equals("prev")){
				month = month2+1;
			}
        	rMap.putInt("year", year);
        	rMap.putInt("month", month);
        	rMap.putString("calcDate", calcDate);
        	
        	json =  gson.toJson(rMap);
        	
        }catch (Exception ex) {
        	json =  gson.toJson("FAIL");
        }
        out.print(json);
        out.flush();
        out.close();
    }
    
    @RequestMapping(value = "/academy/main/pop_movie.do")
    public String lmsMovie(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        return "academy/main/pop_movie";
    }   
    
    @RequestMapping(value = "/academy/main/pop_movie2.do")
    public String lmsMovie2(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	request.setAttribute("videonum", request.getParameter("movie"));
        return "academy/main/employment_pop_movie";
    }   
    

    
	@RequestMapping(value = "/academy/main/maincompGuidePop.do")
    public String maincompGuidePop(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        return "academy/main/main_comp_guide_pop";
    }
	
	/**
     * 메인 페이지
     * (사용)
     * @param request
     * @param model
     * @param rMap
     * @return
     * @throws FrontException
     */
    // TODO: 메인페이지
    @RequestMapping(value = "/academy/counselor/main.do")
    public String counselMain(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	String returnJsp = "";
        try {
        	
            // 공지사항
            rMap.putString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteNotice"));
            request.setAttribute("noticeList", boardService.getLateBoardList(rMap));

            // 교육안내
            /*rMap.putString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteGuide"));
            request.setAttribute("guideList", boardService.getLateBoardList(rMap));*/
            
            // 금융생활정보
            rMap.putString("bcateno", SangsProperties.getProperty("Globals.bbsBcateSiteData"));
            request.setAttribute("dataList", boardService.getLateBoardList(rMap));
            
            // 팝업
            request.setAttribute("noticePopCount", boardService.getMainPopBoardCount(rMap));
            request.setAttribute("noticePopList", boardService.getMainPopBoardView(rMap));
            
            //상시설문
            request.setAttribute("alwaysPollPop", boardService.getMainPollPopBoardView(rMap));
            
            // 배너
            request.setAttribute("bannerList", boardService.getBannerList(rMap));
            rMap.setString("title", SangsProperties.getProperty("Globals.academyMain"));
            request.setAttribute("REQUEST_DATA", rMap);
            returnJsp = "academy/main/counsel_main" ;

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        return returnJsp;
    }

}