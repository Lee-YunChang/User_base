package com.webapp.classdesk.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
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
import com.webapp.classdesk.mapper.ClassdeskBoardMapper;
import com.webapp.classdesk.service.ClassdeskBoardService;

/**
 * Description : Classdesk Board Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskBoardService")
public class ClassdeskBoardServiceImpl implements ClassdeskBoardService {

    @Resource(name = "classdeskBoardMapper")
    private ClassdeskBoardMapper classdeskBoardMapper;

    private Logger               log = LogManager.getLogger(this.getClass());

    /**
     * getBoardList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getBoardList(DataMap data) throws Exception {
        return classdeskBoardMapper.getBoardList(data);
    }

    /**
     * insertBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    public void insertBoardInfo(DataMap data) throws Exception {
        classdeskBoardMapper.insertBoardInfo(data);
    }

    /**
     * getMaxBoardNo
     * 
     * @return
     * @throws Exception
     */
    public int getMaxBoardNo() throws Exception {
        return classdeskBoardMapper.getMaxBoardNo();
    }

    /**
     * getBoardView
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getBoardView(DataMap data) throws Exception {
        return classdeskBoardMapper.getBoardView(data);
    }

    /**
     * updateBoardViewCnt
     * 
     * @param data
     * @throws Exception
     */
    public void updateBoardViewCnt(DataMap data) throws Exception {
        classdeskBoardMapper.updateBoardViewCnt(data);
    }

    /**
     * updateBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    public void updateBoardInfo(DataMap data) throws Exception {
        classdeskBoardMapper.updateBoardInfo(data);
    }

    /**
     * deleteBoardInfo
     * 
     * @param data
     * @throws Exception
     */
    public void deleteBoardInfo(DataMap data) throws Exception {
        //첨부파일 리스트 삭제
        List fileList = getFileList(data);
        if (fileList != null) {
            try {
                for (int i = 0; i < fileList.size(); i++) {
                    EduMap fileInfo = (EduMap)fileList.get(i);
                    FileUtil.deleteFile(fileInfo.getString("SAVPATH") + File.separator + fileInfo.getString("SAVFILE"));

                    data.setInt("oFileNo", fileInfo.getInt("FILENO"));
                    deleteFileInfo(data);
                }
            } catch (FileNotFoundException e) {
            }

        }

        classdeskBoardMapper.deleteBoardInfo(data);
    }

    /**
     * getFileInfo
     * 
     * @param fileNo
     * @return
     * @throws Exception
     */
    public EduMap getBbsFileInfo(DataMap data) throws Exception {
        return classdeskBoardMapper.getBbsFileInfo(data);
    }

    /**
     * deleteFileInfo
     * 
     * @param data
     * @throws Exception
     */
    public void deleteFileInfo(DataMap data) throws Exception {
        classdeskBoardMapper.deleteFileInfo(data);
    }

    /**
     * insertFileInfo
     * 
     * @param data
     * @throws Exception
     */
    public void insertFileInfo(HttpServletRequest request, DataMap data) throws Exception {

        if (ServletFileUpload.isMultipartContent(request)) {
            MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
            boolean fileEmptyChk = mRequest.getFile(mRequest.getFileNames().next()).isEmpty();
            if (data.containsKey("execFlag") && "UPDATE".equals(data.getString("execFlag")) && fileEmptyChk == false) {

                List fileList = classdeskBoardMapper.getFileList(data);
                if (fileList != null) {
                    for (int i = 0; i < fileList.size(); i++) {

                        EduMap fileInfo = (EduMap)fileList.get(i);
                        FileUtil.deleteFile(fileInfo.getString("SAVPATH") + File.separator + fileInfo.getString("SAVFILE"));

                        data.setInt("oFileNo", fileInfo.getInt("FILENO"));
                        classdeskBoardMapper.deleteFileInfo(data);
                    }
                }

            }
            FileUploadUtil uploadUtil = new FileUploadUtil();
            data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
        }

        int fileCnt = data.getInt("UPLOAD_FILE_CNT");
        int fileTempCnt = data.getInt("UPLOAD_FILE_TMP");

        if (fileCnt != fileTempCnt) {
            data.putString("rMsg", "등록 불가 파일을 제거후 등록 하였습니다.");

        }

        for (int i = 0; i < fileCnt; i++) {
            DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");
            DataMap paramFileMap = new DataMap();
            paramFileMap.setString("uploadFileOrgName", fileMap.get("uploadFileOrgName", i).toString());
            paramFileMap.setString("uploadFileSaveName", fileMap.get("uploadFileSaveName", i).toString());
            paramFileMap.setInt("uploadFileSize", Integer.parseInt(fileMap.get("uploadFileSize", i).toString()));
            paramFileMap.setString("uploadFileFulltPath", fileMap.get("uploadFileFulltPath", i).toString());
            paramFileMap.set("bbsNo", data.getInt("bbsNo"));

            classdeskBoardMapper.insertFileInfo(paramFileMap);
        }
    }

    /**
     * getFileList
     * 
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public List<EduMap> getFileList(DataMap data) throws Exception {
        return classdeskBoardMapper.getFileList(data);
    }

    /**
     * getCourseBbsList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getCourseBbsList(DataMap data) throws Exception {
    	data.set("rowCount", "10");
        ParamUtil.setPagingValue(data);
        return classdeskBoardMapper.getCourseBbsList(data);
    }
    
    /**
     * getCourseBbsListCount
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public int getCourseBbsListCount(DataMap data) throws Exception {
        ParamUtil.setPagingValue(data);
        return classdeskBoardMapper.getCourseBbsListCount(data);
    }

    /**
     * saveBbs
     * 
     * @param data
     * @throws Exception
     */
    public void saveBbs(HttpServletRequest request, DataMap data) throws Exception {
    	int bbsNo = ParamUtil.getIntParam(data.getString("bbsNo"), 0);
        if (bbsNo > 0) {
            // update
            classdeskBoardMapper.updateBoardInfo(data);
            classdeskBoardMapper.updateFileBbsno(data);
        } else {
            // insert
            bbsNo = classdeskBoardMapper.getMaxBoardNo();
            data.setInt("bbsNo", bbsNo);
            classdeskBoardMapper.insertBoardInfo(data);
            classdeskBoardMapper.updateFileBbsno(data);
        }
    }
}
