package com.webapp.academy.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Board Service
 *
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface BoardService {

    /**
     * 게시판 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getBoardList(DataMap data) throws Exception;
    
    /**
     * 게시판 리스트 카운토
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getBoardListCnt(DataMap data) throws Exception;

    /**
     * TOP 게시글
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTopBoardList(DataMap data) throws Exception;

    
    /**
     * 게시판 최근 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getLateBoardList(DataMap data) throws Exception;

    /**
     * 게시판 등록
     *
     * @param data
     * @throws Exception
     */
    void insertBoardInfo(HttpServletRequest request, DataMap data) throws Exception;

    /**
     * 게시판 MAX KEY 검색
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMaxBoardNo(DataMap data) throws Exception;

    /**
     * 게시판 내용보기 (팝업)
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getMainPopBoardView(DataMap data) throws Exception;

    /**
     * 게시판 카운트 (팝업)
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getMainPopBoardCount(DataMap data) throws Exception;

    /**
     * 게시판 내용보기 (상시설문)
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getMainPollPopBoardView(DataMap data) throws Exception;

    /**
     * 참여여부 확인
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getPollInfoData(DataMap data) throws Exception;

    /**
     * 게시판 내용보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBoardView(DataMap data) throws Exception;

    /**
     * 게시판 이전내용보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBbsPrevData(DataMap data) throws Exception;
    /**
     * 게시판 다음내용보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBbsNextData(DataMap data) throws Exception;
    /**
     * 게시판 카테고리 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBoardCategoryList(DataMap data) throws Exception;

    /**
     * 게시판 VIEW COUNT 갱신
     *
     * @param data
     * @throws Exception
     */
    void updateBoardViewCnt(DataMap data) throws Exception;

    /**
     * 게시판 정보 갱신
     *
     * @param data
     * @throws Exception
     */
    void updateBoardInfo(HttpServletRequest request, DataMap data) throws Exception;

    /**
     * 게시판 정보 삭제
     *
     * @param data
     * @throws Exception
     */
    void deleteBoardInfo(DataMap data) throws Exception;

    /**
     * 강사 소통게시판 정보 삭제
     *
     * @param data
     * @throws Exception
     */
    void tutorDeleteBoardInfo(DataMap data) throws Exception;
    
    /**
     * 게시판 파일 정보
     *
     * @param fileNo
     * @return
     * @throws Exception
     */
    EduMap getFileInfo(int fileNo) throws Exception;

    /**
     * 게시판 파일 삭제
     *
     * @param data
     * @throws Exception
     */
    void deleteFileInfo(DataMap data) throws Exception;

    /**
     * 게시판 파일 저장
     *
     * @param data
     * @throws Exception
     */
    void insertFileInfo(HttpServletRequest request, DataMap data) throws Exception;

    /**
     * 게시판 파일 리스트
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> getFileList(int bbsNo) throws Exception;

   
    /**
     * 배너 목록
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getBannerList(DataMap data) throws Exception;

    /**
     * 자주묻는질문 조회수 업데이트
     *
     * @param data
     * @throws Exception
     */
    void getCountUpdate( DataMap data) throws Exception;
    
    /**
     * 증가된 카운트 조회
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    int getNewCount(DataMap data) throws Exception;

   
	/**
     * faq 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getFaqBoardList(DataMap data) throws Exception;
    

}

