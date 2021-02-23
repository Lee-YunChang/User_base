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
public interface CounselorService {

    /**
     * 게시판 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPersonalCounselorList(DataMap data) throws Exception;
    
    /**
     * 게시판 리스트 카운토
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getPersonalCounselorListCnt(DataMap data) throws Exception;
    
    /**
     * 게시판 내용보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCounselorBoardView(DataMap data) throws Exception;
    
    /**
     * 게시판 파일 리스트
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> getFileList(int bbsNo) throws Exception;
    
    /**
     * 게시판 파일 리스트
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    void insertCounselUserInfo(DataMap data) throws Exception;
    
    /**
     * 게시판 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getOpenCounselorList(DataMap data) throws Exception;
    
    /**
     * 게시판 리스트 카운토
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getOpenCounselorListCnt(DataMap data) throws Exception;
    
    /**
     * 게시판 내용보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCounselorOpenBoardView(DataMap data) throws Exception;
}
