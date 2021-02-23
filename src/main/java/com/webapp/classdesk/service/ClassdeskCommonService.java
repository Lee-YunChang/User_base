package com.webapp.classdesk.service;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Classdesk Common Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface ClassdeskCommonService {
	
	/**
	 * getLeReportFileList
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getLeReportFileList(DataMap data) throws Exception;
	
	/**
	 * getLeReportApplyFileList
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getLeReportApplyFileList(DataMap data) throws Exception;
	
	/**
	 * getCuserNo
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getCuserNo(DataMap data) throws Exception;
	
	/**
	 * getMailRecInfo
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getMailRecInfo(DataMap data) throws Exception;
	
	/**
	 * getEdCourseSeqInfo
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getEdCourseSeqInfo(DataMap data) throws Exception;
	
	/**
	 * getQuizFileInfo
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getQuizFileInfo(DataMap data) throws Exception;
}
