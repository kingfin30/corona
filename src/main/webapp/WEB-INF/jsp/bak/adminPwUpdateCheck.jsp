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
        <link rel="icon" type="image/x-icon" href="/resources/assets/img/favicon.ico" />
        <link href="/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
         
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="/resources/vendor/jquery/jquery.slim.min.js"></script>
  
    <script>var pwmsg = '${pwmsg}';
       		if(pwmsg !=null && pwmsg !=""){
    	  	 alert(pwmsg);
    		}
       	</script>
  
       	 <script >
     	function pwCheck(){
      	
      		if(document.pwForm.adminPassword.value ==""){
      			alert("관리자 패스워드를 입력해주세요.");
      			document.pwForm.adminPassword.focus();
      			return false;
      		}

      
      
      		return true;

      	}
	
		
		</script>
    </head>
    <body class="sb-nav-fixed">
 <jsp:include page="nav.jsp"/>

            
            <div id="layoutSidenav_content">
                <main>
                	
                    <div class="container-fluid">
                        <h1 class="mt-4">관리자 패스워드 수정</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item"><a href="/adminList.do"> 관리자 목록</a></li>
                             <li class="breadcrumb-item"><a href="adminRead.do?ano=${adminUpdate.ano}">관리자 정보</a></li>
                             <li class="breadcrumb-item active">관리자 패스워드 수정</li>
                        </ol>
                     <form name="pwForm" role="form" method="post" action="adminPwUpdate.do"> 
		<div class="card mb-4">
	
		    <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                              관리자 패스워드 수정
                            </div>	
                            <div class="card-body">
                            
					<input type="hidden" id="ano" name="ano" value="${adminPwUpdateView.ano}" readonly/>
  				
			
                            	<table  class="table table-bordered" border="1">
        
			
			
			<tr> 
	   			  <td><label for="newPassword"><B>신규 패스워드</B></td>
	    		  <td colspan='2'>
	    		  <input type="password" id="newPassword" name="newPassword"  />
	    		 
	    		  </td>
	       		  
			</tr>
			<tr>
	   			  <td><label for="adminPassword"><B>신규 패스워드 확인</B></td>
	    		  <td colspan='2'>
	    		  <input type="password" id="adminPassword" name="adminPassword"   />
	    		 
	    		  </td>
	       		  
			</tr> 
	
		  
			</table>
			  <div class = "input-group justify-content-center">
					<button class="btn btn-primary" type="submit" id="updatePw_btn" onclick="return pwCheck()">저장</button>&nbsp;
				
					<button class="btn btn-primary" type="button" id="list_btn" onclick=
						"location.href = 'adminRead.do?ano=${adminPwUpdateView.ano}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'">뒤로가기</button>	
					<br/>
				</div>
		 
                            </div>
                      
		</div>
		     
                   </form>     
		
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
