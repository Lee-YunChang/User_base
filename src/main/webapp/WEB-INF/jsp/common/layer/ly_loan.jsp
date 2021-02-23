<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/inc/taglib_inc.jsp"%>

<script id="itemRow" type="text/template">
<tr>
	<td>{{=FND_USECD_NM}}</td>
	<td class="text-left">{{=GDNM}}</td>
	<td class="text-left">{{=FND_KND_NM}}</td>
	<td>
		<a href="#" name="" value="{{=FND_USECD}}/{{=FND_USECD_NM}}/{{=GDCD}}/{{=GDNM}}/{{=FND_KND_CD}}/{{=FND_KND_NM}}" class="btn btn-sm btn-default loanLayer">선택</a>
	</td>
</tr>
</script>



                 		
<script type="text/javascript">
	$(document).ready(function(){
		console.log('------ loan Layer load -------------')
		
		$('body').on('click','.loanLayer', function(e){
			e.preventDefault();
			var result = $(this).attr('value').split('/');
			var data = {};
			data.pcode = result[0];
			data.pname = result[1];
			data.code = result[2];
			data.name = result[3];
			data.knd = result[4];
			data.kndnm = result[5];
			
			selectLoanDatas(data);
			$('.close').trigger('click'); //layer closed.
		});
		
		$('.searchTxt').keypress(function(e){
			if(event.which == 13){
				e.preventDefault();
				fnLoanList();
			}
			
		});
		
		
		fnLoanList();
		
	});
	
	function fnLoanList(){
		/* $.ajax({
            url : "/academy/myclass/getEduLoanPrdList.do",
            data : {fnd_usecd:$('#fnd_usecd').val(), gdnm:$('#gdnm').val()},
            dataType : "json",
            type : 'post',
            success : function(res) {
            	
            		if(res.list.length == 0){
            			//alert('검색결과가 없습니다. 검색어에 잘못된 철자가 없는지, 정확한 지점인지 다시 한번 확인해 주세요.');
            			$('#itemList').html('<tr><td colspan="4">등록된 대출상품 검색결과가 없습니다.</td></tr>');	
            			$('.po_C2').text(0);
            		}else{
            			$('#itemList').empty();	
            			$('.po_C2').text(res.list.length);
            			
            			
            			$.each(res.list, function(i, item){
    		        		$('#itemList').append(_.template($('#itemRow').html())(
    		        				{ FND_USECD:item.FND_USECD
    		        				  ,FND_USECD_NM:item.FND_USECD_NM	
    		        				  ,GDCD:item.GDCD
    		        				  ,GDNM:item.GDNM
    		        				  ,FND_KND_CD:item.FND_KND_CD
    		        				  ,FND_KND_NM:item.FND_KND_NM
    		        				}
    		        		));
    					 });
            		}
            },
            error : function(e) {
                alert("error :" + e.responseText);
            }
        });  */
	}
	
</script>
    <article>
       <div class="modal" id="ch_myClass" tabindex="-1" role="dialog" aria-labelledby="postLabel" aira-hidden="true">
           <div class="modal-dialog">
               <div class="modal-content">
                   <div class="modal-header">
                       <button title="닫기" type="button" class="close" data-dismiss="modal" aria-modal="Close"><span aria-hidden="true" class="text-hide">닫기</span></button>
                       <h4 class="modal-title" id="postLabel">대출상품리스트</h4>
                   </div>

               </div>
               <div class="modal-body">
                   <section>
	                 <div class="tblWrap">
	                     <form>
	                         <fieldset>
	                             <legend class="sr-only">대출상품 검색</legend>
	                             <table class="writeForm">
	                             	<caption>대출상품검색</caption>
	                             	<colgroup>
	                             		<col style="width:30%">
	                             		<col style="width:*">
	                                 	</colgroup>
	                                 	<tbody>
	                                 		<tr>
	                                 			<th scope="row">상품용도</th>
	                                 			<td>
	                                 				<select name="fnd_usecd" id="fnd_usecd" title="대출종류" class="form-control-static">
														<option value="">전체</option>
														<c:forEach var="result" items="${goods}" varStatus="status">
															<option value="<c:out value="${result.FND_USECD}"/>"><c:out value="${result.FND_USECD_NM}"/></option>
														</c:forEach>
									 				</select>
	                                 			</td>
	                                 		</tr>
	                                 		<!-- <tr>
	                                 			<th scope="row">대출상품</th>
	                                 			<td>
	                                 				 <input type="text" title="검색어입력" name="gdnm" id="gdnm" value="" class="form-control searchTxt">
	                                 			</td>
	                                 		</tr> -->
	                                 	</tbody>
	                                 </table>
	                             </fieldset>
	                         </form>
	                     </div>
						<div class="btnAreaC mrg_t10">
							<button title="검색" type="button" class="btn btn-blue btn-lg" onclick="fnLoanList(); return false;">검색</button>
						</div>
	                 </section>
                 	<hr class="hr_20">
	                 <section>
	                 	<span>조회건수 : <strong class="po_C2">0</strong>건</span>
	                     <div class="tblListScroll borBox mrg_t5">
	                         <div class="tblWrap">
	                             <table class="dataTbl text-center">
	                             	<caption>상품목록</caption>
	                             	<colgroup>
	                             		<col style="width:20%">
	                         		<col style="width:30%">
	                         		<col style="width:30%">
	                         		<col style="width:16%">
	                         	</colgroup>
	                         	<thead>
	                         		<tr>
	                         			<th scope="col">대출종류</th>
	                         			<th scope="col">대출상품</th>
	                         			<th scope="col">자금용도</th>
	                         			<th scope="col"></th>
	                         		</tr>
	                         	</thead>
	                         	<tbody id="itemList">
	                         		<tr><td colspan="4">등록된 대출상품 검색결과가 없습니다.</td></tr>
	                         		
	                         	</tbody>
	                         </table>
	                     </div>
	                 </div>
	             </section>
              </div>
          </div>
      </div>
  </article>
                
                