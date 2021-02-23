package com.webapp.classdesk.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk TutorPoll Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskTutorPollMapper")
public interface ClassdeskTutorPollMapper {

    /**
     * getPollMainList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getPollMainList(DataMap data) throws Exception;

    /**
     * 설문 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollList(DataMap data) throws Exception;

    /**
     * 설문 MAX NO
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getMaxPollcSeqNo(DataMap data) throws Exception;

    /**
     * 설문 메인 저장
     * 
     * @param data
     * @throws Exception
     */
    void insertPoll(DataMap data) throws Exception;

    /**
     * 설문 임시저장 / 설문개시
     * 
     * @param data
     * @throws Exception
     */
    void updatePoll(DataMap data) throws Exception;

    /**
     * selectMstPollCnt
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap selectMstPollCnt(DataMap data) throws Exception;

    /**
     * selectMstPollQuizCnt
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap selectMstPollQuizCnt(DataMap data) throws Exception;

    /**
     * 설문 문항 일괄 저장
     * 
     * @param data
     * @throws Exception
     */
    void insertMstPollQuiz(DataMap data) throws Exception;

    /**
     * getPollItem
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getPollItem(DataMap data) throws Exception;

    /**
     * 설문 문항 저장
     * 
     * @param data
     * @throws Exception
     */
    void insertPollQuiz(DataMap data) throws Exception;

    /**
     * 설문 문항 수정
     * 
     * @param data
     * @throws Exception
     */
    void updatePollQuiz(DataMap data) throws Exception;

    /**
     * 설문 문항 삭제
     * 
     * @param data
     * @throws Exception
     */
    void deletePollQuiz(DataMap data) throws Exception;

    /**
     * 설문통계
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollStatList(DataMap data) throws Exception;

    /**
     * 설문 주관식 내용 
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollStatEtcList(DataMap data) throws Exception;

    /**
     * getPollcSeqNoInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getPollcSeqNoInfo(DataMap data) throws Exception;

    /**
     * 주관식답변(설문전체)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPollStatDesList(DataMap data) throws Exception;
}
