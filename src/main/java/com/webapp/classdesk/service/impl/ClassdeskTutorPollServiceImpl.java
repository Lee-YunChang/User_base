package com.webapp.classdesk.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.util.ParamUtil;
import com.webapp.classdesk.mapper.ClassdeskTutorPollMapper;
import com.webapp.classdesk.service.ClassdeskTutorPollService;

/**
 * Description : Classdesk TutorPoll Service Impl
 * 
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */
@Service("classdeskTutorPollService")
public class ClassdeskTutorPollServiceImpl implements ClassdeskTutorPollService {

    @Resource(name = "classdeskTutorPollMapper")
    private ClassdeskTutorPollMapper classdeskTutorPollMapper;

    /**
     * getPollMainList
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getPollMainList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollMainList(data);
    }

    /**
     * 설문 목록
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollList(data);
    }

    /**
     * 설문 MAX NO
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getMaxPollcSeqNo(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getMaxPollcSeqNo(data);
    }

    /**
     * 설문 메인 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertPoll(DataMap data) throws Exception {
        classdeskTutorPollMapper.insertPoll(data);
    }

    /**
     * 설문 임시저장 / 설문개시
     * 
     * @param data
     * @throws Exception
     */
    public void updatePoll(DataMap data) throws Exception {
        classdeskTutorPollMapper.updatePoll(data);
    }

    /**
     * selectMstPollCnt
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap selectMstPollCnt(DataMap data) throws Exception {
        return classdeskTutorPollMapper.selectMstPollCnt(data);
    }

    /**
     * selectMstPollQuizCnt
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap selectMstPollQuizCnt(DataMap data) throws Exception {
        return classdeskTutorPollMapper.selectMstPollQuizCnt(data);
    }

    /**
     * 설문 문항 일괄 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertMstPollQuiz(DataMap data) throws Exception {
        classdeskTutorPollMapper.insertMstPollQuiz(data);
    }

    /**
     * getPollItem
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap getPollItem(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollItem(data);
    }

    /**
     * 설문 문항 저장
     * 
     * @param data
     * @throws Exception
     */
    public void insertPollQuiz(DataMap data) throws Exception {
        classdeskTutorPollMapper.insertPollQuiz(data);
    }

    /**
     * 설문 문항 수정
     * 
     * @param data
     * @throws Exception
     */
    public void updatePollQuiz(DataMap data) throws Exception {
        classdeskTutorPollMapper.updatePollQuiz(data);
    }

    /**
     * 설문 문항 삭제
     * 
     * @param data
     * @throws Exception
     */
    public void deletePollQuiz(DataMap data) throws Exception {
        classdeskTutorPollMapper.deletePollQuiz(data);
    }

    /**
     * 설문통계
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollStatList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollStatList(data);
    }

    /**
     * 설문 주관식 내용 
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollStatEtcList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollStatEtcList(data);
    }

    /**
     * getPollcSeqNoInfo
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public int getPollcSeqNoInfo(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollcSeqNoInfo(data);
    }

    /**
     * 주관식답변(설문전체)
     * 
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> getPollStatDesList(DataMap data) throws Exception {
        return classdeskTutorPollMapper.getPollStatDesList(data);
    }

    /**
     * 설문 마스터 일괄저장
     * 
     * @param data
     * @throws Exception
     */
    public void mtscallExec(DataMap data) throws Exception {
        //설문 maxno
        EduMap map = getMaxPollcSeqNo(data);

        data.putInt("pollcSeqNo", map.getInt("SEQPOLLCSEQNO"));

        //설문 메인등록
        insertPoll(data);
        //설문문항 일괄등록
        insertMstPollQuiz(data);
    }

    /**
     * 설문 문항 등록 / 수정 / 삭제 실행 
     * 
     * @param request
     * @param data
     * @param saveFlg
     * @throws Exception
     */
    public void qExec(HttpServletRequest request, DataMap data, String saveFlg) throws Exception {
        if ("D".equals(saveFlg)) {
            deletePollQuiz(data);
            data.putString("rMsg", "삭제되었습니다.");
        } else {
            if (data.containsKey("qNo") && ParamUtil.getIntParam(data.getString("qNo"), 0) > 0) {
                updatePollQuiz(data);
                data.putString("rMsg", "수정되었습니다.");
            } else {
                EduMap eMap = selectMstPollCnt(data);

                if (eMap == null) {
                    EduMap map = getMaxPollcSeqNo(data);

                    data.putInt("pollcSeqNo", map.getInt("SEQPOLLCSEQNO"));

                    //설문 메인등록
                    insertPoll(data);

                    insertPollQuiz(data);
                } else {
                    data.putInt("pollcSeqNo", eMap.getInt("POLLCSEQNO"));
                    insertPollQuiz(data);
                }

                data.putString("rMsg", "저장되었습니다.");
            }
        }

        if ("D".equals(saveFlg)) {
            data.putString("rScript", "try {fnForm();} catch(err) {self.close();  opener.window.document.location.reload();}");
        } else {
            data.putString("rScript", "self.close();  opener.window.document.location.reload();");
        }
    }
}
