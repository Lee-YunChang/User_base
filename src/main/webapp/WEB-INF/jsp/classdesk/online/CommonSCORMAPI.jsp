<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:set var="domain" value='<%=SangsProperties.getProperty("Globals.domain")%>'/>

<c:set var="pcContentPath" value='<%=SangsProperties.getProperty("Globals.ContentsRootUri")%>'/> 
<c:set var="mobileContentPath" value='<%=SangsProperties.getProperty("Globals.ContentsRootMobileUri")%>'/>
<c:set var="URL1" value="${domain}/${pcContentPath}${treeData.FILE_PATH}"/>
<c:set var="URL2" value="${domain}/${mobileContentPath}${treeData.MOBILE_FILE_PATH}"/>
<c:set var="URL3" value="${domain}/${mobileContentPath}"/>


<c:set var="COURSENO" value="${REQUEST_DATA.courseno}"/>
<c:set var="CSEQNO" value="${REQUEST_DATA.cseqno}"/>
<c:set var="CUSERNO" value="${REQUEST_DATA.cuserNo}"/>
<c:set var="TREENO" value="${REQUEST_DATA.treeno}"/>
<c:set var="GRADENO" value="${REQUEST_DATA.SES_GRADENO}"/>
<c:set var="FRAMECNT" value="${treeData.FRAMECNT}"/>
<c:set var="SEQTITLE" value="${rowData.SEQ_TITLE}"/>
<c:set var="FRAMESEQ" value="${treeHistData.FRAMESEQ}" />
<c:set var="MOVSEC" value="${treeHistData.MOVSEC}" />
<c:set var="FRAMESEQ_BAK" value="${treeHistData.FRAMESEQ}" />
<c:set var="ISPASS" value="${REQUEST_DATA.ispass}" />
  
