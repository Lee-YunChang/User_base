package com.webapp.academy.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import com.sangs.support.DataMap;
import com.sangs.support.EduMap;
import com.sangs.support.SangsProperties;
import com.sangs.util.Aes_128;
import com.sangs.util.SangsCryptUtil;
import com.sangs.util.SangsUtil;
import com.sangs.util.StringUtil;
import com.webapp.academy.ctrl.MemberController;
import com.webapp.academy.mapper.UserMapper;
import com.webapp.academy.service.UserService;
import com.webapp.common.component.EmsManager;
import com.webapp.common.mapper.CommonEmsMapper;
import com.webapp.common.vo.SendMailVO;

/**
 * Description : User Service Impl
 *
 * Modification Information
 * 수정일          수정자         수정내용
 * -------      -----------------------------------
 * 2015.04.09   SANGS           최초작성
 *
 */

@Service("userService")
public class UserServiceImpl implements UserService {

    private Logger            log = LogManager.getLogger(MemberController.class);

    @Resource(name = "userMapper")
    private UserMapper userMapper;

    @Resource(name = "emsManager")
    private EmsManager emsManager;
    
    @Resource(name = "commonEmsMapper")
    private CommonEmsMapper commonEmsMapper;

    /**
     * 회원번호 생성
     *
     * @param data
     * @return
     * @throws Exception
     */
    public int getMaxMberNo(DataMap data) throws Exception {
        return userMapper.getMaxMberNo(data);
    }
/*    
*//**
     * 비밀번호 암호화
     *
     * @param data
     * @return 
     * @return 
     * @throws Exception
     *//*
    public String cryptPassword(String string) throws Exception{
    	return userMapper.cryptPassword(string);
    }
    
*//**
     * 비밀번호 확인
     *
     * @param data
     * @return 
     * @return 
     * @throws Exception
     *//*
    public EduMap confirmPwd(DataMap data) throws Exception{
    	return userMapper.confirmPwd(data);
    }*/
    /**
     * 유저 아이디 중복체크
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap searchMberId(DataMap data) throws Exception {
        return userMapper.searchMberId(data);
    }

    /**
     * 유저 email 중복체크
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap searchMberEmail(DataMap data) throws Exception {
        return userMapper.searchMberEmail(data);
    }

    /**
     * 유저 email 중복체크
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> searchMberEmail2(DataMap data) throws Exception {
        return userMapper.searchMberEmail2(data);
    }
    
    /**
     * 유저 휴대폰번호 중복체크 및 sms 인증발송
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap searchMberMobile(DataMap data) throws Exception{
         return userMapper.searchMberMobile(data);
    }
    /**
     * 유저 휴대폰번호 중복체크 및 sms 인증발송
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap searchMberMobile2(DataMap data) throws Exception{
         return userMapper.searchMberMobile2(data);
    }
    /**
     * 유저 인증메일 발송
     *
     * @param data
     * @return
     * @throws Exception
     */
    public void authSendMail(DataMap data) throws Exception{
        DataMap mailTplMap = new DataMap();
        //템플릿 호출
        if(data.containsKey("mode") && data.getString("mode").equals("personal")){
        	mailTplMap.putString("TPL_UID", "2");
        }else if(data.containsKey("TPL_UID") && !data.getString("TPL_UID").equals("")){
        	mailTplMap.putString("TPL_UID", data.getString("TPL_UID"));
        }else{
        	mailTplMap.putString("TPL_UID", "1");
        }
        mailTplMap.putString("SEQ1", data.getString("authCode"));//인증번호
        
        SendMailVO mailVo = new SendMailVO();
        mailVo.setRecEmail(data.getString("email"));
        mailVo.setReceiver_alias(data.getString("userName"));
        mailVo.setRecUserid(data.getString("userId"));
        mailVo.setRecUsername(data.getString("userName"));
        
        emsManager.sendMailProc(mailTplMap, mailVo);

    }

