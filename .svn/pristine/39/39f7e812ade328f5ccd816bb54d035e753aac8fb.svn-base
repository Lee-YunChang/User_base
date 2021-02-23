package com.webapp.common.mapper;

import com.sangs.support.DataMap;

import java.util.List;

import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : User Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

@Mapper("commonUserMapper")
public interface CommonUserMapper {

    /**
     * 회원정보(통합회원코드기준)
     * 
     * @param userNo
     * @return
     * @throws Exception
     */
    EduMap getUserInfo(int userNo) throws Exception;

    /**
     * 회원정보(LMS회원코드기준)
     * 
     * @param userNo
     * @return
     * @throws Exception
     */
    EduMap getUserLmsInfo(DataMap data) throws Exception;

    /**
     * 로그인 사용자 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getLoginUserInfo(DataMap data) throws Exception;
    
    /**
     * 공통 > 개인정보조회이력관리  
     * 
     * @param data
     * @throws Exception
     */
    void insertMbrTransLog(DataMap data) throws Exception;
    
    /**
     * 공통 > 로그인이력관리
     * 
     * @param data
     * @throws Exception
     */
    void insertMbrLoginLog(DataMap data) throws Exception;


    /**
     * 사용자테이블 로그인 실패 횟수 업데이트
     * 
     * @param data
     * @throws Exception
     */
    void updateLoginFailCntInfo(DataMap data) throws Exception;
    
    /**
     * 회원 > 승인 대기로 변경
     * 
     * @param data
     * @throws Exception
     */
    void updateRegAtInfo(DataMap data) throws Exception;
    
    /**
     * 공통 > 로그인 성공 (실패횟수 0으로 초기화)
     * 
     * @param data
     * @throws Exception
     */
    void updateLoginSuccessInfo(DataMap data) throws Exception;
    
    /**
     * 회원 승인
     * 
     * @param data
     * @throws Exception
     */
    void updateRegAtYesInfo(DataMap data) throws Exception;
    
    /**
     * 공통 > 로그인 실패횟수
     * 
     * @param data
     * @throws Exception
     */
    EduMap selectLoginFailCntInfo(DataMap data) throws Exception;
    
    /**
     * 로그인 세션아이디 체크
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getLoginSessionInfo(DataMap data) throws Exception;

    /**
     * 회원전체 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLoginUserList(DataMap data) throws Exception;

    /**
     * 회원전체 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCuserNo(DataMap data) throws Exception;
    
    /**
     *설문 참여 이력 조회
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getPollHist(DataMap data) throws Exception;
    
    /**
     * 비회원 로그인 사용자 정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getNonMberLoginUserInfo(DataMap data) throws Exception;

    /**
     * 세션아이디저장
     * 
     * @param data
     * @return
     * @throws Exception
     */
    void updateJsessionId(DataMap data) throws Exception;
    
    /**
     * 세션아이디초기화
     * 
     * @param data
     * @return
     * @throws Exception
     */
    void deleteJsessionId(DataMap data) throws Exception;
    
    /**
     * 세션아이디로딩
     * 
     * @param data
     * @return
     * @throws Exception
     */
    String getSessionId(String loginId) throws Exception;
}
