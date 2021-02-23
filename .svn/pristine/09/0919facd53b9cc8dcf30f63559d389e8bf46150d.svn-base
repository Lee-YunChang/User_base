package com.webapp.classdesk.ctrl;

import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.SortedSet;
import java.util.TreeSet;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sangs.session.UserSessionManager;
import com.sangs.session.UserSessionVO;
import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FrontException;
import com.sangs.support.SangsProperties;
import com.sangs.util.DownloadServlet;
import com.sangs.util.ParamUtil;
import com.sangs.util.SangsUtil;
import com.webapp.classdesk.service.ClassdeskBoardService;
import com.webapp.classdesk.service.ClassdeskTutorMainService;
import com.webapp.classdesk.service.ClassdeskUserExamService;
import com.webapp.classdesk.service.ClassdeskUserPollService;
import com.webapp.classdesk.service.ClassdeskUserProgressService;
import com.webapp.common.service.CommonUserService;

/**
 * Description : 사용자 > 나의강의실 > 클래스데스크 메인
 * 
 * Modification Information
 * 수정일          		수정자         수정내용
 * -------      -----------------------------------
 * 2016.09.01   이진영           최초작성
 *
 */

@Controller
public class ClassdeskMainController {

	private Logger log = LogManager.getLogger(this.getClass());
	
    @Resource(name = "classdeskTutorMainService")
    private ClassdeskTutorMainService classdeskTutorMainService;

    @Resource(name = "classdeskBoardService")
    private ClassdeskBoardService     classdeskBoardService;

    @Resource(name = "commonUserService")
    private CommonUserService commonUserService;
    
    @Resource(name = "classdeskUserExamService")
    private ClassdeskUserExamService  classdeskUserExamService;
    
    @Resource(name = "classdeskUserProgressService")
    private ClassdeskUserProgressService classdeskUserProgressService;
    
