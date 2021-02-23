package com.sangs.session;


import java.io.Serializable;

/*
 	Description : 회원 로그인정보 VO
 	Modification Information
	수정일         	수정자                   수정내용
	-------    	--------    ---------------------------
	2013.03.15   송호현		최초생성  
	2013.08.02   김민규		CLASSDESK 에서 쓰이는 세션 코드 생성
	2013.09.12	 송호현	    통합세션관련 정보 생성
  
 */

public class UserSessionVO implements Serializable {
	
	private static final long serialVersionUID = 1L;

	/************ LMS기본 세션정보 *************/
	// 세션코드
	private String sessionId = "";
	
	// 인증사용자여부
	private String isLogin = "N";
	
	private String userId = "";
	private int userNo = 0;
	private String userName = "";
	
	/** 권한코드 */
	private String gradeCode = "";
	private String gradeName = "";
	private int gradeNum = 0;
	
	//독립사이트
	private int cyberGradeNum = 0;
	
	/** 강사코드 */
	private String tutorCode = "";
	private String tutorName = "";
	
	private String email = "";
	private String mobile = "";
	private String brthdy = "";
	
	/*회원구분코드*/
	private String mberRegGb = "";
	
	/*기업승인여부*/
	private String statusGb = "";
	
	/*강사구분코드*/
	private String tutorAt = "";
	
	/*강의명*/
	private String seqTitle = "";
	
	/*과정형태*/
	private String ctypeName = "";
	/******* CLASSDESK 에서 쓰이는 세션 *******/
	
	/** 세션 과정코드*/
	private int courseNo;
	/** 세션 수강코드*/
	private int cUserNo;
	/** 세션 과정개설코드*/
	private int cSeqNo;
	
	/******* 독립사이트 사용 세션 ************/
	private String siteName = "";
	private int siteNo = 0;
	private String siteDomain = "";
	private String siteBwTitle = "";
	private String siteLogImg = "";
	private String homePage = "";
	private String siteLeftImg = "";
	private String siteMainImg = "";
	private String bizno = "";
	
	/******** 로그인 상태 정보 **************/
	private int loginResult = 0;
	public final static int LOGIN_FAIL_INFO = 1;
	public final static int LOGIN_FAIL_PWD = 2;
	public final static int LOGIN_SUCCESS = 100;
	
	/******** 실시간세션정보 ***************/
	private String lastAccDate = "";
	private String ipAddr = "";
	private String lastAccUrl = "";
	
	
	
	public String getCtypeName() {
		return ctypeName;
	}

	public void setCtypeName(String ctypeName) {
		this.ctypeName = ctypeName;
	}
	
	public String getSeqTitle() {
		return seqTitle;
	}

	public void setSeqTitle(String seqTitle) {
		this.seqTitle = seqTitle;
	}
	
	public String gettutorAt() {
		return tutorAt;
	}

	public void settutorAt(String tutorAt) {
		this.tutorAt = tutorAt;
	}

	public String getLastAccUrl() {
		return lastAccUrl;
	}


	public void setLastAccUrl(String lastAccUrl) {
		this.lastAccUrl = lastAccUrl;
	}


