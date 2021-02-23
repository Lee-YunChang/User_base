package com.webapp.classdesk.ctrl;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.omg.CORBA.NVList;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.SangsUtil;
import com.webapp.classdesk.service.ClassdeskUserPollService;

/**
 * Description : 클래스데스트 > 학생모드 > 설문
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.01   SANGS           최초작성
 *
 */

@Controller
public class ClassdeskUserPollController {

    private Logger                   log = LogManager.getLogger(ClassdeskUserPollController.class);

    @Resource(name = "classdeskUserPollService")
    private ClassdeskUserPollService classdeskUserPollService;

    /**
     * 설문목록
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/poll/list.do")
    public String list(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
        try {
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "tutorpoll");
        	
        	//설문목록
        	request.setAttribute("resultList", classdeskUserPollService.getLePoll(rMap));
        	
        	//참여 이력 여부
        	request.setAttribute("histData", classdeskUserPollService.gethistData(rMap));
        	List<EduMap> histData = classdeskUserPollService.gethistData(rMap);
        	request.setAttribute("histData2", histData.size());

        } catch (Exception e) { log.debug(e.getMessage());
             
            throw new FrontException(e);
        }

        rMap.setString("title", SangsProperties.getProperty("Globals.pollList"));
        request.setAttribute("REQUEST_DATA", rMap);
        
        return "classdesk/user/poll_list";
    }

    /**
     * 설문참여
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/poll/form.do")
    public String form(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
            request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
            request.setAttribute("url", "/academy/common/login.do");
            return "forward:/common/msgForward.do";
        }
        try {
        	request.setAttribute("menu_nm", "classdesk");
        	request.setAttribute("lnb_menu", "tutorpoll");
        	EduMap COMMON_DATA = (EduMap) request.getAttribute("COMMON_DATA");
        	// 설문 상시 / 기간 노출
        	//rMap.setString("openType", COMMON_DATA.getString("OPENTYPE"));
            request.setAttribute("listData", classdeskUserPollService.getUserPollList(rMap));

        } catch (Exception e) { log.debug(e.getMessage());
             
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/poll_form";
    }

    /**
     * 설문view
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/poll/view.do")
    public String view(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        try {
        	
        	 request.setAttribute("menu_nm", "mypage");
             request.setAttribute("lnb_menu", "myLecture");
        	
        	//모듈명
        	request.setAttribute("moduleList", classdeskUserPollService.getModuleList(rMap));
        	//질문 목록
        	request.setAttribute("questionList", classdeskUserPollService.getQuestionList(rMap));
        	//설문 내용
        	request.setAttribute("resultList", classdeskUserPollService.getSurveyModuleList(rMap));//복수응답가능
        	
        	//객관식 복수 응답 문항 validation
        	request.setAttribute("itemCntQno", classdeskUserPollService.getItemCnt(rMap));
        	//객관식 복수 응답 불가 문항 validation
        	request.setAttribute("itemCnt2", classdeskUserPollService.getItemCnt2(rMap));
        	
        	//객관식 || 주관식 
        	String JB = "JB";
        	rMap.setString("JB", JB);
        	request.setAttribute("mtSubCode", classdeskUserPollService.selectMtCpollCode(rMap));
        	rMap.setString("title", SangsProperties.getProperty("Globals.pollList"));
    		request.setAttribute("REQUEST_DATA", rMap);

        } catch (Exception e) { log.debug(e.getMessage());
            throw new FrontException(e);
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/poll_view";
    }

    /**
     * 설문view
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping(value = "/classdesk/user/poll/ajaxSaveRealTmAns.do")
    @ResponseBody
    public void ajaxSaveRealTmAns(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {

        res.setContentType("text/html; charset=utf-8");
        PrintWriter out = null;
        Gson gson = new Gson();
        String json = null;

        try {

            out = res.getWriter();
            //사용자 실시간 정답 저장
            classdeskUserPollService.updatePollRealTmAns(rMap);
            json = gson.toJson("SUCCESS");

        } catch (Exception e) { log.debug(e.getMessage());
             
            json = gson.toJson("FAIL");
        } finally {
            if (out != null) {
                out.print(json);
                out.flush();
                out.close();
            }
        }
    }

    /**
     * 설문 임시저장/ 설문개시
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
	@RequestMapping(value = "/classdesk/user/poll/exec.do")
    public String exec(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	try {
    		
    		
        	//응답수 +1
        	classdeskUserPollService.updateLePollCnt(rMap);
        	 
        	//설문 참여 정보 등록
        	classdeskUserPollService.insertPollApply(rMap);                
        	
        	//객관식 복수응답 가능
        	String tmpCheckboxQno = SangsUtil.nvl(rMap.getString("checkboxQno"));//130 , null 
        	int checkboxQnolength =tmpCheckboxQno.split(",").length;
        	String checkboxQno[] =  new String[checkboxQnolength];
        	String tmpCheckboxArr = SangsUtil.nvl(rMap.getString("checkboxArr"));//130 , null 
        	int checkboxArrlength =tmpCheckboxArr.split(",").length;
        	String  checkboxArr[]  =  new String[checkboxArrlength];
        	
        	//객관식 복수응답 불가능
        	String tmpRadioQno = SangsUtil.nvl(rMap.getString("radioQno"));//130 , null 
        	int tmpRadioQnolength =tmpRadioQno.split(",").length;
        	String  radioQno[] = new String[tmpRadioQnolength];
        	String tmpRadioArr = SangsUtil.nvl(rMap.getString("radioArr"));//130 , null 
        	int radioArrlength =tmpRadioArr.split(",").length;
        	String  radioArr[]= new String[radioArrlength];
        	
        	//주관식
        	String tmpTextQno = SangsUtil.nvl(rMap.getString("textQno"));//130 , null 
        	int tmpTextQnolength =tmpTextQno.split(",").length;
        	String  textQno[]= new String[tmpTextQnolength];
        	String tmpTextArr = SangsUtil.nvl(rMap.getString("textArr"));//130 , null 
        	int tmpTextArrlength =tmpTextArr.split(",").length;
        	String  textArr[]= new String[tmpTextArrlength];
        	
        	if(tmpCheckboxQno.indexOf(",") > -1){
        		checkboxQno = tmpCheckboxQno.split(",");
        	} else if(tmpCheckboxQno.length() > 0 ) {
        		checkboxQno[0] = tmpCheckboxQno;
        	} else {
        		checkboxQno[0] = "";
        	}
        	
        	
        	if(tmpCheckboxArr.indexOf(",") > -1){
        		checkboxArr = tmpCheckboxArr.split(",");
        	} else if(tmpCheckboxArr.length() > 0 ) {
        		checkboxArr[0] = tmpCheckboxArr;
        	}else {
        		checkboxArr[0] = "";
        	}
        	
        	
         	if(tmpRadioQno.indexOf(",") > -1){
        		radioQno = tmpRadioQno.split(",");
        	} else if(tmpRadioQno.length() > 0 ) {
        		radioQno[0]=tmpRadioQno;
        	}else {
        		radioQno[0] = "";
        	}
         	
        	
        	if(tmpRadioArr.indexOf(",") > -1){
        		radioArr = tmpRadioArr.split(",");
        	} else if(tmpRadioArr.length() > 0 ) {
        		radioArr[0] = tmpRadioArr;
        	}else {
        		radioArr[0] = "";
        	}
        	
        	
        	if(tmpTextQno.indexOf(",") > -1){
        		textQno = tmpTextQno.split(",");
        	} else if(tmpTextQno.length() > 0 ) {
        		textQno[0] = tmpTextQno;
        	}else {
        		textQno[0] = "";
        	}
        	
        	
        	if(tmpTextArr.indexOf(",") > -1){
        		textArr =tmpTextArr.split(",");
        	} else if(tmpTextArr.length() > 0 ) {
        		textArr[0] = tmpTextArr;
        	}else {
        		textArr[0] = "";
        	}
        	
        	
        	/* 설문 답변 상세 정보 등록 */
        	//객관식 복수응답 가능 등록
        	if(checkboxQno[0].length() > 0) {
        		for(int i = 0 ; i < checkboxQno.length ; i++) {
        			int applyno = classdeskUserPollService.getMaxApplyNo(rMap);
        			rMap.setInt("applyno", applyno);
        			rMap.setInt("qno", Integer.parseInt(SangsUtil.nvl(checkboxQno[i],"0")));
        			rMap.setInt("itemSeq", Integer.parseInt(checkboxArr[i]));
        			classdeskUserPollService.insertPollApplyHist(rMap);
        		}
        	}
        	
