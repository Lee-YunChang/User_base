package com.webapp.classdesk.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk UserExam Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskUserExamMapper")
public interface ClassdeskUserExamMapper {

    /**
     * 시험 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserLectExamList(DataMap data) throws Exception;

    /**
     * getUserLectExamAppCnt
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getUserLectExamAppCnt(DataMap data) throws Exception;

    /**
     * 강의실 시험 응시내역 저장
     * 
     * @param data
     * @throws Exception
     */
    void insertLectExamApp(DataMap data) throws Exception;

    /**
     * insertUserLectExamSetAppHst
     * 
     * @param data
     * @throws Exception
     */
    void insertUserLectExamSetAppHst(DataMap data) throws Exception;

    /**
     * insertUserLectExamBinderAppHst
     * 
     * @param data
     * @throws Exception
     */
    void insertUserLectExamBinderAppHst(DataMap data) throws Exception;

    /**
     * getUserLectExamAppMaxSeq
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getUserLectExamAppMaxSeq(DataMap data) throws Exception;

    /**
     * 강의실 시험 응시답안 랜덤 등록
     * 
     * @param data
     * @throws Exception
     */
    void lmsExamRandomExecute(Map data) throws Exception;

    /**
     * 시험 응시답안 랜덤 객관식 1차 가채점
     * 
     * @param data
     * @throws Exception
     */
    void lmsExamRdmMarkingExecute(Map data) throws Exception;

    /**
     * 시험 응시답안 세트 시험 객관식 1차 가채점
     * 
     * @param data
     * @throws Exception
     */
    void lmsExamSetMarkingExecute(Map data) throws Exception;

    /**
     * 시험 응시답안 바인더 시험 객관식 1차 가채점
     * 
     * @param data
     * @throws Exception
     */
    void lmsExamBinderMarkingExecute(Map data) throws Exception;

    /**
     * 응시문항수
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getItemCnt(DataMap data) throws Exception;
    
    /**
     * 수강생 시험 랜덤 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserLectExamRdmAppHistList(DataMap data) throws Exception;

    /**
     * 수강생 사전시험 결과
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserLectExamRdmAppHistListB(DataMap data) throws Exception;
    
    /**
     * 수강생 시험 세트 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserLectExamSetAppHistList(DataMap data) throws Exception;

    /**
     * 수강생 시험 바인더 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserLectExamBinderAppHistList(DataMap data) throws Exception;

    /**
     * 사용자 실시간 응시시간 저장
     * 
     * @param data
     * @throws Exception
     */
    void updateExamRealTmTime(Map data) throws Exception;

    /**
     * 사용자 실시간 정답 저장
     * 
     * @param data
     * @throws Exception
     */
    void updateExamRealTmAns(Map data) throws Exception;

    /**
     * 과정정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getOpenTypeInfo(DataMap data) throws Exception;
    
    /**
     * 시험 제출정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getExamApplyHistList(DataMap data) throws Exception;
    
    /**
     * Bind문제유형 시험문제 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap examQuizBindInfo(DataMap data) throws Exception;
    
    /**
     * Random문제유형 시험문제 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap examQuizRandomInfo(DataMap data) throws Exception;
    
    /**
     * Set문제유형 시험문제 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap examQuizSetInfo(DataMap data) throws Exception;
    
    /**
     * 시험 응시내역 점수 수정
     * 
     * @param data
     * @throws Exception
     */
    void updateExamApplyHist(Map data) throws Exception;

    /**
     * 시험 응시내역 채점점수 합계 수정
     * 
     * @param data
     * @throws Exception
     */
    void updateExamApply(Map data) throws Exception;


    /**
     * 사전/사후시험 체크
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getLeExamBeAfterCnt(DataMap data) throws Exception;
    
    /**
     * 사전시험 유무 체크
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getLeExamBeChkYn(DataMap data) throws Exception;

    /**
     * 사후시험 점수 > 수강테이블 정보에 업데이트
     * 
     * @param data
     * @throws Exception
     */
    void updateLeCourseUserInfo(DataMap data) throws Exception;
    
    /**
     * 수료정보 업데이트
     * 
     * @param data
     * @throws Exception
     */
    void updateLeCoursePassInfo(DataMap data) throws Exception;
    
    /**
     * 성적 점수 합계 
     * 
     * @param data
     * @return
     * @throws Exception
     */
    float getTotalSumInfo(DataMap data) throws Exception;
    
    /**
     * 수료기준점수
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getCseqCompValInfo(DataMap data) throws Exception;
}
