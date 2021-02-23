package com.webapp.academy.service;

import java.util.List;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;

/**
 * Description : Main Service
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
public interface MainService {

    /**
     * 메인 수강 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    List<EduMap> getMainCourseAppList(DataMap data) throws Exception; 
    List<EduMap> getMainCourseList(DataMap data) throws Exception; 
    
    /**
     * 메인 날짜
     * 
     * @param data
     * @return
     * @throws Exception
     */
    EduMap getMainDateList(DataMap data) throws Exception;
}
