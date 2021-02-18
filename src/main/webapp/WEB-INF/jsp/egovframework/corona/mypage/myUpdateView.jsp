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
          <script>
      	function setValues(){
  			var sh = document.getElementById("mailType");
  			document.updateForm.mailb.value = sh.value;
  			
  			if(sh.value ==""){
  				document.updateForm.mailb.readOnly=false;
  			}else
  				document.updateForm.mailb.readOnly=true;
  		
  			
  		}
      	function updateBtn(){
      	
      		if(document.updateForm.adminName.value == ""){
      			alert("이름을 입력해주세요.");
      			document.updateForm.adminName.focus();
      			return false;
      		}
    	    	
      		if(document.updateForm.mailf.value ==""){
      			alert("메일을 확인해주세요.");
      			document.updateForm.mailf.focus();
      			return false;
      		}
      		if(document.updateForm.mailb.value ==""){
      			alert("메일을 확인해주세요.");
      			document.updateForm.mailb.focus();
      			return false;
      		}
    
      		if(document.updateForm.contact2.value=="" || document.updateForm.contact2.value.length < 3){
      			alert("연락처를 확인해주세요.");
      			document.updateForm.contact2.focus();
      			return false;
      		}
      		if(document.updateForm.contact3.value=="" || document.updateForm.contact3.value.length < 4){
      			alert("연락처를 확인해주세요.");
      			document.updateForm.contact3.focus();
      			return false;
      		}
      		
      		return true;

      	}
          </script>
          
  

  
       	 <script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
	
			// 취소
			// 목록
			$("#list_btn").on("click", function(){

				event.preventDefault();
				location.href = "adminMyPage.do"
			
			})
		})
		
		</script>
    </head>
    <body class="sb-nav-fixed">
 <jsp:include page="/WEB-INF/jsp/egovframework/corona/admin/nav.jsp"/>

            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                             <h1 class="mt-4"><i class="fas fa-edit"></i> 내 정보 수정</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item "><a href="/adminMyPage.do"> 마이페이지</a></li>
                             <li class="breadcrumb-item active">내 정보수정</li>
                        </ol>
                       
                        <div class="card mb-4">
		    <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                              관리자 수정
                            </div>	
                            <div class="card-body">
                            <form name="updateForm" role="form" method="post" action="myUpdate.do">
					<input type="hidden" id="ano" name="ano" value="${adminUpdate.ano}" readonly/>
  				
			
                            	<table  class="table table-bordered" border="1">
			
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td><label for="adminId"><B>아이디</B></td>
	    		  <td colspan='2'>
	    		<c:out value="${adminUpdate.adminId}"/> 
	    		 
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
	    		  <input type="text" id="adminName" name="adminName" value="${adminUpdate.adminName}" class="chk" title="이름을 입력하세요."/>
	    		    <input type="hidden" id="newForm" name="newForm"  />
	    		  </td>
	       		  
			</tr>
			
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td><label for="amail"><B>메일</B></td>
	    			  <div class = "input-group">
	    		  <td colspan='2'><input  size="10" type="text" id="mailf" name="mailf"  value="<c:out value='${newForm.mail1}'/>"  />
	    		  @
	    		  <input size="20" type="text" id="name" name="mailb" id="mailb" value="<c:out value='${newForm.mail2}'/>" />
	    		  
	    		 <select type="text" id="mailType" name="mailType" oninput = "setValues()" >
	    		 						<option value="<c:out value='${newForm.mail2}'/>" selected hidden><c:out value="${newForm.mail2}"/></option>
										<option value="">직접입력</option>
           								<option value="naver.com">naver.com</option>
            							<option value="hanmail.net">hanmail.net</option>
            							<option value="gmail.com">gmail.com</option>
            							<option value="yahoo.com">yahoo.com</option>
            							<option value="nate.com">nate.com</option>            					
            							<option value="asadal.com">asadal.com</option>
            							
									</select></td>
	    		  </div>
	       		  
			</tr>
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td><label for="acontact"><B>개인 연락처</B></td>
	   			      <div class = "input-group">
	    		  <td colspan='2'><select type="text" id="contact1" name="contact1"    >
										<option value="<c:out value='${newForm.ph1}'/>" selected hidden><c:out value="${newForm.ph1}"/></option>
           								<option value="010">010</option>
            							<option value="011">011</option>
            							<option value="016">016</option>
            							<option value="017">017</option>
            							<option value="019">019</option>            					
            							
            							
									</select>
									<span>-</span>
									<input size="10" type="text" id="contact2" maxlength="4" name="contact2" value="${newForm.ph2}" />
									<span>-</span>
									<input size="10" type="text" id="contact3" maxlength="4" name="contact3" value="${newForm.ph3}" /></td>
	       		  </div>
	    	
	    		
	     
	    	
	       		  
			</tr>
		  
			</table>
			<div class = "input-group justify-content-center">
					<button class="btn btn-primary" type="submit" id="update_btn" onclick="return updateBtn()">변경</button>&nbsp;
					<button class="btn btn-primary" type="button" id="reset_btn" onclick=
										"if(confirm('정말 초기화하시겠습니까?'))
										{ location.href = 
										'adminMyPageUpdateView.do?ano=${adminUpdate.ano}';}else{return false;} ">수정 취소</button>&nbsp;
					<button class="btn btn-primary" type="button" id="list_btn">뒤로가기</button>	
					<br/>
				</div>
		 </form>
                            </div>
                    
                        
		</div>
		         
				<br/>
		
		   
                        
		
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
