package com.webapp.classdesk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk Board Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskBoardService {

    /**
     * getBoardList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getBoardList(DataMap data) throws Exception;

    /**
     * insertBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    void insertBoardInfo(DataMap data) throws Exception;

    /**
     * getMaxBoardNo
     * 
     * @return
     * @throws Exception
     */
    int getMaxBoardNo() throws Exception;

    /**
     * getBoardView
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getBoardView(DataMap data) throws Exception;

    /**
     * updateBoardViewCnt
     * 
     * @param data
     * @throws Exception
     */
    void updateBoardViewCnt(DataMap data) throws Exception;

    /**
     * updateBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    void updateBoardInfo(DataMap data) throws Exception;

    /**
     * deleteBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    void deleteBoardInfo(DataMap data) throws Exception;

    /**
     * getFileInfo
     * 
     * @param fileNo
     * @return
     * @throws Exception
     */
    EduMap getBbsFileInfo(DataMap data) throws Exception;

    /**
     * deleteFileInfo
     * 
     * @param data
     * @throws Exception
     */
    void deleteFileInfo(DataMap data) throws Exception;

    /**
     * insertFileInfo
     * 
     * @param data
     * @throws Exception
     */
    void insertFileInfo(HttpServletRequest request, DataMap data) throws Exception;

    /**
     * getFileList
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> getFileList(DataMap data) throws Exception;

    /**
     * getCourseBbsList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseBbsList(DataMap data) throws Exception;
    
    /**
     * getCourseBbsListCount
     * 
     * @param data
     * @return
     * @throws Exception
     */
    int getCourseBbsListCount(DataMap data) throws Exception;
    
    /**
     * saveBbs
     * 
     * @param data
     * @throws Exception
     */
    void saveBbs(HttpServletRequest request, DataMap data) throws Exception;
}
