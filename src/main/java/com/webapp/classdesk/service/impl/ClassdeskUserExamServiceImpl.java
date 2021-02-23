package com.webapp.classdesk.service.impl;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.classdesk.mapper.ClassdeskProgMapper;
import com.webapp.classdesk.mapper.ClassdeskTutorExamQuizbinderMapper;
import com.webapp.classdesk.mapper.ClassdeskTutorExamQuizsetMapper;
import com.webapp.classdesk.mapper.ClassdeskUserExamMapper;
import com.webapp.classdesk.service.ClassdeskUserExamService;
import com.webapp.classdesk.util.ClassdeskUtil;

/**
 * Description : Classdesk UserExam Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskUserExamService")
public class ClassdeskUserExamServiceImpl implements ClassdeskUserExamService {

    @Resource(name = "classdeskUserExamMapper")
    private ClassdeskUserExamMapper            classdeskUserExamMapper;

    @Resource(name = "classdeskTutorExamQuizsetMapper")
    private ClassdeskTutorExamQuizsetMapper    classdeskTutorExamQuizsetMapper;

    @Resource(name = "classdeskTutorExamQuizbinderMapper")
    private ClassdeskTutorExamQuizbinderMapper classdeskTutorExamQuizbinderMapper;

    @Resource(name = "classdeskProgMapper")
    private ClassdeskProgMapper classdeskProgMapper;
    
    /**
     * 시험 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserLectExamList(DataMap data) throws Exception {
        return classdeskUserExamMapper.getUserLectExamList(data);
    }

    /**
     * getUserLectExamAppCnt
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getUserLectExamAppCnt(DataMap data) throws Exception {
        return classdeskUserExamMapper.getUserLectExamAppCnt(data);
    }

    /**
     * 강의실 시험 응시내역 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertLectExamApp(DataMap data) throws Exception {
        classdeskUserExamMapper.insertLectExamApp(data);
    }

    /**
     * insertUserLectExamSetAppHst
     * 
     * @param data
     * @throws Exception
     */
    public void insertUserLectExamSetAppHst(DataMap data) throws Exception {
        classdeskUserExamMapper.insertUserLectExamSetAppHst(data);
    }

    /**
     * insertUserLectExamBinderAppHst
     * 
     * @param data
     * @throws Exception
     */
    public void insertUserLectExamBinderAppHst(DataMap data) throws Exception {
        classdeskUserExamMapper.insertUserLectExamBinderAppHst(data);
    }

    /**
     * getUserLectExamAppMaxSeq
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getUserLectExamAppMaxSeq(DataMap data) throws Exception {
        return classdeskUserExamMapper.getUserLectExamAppMaxSeq(data);
    }

    /**
     * 강의실 시험 응시답안 랜덤 등록
     * 
     * @param data
     * @throws Exception
     */
    public void lmsExamRandomExecute(Map data) throws Exception {
        classdeskUserExamMapper.lmsExamRandomExecute(data);
    }

    /**
     * 시험 응시답안 랜덤 객관식 1차 가채점
     * 
     * @param data
     * @throws Exception
     */
    public void lmsExamRdmMarkingExecute(Map data) throws Exception {
        classdeskUserExamMapper.lmsExamRdmMarkingExecute(data);
    }

    /**
     * 시험 응시답안 세트 시험 객관식 1차 가채점
     * 
     * @param data
     * @throws Exception
     */
    public void lmsExamSetMarkingExecute(Map data) throws Exception {
        classdeskUserExamMapper.lmsExamSetMarkingExecute(data);
    }

    /**
     * 시험 응시답안 바인더 시험 객관식 1차 가채점
     * 
     * @param data
     * @throws Exception
     */
    public void lmsExamBinderMarkingExecute(Map data) throws Exception {
        classdeskUserExamMapper.lmsExamBinderMarkingExecute(data);
    }

    /**
     * 응시문항수
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public int getItemCnt(DataMap data) throws Exception {
        return classdeskUserExamMapper.getItemCnt(data);
    }
    
    /**
     * 수강생 시험 랜덤 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserLectExamRdmAppHistList(DataMap data) throws Exception {
        return classdeskUserExamMapper.getUserLectExamRdmAppHistList(data);
    }

    @Override
    public List<EduMap> getUserLectExamRdmAppHistListB(DataMap data) throws Exception {
    	return classdeskUserExamMapper.getUserLectExamRdmAppHistListB(data);
    }
    
    /**
     * 수강생 시험 세트 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserLectExamSetAppHistList(DataMap data) throws Exception {
        return classdeskUserExamMapper.getUserLectExamSetAppHistList(data);
    }

    /**
     * 수강생 시험 바인더 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserLectExamBinderAppHistList(DataMap data) throws Exception {
        return classdeskUserExamMapper.getUserLectExamBinderAppHistList(data);
    }

    /**
     * 사용자 실시간 응시시간 저장
     * 
     * @param data
     * @throws Exception
     */
    public void updateExamRealTmTime(Map data) throws Exception {
        classdeskUserExamMapper.updateExamRealTmTime(data);
    }

    /**
     * 사용자 실시간 정답 저장
     * 
     * @param data
     * @throws Exception
     */
    public void updateExamRealTmAns(Map data) throws Exception {
        classdeskUserExamMapper.updateExamRealTmAns(data);
    }

    /**
     * 과정정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getOpenTypeInfo(DataMap data) throws Exception {
        return classdeskUserExamMapper.getOpenTypeInfo(data);
    }

    /**
     * 사용자 시험 정보 저장
     * 
     * @param examMap
     * @param rMap
     * @throws Exception
     */
    public void saveUserExamInfo(EduMap examMap, DataMap rMap) throws Exception {
        /*강의실 시험 응시내역 저장*/
        classdeskUserExamMapper.insertLectExamApp(rMap);
        
        
        /***
         * 랜덤 프로시저 저장
         * 문제은행에 난수를 구하여 사용자 응시답안쪽에 인서트한다.
         */
        
        if ("R".equals(examMap.getString("PUB_TYPE"))) {
            int map = classdeskTutorExamQuizsetMapper.getLeExamApplyHist(rMap);
            
            /*강의실 시험 응시답안 랜덤 문제저장*/
            if(map == 0){
            	
            	List<EduMap> quizMap = classdeskTutorExamQuizsetMapper.getEdExamQuizList(rMap);
            	
            	for(int i = 0 ; i < quizMap.size(); i++){
            		int qno = quizMap.get(i).getInt("QNO");
            		rMap.setInt("QSEQ", i+1);
            		rMap.setInt("QNO", qno);
            		
            		//문제 등록
            		classdeskTutorExamQuizsetMapper.insertLeExamApplyHist(rMap);
            	}
            }
            
            //세트 저장 
        } else if ("S".equals(examMap.getString("PUB_TYPE"))) {
            rMap.putInt("setno", examMap.getInt("SETNO"));
            rMap.putString("addObject", "Y"); //쿼리 공통이용시 동적쿼리로 and조건 추가

            List setQuizList = classdeskTutorExamQuizsetMapper.getLeExamSetQuizList(rMap);

            int setQuizSize = setQuizList.size();

            EduMap maxSeq = getUserLectExamAppMaxSeq(rMap);

            int rStartNum = maxSeq.getInt("MAX_NO");
            int rEndNum = (rStartNum + setQuizSize);

            /** 랜덤 변수 */
            int[] rqseqValue = ClassdeskUtil.getExamSetRandomList(setQuizSize, rStartNum, rEndNum);

            EduMap setMap = new EduMap();
            for (int i = 0; i < setQuizSize; i++) {
                setMap = (EduMap)setQuizList.get(i);

                rMap.putInt("qNo", setMap.getInt("QNO"));
                rMap.putInt("qseq", rqseqValue[i]);

                insertUserLectExamSetAppHst(rMap);
            }
        } else {
            rMap.putString("addObject", "Y"); //쿼리 공통이용시 동적쿼리로 and조건 추가

            List binderQuizList = classdeskTutorExamQuizbinderMapper.getLeExamQuizList(rMap);

            int binderQuizSize = binderQuizList.size();

            EduMap maxSeq = classdeskUserExamMapper.getUserLectExamAppMaxSeq(rMap);

            int rStartNum = maxSeq.getInt("MAX_NO");
            int rEndNum = (rStartNum + binderQuizSize);

            /** 랜덤 변수 */
            int[] rqseqValue = ClassdeskUtil.getExamSetRandomList(binderQuizSize, rStartNum, rEndNum);

            EduMap binderMap = new EduMap();
            for (int i = 0; i < binderQuizSize; i++) {
                binderMap = (EduMap)binderQuizList.get(i);

                rMap.putInt("qNo", binderMap.getInt("QNO"));
                rMap.putInt("qseq", rqseqValue[i]);

                classdeskUserExamMapper.insertUserLectExamBinderAppHst(rMap);
            }
        }
        
        /* 2. 사후시험인경우 성적처리 반영 (le_course_user) -> 수료 점수 만족 시 수료코드 발급 */        
        if( "A".equals( rMap.getString("examType"))) {
        	// 사후시험 점수만 수강테이블 정보에 업데이트
        	classdeskUserExamMapper.updateLeCourseUserInfo(rMap);
        	
        		rMap.setString("cuserNo", rMap.getString("SES_CUSERNO"));
        		rMap.setString("courseno", rMap.getString("SES_COURSENO"));
	        		EduMap uInfo = classdeskProgMapper.getLeCourseUserInfo(rMap);
	        		
	        		// 이미 수료한 자가 아닌경우
	        		if( !("Y").equals(uInfo.getString("ISPASS")) && "".equals(uInfo.getString("COMPCODE"))) {
	        			String gubunCode = classdeskProgMapper.getCompGubunInfo(rMap);
	        			rMap.setString("gubun_code", gubunCode);
	        			rMap.setString("isPass", "Y");
	        			rMap.setString("compYN", "Y");
	                 	/*수료코드생성*/
	                 	String compCode="";
	
	                 	java.util.Date d = new java.util.Date();
	                 	SimpleDateFormat date = new SimpleDateFormat("yyyy");
	
	                 	String year = date.format(d);
	                 	
	                 	int maxcompcode = classdeskProgMapper.getMaxCompCode(rMap);
	                 	String strI = String.valueOf(maxcompcode);
	                 	compCode = year+"-"+gubunCode+"-"+strI;
	                 	rMap.setString("compCode", compCode);
	                 	rMap.setInt("compSeq", maxcompcode);
	                 	classdeskProgMapper.updateMaxCompCode(rMap);
	                 	
	                    // 수료코드 반영
	                    classdeskUserExamMapper.updateLeCoursePassInfo(rMap);
	        		}
        }
    }

    /**
     * 사용자 실시간 정답 저장
     * 
     * @param data
     * @throws Exception
     */
    public void saveExamRealTmAns(Map data) throws Exception {
        //사용자 실시간 응시시간 저장
        updateExamRealTmTime(data);
        //사용자 실시간 정답 저장
        updateExamRealTmAns(data);
    }

    /**
     * 시험제출
     * 
     * @param data
     * @throws Exception
     */
    public void submitExec(DataMap data) throws Exception {
        /*시험 응시내역 최종 저장*/
        updateExamRealTmTime(data);

        Map<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("P_CUSERNO", data.getInt("SES_CUSERNO"));
        paramMap.put("P_COURSENO", data.getInt("SES_COURSENO"));
        paramMap.put("P_EXAMNO", data.getInt("examNo"));
        paramMap.put("R_VAL", 0);
        paramMap.put("R_RESULT", 0);
        
        /* 시험 응시답안 객관식 1차 가채점 */
        List<EduMap> applyHistList = getExamApplyHistList(data);
        
        if ("R".equals(data.getString("pubType"))) { // 랜덤출제
        	for(int i=0 ; i < applyHistList.size(); i++) {
        		EduMap applyHistInfo = (EduMap)applyHistList.get(i);
        		data.putInt("qSeq", applyHistInfo.getInt("QSEQ"));
       		 	data.putInt("qNo", applyHistInfo.getInt("QNO"));
       		 	data.putInt("itemSeq" , applyHistInfo.getInt("ITEMSEQ"));
       		 	data.putString("answer", applyHistInfo.getString("ANSWER"));
       		 	
       		 	EduMap examQuizRandomInfo = examQuizRandomInfo(data);
       		 	
       		 	/*if((examQuizRandomInfo.getString("RTEXT").equals(applyHistInfo.getString("ANSWER"))) || 
         			(applyHistInfo.getInt("ITEMSEQ") != 0 && examQuizRandomInfo.getInt("RCODE") == applyHistInfo.getInt("ITEMSEQ")) ){
  	    		 	data.setString("ISRIGHT", "Y");
         		}*/
       		 if((applyHistInfo.getInt("ITEMSEQ") != 0 && examQuizRandomInfo.getInt("RCODE") == applyHistInfo.getInt("ITEMSEQ")) ){
   	    		 	data.setString("ISRIGHT", "Y");
          	 }
         		else { data.setString("ISRIGHT", "N"); }
         		 
  	    		// 시험 응시내역 점수 수정
  	    		updateExamApplyHist(data);
  	    		//시험 응시내역 채점점수 합계 수정
  	    		updateExamApply(data);
       		 
        	}
        }  
        else { // 순차출제
        	EduMap examQuizBindInfo = null;
        	
        	for(int i=0 ; i < applyHistList.size(); i++) {
        		EduMap applyHistInfo = (EduMap)applyHistList.get(i);
        		data.putInt("qSeq", applyHistInfo.getInt("QSEQ"));
        		data.putInt("qNo", applyHistInfo.getInt("QNO"));

        		// 답안 비교
        		examQuizBindInfo = examQuizBindInfo(data);
        		data.putString("answer", applyHistInfo.getString("ANSWER"));
        		
        		if(examQuizBindInfo.getInt("RCODE") == applyHistInfo.getInt("ITEMSEQ")){
 	    		 	data.setString("ISRIGHT", "Y");
        		}
        		else { 
        			data.setString("ISRIGHT", "N"); 
        		}
 	    		// 시험 응시내역 점수 수정
 	    		updateExamApplyHist(data);
 	    		// 시험 응시내역 채점점수 합계 수정
 	    		updateExamApply(data);
 	    		
        	}
        }
    	
        /* 2. 사후시험인경우 성적처리 반영 (le_course_user) -> 수료 점수 만족 시 수료코드 발급 */        
        if( "A".equals( data.getString("examType"))) {
        	// 사후시험 점수만 수강테이블 정보에 업데이트
        	classdeskUserExamMapper.updateLeCourseUserInfo(data);
        	
        	float finalVal = classdeskUserExamMapper.getTotalSumInfo(data); // 전체성적
        	int compVal = classdeskUserExamMapper.getCseqCompValInfo(data);
        	
        	// 수료기준점수보다 높은 경우
        	if (finalVal >= compVal) {
	        		data.setString("cuserNo", data.getString("SES_CUSERNO"));
	        		data.setString("courseno", data.getString("SES_COURSENO"));
	        		EduMap uInfo = classdeskProgMapper.getLeCourseUserInfo(data);
	        		
	        		// 이미 수료한 자가 아닌경우
	        		if( !("Y").equals(uInfo.getString("ISPASS")) && "".equals(uInfo.getString("COMPCODE"))) {
	        			String gubunCode = classdeskProgMapper.getCompGubunInfo(data);
	                	data.setString("gubun_code", gubunCode);
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
	                 	classdeskProgMapper.updateMaxCompCode(data);
	                 	
	                    // 수료코드 반영
	                    classdeskUserExamMapper.updateLeCoursePassInfo(data);
	        		}
            }
            
        }
        
    }
    
    /**
     * 시험 제출정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getExamApplyHistList(DataMap data) throws Exception {
        return classdeskUserExamMapper.getExamApplyHistList(data);
    } 
    
    /**
     * Bind문제유형 시험문제 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap examQuizBindInfo(DataMap data) throws Exception {
        return classdeskUserExamMapper.examQuizBindInfo(data);
    } 
    
    /**
     * Random문제유형 시험문제 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap examQuizRandomInfo(DataMap data) throws Exception {
        return classdeskUserExamMapper.examQuizRandomInfo(data);
    } 
    
    /**
     * Set문제유형 시험문제 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap examQuizSetInfo(DataMap data) throws Exception {
        return classdeskUserExamMapper.examQuizSetInfo(data);
    } 
    
    /**
     * 시험 응시내역 점수 수정
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public void updateExamApplyHist(Map data) throws Exception {
        classdeskUserExamMapper.updateExamApplyHist(data);
    }
    
    /**
     * 시험 응시내역 채점점수 합계 수정
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public void updateExamApply(Map data) throws Exception {
        classdeskUserExamMapper.updateExamApply(data);
    }
    
    /**
     * 사전/사후시험 체크
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public int getLeExamBeAfterCnt(DataMap data) throws Exception {
        return classdeskUserExamMapper.getLeExamBeAfterCnt(data);
    }
    
    /**
     * 사전시험 존재 유무 체크 
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public int getLeExamBeChkYn(DataMap data) throws Exception{
    	return classdeskUserExamMapper.getLeExamBeChkYn(data);
    }

}
