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
function idChange(){
	document.frm.id_btn.disabled=true;
}
</script>
</head>
<body>
 <div class="card mb-4">
		    <div class="card-header" style="background-color:#1977cc">
                            
                               <B style="color:white">아이디 중복 확인</B>
                            </div>	
                            <div class="card-body">

	<form method="get" action="${pageContext.request.contextPath}/idCheck.do" name="frm">
		<table>
			<tr>
				<td><label for="adminId">아이디</label></td>
				<td><input type="text" name="adminId" id="adminId" value="${adminId}" maxlength = "10" oninput="idChange()"  ></td>
				<td><input type="submit" value="중복 체크"></td>
			</tr>
			<tr>
				<td colspan="3"><c:choose>
						<c:when test="${result == 1}">${adminId}는 사용중인 아이디입니다.</c:when>
						<c:when test="${result == 0}">${adminId}가 사용가능한 아이디입니다. &nbsp;<input type="button" value="사용" id="id_btn" onclick="idOk()" ></c:when>
						<c:otherwise></c:otherwise>
					</c:choose></td>
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