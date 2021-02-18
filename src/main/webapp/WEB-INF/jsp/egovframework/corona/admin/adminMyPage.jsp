<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>


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
				formObj.attr("action", "adminMyPageUpdateView.do");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			$("#updatePw_btn").on("click", function(){
				formObj.attr("action", "adminMyPagePwUpdateView.do");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			// 취소
			// 목록
			$("#list_btn").on("click", function(){

				location.href = "admin.do";
			})
			
			$('#delete_btn').on("click", function(){
				var con = confirm("정말 삭제하시겠습니까 ?");
			
				if(con){
					formObj.attr("action", "adminDelete.do");
					formObj.attr("method", "post");
					formObj.submit();	

				}
			})
		})
		
		</script>
		<script>var msg55 = '${msg55}';
       		if(msg55!=null && msg55!=""){
    	  	 alert(msg55);
    		}
       	</script>
    </head>
    <body class="sb-nav-fixed">
 <jsp:include page="nav.jsp"/>

            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                         <h1 class="mt-4"><i class="far fa-id-card"></i> 마이페이지</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item active">마이페이지</li>
                        </ol>
                      
                       
                        <div class="card mb-4">
		    <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                               마이페이지 - <c:out value="${member}"/> 
                            </div>	
                            <div class="card-body">
                            <form  name="readForm" role="form" method="post">
					<input type="hidden" id="ano" name="ano" value="${adminRead.ano}" readonly/>
				
				</form>
                            	<table  class="table table-bordered" border="1">
			
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td><label for="adminId"><B>아이디</B></td>
	    		  <td colspan='2'>
	    		<c:out value="${adminRead.adminId}"/> 
	    		 
	    		  </td>
	       		  
			</tr>
			<!--<tr> 첫번째 줄 시작
	   			  <td><label for="adminPassword1"><B>패스워드</B></td>
	    		  <td colspan='2'>
	    		  <input type="text" id="adminPassword1" name="adminPassword1"  class="chk" title="패스워드를 입력하세요." />
	    		 
	    		  </td>
	       		  
			</tr>
			<tr>
	   			  <td><label for="adminPassword"><B>패스워드 확인</B></td>
	    		  <td colspan='2'>
	    		  <input type="text" id="adminPassword" name="adminPassword"  class="chk" title="패스워드를 입력하세요." />
	    		 
	    		  </td>
	       		  
			</tr> -->
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td><label for="adminName"><B>이름</B></td>
	    		  <td colspan='2'>
	    		  <c:out value="${adminRead.adminName}"/> 
	    		  </td>
	       		  
			</tr>
			
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td><label for="amail"><B>메일</B></td>
	    		  <td colspan='2'>
	    		  <c:out value="${adminRead.amail}"/> 
	    		 
	    		  </td>
	       		  
			</tr>
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td><label for="acontact"><B>개인 연락처</B></td>
	    		  <td colspan='2'>
	    		  <c:out value="${adminRead.acontact}"/> 
	    	
	    		  </td>
	       		  
			</tr>
			    		  
			</tr>
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td><label for="regDate"><B>등록일</B></td>
	    		  <td colspan='2'>
	    		  <fmt:formatDate value="${adminRead.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /> 
	    	
	    		  </td>
	       		  
			</tr>
				</tr>
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td><label for="updateDate"><B>최종 수정일</B></td>
	    		  <td colspan='2'>
	    		  <fmt:formatDate value="${adminRead.updateDate}" pattern="yyyy-MM-dd HH:mm:ss" />
	    	
	    		  </td>
	       		  
			</tr>
			</tr>
				</tr>
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td><label for="updateDate"><B>카카오 계정 연동</B></td>
	    		  <td colspan='2'>
	    		  <c:choose>
	    			<c:when test="${kakao == 1 }">
                        	<a class="dropdown-item" onclick="if(confirm('정말 해제하시겠습니까?')){location.href='/kakaoDelete.do'}else{return false;}"><i class="fas fa-sign-out-alt"></i> &nbsp;카카오 계정 연결해제</a>
                     
                        	</c:when>
                        	<c:otherwise>
                        	 연동 계정 없음
                        	</c:otherwise>
               </c:choose>
	    	
	    		  </td>
	       		  
			</tr>
		
			</table>
			  <div class = "input-group justify-content-center">
					<button class="btn btn-primary" type="button" id="update_btn">정보 수정</button>&nbsp;
					<button class="btn btn-primary" type="button" id="updatePw_btn">패스워드 수정</button>&nbsp;
					<!--  <button class="btn btn-primary" type="button" id="list_btn">메인</button>		-->
					
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
              
            
        
      
        
    </body>
       
             <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
     
       
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
</html>