    /**
     * 비밀번호 일괄변경
     *
     * @param data
     * @throws Exception
     */
    public void updateAllPwd(DataMap data) throws Exception {

        userMapper.updateAllPwd(data);
    }
    
    /**
     * 인증번호 체크
     *
     * @param data
     * @throws Exception
     */
    public int getUnityInfo(DataMap data) throws Exception {
    	return userMapper.getUnityInfo(data);
    }
    
    /**
     * 회원가입
     *
     * @param data
     * @throws Exception
     */
    public void insertUnityMber(DataMap data) throws Exception {

        userMapper.insertUnityMber(data);
        
        //비회원 중복 여부 조회 =  검색조건 : 폰번호,이름,생년월일 결과값 : USERNO 검색결과 없을시 0
        data.putInt("nmberNo", userMapper.selectnmberno(data));
        //비회원이 있는경우 = 비회원 탈퇴여부 Y 변경, userno로 해당 수강이력 변경 수강이력 이전
        if(data.getInt("nmberNo") > 0){
        	userMapper.updateNmberno(data);
        	userMapper.updateNmberSecsnAt(data);
        	userMapper.updateLectureUserno(data);
        	userMapper.updateExamApllyUserno(data);
        }
        //종사자 등록
        //insertCompanyEmpInfo(data);
        
        //SMS가입 문자 발송
        String str="[서민금융진흥원] 회원가입이 완료되었습니다.";
        
        String mobile = data.getString("moblphon").replace("-", "");
		
        data.setString("summary", str);
        data.setString("tranType", "4");
        data.setString("callBack", "15444691");
        data.setString("userInfo", data.getString("userName")+"^"+mobile);
       
        //commonEmsMapper.insertSmsData(data);
       
    }

    /**
     * 회원정보
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap selectUserInfo(DataMap data) throws Exception {
        return userMapper.selectUserInfo(data);
    }

    /**
     * 회원정보 변경
     *
     * @param data
     * @throws Exception
     */
    public void updateUnityInfo(DataMap data) throws Exception {
        userMapper.updateUnityInfo(data);
        
      //SMS가입 문자 발송
        String str="[서민금융진흥원] 회원정보가 수정 되었습니다.";
        
        String mobile = data.getString("moblphon").replace("-", "");
		
        data.setString("summary", str);
        data.setString("tranType", "4");
        data.setString("callBack", "15444691");
        data.setString("userInfo", data.getString("SES_USERID")+"^"+mobile);
       
        //commonEmsMapper.insertSmsData(data);
    }


    /**
     * 유저 아이디/비밀번호찾기 - 아이디
     *
     * @param data
     * @return
     * @throws Exception
     */
    public EduMap selectFindId(DataMap data) throws Exception {
        return userMapper.selectFindId(data);
    }

    /**
     * 유저 아이디/비밀번호찾기 - 아이디
     *
     * @param data
     * @return
     * @throws Exception
     */
    public List<EduMap> selectFindId2(DataMap data) throws Exception {
        return userMapper.selectFindId2(data);
    }

    /**
     * 유저 아이디/비밀번호찾기 - 비밀번호 - 임시비밀번호로 업데이트
     *
     * @param data
     * @throws Exception
     */
    public void updateFindPwd(DataMap data) throws Exception {

        DataMap mailTplMap = new DataMap();
        mailTplMap.putString("TPL_UID", "22");

        mailTplMap.putString("SEQ1", data.getString("eUserName"));
        mailTplMap.putString("SEQ2", data.getString("rPwdOrg"));

        SendMailVO mailVo = new SendMailVO();
        mailVo.setRecEmail(data.getString("rEmail")); // 받는사람 메일 주소
        mailVo.setReceiver_alias(data.getString("eUserName"));
        mailVo.setRecUserid(data.getString("rUserId")); // 받는사람 아이디
        mailVo.setRecUsername(data.getString("eUserName")); // 받는사람 이름
        emsManager.sendMailProc(mailTplMap, mailVo);

        userMapper.updateFindPwd(data);
    }

