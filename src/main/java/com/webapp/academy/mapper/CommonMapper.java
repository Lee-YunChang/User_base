package com.webapp.academy.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Common Mapper
 *
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("commonMapper")
public interface CommonMapper {

    /**
     * 메뉴 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> selectRootMenuList(DataMap data) throws Exception;

    /**
     * 서브메뉴 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> selectSubMenuList(Map data) throws Exception;

    /**
     * 현재 메뉴 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCurrentMenuInfo(DataMap data) throws Exception;

    /**
     * 현재 메뉴 정보 url로 검색
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getSearchMenuInfo(DataMap data) throws Exception;

    /**
     * 우편번호 검색 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPostcodeList(DataMap data) throws Exception;
    
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
     * 사용자 정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getUserInfo(DataMap data) throws Exception;

    /**
     * 사용자 정보 (테스트)
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getTestUserInfo(DataMap data) throws Exception;

    /**
     * 공통코드 리스트
     *
     * @param mtCode
     * @return
     * @throws Exception
     */
    List<EduMap> getToSangsCodes(String mtCode) throws Exception;

    /**
     * 사용자 리스트
     *
     * @param mtCode
     * @return
     * @throws Exception
     */
    List<EduMap> getTestUserList(DataMap data) throws Exception;

    /**
     * 이니시스 결제 데이타 등록
     *
     * @param data
     * @throws Exception
     */
    void insertPmCardData(DataMap data) throws Exception;

    /**
     * 메일 템플릿 사용여부 확인
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEmailTempUseYn(DataMap data) throws Exception;


    /**
     * 메일 템플릿
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getEmailSetInfo(DataMap data) throws Exception;

    /**
     * 공통코드 리스트 출력
     *
     * @param mtCode
     * @return
     * @throws Exception
     */
    List<EduMap> selectMtCodeSub(DataMap data) throws Exception;

    /**
	 * 대출과목 리스트
	 */
   public List<Map<String, Object>> getEduLoanList(DataMap data)throws Exception ;
    
    /**
     * 공통코드 단일 조회
     *
     * @param mtCode
     * @return
     * @throws Exception
     */
    EduMap selectMtCodeSubInfo(DataMap data) throws Exception;
    
    /**
     * 관할기관 찾기 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<Map<String,Object>> getOfficeCodeList(DataMap data) throws Exception;

    /**
     * 관할기관 찾기 리스트 수
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getOfficeCodeCount(DataMap data) throws Exception;
    
    EduMap selectDepthName(DataMap data) throws Exception;
	
    List<EduMap> selectTabMenu(DataMap data) throws Exception;
    
    /**
     * 온라인 오프라인 수강카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getOnEduLoanCnt(DataMap data) throws Exception;
    int getOffEduLoanCnt(DataMap data) throws Exception;
    
    /** 대출상품 별 교육수료정보*/
    void getSpLmsUserLoanEduinfo(Map<String, Object> data)throws Exception;

}