<script language="javascript"> 
	var pageCount = new Array;
	var maxPage = 1;
	var studytime = 0; //학습누적시간
	var last_frameseq = 1;
	var frameCompStatus = '';
	var tid=0;
	var movsec=0;//현재영상시간
	var filter = "win16|win32|win64|mac";
	
	var old_frame_comp_status =  <c:out value="'${treeHistData.FRAME_COMP_STATUS}'" default="''" escapeXml="false"/>
	var frame_comp_status = <c:out value="'${treeHistData.FRAME_COMP_STATUS}'" default="''" escapeXml="false"/>
	var framecnt = <c:out value="'${treeData.FRAMECNT}'" default="'0'" escapeXml="false"/>
	var lastframeseq = "${empty treeHistData.LAST_FRAMESEQ ? '' : treeHistData.LAST_FRAMESEQ}";
	var oldMaxFrame = '${empty treeHistData.FRAMESEQ ? 1 : treeHistData.FRAMESEQ}';
	var usernm = '${REQUEST_DATA.SES_USERNAME}';
	
	var bookmarkType = '${REQUEST_DATA.BOOK_MARK_TYPE}';
	
	var frame_comp_status_mobile_array;
	function initAPI()
	{
		window.API_1484_11 = {
				_NoError:0
				,data:[]
				,setFrameCompStatus:function(frame_comp_status) {
					if (frame_comp_status) {
						for (var i=0; i<frame_comp_status.length; i++) {
							if (frame_comp_status.charAt(i) == '1') {
								this.SetValue("cmi.objectives."+i+".completion_status","completed");
							} else {
								this.SetValue("cmi.objectives."+i+".completion_status","incomplete");
							}
							this.SetValue("cmi.objectives."+i+".id",i);
						}
					}
				}
				,getFrameCompStatus:function(){
					if (!this.GetValue('cmi.objectives._count')) {
						return "";
					} else {
						var cnt = this.GetValue('cmi.objectives._count');
						var tmp = [];
						var frame_comp_status = "";
						for (var i=0; i<cnt; i++) {
							if (this.GetValue("cmi.objectives."+i+".completion_status") == 'completed') {
								tmp.push('1');
							} else {
								tmp.push('0');
							}
						}
						
						frame_comp_status = tmp.join('');
						this.SetValue("cmi.frame_comp_status",frame_comp_status);
						return this.GetValue('cmi.frame_comp_status');
						
					}
				}
				,init:function(usernm, framecnt, oldMaxFrame, lastframeseq, frame_comp_status){
					this.SetValue("cmi.prev_frame_comp_status",frame_comp_status);
					this.SetValue("cmi.learner_name",usernm);
					this.SetValue("cmi.objectives._count",framecnt);
					this.SetValue("cmi.prev_max_frame",oldMaxFrame);
					this.SetValue("cmi.location",lastframeseq);
					
					this.setFrameCompStatus(frame_comp_status);
					
				}
				,Initialize:function(args){
					this.startDate = new Date().getTime();
					return "true";
				}
				,Terminate:function(args){
					this.computeTime();
					this.getFrameCompStatus();
					return "true";
				}
				,SetValue:function(name, value){
					for (var i=0; i<this.data.length; i++) {
						if (this.data[i].name == name) {
							this.data[i] = {name:name, value:value};
							return "true";
						}
					}
					
					if (!this.GetValue(name)) {
						this.data.push({name:name, value:value});
						return "true";
					} else {
						return "false";
					}
					
					
				}
				,GetValue:function(name){
					
					for (var i=0; i<this.data.length; i++) {
						if (this.data[i].name == name) {
							return this.data[i].value;
						}
					}
					return "";
				}
				,GetLastError:function(){ return this._NoError; }
				,GetErrorString:function(errCode){ return ""; }
				,startDate:null
				,startTimer:function(){
					this.startDate = new Date().getTime();
				}
				,computeTime:function(){
					if ( this.startDate != 0 ) {
						var currentDate = new Date().getTime();
						var elapsedSeconds = ( (currentDate - this.startDate) / 1000 );
					} else {
						elapsedSeconds = "0";
					}
					
					this.SetValue( "cmi.core.session_time", elapsedSeconds );
					
				}
				,compareFrameSts:function(oldFrmCompSts, newFrmCompSts, frameCnt, maxFrame){
					frameCnt = parseInt(frameCnt, '10');
					maxFrame = parseInt(maxFrame, '10');
					var old = "";
					
					if (!oldFrmCompSts) {
						while(old.length < maxFrame) {
							old = "1" + old;
						}
						
						for (var i=0; i<(frameCnt - maxFrame); i++) {
							old = old + "0";
						}
					}
					
					var result = [];
					for (var i=0; i<frameCnt; i++) {
						result.push(Math.max(old.charAt(i), newFrmCompSts.charAt(i)));
					}
					return result.join('');
				}
			};
		
		window.sapi = window.API_1484_11;
		window.sapi.init(usernm, framecnt, oldMaxFrame, lastframeseq, frame_comp_status);
		
	
		if (navigator.platform) {
			
			 
			if (0 > filter.indexOf(navigator.platform.toLowerCase())) {
				//mobile
				$("#contentArea").append(
						//"<c:if test='${ FRAMECNT eq FRAMESEQ && FRAMECNT ne 3 }'><c:set var='FRAMESEQ' value='1' /></c:if><iframe id='scomf' title='<c:out value='${SEQTITLE}'/>' width=100% height=400 align='center' frameborder='no'  scrolling='no'  src='<c:out value='${URL3}'/>/index.html?courseno=<c:out value='${COURSENO}'/>&cseqno=<c:out value='${CSEQNO}'/>&cuserNo=<c:out value='${CUSERNO}'/>&treeno=<c:out value='${TREENO}'/>&gradeno=<c:out value='${GRADENO}'/>&frameCnt=<c:out value='${FRAMECNT}'/>&frameSeq=<c:out value='${FRAMESEQ}' default='1'/>&frameSeqBak=<c:out value='${FRAMESEQ_BAK}' default='1'/>&movsec=<c:out value='${MOVSEC}' default='0'/>&ispass=<c:out value='${ISPASS}' default='0'/>' target_frame='main'>"
						"<c:if test='${ FRAMECNT eq FRAMESEQ && FRAMECNT ne 3 }'><c:set var='FRAMESEQ' value='1' /></c:if><iframe id='scomf' title='<c:out value='${SEQTITLE}'/>' width=100% height=400 align='center' frameborder='no'  scrolling='no'  src='/edu-data/contents/mobile/index.html?courseno=<c:out value='${COURSENO}'/>&cseqno=<c:out value='${CSEQNO}'/>&cuserNo=<c:out value='${CUSERNO}'/>&treeno=<c:out value='${TREENO}'/>&gradeno=<c:out value='${GRADENO}'/>&frameCnt=<c:out value='${FRAMECNT}'/>&frameSeq=<c:out value='${FRAMESEQ}' default='1'/>&frameSeqBak=<c:out value='${FRAMESEQ_BAK}' default='1'/>&movsec=<c:out value='${MOVSEC}' default='0'/>&ispass=<c:out value='${ISPASS}' default='0'/>' target_frame='main'>"		
						);

			 
			 } else {
				//pc
				$("#contentArea").append(
						//"<c:if test='${ FRAMECNT eq FRAMESEQ && FRAMECNT ne 3 }'>	<c:set var='FRAMESEQ' value='1' /></c:if><iframe id='scomf' title='<c:out value='${SEQTITLE}'/>' width=1100 height=800 align='center' frameborder='no'  scrolling='no'  src='<c:out value='${URL3}'/>/index.html?courseno=<c:out value='${COURSENO}'/>&cseqno=<c:out value='${CSEQNO}'/>&cuserNo=<c:out value='${CUSERNO}'/>&treeno=<c:out value='${TREENO}'/>&gradeno=<c:out value='${GRADENO}'/>&frameCnt=<c:out value='${FRAMECNT}'/>&frameSeq=<c:out value='${FRAMESEQ}' default='1'/>&frameSeqBak=<c:out value='${FRAMESEQ_BAK}' default='1'/>&movsec=<c:out value='${MOVSEC}' default='0'/>&ispass=<c:out value='${ISPASS}' default='0'/>' target_frame='main'>"
						"<c:if test='${ FRAMECNT eq FRAMESEQ && FRAMECNT ne 3 }'>	<c:set var='FRAMESEQ' value='1' /></c:if><iframe id='scomf' title='<c:out value='${SEQTITLE}'/>' width=1100 height=800 align='center' frameborder='no'  scrolling='no'  src='/edu-data/contents/mobile/index.html?courseno=<c:out value='${COURSENO}'/>&cseqno=<c:out value='${CSEQNO}'/>&cuserNo=<c:out value='${CUSERNO}'/>&treeno=<c:out value='${TREENO}'/>&gradeno=<c:out value='${GRADENO}'/>&frameCnt=<c:out value='${FRAMECNT}'/>&frameSeq=<c:out value='${FRAMESEQ}' default='1'/>&frameSeqBak=<c:out value='${FRAMESEQ_BAK}' default='1'/>&movsec=<c:out value='${MOVSEC}' default='0'/>&ispass=<c:out value='${ISPASS}' default='0'/>' target_frame='main'>"
						);
			
			 }
		}
	}
	 
	
	//총 누적시간
	function mobile(_pageIdx, getMovsecPercent, _openTimeSec, _openPageTimeSec, _bestPageIdx, frame_comp_status_mobile_array_tmp) {
		maxPage = _bestPageIdx;
		last_frameseq = _pageIdx;
		studytime = _openTimeSec; //학습누적시간
		movsec = getMovsecPercent; //현재영상시간
		//frame_comp_status_mobile_array = frame_comp_status_mobile_array_tmp.toString();
		frame_comp_status_mobile_array = frame_comp_status_mobile_array_tmp.toString().split(',').join('');
	}

	function onExit(){
		var treeno = $("#treeno").val();
		var seqTitle = $("#seqTitle").val();
		var isPass = $("#isPass").val();
		var stime = Number($('#studytime').val()) + Number(studytime);
		
		  parent.opener.progExec(
					 			'5'
					 			,treeno
					 			,'3'
					 			,stime
					 			,'50'
					 			,true
					 			,old_frame_comp_status
					 			,seqTitle
					 			,isPass); 

	}
</script> 


