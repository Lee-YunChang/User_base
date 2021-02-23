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
import com.webapp.academy.service.BoardService;

/**
 * Description : Board Service Impl
 *
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

@Service("boardService")
public class BoardServiceImpl implements BoardService {

    @Resource(name = "boardMapper")
    private BoardMapper boardMapper;

    private Logger      log = LogManager.getLogger(this.getClass());

    /**
     * 게시판 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getBoardList(DataMap data) throws Exception {
    	data.setInt("rowCount", 10);
        ParamUtil.setPagingValue(data);
        return boardMapper.getBoardList(data);
    }
    
    /**
     * 게시판 리스트 카운트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getBoardListCnt(DataMap data) throws Exception {
        return boardMapper.getBoardListCnt(data);
    }

    /**
     * TOP 게시글
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getTopBoardList(DataMap data) throws Exception {
        return boardMapper.getTopBoardList(data);
    }
    
    /**
     * 게시판 최근 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLateBoardList(DataMap data) throws Exception {
    	return boardMapper.getLateBoardList(data);
    }

    /**
     * 게시판 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertBoardInfo(HttpServletRequest request, DataMap data) throws Exception {

        data.setInt("bbsNo", boardMapper.getMaxBoardNo(data));

        boardMapper.insertBoardInfo(data);

        insertEdDataFile(request, data);
    }

    /**
     * 게시판 MAX KEY 검색
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getMaxBoardNo(DataMap data) throws Exception {
        return boardMapper.getMaxBoardNo(data);
    }

    /**
     * 게시판 내용보기 (팝업)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getMainPopBoardView(DataMap data) throws Exception {
        return boardMapper.getMainPopBoardView(data);
    }
    
    /**
     * 게시판 카운트 (팝업)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getMainPopBoardCount(DataMap data) throws Exception {
        return boardMapper.getMainPopBoardCount(data);
    }
    
    /**
     * 게시판 내용보기 (상시설문)
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMainPollPopBoardView(DataMap data) throws Exception {
        return boardMapper.getMainPollPopBoardView(data);
    }

    /**
     * 참여여부 확인
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getPollInfoData(DataMap data) throws Exception {
        return boardMapper.getPollInfoData(data);
    }
    
    /**
     * 게시판 내용보기
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getBoardView(DataMap data) throws Exception {
        return boardMapper.getBoardView(data);
    }

    /**
     * 이전 게시물 리스트 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getBbsPrevData(DataMap data) throws Exception {
        return boardMapper.getBbsPrevData(data);
    }
    /**
     * 다음 게시물 리스트 조회
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getBbsNextData(DataMap data) throws Exception {
        return boardMapper.getBbsNextData(data);
    }
    /**
     * 게시판 카테고리 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getBoardCategoryList(DataMap data) throws Exception {
        return boardMapper.getBoardCategoryList(data);
    }

    /**
     * 게시판 VIEW COUNT 갱신
     *
     * @param data
     * @throws Exception
     */
    public void updateBoardViewCnt(DataMap data) throws Exception {
        boardMapper.updateBoardViewCnt(data);
    }

    /**
     * 게시판 정보 갱신
     *
     * @param data
     * @throws Exception
     */
    public void updateBoardInfo(HttpServletRequest request, DataMap data) throws Exception {
        data.putString("execFlag", "UPDATE");

        boardMapper.updateBoardInfo(data);
        
        insertEdDataFile(request, data);

    }

    /**
     * 게시판 정보 삭제
     *
     * @param data
     * @throws Exception
     */
    public void deleteBoardInfo(DataMap data) throws Exception {
        this.deleteFileInfo(data);
        boardMapper.deleteBoardInfo(data);
    }

    /**
     * 강사 소통게시판 정보 삭제
     *
     * @param data
     * @throws Exception
     */
    public void tutorDeleteBoardInfo(DataMap data) throws Exception{
         boardMapper.deleteBoardInfo(data);
    }
    
    
    /**
     * 게시판 파일 정보
     *
     * @param fileNo
     * @return
     * @throws Exception
     */
    public EduMap getFileInfo(int fileNo) throws Exception {
        return boardMapper.getFileInfo(fileNo);
    }

    /**
     * 게시판 파일 삭제
     *
     * @param data
     * @throws Exception
     */
    public void deleteFileInfo(DataMap data) throws Exception {

        List fileList = boardMapper.getFileList(data.getInt("bbsNo"));
        if (fileList != null) {

            for (int i = 0; i < fileList.size(); i++) {

                EduMap fileInfo = (EduMap)fileList.get(i);
                FileUtil.deleteFile(fileInfo.getString("SAVPATH") + File.separator + fileInfo.getString("SAVFILE"));

                data.setInt("oFileNo", fileInfo.getInt("FILENO"));

                boardMapper.deleteFileInfo(data);

            }

        }
    }
    /**
     * 게시글 파일 등록
    *
    * @param data
    * @return
    * @throws Exception
    */
	public void insertEdDataFile(HttpServletRequest request , DataMap data)throws Exception{
		
		if (ServletFileUpload.isMultipartContent(request)) {
           MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
           FileUploadUtil uploadUtil = new FileUploadUtil();
           String path = request.getParameter("UPLOAD_DIR").toString() +  "/" +  data.getString("bbsNo");
           request.setAttribute("UPLOAD_DIR", path);
           data.putAll(uploadUtil.fileUpload(request, SangsProperties.getProperty("Globals.addFileRootPath"), Integer.parseInt(SangsProperties.getProperty("Globals.addFileMaxSize"))));
       }
		
       int fileCnt = data.getInt("UPLOAD_FILE_CNT");
       int fileTempCnt = data.getInt("UPLOAD_FILE_TMP");
       if (fileCnt != fileTempCnt) {
           data.putString("rMsg", "등록 불가 파일을 제거후 등록 하였습니다.");
       }
       if(data.getString("qu").equals("update")){
       	String delCheckFile = data.getString("delNum");
   		StringTokenizer str = new StringTokenizer(delCheckFile ,",");
   		//기존파일 삭제
   		while(str.hasMoreTokens()) {
   			data.setString("oFileNo", str.nextToken());
   			boardMapper.deleteFileInfo(data);
   		}
       }
		
       for (int i = 0; i < fileCnt; i++) {
           DataMap fileMap = (DataMap)data.get("UPLOAD_FILE");
           DataMap paramFileMap = new DataMap();
           paramFileMap.setString("bbsNo", data.getString("bbsNo"));
           paramFileMap.setString("uploadFileOrgName", fileMap.get("uploadFileOrgName", i).toString());
           paramFileMap.setString("uploadFileSaveName", fileMap.get("uploadFileSaveName", i).toString());
           paramFileMap.setInt("uploadFileSize", Integer.parseInt(fileMap.get("uploadFileSize", i).toString()));
           paramFileMap.setString("uploadFileFulltPath",fileMap.get("uploadFileFulltPath", i).toString());
           paramFileMap.setString("uploadFileExt", fileMap.get("uploadFileExt", i).toString());
           
           String uploadFileExt =  fileMap.get("uploadFileExt", i).toString();
           if(uploadFileExt.equals("gif") || uploadFileExt.equals("png") || uploadFileExt.equals("jpeg") || uploadFileExt.equals("bmp") || uploadFileExt.equals("jpg")) {
       	    paramFileMap.setString("fgubun", "IMG");
           } else if (uploadFileExt.equals("mp4") || uploadFileExt.equals("mp3")) {
           	paramFileMap.setString("fgubun", "VIDEO");
           }

           boardMapper.insertEdDataFile(paramFileMap);
       }
	}
    
    
    
    /**
     * 게시판 파일 저장
     *
     * @param data
     * @throws Exception
     */
    public void insertFileInfo(HttpServletRequest request, DataMap data) throws Exception {

        if (ServletFileUpload.isMultipartContent(request)) {

            MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request;
            boolean fileEmptyChk = mRequest.getFile(mRequest.getFileNames().next()).isEmpty();
            if(data.containsKey("execFlag") &&"UPDATE".equals(data.getString("execFlag"))&& fileEmptyChk == false) {

                List fileList = boardMapper.getFileList(data.getInt("bbsNo"));
                if(fileList != null){
                    for(int i=0; i<fileList.size(); i++){

                        EduMap fileInfo = (EduMap)fileList.get(i);
                        FileUtil.deleteFile(fileInfo.getString("SAVPATH") + File.separator + fileInfo.getString("SAVFILE"));

                        data.setInt("oFileNo", fileInfo.getInt("FILENO"));
                        boardMapper.deleteFileInfo(data);
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

            boardMapper.insertFileInfo(paramFileMap);
        }

    }

    /**
     * 게시판 파일 리스트
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public List<EduMap> getFileList(int bbsNo) throws Exception {
        return boardMapper.getFileList(bbsNo);
    }

   
    /**
     * 배너 목록
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public List<EduMap> getBannerList(DataMap data) throws Exception {
        return boardMapper.getBannerList(data);
    }
    
    /**
     * 자주묻는질문 조회수 업데이트
     *
     * @param data
     * @throws Exception
     */
    public void getCountUpdate(DataMap data) throws Exception {
        boardMapper.getCountUpdate(data);
    }
    
    /**
     * 증가된 카운트 조회
     *
     * @param bbsNo
     * @return
     * @throws Exception
     */
    public int getNewCount(DataMap data) throws Exception{
        return boardMapper.getNewCount(data);
    }
    
    
	
	/**
     * 게시판 리스트
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getFaqBoardList(DataMap data) throws Exception {
        return boardMapper.getFaqBoardList(data);
    }
    
    
    /**
     * 게시판 정보 갱신
     *
     * @param data
     * @throws Exception
     */
    public void updateCounselAnInfo(HttpServletRequest request, DataMap data) throws Exception {
        data.putString("execFlag", "UPDATE");

        boardMapper.updateCounselAnInfo(data);
        
        insertEdDataFile(request, data);

    }
}