    @Resource(name = "classdeskUserPollService")
    private ClassdeskUserPollService classdeskUserPollService;
    
    
    /**
     * 메인
     * 
     * @param request
     * @param res
     * @param rMap
     * @return
     * @throws FrontException
     */
    @RequestMapping({"/classdesk/main/main.do"})
    public String main(HttpServletRequest request, HttpServletResponse res, DataMap rMap) throws FrontException {
    	
        try {
        	
        	UserSessionVO userSessionVO = UserSessionManager.getUserSessionVO(request);
        	if ("N".equals(rMap.getString("SES_ISLOGIN")) || rMap.getInt("SES_USERNO") < 1) {// 로그인 안했다면
                request.setAttribute("msg", "로그인이 필요한 페이지 입니다.");
                request.setAttribute("url", "/academy/common/login.do");
                return "forward:/common/msgForward.do";
            }
        	
        	int CSEQNO = 0;
        	int COURSENO = 0;
        	int CUSERNO = 0;
        	String CLASSDESK = "";
        	String SEQTITLE = "";
        	String CNAME = "";
        	String CCODE = "";
        	rMap.setString("eduInfoCode", SangsProperties.getProperty("Globals.mtCode_MT_CPSEDU_INFO_CODE"));//정규교육코드 기본세팅
        	List<EduMap> courseList =  classdeskTutorMainService.getCourseList(rMap);//강의중인 리스트 
            
        	EduMap studyInfo = new EduMap();
        	if(courseList.size() == 0){//수강중인 과목 없을경우
        		request.setAttribute("msg", "현재 수강중인 과정이 없습니다.");
                request.setAttribute("url", "/academy/main/main.do");
                return "forward:/common/msgForward.do";
        	}
        	else if(!("").equals(rMap.getString("paramcUserNo")) && !("").equals(rMap.getString("paramcSeqNo"))) {
        			rMap.setString("paramCourseNo" , rMap.getString("paramCourseNo"));
    	    		rMap.setString("paramcSeqNo" , rMap.getString("paramcSeqNo"));
    	    		rMap.setString("paramcUserNo" , rMap.getString("paramcUserNo"));
    	    		rMap.setString("CLASSDESK" , rMap.getString("CLASSDESK"));
    	    		rMap.setString("schOnline" , classdeskTutorMainService.getSubjectCode(rMap));
    	    		rMap.setString("seqTitle" , URLDecoder.decode(rMap.getString("seqTitle"), "UTF-8"));
    	    		rMap.setString("ctypeName" , URLDecoder.decode(rMap.getString("ctypeName"), "UTF-8"));
    	    		
            }
        	else if(!("").equals(rMap.getString("courseSelect"))){ // 수강과목 변경해서 리로드 하는 값이 있는 경우 
        		
        		String[] select = rMap.getString("courseSelect").split(",");
    			rMap.setString("paramcUserNo" , select[0]);
    			rMap.setString("paramcSeqNo" , select[1]);
    			rMap.setString("paramCourseNo" , select[2]);
    			rMap.setString("CLASSDESK" , select[3]);
    			rMap.setString("seqTitle" , select[4]);
    			rMap.setString("ctypeName" , select[5]);
    			rMap.setString("schOnline" , classdeskTutorMainService.getSubjectCode(rMap));
        	}
        	else {//최초 접속시 수강중인 과목리스트의 첫번째 데이터를 로드
        		studyInfo = (EduMap)courseList.get(0);
                CSEQNO = studyInfo.getInt("CSEQNO");
                COURSENO = studyInfo.getInt("COURSENO");
                CUSERNO = studyInfo.getInt("CUSERNO");
                CLASSDESK = studyInfo.getString("CLASS_DESK");
                SEQTITLE = studyInfo.getString("SEQ_TITLE");
                CNAME = studyInfo.getString("MT_CTYPE_NAME");
                CCODE = studyInfo.getString("MT_CTYPE_CODE");
                rMap.setString("paramCourseNo" , Integer.toString(COURSENO));
	    		rMap.setString("paramcSeqNo" , Integer.toString(CSEQNO));
	    		rMap.setString("paramcUserNo" , Integer.toString(CUSERNO));
	    		rMap.setString("CLASSDESK" , CLASSDESK);
	    		rMap.setString("seqTitle" , SEQTITLE);
	    		rMap.setString("ctypeName" , CNAME);
	    		rMap.setString("schOnline" , CCODE);
        	}
        	
        	rMap.setString("paramUserNo" , rMap.getString("SES_USERNO"));
        	EduMap eMap = classdeskTutorMainService.getCourseMainController(rMap);
            request.setAttribute("rowData", eMap);
            
    		userSessionVO.setCourseNo(Integer.parseInt(rMap.getString("paramCourseNo")));
    		userSessionVO.setcSeqNo(Integer.parseInt(rMap.getString("paramcSeqNo")));
    		userSessionVO.setcUserNo(Integer.parseInt(rMap.getString("paramcUserNo")));
    		userSessionVO.setUserNo(Integer.parseInt(rMap.getString("paramUserNo")));
    		userSessionVO.setSeqTitle(rMap.getString("seqTitle"));
    		userSessionVO.setSeqTitle(rMap.getString("ctypeName"));
    		UserSessionManager.setUserSessionVO(request, userSessionVO);
    		
    		rMap.setInt("SES_USERNO", userSessionVO.getUserNo());
            rMap.setString("SES_USERID", userSessionVO.getUserId());
            rMap.setString("SES_USERNAME", userSessionVO.getUserName());
            rMap.setInt("SES_GRADENO", userSessionVO.getGradeNum());
            rMap.setString("SES_MOBILE", userSessionVO.getMobile());
            rMap.setString("SES_EMAIL", userSessionVO.getEmail());
            rMap.setString("SES_MBER_REG_GB", userSessionVO.getMberRegGb());
            rMap.setString("SES_STATUS_GB", userSessionVO.getStatusGb());
            // 등록된 강의실 세션 할당
            rMap.setInt("SES_COURSENO", userSessionVO.getCourseNo());
            rMap.setInt("SES_CUSERNO", userSessionVO.getcUserNo());
            rMap.setInt("SES_CSEQNO", userSessionVO.getcSeqNo());
            
        	request.setAttribute("courseList", courseList);
        	// 과정별 리스트
            request.setAttribute("selectList", classdeskTutorMainService.getCourseList(rMap));
        	// 교육기간
            request.setAttribute("tchItem", classdeskTutorMainService.getCourseMainTchInfo(rMap));
            // 사용자별 교육기간
            request.setAttribute("cuserItem", classdeskTutorMainService.getCuserInfo(rMap));
            // 첨부파일
            request.setAttribute("fileList", classdeskTutorMainService.getFileList(rMap));
            // 교육 커리쿨럼
            request.setAttribute("curricuiumList", classdeskTutorMainService.getCurriculum(rMap));

            
            
           
            
            // 온라인 교육
            List<EduMap> resultList =  classdeskUserProgressService.getEdCourseTreeList(rMap); //classdeskTutorMainService.getCourseOnlineStudyInfo(rMap);
        	request.setAttribute("onResultList", resultList); 
        	
        	request.setAttribute("progData", classdeskTutorMainService.getProgInfo(rMap));
        	EduMap dateData = classdeskUserProgressService.getDateInfo(rMap);
    		//오늘 날짜 저장.
        	Date today = new Date();
            Date startDate = (Date) dateData.get("SDATE");
            Date endDate = (Date) dateData.get("EDATE");
            
            /*수강기간설정*/
            /*if (today.before(startDate)) {
        		request.setAttribute("progExecYn", "N");
            } else if (today.after(endDate)) {
            	request.setAttribute("progExecYn", "N");
            } else {
            	request.setAttribute("progExecYn", "Y");
            }*/
            
            /*항시 수강*/ 
            request.setAttribute("progExecYn", "Y");
        	
        	
        	
        	/*float progressVal = 0;
        	float sumFrameSeq=0;
        	float sumFrameCnt=0;
        	SortedSet<Date> set = new TreeSet<Date>();
        	
        	SimpleDateFormat resultMaxEdate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        	
        	String[] ResultProgressVal = new String[resultList.size()];
        	
        	
        	for(int i = 0 ; i < resultList.size() ; i ++ ){
        		sumFrameSeq = sumFrameSeq + resultList.get(i).getInt("FRAMESEQ");//학습한 페이지
        		sumFrameCnt = sumFrameCnt + resultList.get(i).getInt("FRAMECNT");//각 차시의 전체페이지
        		
        			if(sumFrameSeq > 0){//학습했다면
        				progressVal = sumFrameSeq / sumFrameCnt * 100;//진도율
        				DecimalFormat result=new DecimalFormat("###.##");
        				
        				ResultProgressVal[i] = result.format(progressVal);
        			} else {
        				ResultProgressVal[i] = "0";
        			}
        		
        			sumFrameSeq = 0;
        			sumFrameCnt = 0;
        	}
 
    		request.setAttribute("progressVal", ResultProgressVal);*/

            
           // 시험
           request.setAttribute("examListData", classdeskUserExamService.getUserLectExamList(rMap));
           request.setAttribute("examRowData", classdeskUserExamService.getOpenTypeInfo(rMap));
           
           List<EduMap> examProgData = classdeskTutorMainService.getProgInfo2(rMap); 	
           
           request.setAttribute("examProgData", examProgData.get(0).get("PROG_PER")); 	
           
           //설문목록
	       request.setAttribute("pollResultList", classdeskUserPollService.getLePoll(rMap));
	       	
	       //참여 이력 여부
	       request.setAttribute("pollHistData", classdeskUserPollService.gethistData(rMap));
	       List<EduMap> histData = classdeskUserPollService.gethistData(rMap);
	       request.setAttribute("pollHistData2", histData.size());
           
           // 공지사항 / 자료실
            rMap.setString("select", "list1");
       		rMap.putInt("bcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsBcateClassNotice")));
       		rMap.setString("title", SangsProperties.getProperty("Globals.bbsList1"));
	       	request.setAttribute("courselistData", classdeskBoardService.getCourseBbsList(rMap));
	        request.setAttribute("courselistCount", classdeskBoardService.getCourseBbsListCount(rMap));
	       
