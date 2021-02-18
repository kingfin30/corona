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
var flag=0
function idOk(ele){
	if(document.frm.adminId.diabled != true){
	var text = ele.title+";";
	
	document.frm.adminId.value += text;
	
	ele.disabled=true;
	}
	
	/*
	opener.makeForm.adminId.value = document.frm.adminId.value;
	
	opener.makeForm.reid.value = document.frm.adminId.value;
	
	opener.makeForm.adminId.readOnly=true;
	*/

}
function select(ele){
	opener.xxx.receiver.value = ele.value;
	
	self.close();
}

</script>
  <script>
       	var checkflag = false;
       	function check(field) {
       	        if (checkflag == false ) {
       	               		field.value="전체 전송";
       	                	field.disabled=true;	
       	                	checkflag = true;
       	        
       	                
       	     
       	        return "몽땅해제";
       	        
       	        }else {
       	               field.value="";
       	               field.disabled=false;
       	             checkflag = false;
       	               
       	             
       	             
       	             
       	      
       	        return "몽땅선택";
       	        }
       	}
       	
    
   	
     
       	</script>
</head>
<body>
 <div class="card mb-4">
		    <div class="card-header" style="background-color:#1977cc">
                            
                               <B style="color:white">받는 사람</B>
                            </div>	
                            <div class="card-body">


		<table>
		<tr>
		<td>
		<form method="post" name="frm" id="frm">
			
		<div class="input-group justify-content-center">
	
                    							<div class="input-group-append">
                    			
    				  
								
   							<input size="27" type="text" name="adminId" id="adminId" readonly />
							
    							<button  class="btn btn-primary" id="addBtn" name="addBtn" type="button" onclick="select(this.form.adminId)" ><small>선택</small></button>&nbsp;
    							<button style="background-color:green; border-color:green"  class="btn btn-primary" id="resetbtn" name="resetbtn" type="button" onClick="window.location.href=window.location.href" ><small>초기화</small></button>
    						
    				
                    							</div>
                							</div>
                							 </form>
		</td>
		
		</tr>
		   <!--
			<tr>
				<td>
                                     
                                    	<form role="form" method="get" >
                                    	<input type="hidden" id="page" name="page" value="1"> 
  					
                              				<div class="input-group justify-content-center">
                    							<div class="input-group-append">
                    					 			<select name="searchType" >

     					 	<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>아이디</option>
     					 	<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>이름</option>
      						
      						
    					</select>
    				   
								
   							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />
							
    							<button class="btn btn-primary" id="searchBtn" name="searchBtn" type="button" ><BIG><i class="fas fa-search"></i></BIG></button>
    						
    					<script>
      						$(function(){
        						$('#searchBtn').click(function() {
          						self.location = "letterSearch.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + 
          						$("select[name='searchType'] option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
       							 });
    						  });   
   		
      					</script>
                    							</div>
                							</div>
                						</form>
                						</td>
				
			</tr>-->
			<tr> <td >
			<br/>
			</td>
			</tr>
			<form method="post" name="myform">
			<c:forEach items="${adminList2}" var = "adminList2">
			<tr>
			<td>
			<c:if test ="${member != adminList2.adminId}">
			<div style="color:red">최고관리자</div>
			</td>
			</tr>
			<tr>
				<td >
					&nbsp;&nbsp;<span> <input class="linkbtn" name="adminbtn" id="adminbtn" type="button" title="<c:out value='${adminList2.adminId}'/>"
					value="* <c:out value='${adminList2.adminName}'/>(<c:out value='${adminList2.adminId}'/>)" onclick="idOk(this)">
					</input>
					</span>
					<input type="hidden" value="<c:out value='${adminList2.ano}'/>;" ></input>
				</td>
				
			</tr>
			</c:if>
			</c:forEach>
			<tr>
			<td>
			<div style="color:red">일반관리자</div>
			</td>
			</tr>
			<c:forEach items="${adminList}" var = "adminList">
				<c:if test ="${member != adminList.adminId}">
			<tr>
		
				<td >
					&nbsp;&nbsp;<span> <input class="linkbtn" name="adminbtn" id="adminbtn" type="button" title="<c:out value='${adminList.adminId}'/>"
					value="* <c:out value='${adminList.adminName}'/>(<c:out value='${adminList.adminId}'/>)" onclick="idOk(this)">
					</input>
					</span>
					<input type="hidden" value="<c:out value='${adminList.ano}'/>;" ></input>
				</td>
				
			</tr>
			</c:if>
			</c:forEach>
			</form>
		</table>
		
		
		


	</div>
	</div>
</body>
  		<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
     
       
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
</html>