	public String getSessionId() {
		return sessionId;
	}


	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}


	public String getIsLogin() {
		return isLogin;
	}


	public void setIsLogin(String isLogin) {
		this.isLogin = isLogin;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getGradeCode() {
		return gradeCode;
	}


	public void setGradeCode(String gradeCode) {
		this.gradeCode = gradeCode;
	}

	public int getGradeNum() {
		return gradeNum;
	}


	public void setGradeNum(int gradeNum) {
		this.gradeNum = gradeNum;
	}


	public String getGradeName() {
		return gradeName;
	}


	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}


	public String getTutorCode() {
		return tutorCode;
	}


	public void setTutorCode(String tutorCode) {
		this.tutorCode = tutorCode;
	}


	public String getTutorName() {
		return tutorName;
	}


	public void setTutorName(String tutorName) {
		this.tutorName = tutorName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getMobile() {
		
		return mobile;
	}


	public void setMobile(String mobile) {
		this.mobile =  mobile;
	}


	public int getCourseNo() {
		return courseNo;
	}


	public void setCourseNo(int courseNo) {
		this.courseNo = courseNo;
	}


	public int getcUserNo() {
		return cUserNo;
	}


	public void setcUserNo(int cUserNo) {
		this.cUserNo = cUserNo;
	}


	public int getcSeqNo() {
		return cSeqNo;
	}


	public void setcSeqNo(int cSeqNo) {
		this.cSeqNo = cSeqNo;
	}


	public String getSiteName() {
		return siteName;
	}


	public int getCyberGradeNum() {
		return cyberGradeNum;
	}


	public void setCyberGradeNum(int cyberGradeNum) {
		this.cyberGradeNum = cyberGradeNum;
	}


	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}


	public int getSiteNo() {
		return siteNo;
	}


	public void setSiteNo(int siteNo) {
		this.siteNo = siteNo;
	}


	public String getSiteDomain() {
		return siteDomain;
	}


	public void setSiteDomain(String siteDomain) {
		this.siteDomain = siteDomain;
	}


	public String getSiteBwTitle() {
		return siteBwTitle;
	}


	public void setSiteBwTitle(String siteBwTitle) {
		this.siteBwTitle = siteBwTitle;
	}


	public String getSiteLogImg() {
		return siteLogImg;
	}


	public void setSiteLogImg(String siteLogImg) {
		this.siteLogImg = siteLogImg;
	}


	public String getHomePage() {
		return homePage;
	}


	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}


	public String getSiteLeftImg() {
		return siteLeftImg;
	}


	public void setSiteLeftImg(String siteLeftImg) {
		this.siteLeftImg = siteLeftImg;
	}


	public String getSiteMainImg() {
		return siteMainImg;
	}


	public void setSiteMainImg(String siteMainImg) {
		this.siteMainImg = siteMainImg;
	}


	public int getLoginResult() {
		return loginResult;
	}


	public void setLoginResult(int loginResult) {
		this.loginResult = loginResult;
	}


	
	public String getBizno() {
		return bizno;
	}


	public void setBizno(String bizno) {
		this.bizno = bizno;
	}

	public String getLastAccDate() {
		return lastAccDate;
	}


	public void setLastAccDate(String lastAccDate) {
		this.lastAccDate = lastAccDate;
	}


	public String getIpAddr() {
		return ipAddr;
	}


	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}


	public String getMberRegGb() {
		return mberRegGb;
	}


	public void setMberRegGb(String mberRegGb) {
		this.mberRegGb = mberRegGb;
	}
	
	public String getStatusGb() {
		return statusGb;
	}
	
	public void setStatusGb(String statusGb) {
		this.statusGb = statusGb;
	}

	public String getBrthdy() {
		return brthdy;
	}

	public void setBrthdy(String brthdy) {
		this.brthdy = brthdy;
	}

	public String getTutorAt() {
		return tutorAt;
	}

	public void setTutorAt(String tutorAt) {
		this.tutorAt = tutorAt;
	}

	@Override
	public String toString() {
		return "UserSessionVO [sessionId=" + sessionId + ", isLogin=" + isLogin
				+ ", userId=" + userId + ", userNo=" + userNo + ", userName="
				+ userName + ", gradeCode=" + gradeCode + ", gradeName="
				+ gradeName + ", gradeNum=" + gradeNum + ", cyberGradeNum="
				+ cyberGradeNum + ", tutorCode=" + tutorCode + ", tutorName="
				+ tutorName + ", email=" + email + ", mobile=" + mobile
				+ ", brthdy=" + brthdy + ", mberRegGb=" + mberRegGb
				+ ", statusGb=" + statusGb + ", tutorAt=" + tutorAt
				+ ", seqTitle=" + seqTitle + ", ctypeName=" + ctypeName
				+ ", courseNo=" + courseNo + ", cUserNo=" + cUserNo
				+ ", cSeqNo=" + cSeqNo + ", siteName=" + siteName + ", siteNo="
				+ siteNo + ", siteDomain=" + siteDomain + ", siteBwTitle="
				+ siteBwTitle + ", siteLogImg=" + siteLogImg + ", homePage="
				+ homePage + ", siteLeftImg=" + siteLeftImg + ", siteMainImg="
				+ siteMainImg + ", bizno=" + bizno + ", loginResult="
				+ loginResult + ", lastAccDate=" + lastAccDate + ", ipAddr="
				+ ipAddr + ", lastAccUrl=" + lastAccUrl + "]";
	}
	
	
	

}

	
	