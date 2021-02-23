package com.webapp.classdesk.service.impl;

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
import com.webapp.classdesk.mapper.ClassdeskTutorDiscussMapper;
import com.webapp.classdesk.service.ClassdeskTutorDiscussService;

/**
 * Description : Classdesk TutorDiscuss Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.08.19   황두은           최초작성
 *
 */
@Service("classdeskTutorDiscussService")
public class ClassdeskTutorDiscussServiceImpl implements ClassdeskTutorDiscussService {

    @Resource(name = "classdeskTutorDiscussMapper")
    private ClassdeskTutorDiscussMapper classdeskTutorDiscussMapper;

    protected Logger  log = LogManager.getLogger(this.getClass());

    
    /**
     * saveBbs
     * 
     * @param data
     * @throws Exception
     */
    public void saveBbs(HttpServletRequest request, DataMap data) throws Exception {
    	
        int bbsNo = ParamUtil.getIntParam(data.getString("bbsNo"), 0);
        // reply
    	if(data.getString("qu").equals("reply")) {
    		classdeskTutorDiscussMapper.insertDiscussReplyInfo(data);
    		
    		//파일등록을위해 등록한글의 bbsNo가져옴
    		bbsNo = classdeskTutorDiscussMapper.getBoardNo();
        	data.setInt("bbsNo", bbsNo);
    	}else if(data.getString("qu").equals("update")) {
    		// update
    		classdeskTutorDiscussMapper.updateBoardInfo(data);
    	}else if(data.getString("qu").equals("insert")){
	    	// insert
	    	bbsNo = classdeskTutorDiscussMapper.getMaxBoardNo();
	    	
	    	if(data.getString("refLevel").equals("")){
	    		data.setInt("refLevel", data.getInt("bbsNo"));
	    	}
	    	data.setInt("bbsNo", bbsNo);
	    	
	    	classdeskTutorDiscussMapper.insertDiscussInfo(data);
    	}
        
        if (ServletFileUpload.isMultipartContent(request)) {

            MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
            FileUploadUtil uploadUtil = new FileUploadUtil();
            data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
        }
        int fileCnt = data.getInt("UPLOAD_FILE_CNT");
        int fileTempCnt = data.getInt("UPLOAD_FILE_TMP");
        
        if (fileCnt != fileTempCnt) {
            data.putString("rMsg", "등록 불가 파일을 제거후 등록 하였습니다.");
        }

        if(data.getString("qu").equals("update") && fileCnt > 0 && data.containsKey("savePath")){
    		//기존파일 삭제
        	FileUtil.deleteFile(data.getString("savePath") + File.separator + data.getString("saveFile"));
        	classdeskTutorDiscussMapper.discussFileDelete(data);
        }
        for (int i = 0; i < fileCnt; i++) {
            DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");
            DataMap paramFileMap = new DataMap();
            paramFileMap.setString("bbsNo", data.getString("bbsNo"));
            paramFileMap.setString("uploadFileOrgName", fileMap.get("uploadFileOrgName", i).toString());
            paramFileMap.setString("uploadFileSaveName", fileMap.get("uploadFileSaveName", i).toString());
            paramFileMap.setInt("uploadFileSize", Integer.parseInt(fileMap.get("uploadFileSize", i).toString()));
            paramFileMap.setString("uploadFileFulltPath", fileMap.get("uploadFileFulltPath", i).toString());
            paramFileMap.setString("uploadFileExt", fileMap.get("uploadFileExt", i).toString());
            paramFileMap.setString("uploadSeq", Integer.toString((i+1)));
            
            classdeskTutorDiscussMapper.insertFileDiscuss(paramFileMap);
        }
    }    
    
    /**
     * getCourseDiscussList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCourseDiscussList(DataMap data) throws Exception {
        ParamUtil.setPagingValue(data);
        return classdeskTutorDiscussMapper.getCourseDiscussList(data);
    }
     
    /**
     * getDiscussView
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getDiscussRowView(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getDiscussRowView(data);
    }
    
    /**
     * getDiscussTopView
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getDiscussTopView(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getDiscussTopView(data);
    }
    
    /**
     * getFileList
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public EduMap getFileList(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getFileList(data);
    }
    
    /**
     * updateDiscussViewCnt
     * 
     * @param data
     * @throws Exception
     */
    public void updateDiscussViewCnt(DataMap data) throws Exception {
    	classdeskTutorDiscussMapper.updateDiscussViewCnt(data);
    }
    
    /**
     * deleteDiscussInfo
     * 
     * @param data
     * @throws Exception
     */
    public void deleteDiscussInfo(DataMap data) throws Exception {
    	//파일 정보조회
    	EduMap fileInfo = selectFileInfo(data);
    	
    	if(fileInfo != null){
    		data.setInt("fileId",fileInfo.getInt("FILE_ID"));
    		data.setInt("fileSeq",fileInfo.getInt("FILE_SEQ"));
    		data.setString("savPath",fileInfo.getString("SAVPATH"));
    		data.setString("savFile",fileInfo.getString("SAVFILE"));
    		
    		//DB 파일삭제 
    		deleteDiscussFile(data);
    		
    		//물리적경로 파일삭제
    		FileUtil.deleteFile(data.getString("savPath") + File.separator + data.getString("savFile"));
    	}
    	classdeskTutorDiscussMapper.deleteDiscussInfo(data);
    }
    
    /**
     * 파일정보 조회
     * 
     * @param data
     * @throws Exception
     */
    public EduMap selectFileInfo(DataMap data) throws Exception {
    	return classdeskTutorDiscussMapper.selectFileInfo(data);
    }
    
    /**
     * 파일삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deleteDiscussFile(DataMap data) throws Exception {
    	classdeskTutorDiscussMapper.deleteDiscussFile(data);
    }
    
    /**
     * getRcmndCount
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public List<EduMap> getRcmndCount(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getRcmndCount(data);
    }
    
    /**
     * getUnityMberno
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public String getUnityMberno(String unityId) throws Exception {
        return classdeskTutorDiscussMapper.getUnityMberno(unityId);
    }
    
    /**
     * insertRcmndInfo
     * 
     * @param data
     * @throws Exception
     */
    public void insertRcmndInfo(HttpServletRequest request, DataMap data) throws Exception {
    	classdeskTutorDiscussMapper.insertRcmndInfo(data);
    }  
    
    /**
     * getRcmndCount
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public List<EduMap> checkRcmnd(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.checkRcmnd(data);
    }
    
    /**
     *getTopDiscussList
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getTopDiscussList(DataMap data) throws Exception {
    	data.setInt("rowCount", 20);
        ParamUtil.setPagingValue(data);
        return classdeskTutorDiscussMapper.getTopDiscussList(data);
    }
    
    /**
     *getTopDiscussListCount
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getTopDiscussListCount(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getTopDiscussListCount(data);
    }
    
    /**
     *getDiscussList
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getDiscussList(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getDiscussList(data);
    }
    
    /**
     * 토론파일 다운 카운트증가
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void updateDiscussFileCount(DataMap data) throws Exception {
    	classdeskTutorDiscussMapper.updateDiscussFileCount(data);
    } 
    
    /**
     *getDeleteCheck
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getDeleteCheck(DataMap data) throws Exception {
        return classdeskTutorDiscussMapper.getDeleteCheck(data);
    }
}
