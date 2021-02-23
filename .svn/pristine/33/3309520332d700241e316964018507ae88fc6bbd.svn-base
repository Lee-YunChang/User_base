package com.webapp.academy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.webapp.academy.mapper.MainMapper;
import com.webapp.academy.service.MainService;

/**
 * Description : Main Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

@Service("mainService")
public class MainServiceImpl implements MainService { 

    @Resource(name = "mainMapper")
    private MainMapper mainMapper;

    /**
     * 메인 수강 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getMainCourseAppList(DataMap data) throws Exception {
        return mainMapper.getMainCourseAppList(data);
    }

    
    public List<EduMap> getMainCourseList(DataMap data) throws Exception {
        return mainMapper.getMainCourseList(data);
    }

    
    /**
     * 메인 날짜
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMainDateList(DataMap data) throws Exception {
        return mainMapper.getMainDateList(data);
    }

}
