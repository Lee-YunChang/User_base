package com.webapp.academy.service.impl;

import java.io.File;
import java.util.List;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.FileUploadUtil;
import com.sangs.support.SangsProperties;
import com.sangs.util.FileUtil;
import com.sangs.util.ParamUtil;
import com.webapp.academy.mapper.BoardMapper;
import com.webapp.academy.mapper.CounselorMapper;
import com.webapp.academy.service.BoardService;
import com.webapp.academy.service.CounselorService;

/**
 * Description : Board Service Impl
 *
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

@Service("counselorService")
public class CounselorServiceImpl implements CounselorService {

    @Resource(name = "counselorMapper")
    private CounselorMapper counselorMapper;

    private Logger      log = LogManager.getLogger(this.getClass());

    /**
     * 재무상담 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPersonalCounselorList(DataMap data) throws Exception {
    	data.setInt("rowCount", 10);
        ParamUtil.setPagingValue(data);
        return counselorMapper.getPersonalCounselorList(data);
    }
    
    /**
     * 재무상담 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getPersonalCounselorListCnt(DataMap data) throws Exception {
        return counselorMapper.getPersonalCounselorListCnt(data);
    }
    
    /**
     * 게시판 내용보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCounselorBoardView(DataMap data) throws Exception{
    	return counselorMapper.getCounselorBoardView(data);
    }
    
    /**
     * 게시판 파일 정보
     *
     * @param fileNo
     * @return
     * @throws Exception
     */
    public List<EduMap> getFileList(int fileNo) throws Exception {
        return counselorMapper.getFileList(fileNo);
    }
    
    /**
     * 재무상담 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void insertCounselUserInfo(DataMap data) throws Exception {
        counselorMapper.insertCounselUserInfo(data);
    }
    
    /**
     * 재무상담 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getOpenCounselorList(DataMap data) throws Exception {
    	data.setInt("rowCount", 10);
        ParamUtil.setPagingValue(data);
        return counselorMapper.getOpenCounselorList(data);
    }
    
    /**
     * 재무상담 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getOpenCounselorListCnt(DataMap data) throws Exception {
        return counselorMapper.getOpenCounselorListCnt(data);
    }
    
    /**
     * 게시판 내용보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getCounselorOpenBoardView(DataMap data) throws Exception{
    	return counselorMapper.getCounselorOpenBoardView(data);
    }
}
