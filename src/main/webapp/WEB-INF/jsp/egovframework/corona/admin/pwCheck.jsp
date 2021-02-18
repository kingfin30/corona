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
<title>Coronalab</title>
<script>
function idOk(){
	
	
	opener.makeForm.adminId.value = document.frm.adminId.value;
	
	opener.makeForm.reid.value = document.frm.adminId.value;
	
	opener.makeForm.adminId.readOnly=true;
	

	self.close();
}

</script>
<script type="text/javascript">
	formObj = opener.$("form[name='readForm']")
	function PWCheck() {
			var PW = $("adminPassword").val();
  		

  		$.ajax({
  			url:"/passChk.do",
  		    type: "post",
  		    dataType: "json", //서버로부터 내가 받는 데이터의 타입
  			//contentType : "application/json;charset=UTF-8;",
  		    data: {"adminPassword" : $("#adminPassword").val()} ,
  		    success: function(data){
  		         if(data == 1){
  		         	console.log("패스워드 맞음");
  		         
  		       		$("#adminPassword").css("background-color", "#B0F6AC");
  		       		$("#pass_text").css("color", "#34aadc");
  		       		$("#pass_text").text("패스워드 일치");
  		       		formObj.attr("action", "adminPwUpdateView.do");
					formObj.attr("method", "get");
					formObj.submit();	
					self.close();
  		         }else if(data == 0){
  		         	console.log("패스워드 틀림");
  		      
  		         	$("#adminPassword").css("background-color", "#FFCECE");
					$("#pass_text").css("color", "rgb(255,100,103)");
					$("#pass_text").text("패스워드 불일치");
					opener.alert("패스워드가 틀렸습니다.");
					self.close();
  		       
  		         	
  		     
  		         	
  		         }
  		    },
  		    error: function (e){        
  		    	alert("통신실패" + e);    
  		

 		 
  		    }
  		  });
  		/*var url = "idCheck.do?adminId="+ document.makeForm.adminId.value;
  		window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable= no, width=400, height= 200");*/
  	}
</script>
</head>
<body>
 <div class="card mb-4">
  <div class="card-header">
                            
                               <small><B>관리자 확인</B></small>
                            </div>	
		  
                            <div class="card-body">

	<form method="get" action="${pageContext.request.contextPath}/pwCheck.do" name="frm">
		<input value="" name="checking" id="checking" hidden></input>
		<table  class="table table-bordered" border="0">
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="background-color:#F2F2F2"><label for="adminId"><small>관리자 아이디</small></td>
	    		  <td >
	    		${member}
	    		 
	    		  </td>
	       		  
			</tr>
			<tr>
				<td style="background-color:#F2F2F2"><label for="adminPw"><small>관리자 패스워드</small></td>
				<td><input type="password" name="adminPassword" id="adminPassword" maxlength = "12"  ><button type="button" onclick="PWCheck()" >확인</button>
				<small><div class="check_font" id="pass_text"></div></small>
				</td>
				
				
			</tr>
		
		</table>
	</form>
	</div>
	</div>
</body>
  		<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
     
       
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
</html>