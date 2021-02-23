package com.webapp.classdesk.service;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk TutorMain Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskTutorMainService {

    /**
     * 사용자 CLASSDESK 접근권한
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCourseUSerCount(DataMap data) throws Exception;

    /**
     * 클래스데스크 공통 헤더 타이틀 및 메뉴 제어
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCourseMainController(DataMap data) throws Exception;
    
    /**
     * 온라인학습 메인 > 차시목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getOnlineTreeList(DataMap data) throws Exception;

    /**
     * 메인  강사 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCourseMainTchInfo(DataMap data) throws Exception;

    /**
     * 수강여부 확인
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseList(DataMap data) throws Exception;
    
    /**
     * 선택수강 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSelectInfo(DataMap data) throws Exception;

    /**
     * 마지막 수강정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getCourseInfo(DataMap data) throws Exception;

    /**
     * 마지막 수강정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getCseqInfo(DataMap data) throws Exception;
    
    /**
     * 마지막 수강정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getCuserNoInfo(DataMap data) throws Exception;

    /**
     * 수강생정보(상시운영시 데이터 추출용)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCuserInfo(DataMap data) throws Exception;

    /**
     * 진도
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCourseMainprogress(DataMap data) throws Exception;

    /**
     * 과제 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseMainReportList(DataMap data) throws Exception;

    /**
     * 설문
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseMainPollList(DataMap data) throws Exception;

    /**
     * 시험 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseMainLectExamList(DataMap data) throws Exception;

    /**
     * getProgInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getProgInfo(DataMap data) throws Exception;
    
    /**
     * getProgInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getProgInfo2(DataMap data) throws Exception;
    
    /**
     * getProgInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> mainCategorySelect(DataMap data) throws Exception;
    
    /**
     * getFileList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getFileList(DataMap data) throws Exception;
    
    /**
     * getBbsFileInfo
     * 
     * @param fileNo
     * @return
     * @throws Exception
     */
    EduMap getFileInfo(DataMap data) throws Exception;
    
    /**
     * getSubjectCode
     * 
     * @param fileNo
     * @return
     * @throws Exception
     */
    String getSubjectCode(DataMap data) throws Exception;
    
    /**
     * getCurriculum
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCurriculum(DataMap data) throws Exception;
    
    /**
     *  온라인학습 > 목차리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseOnlineStudyInfo(DataMap data) throws Exception;
    
    
}
