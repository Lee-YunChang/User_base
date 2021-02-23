package com.webapp.classdesk.mapper;

import java.util.List;
import java.util.Map;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

/**
 * Description : Classdesk TutorResult Mapper
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Mapper("classdeskTutorResultMapper")
public interface ClassdeskTutorResultMapper {
	
	/**
	 * 목록 호출
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getLeCourseUSerList(DataMap data) throws Exception;
	
	/**
	 * 상시과정 목록 호출
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	List<EduMap> getLeCourseAlwaysUSerList(DataMap data) throws Exception;
	
	/**
	 * updateLeCourseUserInfo
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateLeCourseUserInfo(DataMap data) throws Exception;
	
	/**
	 * updateLeCourseUserRankInfo
	 * 
	 * @param data
	 * @throws Exception
	 */
	void updateLeCourseUserRankInfo(DataMap data) throws Exception;
	
	/**
	 * getEdCourseInfo
	 * 
	 * @param data
	 * @return
	 * @throws Exception
	 */
	EduMap getEdCourseInfo(DataMap data) throws Exception;
	
	/**
	 * courseCompExec
	 * 
	 * @param data
	 * @throws Exception
	 */
	void courseCompExec(Map data) throws Exception;
	
	/**
	 * cuserCompExec
	 * 
	 * @param data
	 * @throws Exception
	 */
	void cuserCompExec(Map data) throws Exception;
}