	        rMap.setString("select", "list2");
	        rMap.putInt("bcateno", ParamUtil.getIntParam(SangsProperties.getProperty("Globals.bbsBcateClassData")));
	        rMap.setString("title", SangsProperties.getProperty("Globals.bbsList2"));
	        request.setAttribute("courselistData2", classdeskBoardService.getCourseBbsList(rMap));
	        request.setAttribute("courselistCount2", classdeskBoardService.getCourseBbsListCount(rMap));


	        request.setAttribute("menu_nm", "mypage");
            request.setAttribute("lnb_menu", "myLecture");
        	rMap.setString("title", SangsProperties.getProperty("Globals.classdeskMain"));
            request.setAttribute("REQUEST_DATA", rMap);

        } 
        catch (Exception e) { 
        	e.printStackTrace();
            throw new FrontException(e);
        }
        return "classdesk/main/main";
    }
    
    @RequestMapping({"/classdesk/main/mainSelect.do"})
    public String mainCategorySelect(DataMap rMap, Model model) throws Exception {
    	
    	rMap.setString("eduInfoCode", SangsProperties.getProperty("Globals.mtCode_MT_CPSEDU_INFO_CODE"));//정규교육코드 기본세팅
    	
    	model.addAttribute("result",classdeskTutorMainService.mainCategorySelect(rMap));
		return "jsonView";
    }
    
    @RequestMapping({"/classdesk/main/fileDown.do"})
    public String Filedown(HttpServletRequest req, HttpServletResponse res, DataMap rMap) throws FrontException {

        DownloadServlet filedown = new DownloadServlet();
        boolean result;

        try {
            //rMap.setString("filename", "../6BAE7B3F1CBB415FBE6A15D65DB18BE7.xls");
            rMap.setString("filename", SangsUtil.replaceAll(rMap.getString("filename"), "../", ""));
            //상위경로 진입 방지

            if(rMap.containsKey("sampleDown")){
                req.setAttribute("REQUEST_DATA", rMap);
                return "/common/file_down";
            }
            
            EduMap map = classdeskTutorMainService.getFileInfo(rMap);
            
            result = filedown.downLoadFile(req, res, map);
            
            if (result) {
                return null;
            } else {
                return "/common/cmmn_error";
            }

        } catch (Exception e) { log.debug(e.getMessage());
            return "common/cmmn_error";
        }
    }
    
}