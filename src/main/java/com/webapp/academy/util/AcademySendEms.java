package com.webapp.academy.util;

import java.util.List;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.DateUtil;
import com.sangs.util.StringUtil;
import com.webapp.common.component.EmsManager;
import com.webapp.common.service.CommonSendMailService;
import com.webapp.common.service.CommonSendMsgService;
import com.webapp.common.vo.SendMailVO;
import com.webapp.common.vo.SendMsgVO;

@Component("academySendEms")
public class AcademySendEms {

    private static Logger         log = LogManager.getLogger(AcademySendEms.class);

    @Resource(name = "emsManager")
    private EmsManager            emsManager;

    @Resource(name = "commonSendMailService")
    private CommonSendMailService commonSendMailService;

    @Resource(name = "commonSendMsgService")
    private CommonSendMsgService  commonSendMsgService;

    /**
     * 일반과정 신청
     * @param sm 
     * @param rMap
     * @param eMap
     */
    public void sendCourseApply(DataMap rMap, EduMap eMap) {
        try {
            
        	/*******************************************************************************************
             	탬플릿 기반 메일 발송 모듈 코드  메일 발송 
            *******************************************************************************************/

            DataMap mailTplMap = new DataMap();

            mailTplMap.setString("TPL_UID", "SGBANK".equals(rMap.getString("mtPmPayCode")) ? SangsProperties.getProperty("Globals.tplUid_USER_COURSE_APPLY_WAIT") : SangsProperties.getProperty("Globals.tplUid_USER_COURSE_APPLY_COMP"));// 템플릿 고유번호
            mailTplMap.add("SEQ1", rMap.getString("SES_USERNAME") + "(" + rMap.getString("SES_USERID") + ")"); //신청자
            mailTplMap.add("SEQ2", eMap.getString("SEQ_TITLE")); //신청과정명
            mailTplMap.add("SEQ3", eMap.getString("STR_STUDY_SDATE") + " ~ " + eMap.getString("STR_STUDY_EDATE")); //교육기간
            mailTplMap.add("SEQ4", DateUtil.getNowDate()); //신청일/ 결제일
            mailTplMap.add("SEQ5", StringUtil.numberCommaFormat(rMap.getInt("price")) + "원"); //금액


            SendMailVO mailVo = new SendMailVO();
            mailVo.setRecEmail(rMap.getString("buyeremail")); // 받는사람 메일 주소
            mailVo.setReceiver_alias(rMap.getString("SES_USERNAME")); // 받는사람 이름
            mailVo.setRecUserid(rMap.getString("SES_USERID")); // 받는사람 아이디 
            mailVo.setWriterUserid(rMap.getString("SES_USERID"));
            mailVo.setWriterUsername(rMap.getString("SES_USERNAME"));

            emsManager.sendMailProc(mailTplMap, mailVo);

            /*******************************************************************************************
             	탬플릿 기반 SMS 발송 모듈 코드 
            *******************************************************************************************/
            DataMap msgTplMap = new DataMap();

            msgTplMap.setString("TPL_UID", "SGBANK".equals(rMap.getString("mtPmPayCode")) ? SangsProperties.getProperty("Globals.tplUid_USER_COURSE_APPLY_WAIT") : SangsProperties.getProperty("Globals.tplUid_USER_COURSE_APPLY_COMP"));// 템플릿 고유번호

            SendMsgVO msgVo = new SendMsgVO();
            msgVo.setRcvphns(StringUtil.replaceStr(rMap.getString("buyertel"), "-", ""));
            msgVo.setRecUsername(rMap.getString("SES_USERNAME")); // 받는사람 이름
            msgVo.setRecUserid(rMap.getString("SES_USERID")); // 받는사람 아이디 
            msgVo.setSendUserid(rMap.getString("SES_USERID"));
            emsManager.sendMsgProc(msgTplMap, msgVo);

        } catch (Exception ex) {
             
        }
    }