        	//객관식 복수응답 불가능 등록
        	if(radioQno[0].length() > 0) {
        		for(int i = 0 ; i < radioQno.length ; i++) {
        			int applyno = classdeskUserPollService.getMaxApplyNo(rMap);
        			rMap.setInt("applyno", applyno);
        			rMap.setInt("qno", Integer.parseInt(SangsUtil.nvl(radioQno[i],"0")));
        			rMap.setInt("itemSeq", Integer.parseInt(SangsUtil.nvl(radioArr[i],"0")));
        			classdeskUserPollService.insertPollApplyHist(rMap);
        		}
        	}
        	//주관식 등록
        	
        	if(textQno[0].length() > 0) {
        		for(int i = 0 ; i < textQno.length ; i++) {
        			int applyno = classdeskUserPollService.getMaxApplyNo(rMap);
        			rMap.setInt("applyno", applyno);
        			rMap.setInt("qno", Integer.parseInt(SangsUtil.nvl(textQno[i],"0")));
        			rMap.setInt("itemSeq",0);
        			rMap.setString("answer", SangsUtil.nvl(textArr[i],"0"));
        			classdeskUserPollService.insertPollApplyHist(rMap);
        		}
        	}

            rMap.putString("rMsg", "설문이 저장되었습니다.");
            rMap.putString("rScript", "location.href = '/classdesk/main.do';"); 
           //rMap.putString("rScript", "location.href = '/classdesk/main/main.do';");
            
            
        } catch (Exception e) { 
        	log.debug(e.getMessage());
            rMap.putString("rMsg", "에러가 발행했습니다.");
        }

        request.setAttribute("REQUEST_DATA", rMap);

        return "classdesk/user/poll_exec";
    }
}
