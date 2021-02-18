<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>
<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' var="nowDate"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" id="top">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Coronalab</title>
    
        <link href="/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     
        <script>var mailmsg = '${mailmsg}';
       		if(mailmsg!=null && mailmsg!=""){
    	  	 alert(mailmsg);
    		}
       	</script>
       	       		 <script>
       	var checkflag = false;
       	function check(field) {
       	        if (checkflag == false ) {
       	                for (i = 0; i < field.length; i++) {
       	                	if(field[i].disabled != true)
       	                		field[i].checked = true;
       	                		
       	                	checkflag = true;
       	                }
       	             
       	             if(field.disabled != true)
	                		field.checked = true;
       	                
       	        checkflag = true;
       	        return "몽땅해제";
       	        
       	        }else {
       	                for (i = 0; i < field.length; i++) {
       	                field[i].checked = false;
       	             checkflag = false;
       	                }
       	             
       	             field.checked = false;
       	             
       	        checkflag = false;
       	        return "몽땅선택";
       	        }
       	}
       	
    	function check2(field) {
   	        if (checkflag == true) {
   	        	
   	        		field.checked = false;
   	        	
   	        
   	        checkflag = false;
   	       
   	        }
   	}
     
       	</script>
       	       		<script>
      

     
       	</script>
       	
       	    <style>
            	.hover{ background-color:#fdf7df;}
            	.graytd{background-color:#fcfcfc;}
            </style>
            <script>
            	$(document).ready(function(){
            		$('tbody tr').hover(
            				function (){$(this).addClass('hover');},
            				function (){$(this).removeClass('hover');});
            	});
            </script>
       	 	<script>
    	$(document).ready(function(){
			var formObj = $("form[name='myform']");
			var formObj2 = $("form[name='myform2']");
			var checkObj = $("input[name='chk']:checked");
			
			// 수정 
			$("#btnDelete").on("click", function(){
				
				
				 if($('input:checkbox[name="chk"]:checked').length==0){
					 alert('1명 이상의 구독자를 선택해주세요.')
				 }

						
				 else{ 
					 if(confirm( $('input:checkbox[name="chk"]:checked').length+"명의 구독자를 삭제하시겠습니까?")){
					formObj.attr("action", "subDeleteCheck.do");
					formObj.attr("method", "post");
					formObj.submit();			
					}
				 }
			})
			
			$("#btnSend").on("click", function(){
				
				
				 if($('input:checkbox[name="chk"]:checked').length==0){
					 alert('1명 이상의 구독자를 선택해주세요.')
				 }

						
				 else{ 
					 if(confirm( $('input:checkbox[name="chk"]:checked').length+"명의 구독자에게 메일을 전송 하시겠습니까?")){
					formObj.attr("action", "subSendCheck.do");
					formObj.attr("method", "post");
					formObj.submit();			
					}
				 }
			})
			
			$("#btnSendAll").on("click", function(){
				
				
				

						
				
				if(confirm( "메일을 전체 구독자에게 전송하시겠습니까?")){
					formObj.attr("action", "subSendAll.do");
					formObj.attr("method", "post");
					formObj.submit();			
					
				 }
			})
			$("#btnSendSelect").on("click", function(){
				
				
				 if($('input:checkbox[name="chk"]:checked').length==0){
					 alert('1명 이상의 구독자를 선택해주세요.')
				 }

						
				 else{
				if(document.myform.mrno2.value.length ==0){
					alert('입력창에 번호를 입력해주세요.');
				}	 
				 
				 else if(confirm( $('input:checkbox[name="chk"]:checked').length+"명의 구독자에게 "+ document.getElementById("mrno2").value + "번메일을 전송 하시겠습니까?")){
					formObj.attr("action", "subSendCheckInput.do");
					formObj.attr("method", "post");
					formObj.submit();			
					}
				 }
			})
			
			$("#btnSendAllSelect").on("click", function(){
				if(document.myform2.mrno1.value.length ==0){
					alert('입력창에 번호를 입력해주세요.');
				}	 
	
				else if(confirm( document.getElementById("mrno1").value +"번 메일을 전체 구독자에게 전송하시겠습니까?")){
					formObj2.attr("action", "subSendAllInput.do");
					formObj2.attr("method", "post");
					formObj2.submit();			
					
				 }
			})
			
			
		
			// 취소
			// 목록
		
		})
       	</script>
       	<script>
       		function setPerPageNums(){
       			var sh = document.getElementById("s1");
   
      			
       			location.href="subscribeList.do?&page=1&perPageNum="+ sh.value;
       					//+"&searchType=${scri.searchType}&keyword=${scri.keyword}"
       		}
       	</script>
       	         
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="/resources/vendor/jquery/jquery.slim.min.js"></script>
          
    </head>
    <body class="sb-nav-fixed">
       <jsp:include page="/WEB-INF/jsp/egovframework/corona/admin/nav.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                       <h1 class="mt-4"><i class="fas fa-table"></i> 구독자 목록</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item active">구독자 목록</li>
                        </ol>
                      
                        <div class="row"></div>
                         <div class="card mb-4">
                         <div class="card-body">
                         ※ 구독자에게 정기 컨텐츠 이메일을 보낼 수 있습니다.
                         </div>
                         </div>
                              
                        

<!-- 데이터 테이블-->
                        
                        <div class="card mb-4">
                            <div class="card-header">
                            	
                               		 <i class="fas fa-table mr-1 "></i>
                                		구독자 테이블
                                		<select name="s1" id="s1" oninput="setPerPageNums()"  >
                                    	<option value="10" <c:if test="${scri.perPageNum == '10'}" > selected </c:if>  >10개 보기</option>
                                    	<option value="20" <c:if test="${scri.perPageNum == '20'}" > selected </c:if> >20개 보기</option>
                                    	<option value="50" <c:if test="${scri.perPageNum == '50'}" > selected </c:if> >50개 보기</option>
                                    	<option value="100" <c:if test="${scri.perPageNum == '100'}" > selected </c:if> >100개 보기</option>
                                    </select>
                                	<div style="float: right;">
                                	<form name="myform2" method=post>
                                	<div class="input-group">
                                	
                                	<input size="5px" type="text" name="mrno1" id="mrno1" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></input>  
                                 <button  class="btn btn-primary" style="background-color:green; border-color:green" type="button" id ="btnSendAllSelect" name="btnSendAllSelect"  ><span> 번 컨텐츠 전체 전송</span><i class="icon fa fa-paper-plane"></i></button>
                                &nbsp;&nbsp;
                                <button  class="btn btn-primary" type="button" id ="btnSendAll"   ><span> 정기컨텐츠 전체 전송</span><i class="icon fa fa-paper-plane"></i></button>
                                </div>
                                </form>
                                 </div>
                            
                             
                            </div>
                          
                           		
                            
                        
                            
                                
                            <div class="card-body">
                        
                       
                                <div class="table-responsive">
                               <form name="myform" action="adminDeleteCheck.do" method=post>
                                    <table class="table table-bordered"   width="100%" cellspacing="0">
                                        <thead style="background-color:#F2F2F2">
                                            <tr>
                                            <th width="50px" style="text-align: center"><input type="checkbox" name="checkall" onchange="check(this.form.chk)"/></th>
                                            	<th  width="60px" nowrap>번호</th>
                                                <th>이름</th>
                                                <th>생년월일</th>
                                                <th>이메일</th>
                                                <th>등록일</th>
                                            
                                                
                                                                                                
                                            </tr>
                                        </thead>
                                 
                                        <tbody>
                                        	<c:forEach items="${subList}" var = "subList">
                                          <tr>
                                          <td style="text-align: center"><input type="checkbox" name="chk" value="${ subList.cmno}" onchange="check2(this.form.checkall)" class="checkSelect" /></td>
								<td width="60px" nowrap style="text-align:center"><c:out value="${pageMaker.totalCount - subList.rnum + 1}" /></td>
								<td><c:out value="${subList.cname}" /></td>
								<td><c:out value="${subList.cbirth}" /></td>
								
								<td><a href="mailto:<c:out value="${subList.mailaddress}" />"><c:out value="${subList.mailaddress}" /></a></td>
							
								
							
								
								
								<!--  -->
						
								<td><fmt:formatDate value="${subList.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
																						
							</tr>
                                       	</c:forEach>
                                       
                                        </tbody>
                                           <tfoot style="background-color:#F2F2F2" >
                                        
                                        <th colspan="8">
                                       
                                        	  <div style="float: right;">
                                        	  <div class="input-group">
                                        	
                                        <input type="text" size="5px" name="mrno2" id="mrno2" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></input>
                                        <button  class="btn btn-primary" style="background-color:green; border-color:green" type="button" id ="btnSendSelect"   ><span> 번 컨텐츠 선택 전송</span><i class="icon fa fa-paper-plane"></i></button>	  
                                   		&nbsp;
                                   		<button class="btn btn-primary" type="button" name="btnSend" id ="btnSend"  ><span>정기컨텐츠 선택 전송</span><i class="icon fa fa-paper-plane"></i></button>
                                   		&nbsp;
										<button class="btn btn-primary" type="button" name="btnDelete" id ="btnDelete" style="background-color:#FE2E64; border-color:#FE2E64" >선택 삭제</button>
										</div>
										</div>
										</th> 
                                        
                                        </tfoot>
                                    </table>
                                    </form>
                                       <div class="container  mt-5">
                                    	<form role="form" method="get" >
                                    	<input type="hidden" id="page" name="page" value="${scri.page}"> 
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
                              				<div class="input-group justify-content-center">
                    							<div class="input-group-append">
                    					 			<select name="searchType" >
     					 	<option value="n" selected disabled <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>----------</option>
     					 	<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>이름</option>
     					 	<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>생년월일</option>
     					 	<option value="p"<c:out value="${scri.searchType eq 'p' ? 'selected' : ''}"/>>이메일</option> 
      						
      						
    					</select>
    				   
								
   							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />
							
    							<button class="btn btn-primary" id="searchBtn" type="button" ><BIG><i class="fas fa-search"></i></BIG></button>
    						
    					<script>
      						$(function(){
        						$('#searchBtn').click(function() {
          						self.location = "subscribeList.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + 
          						$("select[name='searchType'] option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
       							 });
    						  });   
   		
      					</script>
                    							</div>
                							</div>
                						</form>
				
  										<ul class="pagination justify-content-center mt-5">
    										<c:if test="${scri.page != 1}">
    							<li class="page-item"><a class="page-link" href="subscribeList.do${pageMaker.makeSearch(1)}"> <i class="fa fa-angle-double-left" style="font-size:20px;"></i> </a></li>
    						</c:if>
    						<c:if test="${pageMaker.prev}">
    							<li class="page-item"><a class="page-link" href="subscribeList.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"> <i class="fa fa-angle-left" style="font-size:20px;"></i> </a></li>
    						</c:if>
    						

    						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    							
    							<c:choose>
    								<c:when test="${idx eq scri.page }">
    								<li class="page-item-active" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>
    									<a class="page-link" href="subscribeList.do${pageMaker.makeSearch(idx)}"><B>${idx}</B></a></li>
    								</c:when>
    								<c:otherwise>
    								<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>
    									<a class="page-link" href="subscribeList.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
    								</c:otherwise>
    							</c:choose>
    						</c:forEach>
    						

    						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    							<li class="page-item"><a class="page-link" href="subscribeList.do${pageMaker.makeSearch(pageMaker.endPage + 1)}"> <i class="fa fa-angle-right" style="font-size:20px;"></i></a></li>
    						 </c:if>
    						 <c:if test="${scri.page != pageMaker.totalPage}">
    							<li class="page-item"><a class="page-link" href="subscribeList.do${pageMaker.makeSearch(pageMaker.totalPage)}"> <i class="fa fa-angle-double-right" style="font-size:20px;"></i></a></li>
    						</c:if>
    					
  										</ul>
									</div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                                 
           				
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Coronalab 2020</div>
                        </div>
                    </div>
                </footer>
            </div>
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
     
       
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        
    </body>
</html>
