package com.webapp.classdesk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk TutorDiscuss Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.08.19   황두은           최초작성
 *
 */
public interface ClassdeskTutorDiscussService {
	 /**
     * saveBbs
     * 
     * @param data
     * @throws Exception
     */
    void saveBbs(HttpServletRequest request, DataMap data) throws Exception;	
    
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
     * getRcmndCount
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
    void insertRcmndInfo(HttpServletRequest request, DataMap data) throws Exception;	
    
    /**
     * getRcmndCount
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