    /**
     * 회원 탈퇴 신청
     *
     * @param data
     * @throws Exception
     */
    public void updateCencelMember(DataMap data) throws Exception {
        //회원 데이터 삭제
        userMapper.updateCencelMember(data);
    }

    /**
     * 기업정보 호출
     *
     * @param data
     * @throws Exception
     */
    public EduMap selectCompanyInfo(DataMap data) throws Exception {
        return userMapper.selectCompanyInfo(data);
    }

    /**
     * 기업정보 검색
     *
     * @param data
     * @throws Exception
     */
    public List<EduMap> selectCompanyList(DataMap data) throws Exception {
        return userMapper.selectCompanyList(data);
    }

    /**
     * 기업정보 검색
     *
     * @param data
     * @throws Exception
     */
    public EduMap seachCompanyInfo(DataMap data) throws Exception {
        return userMapper.seachCompanyInfo(data);
    }


    /**
     * 회원가입 2단계 기업정보 검색(List)
     *
     * @param data
     * @throws Exception
     */
    public List<EduMap> seachCompanyList(DataMap data) throws Exception {
        return userMapper.seachCompanyList(data);
    }

    /**
     * 기업검색
     *
     * @param data
     * @throws Exception
     */
    public EduMap seachCompanyInfo2(DataMap data) throws Exception {
        return userMapper.seachCompanyInfo2(data);
    }


    /**
     * 기업정보 등록
     *
     * @param data
     * @throws Exception
     */
    public void insertCompanyInfo(DataMap data) throws Exception {
        userMapper.insertCompanyInfo(data);
    }
    /**
     * 기업정보 수정
     *
     * @param data
     * @throws Exception
     */
    public void updateCompanyInfo(DataMap data) throws Exception {
        userMapper.updateCompanyInfo(data);
    }

    /**
     * 종사직군 리스트 조회
     *
     * @param data
     * @throws Exception
     */
    public List<EduMap> selectJobKndCodeList(DataMap data) throws Exception{
        return userMapper.selectJobKndCodeList(data);
    }

    /**
     * 종사직원 리스트 조회
     *
     * @param data
     * @throws Exception
     */
    public List<EduMap> selectCompanyEmpList(DataMap data) throws Exception{
        data.setInt("rowCount", 20);
        setPagingValue(data);
        //ParamUtil.setPagingValue(data);
        return userMapper.selectCompanyEmpList(data);
    }

    // 페이징 처리 추가 (공통 static 이 너무 느려서 가져옴)
    public void setPagingValue(DataMap data) {
        // 페이징 변수 세팅
        int cPage = Integer.parseInt(getObjParamEmpty(data.get("cPage"), "1"));
        int rowCount = 10;
        if(data.getInt("rowCount") > 0){
            rowCount = data.getInt("rowCount");
        } else{
            rowCount = Integer.parseInt(SangsProperties.getProperty("Globals.defaultRowCount"));
        }

        if (cPage < 1) cPage = 1;
        data.add("cPage", cPage);
        data.add("startNo", (cPage - 1) * rowCount + 1);
        data.add("endNo", cPage * rowCount);
        data.add("rowCount", rowCount);
    }

    public String getObjParamEmpty(Object reqstr, String dstr) {
        if (reqstr == null) {
            return dstr;
        } else {
            String rVal = reqstr.toString().trim();
            if ("".equals(rVal)) {
                return dstr;
            } else {
                return rVal;
            }
        }
    }



    /**
     * 기업회원정보 승인처리
     *
     * @param data
     * @throws Exception
     */
    public void updateRegAtInfoAjax(DataMap data) throws Exception{
        userMapper.updateRegAtInfoAjax(data);
    }

    /**
     * 기업회원 중복데이터 제거
     *
     * @param data
     * @throws Exception
     */
    public void updateRegAtNotInfoAjax(DataMap data) throws Exception{
        userMapper.updateRegAtNotInfoAjax(data);
    }

    /**
     * 종사직원 정보조회 comNo, empSeq
     *
     * @param data
     * @throws Exception
     */
    public EduMap selectCompanyEmpInfo(DataMap data) throws Exception{
        return userMapper.selectCompanyEmpInfo(data);
    }

