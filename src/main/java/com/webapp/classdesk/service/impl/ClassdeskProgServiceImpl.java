package com.webapp.classdesk.service.impl;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.BookMarkType;
import com.sangs.util.ParamUtil;
import com.sangs.util.StringUtil;
import com.webapp.classdesk.mapper.ClassdeskProgMapper;
import com.webapp.classdesk.service.ClassdeskProgService;

/**
 * Description : Classdesk Prog Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskProgService")
public class ClassdeskProgServiceImpl implements ClassdeskProgService {

	private final Logger log = LogManager.getLogger(ClassdeskProgServiceImpl.class);
	
    @Resource(name = "classdeskProgMapper")
    private ClassdeskProgMapper classdeskProgMapper;
    
    /**
     * 진도처리관련
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEdCourseTreeInfo(DataMap data) throws Exception {
        return classdeskProgMapper.getEdCourseTreeInfo(data);
    }

    /**
     *  getLeCourseTreeHistInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLeCourseTreeHistInfo(DataMap data) throws Exception {
        return classdeskProgMapper.getLeCourseTreeHistInfo(data);
    }
    /**
     *  getLeCourseTreeHistInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
/*    public List<EduMap> getLcmsItem(DataMap data) throws Exception {
        return classdeskProgMapper.getLcmsItem(data);
    }*/
    /**
     * 현재까지 학습한 페이지 (FRAMESEQ)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public int getFrameseqInfo(DataMap data) throws Exception {
        return classdeskProgMapper.getFrameseqInfo(data);
    }

    /**
     * 최초 학습 정보 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertLeCourseTreeHist(DataMap data) throws Exception {
        classdeskProgMapper.insertLeCourseTreeHist(data);
    }

    /**
     * 학습정보 저장3
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeCourseTreeHist(DataMap data) throws Exception {
        classdeskProgMapper.updateLeCourseTreeHist(data);
    }

    /**
     * getEduseqYnInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEduseqYnInfo(DataMap data) throws Exception {
        return classdeskProgMapper.getEduseqYnInfo(data);
    }

    /**
     * 성적 산출을 위한 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getResultInfo(DataMap data) throws Exception {
        return classdeskProgMapper.getResultInfo(data);
    }

    /**
     * 업데이트 성적
     * 
     * @param data
     * @throws Exception
     */
    public void updateEvalProg(DataMap data) throws Exception {
    	
        classdeskProgMapper.updateEvalProg(data);
    }
    
    /**
     * 수료코드 발행
     * @param data
     * @throws Exception
     */
    public void insertLeCompSeq(DataMap data) throws Exception {
    	classdeskProgMapper.insertLeCompSeq(data);
    }

    /**
     * 진도처리
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public void progExec(DataMap requestMap) throws Exception {
       // int curPage = 0;
        
        // asis 콘텐츠 CURRENT_PAGE 10 이하 정수를 01, 02 로반환 > 1 , 2 로 변경
       // String MAX_PAGE = ParamUtil.getStrParam(requestMap.getString("frameseq"), "");  // 현재학습중인 FRAMESEQ 
        
      /*  log.debug("MAX_PAGE ==> " + MAX_PAGE);
        log.debug("MAX_PAGE length ==> " + MAX_PAGE.length());
        log.debug("MAX_PAGE substring ==> " + MAX_PAGE.substring(0, 1));
        
        if (MAX_PAGE.length() < 3 && MAX_PAGE.substring(0, 1).equals("0")) {
        	curPage = Integer.parseInt(MAX_PAGE.substring(1, 2));
        }*/
        
        //requestMap.setInt("frameseq", curPage);
       
        
