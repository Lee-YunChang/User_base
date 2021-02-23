package com.webapp.academy.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : board Mapper
 *
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("counselorMapper")
public interface CounselorMapper {

    /**
     * 게시판 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getPersonalCounselorList(DataMap data) throws Exception;
    
    /**
     * 게시판 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getPersonalCounselorListCnt(DataMap data) throws Exception;
    
    /**
     * 게시판 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCounselorBoardView(DataMap data) throws Exception;
    
    /**
     * 게시판 파일 정보
     *
     * @param fileNo
     * @return
     * @throws Exception
     */
    List<EduMap> getFileList(int fileNo) throws Exception;
    
    /**
     * 게시판 파일 정보
     *
     * @param rMap
     * @return
     * @throws Exception
     */
    EduMap getFileInfo(DataMap rMap) throws Exception;
    
    /**
     * 게시판 리스트 카운트
     *
     * @param data
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
     * 게시판 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getOpenCounselorListCnt(DataMap data) throws Exception;
    
    /**
     * 게시판 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getCounselorOpenBoardView(DataMap data) throws Exception;
}
