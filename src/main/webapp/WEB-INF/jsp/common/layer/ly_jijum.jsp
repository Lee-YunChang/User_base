<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>

<script id="itemRow" type="text/template">
 <li><a href="#none" class="jijumLayer" value="{{=comno}}/{{=comname}}">{{=comname}}</a></li>
</script>

<script type="text/javascript">
	$(document).ready(function(){
		
		fnJijumList();
		
		$('body').on('click','.jijumLayer', function(e){
			e.preventDefault();
			var result = $(this).attr('value').split('/');
			var data = {};
			data.code = result[0];
			data.name = result[1];
			
			selectJijumDatas(data);
			$('.close').trigger('click'); //layer closed.
		});
		
	});
	
	function fnJijumList(){
		
		 $.ajax({
            url : "/academy/user/officeSearchList.do",
            data : {mtOfficeName:$('#mtOfficeName').val()},
            dataType : "json",
            type : 'post',
            success : function(res) {
            	
            		if(res.list.length == 0){
            			alert('검색결과가 없습니다. 검색어에 잘못된 철자가 없는지, 정확한 지점인지 다시 한번 확인해 주세요.');
            		}else{
            			$('#itemList').empty();	
            			
            			$.each(res.list, function(i, item){
    		        		$('#itemList').append(_.template($('#itemRow').html())(
    		        				{ comno:item.COMNO
    		        				  ,comname:item.COMNAME	
    		        				}
    		        		));
    					 });
            		}
            },
            error : function(e) {
                alert("error :" + e.responseText);
            }
        });  
	}
	
</script>
	<article>
       	<div class="modal" id="jijum" tabindex="-1" role="dialog" aria-labelledby="jijumLabel" aira-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-modal="Close" title="닫기"><span aria-hidden="true" class="text-hide">닫기</span></button>
                        <h4 class="modal-title" id="jijumLabel">지점(지부) 검색</h4>
                    </div>

                </div>
                <div class="modal-body">
                    <section>
                        <div class="searchWrap">
                                <fieldset>
                                    <legend class="sr-only">검색</legend>
                                    <div class="formSearch">
                                        <div class="onlyOneBtn">
                                              <input type="text" title="검색어입력" name="mtOfficeName" id="mtOfficeName" class="textBox">
                                            <button type="button" name="button" onclick="fnJijumList(); return false;" class="btn-mint" title="검색">검색</button>
                                        </div>
                                    </div>
                                </fieldset>
                        </div>
                    </section>
                                <p class="rbltopTxt"><strong class="po_C2">* 정렬순서는 가나다순 입니다.</strong></p>
                    <section>
                        <div class="listScrollWrap borBox">
                            <div class="listWrap">
                               <ul id="itemList">
                                </ul>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </article>