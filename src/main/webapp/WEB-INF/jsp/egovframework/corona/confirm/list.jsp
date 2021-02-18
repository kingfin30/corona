<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="asapro" uri="http://www.asadal.com" %>

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
        <script>var msg2 = '${msg2}';
       		if(msg2!=null && msg2!=""){
    	  	 alert(msg2);
    		}
       	</script>
       	 <script>var chkMsg = '${chkMsg}';
       		if(chkMsg!=null && chkMsg!=""){
    	  	 alert(chkMsg);
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

    	$(document).ready(function(){
			var formObj = $("form[name='myform']");
			var checkObj = $("input[name='chk']:checked");
			
			// 수정 
			$("#btnRelease").on("click", function(){
				
				
				 if($('input:checkbox[name="chk"]:checked').length==0){
					 alert('1명 이상의 확진자를 선택해주세요.')
				 }

						
				 else{ 
					 if(confirm( $('input:checkbox[name="chk"]:checked').length+"명의 확진자를 해제 상태로 변경하시겠습니까?")){
					formObj.attr("action", "releaseCheck.do");
					formObj.attr("method", "post");
					formObj.submit();			
					}
				 }
			})
			$("#btnDead").on("click", function(){
				 if($('input:checkbox[name="chk"]:checked').length==0){
					 alert('1명 이상의 확진자를 선택해주세요.')
				 }

						
				 else{ 
					 if(confirm( $('input:checkbox[name="chk"]:checked').length+"명의 확진자를 사망 상태로 변경하시겠습니까?")){
					formObj.attr("action", "deadCheck.do");
					formObj.attr("method", "post");
					formObj.submit();			
					}
				 }
			})
			// 취소
			// 목록
		
		})
       	</script>
       	<script>
     
       		function setPerPageNums(){
       			var sh = document.getElementById("s1");
       			
       			
   
      			
       			location.href="list.do?&page=1&perPageNum="+ sh.value+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
       			
       			  	
       		}
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
   
       	         
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="/resources/vendor/jquery/jquery.slim.min.js"></script>
          
    </head>
    <body class="sb-nav-fixed">
         <jsp:include page="/WEB-INF/jsp/egovframework/corona/admin/nav.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                    	 <h1 class="mt-4"><i class="fas fa-table"></i> 확진자 목록</h1>
   			           <ol class="breadcrumb mb-4">
                           	<li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item active">확진자 목록</li>
                        </ol>
                       
                        <div class="row"></div>
                              
                        

<!-- 데이터 테이블-->
                        <div class="card mb-4">
                         <div class="card-body">
                         
                         ※ 이름을 클릭하면 상세 정보를 보실 수 있습니다.
                         </div>
                         </div>
                         
				


                        <div class="card mb-4">
                            <div class="card-header">
                         
                            	
               
                               		 <i class="fas fa-table mr-1 "></i>
                                		확진자 테이블
                                		 <select name="s1" id="s1" oninput="setPerPageNums()"  >
                                    	<option value="10" <c:if test="${scri.perPageNum == '10'}" > selected </c:if>  >10개 보기</option>
                                    	<option value="20" <c:if test="${scri.perPageNum == '20'}" > selected </c:if> >20개 보기</option>
                                    	<option value="50" <c:if test="${scri.perPageNum == '50'}" > selected </c:if> >50개 보기</option>
                                    	<option value="100" <c:if test="${scri.perPageNum == '100'}" > selected </c:if> >100개 보기</option>
                                    </select>
                                		
                                    
                                    	<div style="float:right;" >
                                   
                                	<button class="btn btn-primary" type="button" id ="btnChange" onclick = "location.href = 'insert.do' " >확진자 등록</button>
                                	<!--  
                                	<button class="btn btn-primary" type="button" id ="btnChange" onclick = "location.href = 'boardlistexcel.do' " >엑셀 다운로드</button>-->
                            </div>
                            
                       
                            </div>
                          
                           		
                            
                        
                            
                                
                            <div class="card-body">
                                <div class="table-responsive">
                                	<form name="myform" action="releaseCheck.do" method=post>
                                	
  					<input type="hidden" id="page" name="page" value="${scri.page}"> 
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
 					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
 					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 

                                    <table  class="table table-bordered"   width="100%" cellspacing="0">
                                    
                                        <thead style="background-color:#F2F2F2">
                                            <tr style="text-align:center">
                                            	<th width="50px" style="text-align: center"><input type="checkbox" name="checkall" onchange="check(this.form.chk)"/></th>
                                            	<th  width="100px">번호</th>
                                                <th>이름</th>
                                                <th>생년월일</th>
                                               
                                                <th width="150px">나이(만)</th>
                                                <th width="100px">성별</th>
                                               <th width="250px">연락처</th>
                                                  
                                               
                                                <th width="100px">지역</th>
                                                 <th width="120px">내.외국인</th>
                                               
                                               
                                                 <th width="100px">상태</th>
                                                  <th width="150px">확진일</th>
                							<!--  
												<th style="text-align: center">상태변경
                                                -->
                                            </tr>
                                        </thead>
                                 
                                        <tbody>
                                        	<c:forEach items="${list}" var = "list">
                                          <tr>
                                          <td style="text-align: center"><input type="checkbox" name="chk" value="${list.cno}" onchange="check2(this.form.checkall)" class="checkSelect" 
                                          <c:if test="${list.state!='확진'}">disabled</c:if> /></td>
								<td style="text-align:center"><c:out value="${pageMaker.totalCount - list.rnum + 1}" /></td>
								
								<td>&nbsp;&nbsp;<a href = "read.do?cno=${list.cno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><B> <c:out value="${list.name}" /></B></a></td>
								
								<td>${asapro:maskingBirthRight4(list.birth)}</td> 
								
								<td style="text-align: center"><c:out value="${list.age}" /> 세</td>
								<td style="text-align:center">
									<c:out value="${list.gender}" />
									<c:choose>
										<c:when test="${list.gender eq '남성' }">
											<i style="color:blue" class="fas fa-mars"></i>
										</c:when>
										<c:when test="${list.gender eq '여성' }">
											<i style="color:red" class="fas fa-venus"></i>
										</c:when>
									</c:choose>
								</td>
								<td><c:out value="${list.phone}" /> (<c:out value="${list.cellOs}" />) </td>
								
								
								
								<td style="text-align:center"><c:out value="${list.region}" /></td>
								
								<td style="text-align:center"><c:out value="${list.local}" /></td> 
								
								
								
								<td style="text-align:center">
									<c:choose>
										<c:when test="${list.state=='확진'}">
											<span style="color:red"><c:out value="${list.state}"></c:out></span>
										</c:when>
										<c:when test="${list.state=='해제'}">
											<span style="color:green"><c:out value="${list.state}"></c:out></span>
										</c:when>
										<c:when test="${list.state=='사망'}">
											<span><c:out value="${list.state}"></c:out></span>
										</c:when>
										
									</c:choose>
								</td>
								<td style="text-align:center"><fmt:formatDate value="${list.confirm_date}" pattern="yyyy-MM-dd"/></td>
								<td hidden><fmt:formatDate value="${list.update_date}" pattern="yyyy-MM-dd" var="updateDate"/></td>
								<!--  <td style="text-align: center"><button class="btn btn-primary" type="button" id ="btnChange" onclick="location.href = 'read.do?cno=${list.cno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}' ">내용확인</button></td>
									
								<c:choose>
									<c:when test="${list.state=='확진'}">
										<td style="text-align: center"><button class="btn btn-primary" type="button" name="btnRealse" id ="btnRealse" onclick=
										"if(confirm('${list.cno}번 확진자 ${list.name}님을 격리 해제 상태로 바꾸시겠습니까?'))
										{ location.href = 
										'release.do?cno=${list.cno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}';}else{return false;} " 
										><small>해제</small></button>
										<button class="btn btn-primary" type="button" name="btnDead" id ="btnDead" onclick=
										"if(confirm('${list.cno}번 확진자 ${list.name}님을 사망 상태로 바꾸시겠습니까?'))
										{ location.href = 
										'dead.do?cno=${list.cno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}';}else{return false;} "  
										><small>사망</small></button></td>
									</c:when>	
									<c:otherwise>
										<td style="text-align: center"><button class="btn btn-primary" type="button" id ="btnReset" onclick=
										"if(confirm('${list.cno}번 확진자 ${list.name}님의 상태를 초기화하시겠습니까?'))
										{ location.href = 
										'reset.do?cno=${list.cno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}';}else{return false;} " 
										<c:if test="${updateDate != nowDate}" >disabled</c:if> 
										> <small>되돌리기</small> </button></td>
									</c:otherwise>
								</c:choose>
										-->														
							</tr>
                                       	</c:forEach>
                                       
                                        </tbody>
                                        <tfoot style="background-color:#F2F2F2" >
                                        
                                        <td colspan="10"> 
                                       
                                        	  <div style="float: right;">
                                        	  상태변경 : &nbsp;
                                    <button class="btn btn-primary" type="button" name="btnRelease" id ="btnRelease" style="background-color:green; border-color:green">해제</button>
										<button class="btn btn-primary" type="button" name="btnDead" id ="btnDead" style="background-color:gray; border-color:gray" >사망</button>
										</div>
										</td>
                                        
                                        </tfoot>
                                        
                                    
                                    </table>
                                  </form>
                                    
                                 
           							<form role="form" id="meform" name="meform" method="get" action="list.do">
                                    <div class="container  mt-5">
                                    		<input type="hidden" id="page" name="page" value="1"> 
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
 			
                              				<div class="input-group justify-content-center">
                    							<div class="input-group-append">
                    					 			<select name="searchType" >
     					 	<option value="n" selected disabled <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>----------</option>
     					 	<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>이름</option>
     					 	<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>지역</option>
      						<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>상태</option>
      						<option value="cd"<c:out value="${scri.searchType eq 'cd' ? 'selected' : ''}"/>>성별</option>
      						
      						
    					</select>
    				   
								
   							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />
							
    							<button class="btn btn-primary" id="searchBtn" type="button" ><BIG><i class="fas fa-search"></i></BIG></button>
    						
    					<script>
    					
      						$(function(){
      					
      							
        						$('#searchBtn').click(function() {
        						
        							
        				
        							
          							self.location = "list.do?" + "page=1&perPageNum=" + $("select option:selected").val() + "&searchType=" + 
          							$("select[name='searchType'] option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
          						
          			
       							 });
    						  });   
   		
      					</script>
                    							</div>
                							</div>
                						
				
  										<ul class="pagination justify-content-center mt-5">
    										<c:if test="${scri.page!=1}">
    							<li class="page-item"><a class="page-link" href="list.do${pageMaker.makeSearch(1)}">
    							<i class="fa fa-angle-double-left" style="font-size:20px;"></i>
    							 </a></li>
    						</c:if>
    						<c:if test="${pageMaker.prev}">
    							<li class="page-item"><a class="page-link" href="list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"> <i class="fa fa-angle-left" style="font-size:20px;"></i> </a></li>
    						</c:if>
    						

    						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    							
    							<c:choose>
    								<c:when test="${idx eq scri.page }">
    								<li class="page-item-active" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>
    									<a class="page-link" href="list.do${pageMaker.makeSearch(idx)}"><B>${idx}</B></a></li>
    								</c:when>
    								<c:otherwise>
    								<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>
    									<a class="page-link" href="list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
    								</c:otherwise>
    							</c:choose>
    						</c:forEach>
    						

    						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    							<li class="page-item"><a class="page-link" href="list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}"> <i class="fa fa-angle-right" style="font-size:20px;"></i> </a></li>
    						 </c:if>
    						 <c:if test="${scri.page != pageMaker.totalPage}">
    							<li class="page-item"><a class="page-link" href="list.do${pageMaker.makeSearch(pageMaker.totalPage)}"> <i class="fa fa-angle-double-right" style="font-size:20px;"></i> </a></li>
    						</c:if>
    					
  										</ul>
									</div>
									</form>
                                    
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
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
     
       
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        
    </body>
</html>
