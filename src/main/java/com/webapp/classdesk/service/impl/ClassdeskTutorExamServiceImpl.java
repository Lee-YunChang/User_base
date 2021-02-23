package com.webapp.classdesk.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.mapper.ClassdeskTutorExamMapper;
import com.webapp.classdesk.mapper.ClassdeskTutorExamQuizbinderMapper;
import com.webapp.classdesk.mapper.ClassdeskUserExamMapper;
import com.webapp.classdesk.service.ClassdeskTutorExamService;

/**
 * Description : Classdesk TutorExam Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskTutorExamService")
public class ClassdeskTutorExamServiceImpl implements ClassdeskTutorExamService {

    @Resource(name = "classdeskTutorExamMapper")
    private ClassdeskTutorExamMapper           classdeskTutorExamMapper;

    @Resource(name = "classdeskTutorExamQuizbinderMapper")
    private ClassdeskTutorExamQuizbinderMapper classdeskTutorExamQuizbinderMapper;

    @Resource(name = "classdeskUserExamMapper")
    private ClassdeskUserExamMapper            classdeskUserExamMapper;

    /**
     * 시험 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLectExamList(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getLectExamList(data);
    }

    /**
     * 시험 제출자 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getUserLectExamSubList(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getUserLectExamSubList(data);
    }

    /**
     * 시험 상세
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLectExamItem(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getLectExamItem(data);
    }

    /**
     * getLeExamEvalInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getLeExamEvalInfo(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getLeExamEvalInfo(data);
    }

    /**
     * 교육시험 출제정책 랜덤방식 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getEduExamSectionList(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getEduExamSectionList(data);
    }

    /**
     * 강의실 출제정책 랜덤방식 리스트
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getLectExamSectionList(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getLectExamSectionList(data);
    }

    /**
     * 시험 MAx No
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMaxLeExamSeqNo(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getMaxLeExamSeqNo(data);
    }

    /**
     * 최종평가
     * 
     * @param data
     * @throws Exception
     */
    public void updateLectExamResult(DataMap data) throws Exception {
        classdeskTutorExamMapper.updateLectExamResult(data);
    }

    /** 
     * 시험 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertLectExam(DataMap data) throws Exception {
        classdeskTutorExamMapper.insertLectExam(data);
    }

    /**
     * insertLectExamSec
     * 
     * @param data
     * @throws Exception
     */
    public void insertLectExamSec(DataMap data) throws Exception {
        classdeskTutorExamMapper.insertLectExamSec(data);
    }

    /**
     * 강사 시험 응시내역 채점
     * 
     * @param data
     * @throws Exception
     */
    public void updateExamAppMarking(DataMap data) throws Exception {
        classdeskTutorExamMapper.updateExamAppMarking(data);
    };

    /**
     * 강사 시험 응시답안 채점
     * 
     * @param data
     * @throws Exception
     */
    public void updateExamAppHstMarking(DataMap data) throws Exception {
        classdeskTutorExamMapper.updateExamAppHstMarking(data);
    }

    /**
     * 시험 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deleteLeExam(DataMap data) throws Exception {
        classdeskTutorExamMapper.deleteLeExam(data);
    }

    /**
     * 시험 응시내역 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deleteLeExamApp(DataMap data) throws Exception {
        classdeskTutorExamMapper.deleteLeExamApp(data);
    }

    /**
     * 시험 응시답안 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deleteLeExamAppHst(DataMap data) throws Exception {
        classdeskTutorExamMapper.deleteLeExamAppHst(data);
    }

    /**
     * 랜덤 시험 문제은행 출제정책 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deleteLeExamSec(DataMap data) throws Exception {
        classdeskTutorExamMapper.deleteLeExamSec(data);
    }

    /**
     * 성적 업데이트프로시저 실행
     * 
     * @param data
     * @throws Exception
     */
    public void callLmsCourseRecordExec(Map data) throws Exception {
        classdeskTutorExamMapper.callLmsCourseRecordExec(data);
    }

    /**
     * 과정정보
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getOpenTypeInfo(DataMap data) throws Exception {
        return classdeskTutorExamMapper.getOpenTypeInfo(data);
    }

    /**
     * (상시) 시험 사용여부 저장
     * 
     * @param data
     * @throws Exception
     */
    public void updateLeExamUseYn(DataMap data) throws Exception {
        classdeskTutorExamMapper.updateLeExamUseYn(data);
    }

    /**
     * (상시) 시험 문제 사용여부 저장
     * 
     * @param data
     * @throws Exception
     */
    public void updateQuizUseYn(DataMap data) throws Exception {
        
        String tname = data.getString("tname");
    	
    	if (tname.equals("LE_EXAM_SET_QUIZ")) {
    		classdeskTutorExamMapper.updateQuizUseYn1(data);
	    } else if (tname.equals("LE_EXAM_QUIZ")) {
	    	classdeskTutorExamMapper.updateQuizUseYn2(data);
	    } else if (tname.equals("ED_EXAM_QUIZ")) {
	    	classdeskTutorExamMapper.updateQuizUseYn3(data);
	    }
    }

    /**
     * 사용자 실시간 응시시간 저장
     * 
     * @param data
     * @throws Exception
     */
    public void updateExamSubmit(DataMap data) throws Exception {
        classdeskTutorExamMapper.updateExamSubmit(data);
    }

    /**
     * 시험 등록 / 수정 / 삭제 실행
     * 
     * @param request
     * @param data
     * @param saveFlg
     * @throws Exception
     */
    public void exec(HttpServletRequest request, DataMap data, String saveFlg) throws Exception {

        if (!data.containsKey("examNo") || ParamUtil.getIntParam(data.getString("examNo"), 0) == 0) {
            EduMap map = getMaxLeExamSeqNo(data);
            data.putInt("examNo", map.getInt("SEQ_EXAM_MAX_NO"));
        }

        String sdate = data.getString("sdate") + " " + data.getString("shour") + ":" + data.getString("smin") + ":00";
        String edate = data.getString("edate") + " " + data.getString("ehour") + ":" + data.getString("emin") + ":00";

        data.setString("sdate", sdate);
        data.setString("edate", edate);

        insertLectExam(data);

        /***
         * 랜덤 등록
         * 
         */
        if ("R".equals(data.getString("pubType"))) {

            String[] strSecNos = request.getParameterValues("secNos");
            String[] strSecTitles = request.getParameterValues("secTitles");
            String[] strDescriptions = request.getParameterValues("descriptions");
            String[] strAllots = request.getParameterValues("allots");
            String[] strTotalQnums = request.getParameterValues("totalQnums");
            String[] strLeUseYns = request.getParameterValues("leUseYns");

            int randomSize = strSecNos.length;

            if (randomSize > 0) {
                DataMap randomDataMap = null;

                for (int i = 0; i < randomSize; i++) {

                    randomDataMap = new DataMap();
                    randomDataMap.putInt("examNo", data.getInt("examNo"));
                    randomDataMap.putInt("secNo", ParamUtil.getIntParam(strSecNos[i]));
                    randomDataMap.putString("secTitle", ParamUtil.getStrParam(strSecTitles[i], ""));
                    randomDataMap.putString("description", ParamUtil.getStrParam(strDescriptions[i], ""));
                    randomDataMap.putInt("allot", ParamUtil.getIntParam(strAllots[i]));
                    randomDataMap.putInt("totalQnum", ParamUtil.getIntParam(strTotalQnums[i]));
                    randomDataMap.putString("useYn", ParamUtil.getStrParam(strLeUseYns[i], ""));

                    insertLectExamSec(randomDataMap);

                }
            }

            // 문제은행 선택 안했을경우
        } else {
            /* 랜덤 시험 문제은행 출제정책 삭제 */
            deleteLeExamSec(data);
        }

        if ("Y".equals(data.getString("openYn"))) {
            data.putString("rMsg", "시험 출제되었습니다.");
            data.putString("rScript", "fnList()");
        } else {
            data.putString("rMsg", " 임시 저장되었습니다.");
            data.putString("rScript", "fnDetail(\\'" + data.get("examNo") + "\\')");
        }
    }

    /**
     * 시험 정보 전체삭제
     * 
     * @param data
     * @throws Exception
     */
    public void delExec(DataMap data) throws Exception {
        /* 시험 응시답안 삭제 */
        deleteLeExamAppHst(data);
        /* 시험 응시내역 삭제 */
        deleteLeExamApp(data);
        /* 바인더 시험 삭제 */
        classdeskTutorExamQuizbinderMapper.deletetLeExamQuiz(data);
        /* 랜덤 시험 문제은행 출제정책 삭제 */
        deleteLeExamSec(data);
        /* 시험 삭제 */
        deleteLeExam(data);
    }

    /**
     * 시험 평가(채점) 양식 실행
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void evalExec(HttpServletRequest request, DataMap data) throws Exception {
        String qSeqs[] = request.getParameterValues("qSeq");//출제문제 순번
        String isRights[] = request.getParameterValues("isRight"); //정답여부
        String vals[] = request.getParameterValues("val"); //문항 점수

        data.setDouble("val", data.getDouble("sumVal"));

        updateExamAppMarking(data);

        DataMap histMap = null;
        for (int i = 0; i < qSeqs.length; i++) {

            histMap = new DataMap();

            histMap.putInt("cUserNo", data.getInt("cUserNo"));
            histMap.putInt("examNo", data.getInt("examNo"));
            histMap.putInt("qSeq", ParamUtil.getIntParam(qSeqs[i]));
            histMap.putString("isRight", isRights[i]);
            histMap.putDouble("val", ParamUtil.getDoubleParam(vals[i]));

            //사용자 설문 응시답안 저장
            updateExamAppHstMarking(histMap);
        }
    }

    /**
     * 시험 수강생 재응시 승인
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void delUserExec(HttpServletRequest request, DataMap data) throws Exception {
        String[] cUserNos = request.getParameterValues("cUserNos");

        DataMap delMap = null;

        if (cUserNos.length > 0) {
            //for (String str : cUserNos) {
            for(int i=0; i < cUserNos.length; i++) {
            	String str = cUserNos[i];
                delMap = new DataMap();

                delMap.putInt("examNo", data.getInt("examNo"));
                delMap.putInt("cUserNo", ParamUtil.getIntParam(str));
                /* 시험 응시답안 삭제 */
                deleteLeExamAppHst(delMap);
                /* 시험 응시내역 삭제 */
                deleteLeExamApp(delMap);

            }
        }
    }

    /**
     * 강사제출
     * 
     * @param data
     * @throws Exception
     */
    public void tutorSubmitExec(DataMap data) throws Exception {
        /*시험 응시내역 최종 저장*/
        updateExamSubmit(data);

        Map<String, Object> paramMap = new HashMap<String, Object>();

        paramMap.put("P_CUSERNO", data.getInt("cUserNo"));
        paramMap.put("P_COURSENO", data.getInt("SES_CUSERNO"));
        paramMap.put("P_EXAMNO", data.getInt("examNo"));
        paramMap.put("R_VAL", 0);
        paramMap.put("R_RESULT", 0);

        if ("R".equals(data.getString("pubType"))) {
            /* 시험 응시답안 객관식 1차 가채점 */
            classdeskUserExamMapper.lmsExamRdmMarkingExecute(paramMap);
        } else if ("S".equals(data.getString("pubType"))) {
            /* 시험 응시답안 객관식 1차 가채점 */
            classdeskUserExamMapper.lmsExamSetMarkingExecute(paramMap);
        } else {
            /* 시험 응시답안 객관식 1차 가채점 */
            classdeskUserExamMapper.lmsExamBinderMarkingExecute(paramMap);
        }
    }

    /**
     * 시험 최종평가반영
     * 
     * @param data
     * @throws Exception
     */
    public void evalFinalExec(DataMap data) throws Exception {

        Map hashMap = new HashMap();

        updateLectExamResult(data);

        EduMap eMap = getLectExamItem(data);

        String examType = eMap.getString("EXAM_TYPE");

        if (examType.equals("M")) {
            hashMap.put("P_KEY", "EXAM_M"); // 중간시험 프로시저
        } else {
            hashMap.put("P_KEY", "EXAM_F"); // 최종시험 프로시저
        }
        // 최종 성적 반영 프로시저 실행            
        hashMap.put("P_CSEQNO", data.getInt("SES_CSEQNO"));
        hashMap.put("R_RESULT", "");

        callLmsCourseRecordExec(hashMap);
    }

    /**
     * 시험 사용여부 등록
     * 
     * @param request
     * @param data
     * @throws Exception
     */
    public void useExec(HttpServletRequest request, DataMap data) throws Exception {

        int itemCnt = request.getParameterValues("useExamNo").length;

        if (itemCnt > 0) {
            for (int i = 0; i < itemCnt; i++) {
                data.set("useYn", ParamUtil.getStrParam(request.getParameterValues("useYn")[i]));
                data.set("examNo", ParamUtil.getStrParam(request.getParameterValues("useExamNo")[i]));

                updateLeExamUseYn(data);
            }
        }
    }
}
