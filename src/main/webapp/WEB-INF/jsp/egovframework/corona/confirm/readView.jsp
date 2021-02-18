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
          <script src="/resources/vendor/jquery/jquery.slim.min.js"></script>
  

  
       	 <script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$("#update_btn").on("click", function(){
				formObj.attr("action", "change.do?page=${scri.page}"
						+"&perPageNum=${scri.perPageNum}"
						+"&searchType=${scri.searchType}&keyword=${scri.keyword}");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			// 취소
			// 목록
			$("#list_btn").on("click", function(){

				location.href = "list.do?page=${scri.page}"
					+"&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
		})
		
		</script>
    </head>
    <body class="sb-nav-fixed">
 <jsp:include page="/WEB-INF/jsp/egovframework/corona/admin/nav.jsp"/>

            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4"><i class="fas fa-search"></i> 내용확인</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item "><a href="list.do">확진자 목록</a></li>
                             <li class="breadcrumb-item active">내용확인</li>
                             
                        </ol>
                         <div class="card mb-4">
                         <div class="card-body">
             		※ 되돌리기 버튼은 상태가 변경되면 표시됩니다.	<br/>
                          	※ 되돌리기 버튼으로 당일 날만 초기화가 가능합니다.<br/>
      
                         </div>
                         </div>
                       
                        <div class="card mb-4">
		    <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                               내용확인
                            </div>	
                            <div class="card-body">
                            <form  name="readForm" role="form" method="post">
					<input type="hidden" id="cno" name="cno" value="${read.cno}" />
  					<input type="hidden" id="page" name="page" value="${scri.page}"> 
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
 					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
 					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				</form>
                            	<table  class="table table-bordered" border="1">
			<tr >
			
				<th colspan='3' style="background-color:#F2F2F2"><label for="cno"><B><BIG>&nbsp;&nbsp;번호&nbsp;&nbsp;</BIG></B></label>
									<B><BIG><c:out value="${read.rnum}" /><B><BIG></th>
				
			</tr>
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td  width="300px" style="text-align:center;background-color:#F2F2F2"><label for="cno"><B><BIG>이름</BIG></B></td> 
	    		  <td colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;<BIG><c:out value="${read.name}" /></BIG>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	       		  
			</tr>
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="text-align:center;background-color:#F2F2F2"><label for="cno"><B><BIG>생년월일 8자리</BIG></B></td>
	    		  <td colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;<BIG><c:out value="${read.birth}" /></BIG>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	       		  
			</tr>
			</tr>
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="text-align:center;background-color:#F2F2F2"><label for="cno"><B><BIG>나이(만)</BIG></B></td>
	    		  <td colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;<BIG><c:out value="${read.age}" /> 세</BIG>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	       		  
			</tr>
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="text-align:center;background-color:#F2F2F2"><label for="cno"><B><BIG>성별</BIG></B></td>
	    		  <td colspan='2'>
	    		  		&nbsp;&nbsp;&nbsp;<BIG>
	    		  		<c:out value="${read.gender}" />
	    		  		<c:choose>
										<c:when test="${read.gender eq '남성' }">
											<i style="color:blue" class="fas fa-mars"></i>
										</c:when>
										<c:when test="${read.gender eq '여성' }">
											<i style="color:red" class="fas fa-venus"></i>
										</c:when>
									</c:choose>
									</BIG>
	    		  		&nbsp;&nbsp;&nbsp;
	    		  </td>
	       		  
			</tr>
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="text-align:center;background-color:#F2F2F2"><label for="cno"><B><BIG>연락처</BIG></B></td>
	    		  <td colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;<BIG><c:out value="${read.phone}" /></BIG>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	       		  
			</tr>
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="text-align:center;background-color:#F2F2F2"><label for="cno"><B><BIG>내.외국인</BIG></B></td>
	    		  <td colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;<BIG><c:out value="${read.local}" /></BIG>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	       		  
			</tr>
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="text-align:center;background-color:#F2F2F2"><label for="cno"><B><BIG>상태</BIG></B></td>
	    		  <td colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;<BIG><c:out value="${read.state}" /></BIG>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	       		  
			</tr>
			
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="text-align:center;background-color:#F2F2F2"><label for="cno"><B><BIG>주소 정보</BIG></B></td>
	    		  <td colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;<BIG>우편번호 : <c:out value="${read.address_no }" />
	    		  <br/>&nbsp;&nbsp;&nbsp;주소 : <c:out value="${read.address }" />&nbsp;<c:out value="${read.address_detail }" />&nbsp;<c:out value="${read.address_extra }" /></BIG>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	       		  
			</tr>
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="text-align:center;background-color:#F2F2F2"><label for="cno"><B><BIG>확진 날짜</BIG></B></td>
	    		  <td colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;<BIG><fmt:formatDate value="${read.confirm_date}" pattern="yyyy-MM-dd"/></BIG>&nbsp;&nbsp;&nbsp;&nbsp;	</td>
	       		  
			</tr>
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="text-align:center;background-color:#F2F2F2"><label for="cno"><B><BIG>상태 업데이트 날짜</BIG></B></td>
	    		  <td colspan='2'>&nbsp;&nbsp;&nbsp;&nbsp;<BIG><fmt:formatDate value="${read.update_date}" pattern="yyyy-MM-dd"/></BIG>&nbsp;&nbsp;&nbsp;&nbsp;</td>
	       		  <td hidden><fmt:formatDate value="${read.update_date}" pattern="yyyy-MM-dd" var="updateDate"/></td>
			</tr>
			</table>
			<div class = "input-group justify-content-center">
					<c:choose>
									<c:when test="${read.state=='확진'}">
										<button class="btn btn-primary" type="button" name="btnRealse" style="background-color:green; border-color:green" id ="btnRealse" onclick=
										"if(confirm('${read.rnum}번 확진자 ${read.name}님을 격리 해제 상태로 바꾸시겠습니까?'))
										{ location.href = 
										'release.do?cno=${read.rnum}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}';}else{return false;} " 
										>해제</button>&nbsp;
										<button class="btn btn-primary" type="button" name="btnDead" id ="btnDead" style="background-color:gray; border-color:gray" onclick=
										"if(confirm('${read.rnum}번 확진자 ${list.name}님을 사망 상태로 바꾸시겠습니까?'))
										{ location.href = 
										'dead.do?cno=${read.rnum}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}';}else{return false;} "  
										>사망</button>&nbsp;
									</c:when>	
									<c:otherwise>
										<button class="btn btn-primary" type="button" id ="btnReset" onclick=
										"if(confirm('${read.rnum}번 확진자 ${list.name}님을 다시 확진으로 바꾸시겠습니까?\n※오류시 클릭'))
										{ location.href = 
										'reset.do?cno=${read.cno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}';}else{return false;} " 
										<c:if test="${updateDate != nowDate}" >disabled</c:if> 
										> 확진 상태 </button>&nbsp;
									</c:otherwise>
								</c:choose>
					<button class="btn btn-primary" type="button" id="update_btn">개인정보 수정</button>&nbsp;
					<button class="btn btn-primary" type="button" id="list_btn">목록</button>	
					
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
            
        
      
        
    </body>
       
             <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
     
       
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
</html>
