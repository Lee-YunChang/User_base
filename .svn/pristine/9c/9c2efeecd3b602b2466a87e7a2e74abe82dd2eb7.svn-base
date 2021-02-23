package com.webapp.academy.service;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : User Service
 *
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface UserService {

    /**
     * 회원번호 생성
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxMberNo(DataMap data) throws Exception;
    
   /* *//**
     * 비밀번호 암호화
     *
     * @param string
     * @return
     * @throws Exception
     *//*
    String cryptPassword(String string) throws Exception;
    
    *//**
     * 비밀번호 확인
     *
     * @param a
     * @return
     * @throws Exception
     *//*
    EduMap confirmPwd(DataMap data) throws Exception;*/
    
    /**
     * 비밀번호 일괄변경
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateAllPwd(DataMap data) throws Exception;

    
    /**
     * 유저 아이디 중복체크
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap searchMberId(DataMap data) throws Exception;

    /**
     * 유저 email 중복체크
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap searchMberEmail(DataMap data) throws Exception;


    /**
     * 유저 email 중복체크
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> searchMberEmail2(DataMap data) throws Exception;
    /**
     * 유저 휴대폰번호 중복체크 및 sms 인증발송
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap searchMberMobile(DataMap data) throws Exception;
    /**
     * 유저 휴대폰번호 중복체크 및 sms 인증발송
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap searchMberMobile2(DataMap data) throws Exception;

    /**
     * 유저 인증메일 발송
     *
     * @param data
     * @return
     * @throws Exception
     */
    void authSendMail(DataMap data) throws Exception;

    /**
     * 인증번호 체크
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getUnityInfo(DataMap data) throws Exception;

    /**
     * 회원가입
     *
     * @param data
     * @throws Exception
     */
    void insertUnityMber(DataMap data) throws Exception;

    /**
     * 회원정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap selectUserInfo(DataMap data) throws Exception;

    /**
     * 회원정보 변경
     *
     * @param data
     * @throws Exception
     */
    void updateUnityInfo(DataMap data) throws Exception;

    /**
     * 유저 아이디/비밀번호찾기 - 아이디
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap selectFindId(DataMap data) throws Exception;
    
    /**
     * 유저 아이디/비밀번호찾기 - 아이디
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> selectFindId2(DataMap data) throws Exception;

    /**
     * 유저 아이디/비밀번호찾기 - 비밀번호 - 임시비밀번호로 업데이트
     *
     * @param data
     * @throws Exception
     */
    void updateFindPwd(DataMap data) throws Exception;

    /**
     * 회원 탈퇴 신청
     *
     * @param data
     * @throws Exception
     */
    void updateCencelMember(DataMap data) throws Exception;

    /**
     * 기업정보 호출
     *
     * @param data
     * @throws Exception
     */
   EduMap selectCompanyInfo(DataMap data) throws Exception;

   /**
    * 기업정보 수정
    *
    * @param data
    * @throws Exception
    */
   void updateCompanyInfo(DataMap data) throws Exception;

    /**
     * 기업검색 (List)
     *
     * @param data
     * @throws Exception
     */
   List<EduMap> selectCompanyList(DataMap data) throws Exception;

   /**
    * 기업검색 (info)
    *
    * @param data
    * @throws Exception
    */
  EduMap seachCompanyInfo(DataMap data) throws Exception;

  /**
   * 기업검색_회원가입2단계 (List)
   *
   * @param data
   * @throws Exception
   */
 List<EduMap> seachCompanyList(DataMap data) throws Exception;

  /**
   * 기업검색
   *
   * @param data
   * @throws Exception
   */
 EduMap seachCompanyInfo2(DataMap data) throws Exception;


  /**
   * 기업정보 등록
   *
   * @param data
   * @throws Exception
   */
  void insertCompanyInfo(DataMap data) throws Exception;



   /**
    * 종사직군 리스트 조회
    *
    * @param data
    * @throws Exception
    */
   List<EduMap> selectJobKndCodeList(DataMap data) throws Exception;

   /**
    * 기업회원 리스트 조회
    *
    * @param data
    * @throws Exception
    */
   List<EduMap> selectCompanyEmpList(DataMap data) throws Exception;

   /**
    * 기업회원 승인체크(ajax)
    *
    * @param data
    * @throws Exception
    */
   void updateRegAtInfoAjax(DataMap data) throws Exception;

   /**
    * 기업회원 중복데이터 제거
    *
    * @param data
    * @throws Exception
    */
   void updateRegAtNotInfoAjax(DataMap data) throws Exception;

   /**
    * 기업회원 정보조회 comNo, empSeq
    *
    * @param data
    * @throws Exception
    */
   EduMap selectCompanyEmpInfo(DataMap data) throws Exception;

   /**
    * 기업회원 정보조회 comNo, regUserId
    *
    * @param data
    * @throws Exception
    */
   EduMap selectCompanyEmpInfo2(DataMap data) throws Exception;


   /**
    * 기업회원 등록
    *
    * @param data
    * @throws Exception
    */
   void insertCompanyEmpInfo(DataMap data) throws Exception;

   /**
    * 기업회원 등록 (excel 일괄등록)
    *
    * @param data
    * @throws Exception
    */
   void insertCompanyExcel(DataMap data) throws Exception;

   /**
    * 기업회원 이메일발송
    *
    * @param data
    * @throws Exception
    */
   void empMailExec(DataMap data) throws Exception;

   /**
    * 기업회원 소속정보 변경용1
    *
    * @param data
    * @throws Exception
    */
   EduMap deleteCompanyEmpInfo(DataMap data) throws Exception;
   /**
    * 기업회원 소속정보 변경용2 -> 후에 insertCompanyEmpInfo 사용
    *
    * @param data
    * @throws Exception
    */
   void deleteCompanyEmpInfo2(DataMap data) throws Exception;

   /**
    * 기업회원관리 -> 종사자 삭제
    *
    * @param data
    * @throws Exception
    */
   void deleteEmpInfo(DataMap data) throws Exception;

   /**
    * 회원정보 변경 회원등급 및 회원 사업자변호 변경
    *
    * @param data
    * @throws Exception
    */
   void updateCompanyEmpMoveInfo(DataMap data) throws Exception;


   /**
    * 해당기업의 max emp_seq +1을 호출
    *
    * @param data
    * @throws Exception
    */
   int selectMaxSeqInfo(DataMap data)  throws Exception;

   /**
    * 사업자번호로 승인여부 카운트 조회
    *
    * @param data
    * @throws Exception
    */
   int selectStatusGbYnCnt(DataMap data)  throws Exception;

   /**
    * 회원의 이메일 인증 실행
    *
    * @param data
    * @throws Exception
    */
   void updateAuthCodeInfo(DataMap data) throws Exception;

   /**
    * 유저 비밀번호 찾기
    *
    * @param data
    * @throws Exception
    */
   EduMap selectPwdSearchUserInfo(DataMap data) throws Exception;

   /**
    * 유저 비밀번호 변경
    *
    * @param data
    * @throws Exception
    */
   void updatePwdPopExec(DataMap data) throws Exception;

   /**
    * 기업회원관리 > 회원 (등록인원,가입인원,수료인원) 카운트
    *
    * @param data
    * @throws Exception
    */
   EduMap getEmpInfoTotCount(DataMap data) throws Exception;

   /**
    * 기업담당자 가입권유메일 하루 100건으로 제한 체크
    *
    * @param data
    * @return
    * @throws Exception
    */
   int getEmpMailTodayCnt(DataMap data) throws Exception;

   /**
    * 기업정보 입력 카운트
    *
    * @param data
    * @return
    * @throws Exception
    */
   int selectCompanyData(DataMap data) throws Exception;

   /**
    * 현재 등록되어있는 기업회원 조회
    *
    * @param data
    * @throws Exception
    */
   public List<EduMap> selectComEmpList(DataMap data) throws Exception;

   /**
    * 현재기업담당자 일반 회원으로 변경 후 신규 기업담당자 변경
    *
    * @param data
    * @throws Exception
    */
  public void updateComMngrExec(DataMap data) throws Exception;
  
  
  /**
   * 회원가입 > 본인인증 > 중복회원가입여부
   *
   * @param data
   * @throws Exception
   */
  int chkJoinYn(DataMap data) throws Exception;

  
  /**
   * 기존회원 > 본인인증 > 개인정보 비교
   *
   * @param data
   * @throws Exception
   */
  int chkInfoCompare(DataMap data) throws Exception;
  
  
  /**
   * 기존회원 > 본인인증 > 개인정보 비교 후, 본인인증 정보로 개인정보 UPDATE
   *
   * @param data
   * @throws Exception
   */
  void mebmerUpdateInfo(DataMap data) throws Exception;
  

}