    /**
     * 일반과정 수강취소
     * @param sm
     * @param rMap
     */
    public void sendCourseApplyCancel(DataMap rMap) {
        try {
            /*******************************************************************************************
             	탬플릿 기반 메일 발송 모듈 코드  메일 발송 
            *******************************************************************************************/

            DataMap mailTplMap = new DataMap();

            mailTplMap.setString("TPL_UID", SangsProperties.getProperty("Globals.tplUid_COURSE_CANCLE"));// 템플릿 고유번호
            mailTplMap.add("SEQ1", rMap.getString("seqTitle")); //과정명
            mailTplMap.add("SEQ2", rMap.getString("seqTitle")); //과정명
            mailTplMap.add("SEQ3", DateUtil.getNowDate()); //취소일
            mailTplMap.add("SEQ4", SangsProperties.getProperty("Globals.domain"));

            SendMailVO mailVo = new SendMailVO();
            mailVo.setRecEmail(rMap.getString("SES_EMAIL")); // 받는사람 메일 주소
            mailVo.setReceiver_alias(rMap.getString("SES_USERNAME")); // 받는사람 이름
            mailVo.setRecUserid(rMap.getString("SES_USERID")); // 받는사람 아이디 

            mailVo.setWriterUserid(rMap.getString("SES_USERID"));
            mailVo.setWriterUsername(rMap.getString("SES_USERNAME"));

            emsManager.sendMailProc(mailTplMap, mailVo);

            /*******************************************************************************************
             	탬플릿 기반 SMS 발송 모듈 코드 
            *******************************************************************************************/
            DataMap msgTplMap = new DataMap();

            msgTplMap.setString("TPL_UID", SangsProperties.getProperty("Globals.tplUid_COURSE_CANCLE"));// 템플릿 고유번호
            SendMsgVO msgVo = new SendMsgVO();
            msgVo.setRcvphns(StringUtil.replaceStr(rMap.getString("SES_MOBILE"), "-", ""));
            msgVo.setRecUsername(rMap.getString("SES_USERNAME")); // 받는사람 이름
            msgVo.setRecUserid(rMap.getString("SES_USERID")); // 받는사람 아이디 
            msgVo.setSendUserid(rMap.getString("SES_USERID"));
            emsManager.sendMsgProc(msgTplMap, msgVo);

        } catch (Exception ex) {
             
        }
    }

    /**
     * 전산화이전 수료증 발급신청
     * @param sm
     * @param rMap
     */
    public void sendOldCompApply(DataMap rMap) {
        try {
            /*******************************************************************************************
             	탬플릿 기반 메일 발송 모듈 코드  메일 발송 
            *******************************************************************************************/

            DataMap mailTplMap = new DataMap();

            mailTplMap.setString("TPL_UID", SangsProperties.getProperty("Globals.tplUid_USER_CERT_APPLY"));// 템플릿 고유번호
            mailTplMap.add("SEQ1", rMap.getString("applyCompName"));
            mailTplMap.add("SEQ2", rMap.getString("studySdate") + " ~ " + rMap.getString("studyEdate")); //교육기간
            mailTplMap.add("SEQ3", DateUtil.getNowDate()); //신청일

            SendMailVO mailVo = new SendMailVO();
            mailVo.setRecEmail(rMap.getString("mail")); // 받는사람 메일 주소
            mailVo.setReceiver_alias(rMap.getString("SES_USERNAME")); // 받는사람 이름
            mailVo.setRecUserid(rMap.getString("SES_USERID")); // 받는사람 아이디 
            mailVo.setWriterUserid(rMap.getString("SES_USERID"));
            mailVo.setWriterUsername(rMap.getString("SES_USERNAME"));

            emsManager.sendMailProc(mailTplMap, mailVo);

        } catch (Exception ex) {
             
        }
    }

