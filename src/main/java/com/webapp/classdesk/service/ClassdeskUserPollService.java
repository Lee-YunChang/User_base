package com.webapp.classdesk.service;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk UserPoll Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskUserPollService {

    /**
     * 클래스데스크 > 학생 > 설문
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollApplyMainList(DataMap data) throws Exception;

    /**
     * 설문 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getUserPollList(DataMap data) throws Exception;

    /**
     * 강의실 설문 응시내역
     * 
     * @param data
     * @throws Exception
     */
    void insertPollApply(DataMap data) throws Exception;

    /**
     * 강의실 설문 응시답안
     * 
     * @param data
     * @throws Exception
     */
    void insertPollApplyHist(DataMap data) throws Exception;

    /**
     * 설문 실시간 정답
     * 
     * @param data
     * @throws Exception
     */
    void updatePollRealTmAns(DataMap data) throws Exception;

    /**
     * updatePollApply
     * 
     * @param data
     * @throws Exception
     */
    void updatePollApply(DataMap data) throws Exception;

    /**
     * 과제 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollApplyHistList(DataMap data) throws Exception;

    /**
     * 강의실 설문 응시내역 저장
     * 
     * @param data
     * @throws Exception
     */
    void savePollApply(DataMap data) throws Exception;
    
    /**
     * 설문목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLePoll(DataMap data) throws Exception;
    
    /**
     * 설문목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getModuleList(DataMap data) throws Exception;
    
    /**
     * 설문목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getQuestionList(DataMap data) throws Exception;
    
    
    /**
     * 설문목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSurveyModuleList(DataMap data) throws Exception;
    

    /**
     * 설문목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getItemCnt(DataMap data) throws Exception;

    /**
     * 설문목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getItemCnt2(DataMap data) throws Exception;
    
    /**
     * 주관식 객관식 코드 출력 
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> selectMtCpollCode(DataMap data) throws Exception;
    
    /**
     * 설문목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxApplyNo(DataMap data) throws Exception;

    /**
	 * 응답수 +1
     * 
     * @param data
     * @throws Exception
     */
    void updateLePollCnt(DataMap data) throws Exception;
    
    /**
     * 설문목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> gethistData(DataMap data) throws Exception;
}
