package com.webapp.classdesk.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk TutorExam Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskTutorExamMapper")
public interface ClassdeskTutorExamMapper {
	
	/**
	 * 시험 리스트
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getLectExamList(DataMap data) throws Exception;
	
	/**
	 * 시험 제출자 리스트
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getUserLectExamSubList(DataMap data) throws Exception;
	
	/**
	 * 시험 상세
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getLectExamItem(DataMap data) throws Exception;
	
	/**
	 * getLeExamEvalInfo
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getLeExamEvalInfo(DataMap data) throws Exception;
	
	/**
	 * 교육시험 출제정책 랜덤방식 리스트
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getEduExamSectionList(DataMap data) throws Exception;
	
	/**
	 * 강의실 출제정책 랜덤방식 리스트
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getLectExamSectionList(DataMap data) throws Exception;
	
	/**
	 * 시험 MAx No
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getMaxLeExamSeqNo(DataMap data) throws Exception;
	
	/**
	 * 최종평가
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateLectExamResult(DataMap data) throws Exception;
	
	/** 
	 * 시험 저장
	 * 
	 * @param data
	 * @throws Exception
	 */
	void insertLectExam(DataMap data) throws Exception;
	
	/**
	 * insertLectExamSec
	 * 
	 * @param data
	 * @throws Exception
	 */
	void insertLectExamSec(DataMap data) throws Exception;
	
	/**
	 * 강사 시험 응시내역 채점
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateExamAppMarking(DataMap data) throws Exception;
	
	/**
	 * 강사 시험 응시답안 채점
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateExamAppHstMarking(DataMap data) throws Exception;
	
	/**
	 * 시험 삭제
	 * 
	 * @param data
	 * @throws Exception
	 */
	void deleteLeExam(DataMap data) throws Exception;
	
	/**
	 * 시험 응시내역 삭제
	 * 
	 * @param data
	 * @throws Exception
	 */
	void deleteLeExamApp(DataMap data) throws Exception;
	
	/**
	 * 시험 응시답안 삭제
	 * 
	 * @param data
	 * @throws Exception
	 */
	void deleteLeExamAppHst(DataMap data) throws Exception;
	
	/**
	 * 랜덤 시험 문제은행 출제정책 삭제
	 * 
	 * @param data
	 * @throws Exception
	 */
	void deleteLeExamSec(DataMap data) throws Exception;
	
	/**
	 * 성적 업데이트프로시저 실행
	 * 
	 * @param data
	 * @throws Exception
	 */
	void callLmsCourseRecordExec(Map data) throws Exception;
	
	/**
	 * 과정정보
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getOpenTypeInfo(DataMap data) throws Exception;
	
	/**
	 * (상시) 시험 사용여부 저장
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateLeExamUseYn(DataMap data) throws Exception;
	
	/**
	 * (상시) 시험 문제 사용여부 저장
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateQuizUseYn(DataMap data) throws Exception;
	
	void updateQuizUseYn1(DataMap data) throws Exception;
	void updateQuizUseYn2(DataMap data) throws Exception;
	void updateQuizUseYn3(DataMap data) throws Exception;
	
	/**
	 * 사용자 실시간 응시시간 저장
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateExamSubmit(DataMap data) throws Exception;
}