    /**
     * 종사직원 정보조회 comNo, regUserId
     *
     * @param data
     * @throws Exception
     */
    public EduMap selectCompanyEmpInfo2(DataMap data) throws Exception{
        return userMapper.selectCompanyEmpInfo2(data);
    }


    /**
     * 종사직원 정보조회 개별등록
     *
     * @param data
     * @throws Exception
     */
    public void insertCompanyEmpInfo(DataMap data) throws Exception{

            //회원가입일경우
            if("Y".equals(data.getString("regMode"))){
                Map<String, Object> inputDataMap = new HashMap<String, Object>();

                inputDataMap.put("comNo", data.getString("comNo")); //기업일련번호
                inputDataMap.put("empName", data.getString("userName")); //기업회원명
                inputDataMap.put("mtJobKndCode", data.getString("mtJobKndCode")); //종사자 코드
                inputDataMap.put("deptName", data.getString("deptName")); //부서명
                inputDataMap.put("positionName", data.getString("positionName")); //직급명
                inputDataMap.put("email", data.getString("email")); //이메일
                inputDataMap.put("regAt", "Y");

                inputDataMap.put("regDate", data.getString("regDate")); //등록일
                inputDataMap.put("regUserId", data.getString("regUserId")); //아이디

               // userMapper.insertCompanyEmpInfo(inputDataMap);

            } 
            else{
                int insertSize= data.getInt("insertSize");
                data.setString("mtCode",SangsProperties.getProperty("Globals.mtCode_MT_JICJONG_CODE"));

                //넘어온 수만큼(오류없는것만 insert 진행)
                for(int i = 0; i <= insertSize; i++){
                    Map<String, Object> inputDataMap = new HashMap<String, Object>();
                        inputDataMap.put("comNo", data.getString("comNo")); //기업명
                        inputDataMap.put("empName", data.getString("empName_"+i)); //기업명
                        inputDataMap.put("mtJobKndCode", data.getString("mtJobKndCode_"+i)); //종사자 코드
                        inputDataMap.put("regAt", "R"); //등록여부
                        inputDataMap.put("deptName", data.getString("deptName_"+i)); //부서명
                        inputDataMap.put("positionName", data.getString("positionName_"+i)); //직급명
                        inputDataMap.put("email", data.getString("email_"+i)); //이메일

                        userMapper.insertCompanyEmpInfo(inputDataMap);

                }
            }
            //관리자등록
    }

    /**
     * 종사직원 정보조회 (excel 일괄등록)
     *
     * @param data
     * @throws Exception
     */
    public void insertCompanyExcel(DataMap data) throws Exception{

            int excelSize= data.getInt("excelSize");
            data.setString("mtCode",SangsProperties.getProperty("Globals.mtCode_MT_JICJONG_CODE"));
            List<EduMap> mtJobKndNmList = userMapper.selectJobKndCodeList(data);
            //넘어온 수만큼(오류없는것만 insert 진행)
            for(int i = 0; i < excelSize; i++){

                if(data.get("msgCode_"+i).equals("OK")){

                    Map<String, Object> inputDataMap = new HashMap<String, Object>();
                    inputDataMap.put("comNo", data.getString("comNo")); //기업명
                    inputDataMap.put("empName", data.getString("empName_"+i)); //기업명
                    inputDataMap.put("mtJobKndCode", SangsUtil.eduMapGetMtCdByNm(mtJobKndNmList, SangsUtil.nvl(data.getString("mtJobKndNm_"+i)))); //종사자 코드
                    inputDataMap.put("regAt", "R"); //등록여부
                    inputDataMap.put("deptName", data.getString("deptName_"+i)); //부서명
                    inputDataMap.put("positionName", data.getString("positionName_"+i)); //직급명
                    inputDataMap.put("email", data.getString("email_"+i)); //이메일

                    userMapper.insertCompanyEmpInfo(inputDataMap);
                }

            }

    }

