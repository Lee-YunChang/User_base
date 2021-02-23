package com.webapp.classdesk.mapper;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.util.ParamUtil;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk TutorDiscuss Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.08.19   황두은           최초작성
 *
 */
@Mapper("classdeskTutorDiscussMapper")
public interface ClassdeskTutorDiscussMapper {
	
    /**
     * insertBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    void insertDiscussInfo(DataMap data) throws Exception;	
    
    /**
     * insertBoardReplyInfo
     * 
     * @param data
     * @throws Exception
     */
    void insertDiscussReplyInfo(DataMap data) throws Exception;	
    
    /**
     * 토론 파일 수정시 기존파일 삭제
     * discussFileDelete
     * 
     * @param data
     * @throws Exception
     */
    void discussFileDelete(DataMap data) throws Exception;	
    
    
    /**
     * insertBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    void updateFileBbsno(DataMap data) throws Exception;
    
    /**
     * insertFileDiscuss
     * 
     * @param data
     * @throws Exception
     */
    void insertFileDiscuss(DataMap data) throws Exception;
    
    /**
     * getMaxBoardNo
     * 
     * @return
     * @throws Exception
     */
    int getMaxBoardNo() throws Exception;
    
    /**
     * getBoardNo
     * 
     * @return
     * @throws Exception
     */
    int getBoardNo() throws Exception;
    
    /**
     * updateBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    void updateBoardInfo(DataMap data) throws Exception;
    
    /**
     * getCourseDiscussList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getCourseDiscussList(DataMap data) throws Exception;
	
    /**
     * getDiscussView
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getDiscussRowView(DataMap data) throws Exception;
	 
    /**
     * getDiscussTopView
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getDiscussTopView(DataMap data) throws Exception;
    
    /**
     * getFileList
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    EduMap getFileList(DataMap data) throws Exception;
    
    /**
     * updateDiscussViewCnt
     * 
     * @param data
     * @throws Exception
     */
    void updateDiscussViewCnt(DataMap data) throws Exception;
    
    /**
     * deleteDiscussInfo
     * 
     * @param data
     * @throws Exception
     */
    void deleteDiscussInfo(DataMap data) throws Exception; 
    
    /**
     * 파일 정보조회
     * 
     * @param data
     * @throws Exception
     */
    EduMap selectFileInfo(DataMap data) throws Exception; 
    
    /**
     * 파일삭제
     * 
     * @param data
     * @throws Exception
     */
    void deleteDiscussFile(DataMap data) throws Exception; 
    
    
    /**
     * getFileList
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> getRcmndCount(DataMap data) throws Exception;
    
    /**
     * getUnityMberno
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    String getUnityMberno(String unityId) throws Exception;
    
    
    /**
     * insertRcmndInfo
     * 
     * @param data
     * @throws Exception
     */
    void insertRcmndInfo(DataMap data) throws Exception;	
    
    /**
     * getFileList
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    List<EduMap> checkRcmnd(DataMap data) throws Exception;
    
    /**
     * getTopDiscussList
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getTopDiscussList(DataMap data) throws Exception;
    
    /**
     * getTopDiscussListCount
     *
     * @param data
     * @return
     * @throws Exception
     */
    int getTopDiscussListCount(DataMap data) throws Exception;
    
    /**
     * getDiscussList
     *
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getDiscussList(DataMap data) throws Exception;
    
    /**
     * 토론파일 다운 카운트증가
     *
     * @param data
     * @return
     * @throws Exception
     */
    void updateDiscussFileCount(DataMap data) throws Exception;
    
    /**
     * getDeleteCheck
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getDeleteCheck(DataMap data) throws Exception;
    
}

