package com.webapp.classdesk.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.mapper.ClassdeskTutorResultMapper;
import com.webapp.classdesk.service.ClassdeskTutorResultService;
import com.webapp.common.component.EmsManager;
import com.webapp.common.vo.SendMailVO;
import com.webapp.common.vo.SendMsgVO;

/**
 * Description : Classdesk TutorResult Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskTutorResultService")
public class ClassdeskTutorResultServiceImpl implements ClassdeskTutorResultService {

    @Resource(name = "classdeskTutorResultMapper")
    private ClassdeskTutorResultMapper classdeskTutorResultMapper;

    @Resource(name = "emsManager")
    private EmsManager                 emsManager;

    private Logger                     log = LogManager.getLogger(this.getClass());

    /**
     * 목록 호출
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeCourseUSerList(DataMap data) throws Exception {
        return classdeskTutorResultMapper.getLeCourseUSerList(data);
    }

    /**
     * 상시과정 목록 호출
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLeCourseAlwaysUSerList(DataMap data) throws Exception {
        ParamUtil.setPagingValue(data);
        return classdeskTutorResultMapper.getLeCourseAlwaysUSerList(data);
    }

    /**
     * updateLeCourseUserInfo
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeCourseUserInfo(DataMap data) throws Exception {
        classdeskTutorResultMapper.updateLeCourseUserInfo(data);
    }

    /**
     * updateLeCourseUserRankInfo
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeCourseUserRankInfo(DataMap data) throws Exception {
        classdeskTutorResultMapper.updateLeCourseUserRankInfo(data);
    }

    /**
     * getEdCourseInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getEdCourseInfo(DataMap data) throws Exception {
        return classdeskTutorResultMapper.getEdCourseInfo(data);
    }

    /**
     * courseCompExec
     * 
     * @param data
     * @throws Exception
     */
    public void courseCompExec(Map data) throws Exception {
        classdeskTutorResultMapper.courseCompExec(data);
    }

    /**
     * cuserCompExec
     * 
     * @param data
     * @throws Exception
     */
    public void cuserCompExec(Map data) throws Exception {
        classdeskTutorResultMapper.cuserCompExec(data);
    }

    /**
     * 수강자별 성적 실행
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void resultExec(HttpServletRequest request, DataMap data) throws Exception {
        int itemCnt = request.getParameterValues("cuserNo").length;

        if (itemCnt > 0) {
            for (int i = 0; i < itemCnt; i++) {

                data.set("cuserNo", ParamUtil.getStrParam(request.getParameterValues("cuserNo")[i]));
                data.set("progressVal", ParamUtil.getStrParam(request.getParameterValues("progressVal")[i]));

                data.set("reportVal", ParamUtil.getStrParam(request.getParameterValues("reportVal")[i]));

                data.set("examMtVal", ParamUtil.getStrParam(request.getParameterValues("examMtVal")[i]));
                data.set("examFinalVal", ParamUtil.getStrParam(request.getParameterValues("examFinalVal")[i]));
                data.set("attendVal", ParamUtil.getStrParam(request.getParameterValues("attendVal")[i]));
                data.set("ispass", ParamUtil.getStrParam(request.getParameterValues("ispass")[i]));
                data.set("finalVal", ParamUtil.getStrParam(request.getParameterValues("finalVal")[i]));
                data.set("rank", ParamUtil.getStrParam(request.getParameterValues("rank")[i]));

                updateLeCourseUserInfo(data);
            }

        }
    }

    /**
     * 전체 성적 실행(최종반영)
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void resultFinalExec(HttpServletRequest request, DataMap data) throws Exception {
        int itemCnt = request.getParameterValues("cuserNo").length;
        Map hashMap = new HashMap();

        if (itemCnt > 0) {
            for (int i = 0; i < itemCnt; i++) {
                data.set("cuserNo", ParamUtil.getStrParam(request.getParameterValues("cuserNo")[i]));
                data.set("progressVal", ParamUtil.getStrParam(request.getParameterValues("progressVal")[i]));
                data.set("reportVal", ParamUtil.getStrParam(request.getParameterValues("reportVal")[i]));
                data.set("examMtVal", ParamUtil.getStrParam(request.getParameterValues("examMtVal")[i]));
                data.set("examFinalVal", ParamUtil.getStrParam(request.getParameterValues("examFinalVal")[i]));
                data.set("attendVal", ParamUtil.getStrParam(request.getParameterValues("attendVal")[i]));
                data.set("ispass", ParamUtil.getStrParam(request.getParameterValues("ispass")[i]));
                data.set("finalVal", ParamUtil.getStrParam(request.getParameterValues("finalVal")[i]));
                data.set("rank", ParamUtil.getStrParam(request.getParameterValues("rank")[i]));

                updateLeCourseUserInfo(data);
            }
        }

        /*******************************************************************************************
         수료로직 실행 
        *******************************************************************************************/
        hashMap.put("P_COURSENO", data.getInt("SES_COURSENO"));
        hashMap.put("P_CSEQNO", data.getInt("SES_CSEQNO"));
        hashMap.put("R_RESULT", "");

        courseCompExec(hashMap);

        /*******************************************************************************************
         탬플릿 기반 메일 발송 모듈 코드  메일 발송 
         > 이러닝 과정일 경우에만 발송 
        *******************************************************************************************/
        // 강의형태 및 템플릿 필요 정보 조회

        EduMap courseInfoMap = getEdCourseInfo(data);

        String mtCtypeCode = courseInfoMap.getString("MT_CTYPE_CODE"); // 강의형태 

        // 온라인 과정일 경우 메일 및 sms 발송 
        if (mtCtypeCode.equals(SangsProperties.getProperty("Globals.mtCode_MT_CTYPE_CODE_ONLINE"))) {
            try {
                DataMap mailTplMap = new DataMap();

                mailTplMap.add("SEQ1", courseInfoMap.getString("SEQ_TITLE")); // SEQ는 1부터 시작. 
                mailTplMap.set("TPL_UID", SangsProperties.getProperty("Globals.tplUid_CLASSDESK_COMP_EXEC")); // 템플릿 고유번호  113

                List<SendMailVO> sendMailList = new ArrayList<SendMailVO>();

                for (int i = 0; i < itemCnt; i++) {
                    SendMailVO mailVo = new SendMailVO();
                    mailVo.setRecUserid(request.getParameterValues("recUserList")[i].split("/")[0]);
                    mailVo.setReceiver_alias(request.getParameterValues("recUserList")[i].split("/")[1]);
                    mailVo.setRecEmail(request.getParameterValues("recUserList")[i].split("/")[2]);

                    mailVo.setWriterUserid(data.getString("SES_USERID"));
                    mailVo.setWriterUsername(data.getString("SES_USERNAME"));
                    sendMailList.add(mailVo);
                }

                // 발송 manager 실행  
                emsManager.sendMailProc(mailTplMap, sendMailList);
            } catch (Exception e) { log.debug(e.getMessage());
                 
            }
            /*******************************************************************************************
             	탬플릿 기반 SMS 발송 모듈 코드 
            *******************************************************************************************/
            try {
                DataMap msgTplMap = new DataMap();

                msgTplMap.add("SEQ1", courseInfoMap.getString("SEQ_TITLE"));
                msgTplMap.set("TPL_UID", SangsProperties.getProperty("Globals.tplUid_CLASSDESK_COMP_EXEC"));

                List<SendMsgVO> sendMsgList = new ArrayList<SendMsgVO>();

                for (int i = 0; i < itemCnt; i++) {
                    SendMsgVO msgVo = new SendMsgVO();
                    msgVo.setRecUserid(request.getParameterValues("recUserList")[i].split("/")[0]); // 받는사람 아이디
                    msgVo.setRecUsername(request.getParameterValues("recUserList")[i].split("/")[1]); // 받는사람 이름
                    msgVo.setRcvphns(request.getParameterValues("recUserList")[i].split("/")[3]); // 받는사람 핸드폰 번호

                    msgVo.setSendUserid(data.getString("SES_USERID"));
                    sendMsgList.add(msgVo);
                }

                emsManager.sendMsgProc(msgTplMap, sendMsgList);
            } catch (Exception e) { log.debug(e.getMessage());
                 
            }
        }
    }

    /**
     * 상시 전체 성적 실행
     * 
     * @param request
     * @param data
     * @param isFinal
     * @throws Exception
     */
    public void resultAlwaysExec(HttpServletRequest request, DataMap data, boolean isFinal) throws Exception {

        Map<String, Object> hashMap = null;

        int itemCnt = request.getParameterValues("cuserNo").length;

        int checkedCnt = request.getParameterValues("resultChecked").length;

        String[] resultCheckeds = request.getParameterValues("resultChecked");

        try {

            if (data.containsKey("resultChecked")) {
                if (checkedCnt > 0) {

                    for (int i = 0; i < checkedCnt; i++) {

                        for (int j = 0; j < itemCnt; j++) {

                            if (ParamUtil.getIntParam(resultCheckeds[i]) == j) {


                                data.set("cuserNo", ParamUtil.getStrParam(request.getParameterValues("cuserNo")[j]));
                                data.set("progressVal", ParamUtil.getStrParam(request.getParameterValues("progressVal")[j]));
                                data.set("reportVal", ParamUtil.getStrParam(request.getParameterValues("reportVal")[j]));
                                data.set("examMtVal", ParamUtil.getStrParam(request.getParameterValues("examMtVal")[j]));
                                data.set("examFinalVal", ParamUtil.getStrParam(request.getParameterValues("examFinalVal")[j]));
                                data.set("attendVal", ParamUtil.getStrParam(request.getParameterValues("attendVal")[j]));
                                data.set("ispass", ParamUtil.getStrParam(request.getParameterValues("ispass")[j]));
                                data.set("finalVal", ParamUtil.getStrParam(request.getParameterValues("finalVal")[j]));
                                data.set("rank", ParamUtil.getStrParam(request.getParameterValues("rank")[j]));

                                updateLeCourseUserInfo(data);

                                /** * 최종성적 반영인 경우에만 수료증 프로시저 호출  */

                                if (isFinal) {

                                    hashMap = new HashMap<String, Object>();

                                    hashMap.put("P_COURSENO", data.getInt("SES_COURSENO"));
                                    hashMap.put("P_CSEQNO", data.getInt("SES_CSEQNO"));
                                    hashMap.put("P_CUSERNO", ParamUtil.getIntParam(request.getParameterValues("cuserNo")[j]));
                                    hashMap.put("R_RESULT", "");


                                    //프로시저
                                    cuserCompExec(hashMap);


                                }
                            }
                        }
                    }

                    data.putString("rMsg", "정상적으로  처리되었습니다.");
                    data.putString("rScript", "fnList()");
                }
            }

        } catch (Exception ex) {
            throw new Exception(ex);
        } finally {

            // 강의형태 및 템플릿 필요 정보 조회
            EduMap courseInfoMap = (EduMap)getEdCourseInfo(data);

            for (int i = 0; i < checkedCnt; i++) {

                for (int j = 0; j < itemCnt; j++) {

                    if (ParamUtil.getIntParam(resultCheckeds[i]) == j) {

                        if (isFinal) {

                            try {

                                /*******************************************************************************************
                                 탬플릿 기반 메일 발송 모듈 코드  메일 발송 
                                 > 이러닝 과정일 경우에만 발송 
                                *******************************************************************************************/
                                DataMap mailTplMap = new DataMap();

                                mailTplMap.add("SEQ1", courseInfoMap.getString("SEQ_TITLE")); // SEQ는 1부터 시작. 
                                mailTplMap.set("TPL_UID", SangsProperties.getProperty("Globals.tplUid_CLASSDESK_COMP_EXEC")); // 템플릿 고유번호 

                                List<SendMailVO> sendMailList = new ArrayList<SendMailVO>();

                                SendMailVO mailVo = new SendMailVO();
                                mailVo.setRecUserid(request.getParameterValues("recUserList")[j].split("/")[0]);
                                mailVo.setReceiver_alias(request.getParameterValues("recUserList")[j].split("/")[1]);
                                mailVo.setRecEmail(request.getParameterValues("recUserList")[j].split("/")[2]);
                                mailVo.setWriterUserid(data.getString("SES_USERID"));
                                mailVo.setWriterUsername(data.getString("SES_USERNAME"));


                                sendMailList.add(mailVo);

                                // 발송 manager 실행  
                                emsManager.sendMailProc(mailTplMap, sendMailList);

                                /*******************************************************************************************
                                 탬플릿 기반 SMS 발송 모듈 코드 
                                 *******************************************************************************************/
                                DataMap msgTplMap = new DataMap();

                                msgTplMap.add("SEQ1", courseInfoMap.getString("SEQ_TITLE"));
                                msgTplMap.set("TPL_UID", SangsProperties.getProperty("Globals.tplUid_CLASSDESK_COMP_EXEC"));

                                List<SendMsgVO> sendMsgList = new ArrayList<SendMsgVO>();

                                SendMsgVO msgVo = new SendMsgVO();
                                msgVo.setRecUserid(request.getParameterValues("recUserList")[j].split("/")[0]); // 받는사람 아이디
                                msgVo.setRecUsername(request.getParameterValues("recUserList")[j].split("/")[1]); // 받는사람 이름
                                msgVo.setRcvphns(request.getParameterValues("recUserList")[j].split("/")[3]); // 받는사람 핸드폰 번호

                                msgVo.setSendUserid(data.getString("SES_USERID"));


                                sendMsgList.add(msgVo);

                                emsManager.sendMsgProc(msgTplMap, sendMsgList);

                            } catch (Exception e) { log.debug(e.getMessage());
                            }

                        }
                    }
                }
            }

        }
    }
}