    /**
     * 종사직원 이메일 발송
     *
     * @param data
     * @throws Exception
     */
    public void empMailExec(DataMap data) throws Exception{

        //템플릿은 임시로 아무거나 넣어놓은 상태임 -2015-05-22 김학규

        List<String> tempList = new ArrayList<String>(); //DB내의 기업회원 체크용 List

        Map<String, Object> dbHsMap = new HashMap<String, Object>();
        List<EduMap> tList = new ArrayList<EduMap>(); //DB내의 기업회원 체크용 hash Map

        int total = userMapper.selectMaxSeqInfo(data);

        for(int i=0; i <= total; i++){

            if(data.containsKey("empSeq_"+i)){
                tempList.add(data.getString("empSeq_"+i)); //tempList 사업자번호가 담긴 리스트
            }
        }

        data.setString("BIZNO",data.getString("bizNo"));
        data.setInt("COMNO",data.getInt("comNo"));

        EduMap tempCompanyInfo = userMapper.selectCompanyInfo(data);

        //DB에서 데이터 조회
        dbHsMap.put("empSeqList", tempList.toArray());
        dbHsMap.put("pmode",data.getString("pmode"));
        dbHsMap.put("COMNO",data.getString("comNo"));

        tList = userMapper.selectCompanyEmpEmailList(dbHsMap);

        for(int i=0; i<tList.size();i++){

            EduMap tempMap = tList.get(i);
            String authKey = Aes_128.encrypt("email="+tempMap.getString("EMAIL") +"&empName="+tempMap.getString("EMP_NAME")+"&deptName="+tempMap.getString("DEPT_NAME")+"&deptPosition="+tempMap.getString("POSITION_NAME")+"&comNo="+tempMap.getInt("COMNO")+"&bizNo="+data.getString("bizNo")+"&mtJobKndCode="+tempMap.getString("MT_JOB_KND_CODE")+"&comName="+StringUtil.replaceStr(tempCompanyInfo.getString("COMNAME"), "&", "^*")+"&empSeq="+tempMap.getInt("EMP_SEQ"));

            DataMap mailTplMap = new DataMap();
            mailTplMap.putString("TPL_UID", "29");
            mailTplMap.putString("SEQ1", tempCompanyInfo.getString("COMNAME"));//기업명
            mailTplMap.putString("SEQ2", data.getString("SES_USERNAME"));//관리자명
            mailTplMap.putString("SEQ3", authKey);//키값

            SendMailVO mailVo = new SendMailVO();
            mailVo.setRecEmail(tempMap.getString("EMAIL"));
            mailVo.setReceiver_alias(tempMap.getString("EMP_NAME"));


            mailTplMap.putString("SES_USERID", data.getString("SES_USERID"));
            emsManager.sendMailProc(mailTplMap, mailVo);

            //상태값 업데이트
            userMapper.updateCompanyMail(tempMap);

        }

    }

    /**
     * 기업회원 소속정보 변경용1
     *
     * @param data
     * @throws Exception
     */
    public EduMap deleteCompanyEmpInfo(DataMap data) throws Exception{
        return userMapper.deleteCompanyEmpInfo(data);
    }
    /**
     * 기업회원 소속정보 변경용2 -> 후에 insertCompanyEmpInfo 사용
     *
     * @param data
     * @throws Exception
     */
    public void deleteCompanyEmpInfo2(DataMap data) throws Exception{
        userMapper.deleteCompanyEmpInfo2(data);
    }

    /**
     * 기업회원관리 -> 종사자 삭제
     *
     * @param data
     * @throws Exception
     */
    public void deleteEmpInfo(DataMap data) throws Exception {
        userMapper.deleteEmpInfo(data);
    }
    /**
     * 회원정보 변경 회원등급 및 회원 사업자변호 변경
     *
     * @param data
     * @throws Exception
     */
    public void updateCompanyEmpMoveInfo(DataMap data) throws Exception{
        userMapper.updateCompanyEmpMoveInfo(data);
    }

