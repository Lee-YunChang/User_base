package com.webapp.academy.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
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
@Mapper("userMapper")
public interface UserMapper {

    /**
     * 회원번호 생성
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxMberNo(DataMap data) throws Exception;

/**
     * 비밀번호 암호화
     *
     * @param data
     * @return
     * @throws Exception
     *//*
    String cryptPassword(String string) throws Exception;
    
    *//**
     * 비밀번호 확인
     *
     * @param data
     * @return
     * @throws Exception
     *//*
    EduMap confirmPwd(DataMap data) throws Exception;*/
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
     * 유저 휴대폰번호 중복체크
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap searchMberMobile(DataMap data) throws Exception;
    /**
     * 유저 휴대폰번호 중복체크
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap searchMberMobile2(DataMap data) throws Exception;
    /**
     * 회원가입
     *
     * @param data
     * @throws Exception
     */
    void insertUnityMber(DataMap data) throws Exception;
    
    /**
     * 비밀번호 일괄변경
     *
     * @param data
     * @throws Exception
     */
    void updateAllPwd(DataMap data) throws Exception;

    /**
     * 인증번호 체크
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getUnityInfo(DataMap data) throws Exception;

    /**
     * 회원정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap selectUserInfo(DataMap data) throws Exception;
    
    /**
     * 비밀번호변경 회원이름 번호 로드
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap selectUserPwdInfo(DataMap data) throws Exception;

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
     * 회원 탈퇴 - 회원 데이터 삭제
     *
     * @param data
     * @throws Exception
     */
    void updateCencelMember(DataMap data) throws Exception;

    /**
     * 기업정보 검색
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
     * 기업정보 검색 (List)
     *
     * @param data
     * @throws Exception
     */
    List<EduMap> selectCompanyList(DataMap data) throws Exception;

    /**
     * 기업정보 검색 (info)
     *
     * @param data
     * @throws Exception
     */
    EduMap seachCompanyInfo(DataMap data) throws Exception;


    /**
     * 기업정보 검색 (List)
     *
     * @param data
     * @throws Exception
     */
    List<EduMap> seachCompanyList(DataMap data) throws Exception;
    /**
     * 기업정보 검색_회원가입 2단계
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
     * 종사직원 리스트 조회
     *
     * @param data
     * @throws Exception
     */
    List<EduMap> selectCompanyEmpList(DataMap data) throws Exception;

    /**
     * 기업회원 승인
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
     * 기업회원 조회
     *
     * @param data
     * @throws Exception
     */
    EduMap selectCompanyEmpInfo(DataMap data) throws Exception;

    /**
     * 기업회원 조회2
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
    int multipleInsertChk(Map data) throws Exception;

    /**
     * 기업회원 등록
     *
     * @param data
     * @throws Exception
     */
    void insertCompanyEmpInfo(Map data) throws Exception;

    /**
     * 기업회원 등록자 유무 카운트
     *
     * @param data
     * @throws Exception
     */
    int selectEmpRegUsrCnt(Map data) throws Exception;

    /**
     * 종사직원  메일발송용 리스트 조회
     *
     * @param data
     * @throws Exception
     */
    List<EduMap> selectCompanyEmpEmailList(Map data) throws Exception;


    /**
     * 종사직원  메일발송상태값 업데이트
     *
     * @param data
     * @throws Exception
     */
    void updateCompanyMail(Map data) throws Exception;

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
    int selectMaxSeqInfo(DataMap data) throws Exception;

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
     * 유저 비밀번호 찾기 -> 비밀번호 변경 실행
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
     * 사업자번호로 승인여부 카운트 조회
     *
     * @param data
     * @throws Exception
     */
    int selectStatusGbYnCnt(DataMap data) throws Exception;

    /**
     * 기업정보 입력 카운트
     *
     * @param data
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
     * 신규 기업담당자 등록
     *
     * @param data
     * @throws Exception
     */
    public void updateComMngrExec2(DataMap data) throws Exception;
    
    /**
     * 관할기관 찾기 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCompanyCodeList(DataMap data) throws Exception;

    /**
     * 관할기관 찾기 리스트 수
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getCompanyCodeCount(DataMap data) throws Exception;
    
    /**
     * 비회원 유저번호
     *
     * @param data
     * @throws Exception
     */
    int selectnmberno(DataMap data) throws Exception;
    
    /**
     * 수강이력 변경
     *
     * @param data
     * @throws Exception
     */
    void updateNmberno(DataMap data) throws Exception;
    
    /**
     * 비회원 탈퇴여부 변경
     *
     * @param data
     * @throws Exception
     */
    void updateNmberSecsnAt(DataMap data) throws Exception;
    
    /**
     * 비회원 ->회원 특강신청 정보 변경
     *
     * @param data
     * @throws Exception
     */
    void updateLectureUserno(DataMap data) throws Exception;
    
    /**
     * 비회원 ->회원 시험 제출정보 변경
     *
     * @param data
     * @throws Exception
     */
    void updateExamApllyUserno(DataMap data) throws Exception;
    
    
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