    /**
     * 환불신청 
     * @param sm
     * @param rMap
     */
    public void sendRepayApply(DataMap rMap) {
        try {
            /*******************************************************************************************
             	탬플릿 기반 메일 발송 모듈 코드  메일 발송 
            *******************************************************************************************/

            DataMap mailTplMap = new DataMap();

            mailTplMap.setString("TPL_UID", SangsProperties.getProperty("Globals.tplUid_USER_REPAY_APPLY"));// 템플릿 고유번호
            mailTplMap.add("SEQ1", rMap.getString("applyRepayName")); //과정명
            mailTplMap.add("SEQ2", StringUtil.numberCommaFormat(rMap.getInt("applyPrc")) + "원"); //환불금액
            mailTplMap.add("SEQ3", rMap.getString("mtRepayReasonCode").equals(SangsProperties.getProperty("Globals.mtCode_MT_REPAY_REASON_ETC")) ? "기타 (" + rMap.getString("applyReasonEtc") + ")" : rMap.getString("mtRepayReasonText")); //환불사유

            mailTplMap.add("SEQ4", rMap.getString("applyBankName") + "(" + rMap.getString("applyAccountNo") + ")  " + rMap.getString("applyDepositName")); //환불금액


            SendMailVO mailVo = new SendMailVO();
            mailVo.setRecEmail(rMap.getString("applyEmail")); // 받는사람 메일 주소
            mailVo.setReceiver_alias(rMap.getString("applyContactName")); // 받는사람 이름
            mailVo.setRecUserid(rMap.getString("SES_USERID")); // 받는사람 아이디 
            mailVo.setWriterUserid(rMap.getString("SES_USERID"));
            mailVo.setWriterUsername(rMap.getString("SES_USERNAME"));
            emsManager.sendMailProc(mailTplMap, mailVo);

            /*******************************************************************************************
             	탬플릿 기반 SMS 발송 모듈 코드 
            *******************************************************************************************/
            DataMap msgTplMap = new DataMap();

            msgTplMap.set("TPL_UID", SangsProperties.getProperty("Globals.tplUid_USER_REPAY_APPLY"));

            SendMsgVO msgVo = new SendMsgVO();
            msgVo.setRcvphns(StringUtil.replaceStr(rMap.getString("applyTel"), "-", ""));
            msgVo.setRecUsername(rMap.getString("applyContactName")); // 받는사람 이름
            msgVo.setRecUserid(rMap.getString("SES_USERID")); // 받는사람 아이디 
            msgVo.setSendUserid(rMap.getString("SES_USERID"));
            emsManager.sendMsgProc(msgTplMap, msgVo);

        } catch (Exception ex) {
             
        }
    }

    public void sendBookOrdApply(DataMap rMap, StringBuilder sb) {
        try {
            /*******************************************************************************************
             	탬플릿 기반 메일 발송 모듈 코드  메일 발송 
            *******************************************************************************************/

            DataMap mailTplMap = new DataMap();

            mailTplMap.setString("TPL_UID", "SGBANK".equals(rMap.getString("mtPmPayCode")) ? SangsProperties.getProperty("Globals.tplUid_USER_BOOK_APPLY_WAIT") : SangsProperties.getProperty("Globals.tplUid_USER_BOOK_APPLY_COMP"));// 템플릿 고유번호
            mailTplMap.add("SEQ1", rMap.getString("SES_USERNAME") + "(" + rMap.getString("SES_USERID") + ")"); //신청자
            mailTplMap.add("SEQ2", sb.toString()); //교재명
            mailTplMap.add("SEQ3", DateUtil.getNowDate()); //신청일/ 결제일
            mailTplMap.add("SEQ4", StringUtil.numberCommaFormat(rMap.getInt("price")) + "원"); //금액


            SendMailVO mailVo = new SendMailVO();
            mailVo.setRecEmail(rMap.getString("email")); // 받는사람 메일 주소
            mailVo.setReceiver_alias(rMap.getString("SES_USERNAME")); // 받는사람 이름
            mailVo.setRecUserid(rMap.getString("SES_USERID")); // 받는사람 아이디 
            mailVo.setWriterUserid(rMap.getString("SES_USERID"));
            mailVo.setWriterUsername(rMap.getString("SES_USERNAME"));

            emsManager.sendMailProc(mailTplMap, mailVo);

            /*******************************************************************************************
             	탬플릿 기반 SMS 발송 모듈 코드 
            *******************************************************************************************/
            DataMap msgTplMap = new DataMap();

            msgTplMap.setString("TPL_UID", "SGBANK".equals(rMap.getString("mtPmPayCode")) ? SangsProperties.getProperty("Globals.tplUid_USER_BOOK_APPLY_WAIT") : SangsProperties.getProperty("Globals.tplUid_USER_BOOK_APPLY_COMP"));// 템플릿 고유번호

            SendMsgVO msgVo = new SendMsgVO();
            msgVo.setRcvphns(StringUtil.replaceStr(rMap.getString("mobile"), "-", ""));
            msgVo.setRecUsername(rMap.getString("SES_USERNAME")); // 받는사람 이름
            msgVo.setRecUserid(rMap.getString("SES_USERID")); // 받는사람 아이디 
            msgVo.setSendUserid(rMap.getString("SES_USERID"));
            emsManager.sendMsgProc(msgTplMap, msgVo);

        } catch (Exception ex) {
             
        }
    }
}