    /**
     * 해당기업의 max emp_seq +1을 호출
     *
     * @param data
     * @throws Exception
     */
    public int selectMaxSeqInfo(DataMap data) throws Exception{

        return userMapper.selectMaxSeqInfo(data);
    }

    /**
     * 회원의 이메일 인증 실행
     *
     * @param data
     * @throws Exception
     */
    public void updateAuthCodeInfo(DataMap data) throws Exception{
         userMapper.updateAuthCodeInfo(data);
    }


    /**
     * 유저 비밀번호 찾기
     *
     * @param data
     * @throws Exception
     */
    public EduMap selectPwdSearchUserInfo(DataMap data) throws Exception{
        return userMapper.selectPwdSearchUserInfo(data);
    }

    /**
     * 비밀번호 찾기 -> 비밀번호찾기 실행
     *
     * @param data
     * @throws Exception
     */
    public void updatePwdPopExec(DataMap data) throws Exception{
    	
    	//회원번호 이름 등 수정할계정의 정보 로딩
    	EduMap userinfo = userMapper.selectUserPwdInfo(data);
    	
    	//SMS가입 문자 발송
        String str="[서민금융진흥원] 비밀번호가 변경되었습니다.";
        
        String mobile = userinfo.getString("MOBLPHON").replace("-", "");
		
        data.setString("summary", str);
        data.setString("tranType", "4");
        data.setString("callBack", "15444691");
        data.setString("userInfo", userinfo.getString("MBERNM")+"^"+mobile);
       
        //commonEmsMapper.insertSmsData(data);
    	
        userMapper.updatePwdPopExec(data);
    }

    /**
     * 기업회원관리 > 회원 (등록인원,가입인원,수료인원) 카운트
     *
     * @param data
     * @throws Exception
     */
    public EduMap getEmpInfoTotCount(DataMap data) throws Exception{
        return userMapper.getEmpInfoTotCount(data);
    }

    /**
     * 기업담당자 가입권유메일 하루 100건으로 제한 체크
     *
     * @param data
     * @throws Exception
     */
    public int getEmpMailTodayCnt(DataMap data) throws Exception {
        return userMapper.getEmpMailTodayCnt(data);
    }

    /**
     * 사업자번호로 승인여부 카운트 조회
     *
     * @param data
     * @throws Exception
     */
    public int selectStatusGbYnCnt(DataMap data) throws Exception {
        return userMapper.selectStatusGbYnCnt(data);
    }

    /**
     * 기업정보 입력 카운트
     *
     * @param data
     * @throws Exception
     */
    public int selectCompanyData(DataMap data) throws Exception {
        return userMapper.selectCompanyData(data);
    }


    /**
     * 현재 등록되어있는 기업회원 조회
     *
     * @param data
     * @throws Exception
     */
    public List<EduMap> selectComEmpList(DataMap data) throws Exception {
        data.setInt("rowCount", 20);
        setPagingValue(data);
        return userMapper.selectComEmpList(data);
    }

    /**
     * 기업담당자 변경
     *
     * @param data
     * @throws Exception
     */
    public void updateComMngrExec(DataMap data) throws Exception{
        userMapper.updateComMngrExec2(data);
    }
    
    
    /**
     * 회원가입 > 본인인증 > 중복회원가입여부
     *
     * @param data
     * @throws Exception
     */
    public int chkJoinYn(DataMap data) throws Exception{
        return userMapper.chkJoinYn(data);
    }

    
    /**
     * 기존회원 > 본인인증 > 개인정보 비교
     *
     * @param data
     * @throws Exception
     */
    public int chkInfoCompare(DataMap data) throws Exception{
        return userMapper.chkInfoCompare(data);
    }
    
    
    
    /**
     * 기존회원 > 본인인증 > 개인정보 비교 후, 본인인증 정보로 개인정보 UPDATE
     *
     * @param data
     * @throws Exception
     */
    public void mebmerUpdateInfo(DataMap data) throws Exception {
    	userMapper.mebmerUpdateInfo(data);
    }

}