/*        requestMap.setString("cuserNo", requestMap.getString("cuserNo"));
        requestMap.setString("courseno", requestMap.getString("courseno"));
        requestMap.setString("cseqno", requestMap.getString("cseqno"));
*/        
        
    	 log.debug("frameseq===> " + requestMap.getInt("frameseq"));
    	
        // 콘텐츠 정보 조회 
        EduMap treeInfo = getEdCourseTreeInfo(requestMap);
        EduMap treeHistData = getLeCourseTreeHistInfo(requestMap);
        EduMap progData = getEduseqYnInfo(requestMap);
        
        System.out.println("###########################");
        System.out.println(treeInfo);
        System.out.println(treeHistData);
        System.out.println(progData);
        System.out.println("###########################");
        
        //String eduseqYn = ParamUtil.getStrParam(progData.getString("EDUSEQ_YN"), "Y"); 	// 순차학습 여부 Y순차 N 자유
        requestMap.setString("OPENTYPE", ParamUtil.getStrParam(progData.getString("OPENTYPE"), "D")); // 상시 과정 A , 기간제 D
        
        
        int maxFrameSeq = treeInfo.getInt("FRAMECNT"); //총 페이지 수
        int curFrameseq = treeHistData != null ? treeHistData.getInt("FRAMESEQ") : 0;
        
        if (treeHistData == null) {
        	
            // 학습(진행)중인 데이터가 없으면 LE_COURSE_TREE_HIST Insert
        	
            if(treeInfo.getInt("FRAMECNT") > 1 ) {
            	 if(requestMap.getInt("frameseq") == maxFrameSeq) {
                 	requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_END"));
                 	requestMap.setInt("val", 100);
                 	requestMap.setString("compYn", "Y");
                 	requestMap.setString("lastFrameseq", "");
                 	
                 } else {
                 	requestMap.setInt("val", 50);
                 	requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
                 }
            	
            }else{
            	//페이지x 1개컨텐츠로 진도체크 할 경우
            	 int runTime =  1;
                 if(treeInfo.getInt("RUNTIME") > 0 ) {
                 	runTime = treeInfo.getInt("RUNTIME")*60;
                 }
                 
                 log.debug("runTime ===> " + runTime);
                 log.debug("studytime ===> " + ParamUtil.getIntParam(requestMap.getString("studytime", 0)));
                 
                 if(ParamUtil.getIntParam(requestMap.getString("studytime", 0)) >= runTime) {
                	requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_END"));
                  	requestMap.setInt("val", 100);
                  	requestMap.setString("compYn", "Y");
                  	requestMap.setString("lastFrameseq", "");
                  
                 }else{
                	 requestMap.setInt("val", 50);
                	 //requestMap.setString("compYn", "N");
                  	 requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
                 }
            }
            
            // ####  insert
            log.debug("진도체크 등록 insertLeCourseTreeHist ===> " + requestMap);
            insertLeCourseTreeHist(requestMap);
            
        } else {
        	
        	int studycnt =  treeHistData.getInt("STUDYCNT") + 1;
        	requestMap.setInt("studycnt", studycnt);
        	 if(treeInfo.getInt("FRAMECNT") > 1 ) {
        	
	        	// 학습(진행)중인 데이터가 있으면 LE_COURSE_TREE_HIST Update
	        	/*int studytime = treeHistData.getInt("STUDYTIME") + requestMap.getInt("studytime");
	        	requestMap.setInt("studytime", studytime);*/
	        	
	            if (maxFrameSeq > requestMap.getInt("frameseq")) {// 진행중인 학습페이지가 해당 차시의 마지막 페이지보다 작으면 학습진행중
	            	requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
	            	if(treeHistData.getInt("VAL") == 100) {// 이전상태 점수는 유지(복습하기시 이전 점수 유지)
	            		requestMap.setInt("val", 100);
	            	} else {
	            		requestMap.setInt("val", 50);
	            	}
	            	
	            	if(requestMap.getInt("frameseq") < curFrameseq) {// 이전상태의 최종 학습페이지가 크면 이전상태를 유지
	                	requestMap.setInt("frameseq", curFrameseq);
	                }
	            	
	             }  else {
	            	requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_END"));
	            	requestMap.setInt("val", 100);
	        		requestMap.setString("lastFrameseq", BookMarkType.getType2(String.valueOf(treeHistData.getInt("LAST_FRAMESEQ"))));
	        		requestMap.setString("compYn", "Y");
	                
	             }
	            
            
        	 }else{
        		 
        		 int runTime =  1;
                 if(treeInfo.getInt("RUNTIME") > 0 ) {
                 	runTime = treeInfo.getInt("RUNTIME")*60;
                 }
                 
                 if(ParamUtil.getIntParam(requestMap.getString("studytime", 0)) < runTime) {
                	 requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
                	 requestMap.setInt("val", treeHistData.getInt("VAL") == 100 ? 100 : 50);
                 }else{
                	requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_END"));
  	            	requestMap.setInt("val", 100);
  	        		requestMap.setString("lastFrameseq", BookMarkType.getType2(String.valueOf(treeHistData.getInt("LAST_FRAMESEQ"))));
  	        		requestMap.setString("compYn", "Y");
                 }
        	 }
            
            
            log.debug("진도체크 수정 updateLeCourseTreeHist ===> " + requestMap);
            
            // ####  update
            updateLeCourseTreeHist(requestMap);
        }
        
        
        // ####  update
        updateLeCourseUserInfo(requestMap);
        
        
        
        
        
        //progCall(requestMap, curFrameseq, curPage, treeHistData, /*eduseqYn,*/ /*progStatus,*/ maxFrameSeq);
   	 	
    }

    
    /**
     * 실제 진도체크 처리 
     * 
     * @param requestMap
     * @param result
     * @param curFrameseq	: 종전 해당차시의 최종 학습페이지
     * @param curPage		: 현재 상태의 학습페이지
     * @param treeHistData
     * @param eduseqYn
     * @param progStatus
     * @param maxFrameSeq
     * @return
     */
    private void progCall(DataMap requestMap,  int curFrameseq, int curPage, EduMap treeHistData,  int maxFrameSeq) throws Exception {
    	
    	log.debug("##################################################  progCall  ##################################################");
    	log.debug("requestMap===> " + requestMap);
    	log.debug("curFrameseq===> " + curFrameseq);
    	log.debug("curPage===> " + curPage);
    	log.debug("treeHistData===> " + treeHistData);
    	//log.debug("eduseqYn===> " + eduseqYn);
    	//log.debug("progStatus===> " + progStatus);
    	log.debug("maxFrameSeq===> " + maxFrameSeq);
    	//log.debug("frameCompStatus===> " + frameCompStatus);
    	log.debug("##################################################  progCall  ##################################################");
    	
    	
    	
        if (treeHistData == null) {
        	
            // 학습(진행)중인 데이터가 없으면 LE_COURSE_TREE_HIST Insert
            if(requestMap.getInt("frameseq") == maxFrameSeq) {
            	requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_END"));
            	requestMap.setInt("val", 100);
            	requestMap.setString("compYn", "Y");
            	requestMap.setString("lastFrameseq", "");
            	
            } else {
            	requestMap.setInt("val", 50);
            	requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
            }
            
            // ####  insert
            insertLeCourseTreeHist(requestMap);
            
        } else {
        	// 학습(진행)중인 데이터가 있으면 LE_COURSE_TREE_HIST Update
        	int studytime = treeHistData.getInt("STUDYTIME") + requestMap.getInt("studytime");
        	requestMap.setInt("studytime", studytime);
        	int studycnt =  treeHistData.getInt("STUDYCNT") + 1;
        	requestMap.setInt("studycnt", studycnt);
            if (maxFrameSeq > curPage) {// 진행중인 학습페이지가 해당 차시의 마지막 페이지보다 작으면 학습진행중
            	requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_ING"));
            	if(treeHistData.getInt("VAL") == 100) {// 이전상태 점수는 유지(복습하기시 이전 점수 유지)
            		requestMap.setInt("val", 100);
            	} else {
            		requestMap.setInt("val", 50);
            	}
                
            	if(curPage < curFrameseq) {// 이전상태의 최종 학습페이지가 크면 이전상태를 유지
                	requestMap.setInt("frameseq", curFrameseq);
                }
            	
            }  else {
            	requestMap.setString("mtProgStatusCode", SangsProperties.getProperty("Globals.mtCode_MT_PROG_STATUS_CODE_END"));
            	requestMap.setInt("val", 100);
        		requestMap.setString("lastFrameseq", BookMarkType.getType2(String.valueOf(treeHistData.getInt("LAST_FRAMESEQ"))));
        		requestMap.setString("compYn", "Y");
                
            }
            // ####  update
            updateLeCourseTreeHist(requestMap);
        }
        
        
        // ####  update
        updateLeCourseUserInfo(requestMap);
	        

    }
    
    /**
     * 학습정보 저장3
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeCourseUserInfo(DataMap data) throws Exception {

    	EduMap resultMap = classdeskProgMapper.getResultInfo(data);
    	float evalExam = resultMap.getFloat("EXAM_FINAL_VAL");
        float evalAttend = resultMap.getFloat("ATTEND_VAL");
        float compVal = resultMap.getInt("COMP_VAL");			// 수료기준점수
        
        float evalProg = resultMap.getInt("EVAL_PROGRESS"); 	// 온라이학습 만점(관리자설정)
        float totFrameCnt = resultMap.getInt("TOT_FRAMECNT"); 	// 총 페이지수
        float totFrameSeq = resultMap.getInt("TOT_FRAMESEQ"); 	// 수강생 페이지수
        float totRunTime = resultMap.getInt("TOT_RUNTIME"); 	// 총 강의시간
        float totStudyTime = resultMap.getInt("TOT_STUDYTIME"); 	// 총 수강 시간
        
        if(totStudyTime > totRunTime){//총수강시간이 강의시간보다 클경우 일치 시킴
        	totStudyTime = totRunTime;
        }
        
        float progVal = (totStudyTime / totRunTime) * evalProg;
        
        DecimalFormat format = new DecimalFormat(".##");
        String str = format.format(progVal);
    	
        progVal = Float.valueOf(str).floatValue();
        data.setFloat("progVal", progVal);
        
        evalExam = Float.valueOf(format.format(evalExam)).floatValue(); // 시험점수
        evalAttend = Float.valueOf(format.format(evalAttend)).floatValue(); // 출석점수
        compVal = Float.valueOf(format.format(compVal)).floatValue(); // 수료기준점수
        float finalVal = progVal + evalExam + evalAttend ;	// 나의 총점
        String testChkYn = classdeskProgMapper.getCseqTestChkYnInfo(data);//성적반영여부
        String finalExamYn = classdeskProgMapper.getCseqFinalTestYn(data);//전체 시험 참여 여부
        
        data.setFloat("finalVal", finalVal);
        
        if (finalVal >= compVal) {
	        	String gubunCode = classdeskProgMapper.getCompGubunInfo(data);
	        	data.setString("gubun_code", gubunCode);
	        	
	        	if(testChkYn.equals('N')){//시험성적반영 X 즉각 수료 처리
	        		data.setString("isPass", "Y");
		        	data.setString("compYN", "Y");
		        	
		        	/*수료코드생성*/
		         	String compCode="";
		
		         	java.util.Date d = new java.util.Date();
		         	SimpleDateFormat date = new SimpleDateFormat("yyyy");
		
		         	String year = date.format(d);
		
		         	int maxcompcode = classdeskProgMapper.getMaxCompCode(data);
		         	String strI = String.valueOf(maxcompcode);
		         	compCode = year+"-"+gubunCode+"-"+strI;
		         	data.setString("compCode", compCode);
		         	data.setInt("compSeq", maxcompcode);
		         	
		         	classdeskProgMapper.updateLeCourseUserInfo(data);
		            classdeskProgMapper.updateMaxCompCode(data);	
	        	}else {//시험성적 반영 시험을 봐야만 수료가능
		        	if("Y".equals(finalExamYn)){ // 모든 시험 참여
	        			data.setString("isPass", "Y");
			        	data.setString("compYN", "Y");
			        	
			        	/*수료코드생성*/
			         	String compCode="";
			
			         	java.util.Date d = new java.util.Date();
			         	SimpleDateFormat date = new SimpleDateFormat("yyyy");
			
			         	String year = date.format(d);
			
			         	int maxcompcode = classdeskProgMapper.getMaxCompCode(data);
			         	String strI = String.valueOf(maxcompcode);
			         	compCode = year+"-"+gubunCode+"-"+strI;
			         	data.setString("compCode", compCode);
			         	data.setInt("compSeq", maxcompcode);
			         	
			         	classdeskProgMapper.updateLeCourseUserInfo(data);
			            classdeskProgMapper.updateMaxCompCode(data);
	        		} else { //모든 시험에 미참여
	        			data.setString("isPass", "N");
			        	data.setString("compYN", "N");	
	        		}
	        	}
        	}
        data.setString("OPENTYPE", resultMap.getString("OPENTYPE"));
        classdeskProgMapper.updateEvalProg(data);
    }
} 