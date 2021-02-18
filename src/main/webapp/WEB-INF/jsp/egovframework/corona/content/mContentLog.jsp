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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Coronalab</title>
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
                  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="/resources/vendor/jquery/jquery.slim.min.js"></script>
           <script type="text/javascript">
		function yes(){
			
			
		
			  opener.name = "myOpner";
			  document.myform.target = opener.name;

			opener.myform2.loglno.value = document.myform.lno.value;
			opener.myform2.logmno.value = document.myform.mno.value;

			opener.myform2.submit();
			
			self.close();
		}
		
		</script>
		<script language=javascript>
  document.onkeydown = winClose;

  function winClose()

   {
    if(event.keyCode == 27){
    window.close();
     } 
   }

</script>
		
               	<style>
       .form-control:focus {
  color: #495057;
  background-color: #fff;
  border-color: #80bdff;
  outline: 0;
  box-shadow: 0 0 0 0 rgba(0, 0, 0,0);
}

.dropbtn {
  background-color: white;
  font-size: 16px;
  border: none;
  outline:none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 180px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 10px 16px;
  text-decoration: none;
  display: block;
}
.dropdown-content span {
  color: white;
  background-color:black;
  padding: 10px 10px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropbtn:focus {
  border: none;
  outline:none;
  }

       	</style>
       	 	<script>
       		function setPerPageNums(){
       			var sh = document.getElementById("s1");
   
      			
       			location.href="letterist.do?&page=1&perPageNum="+ sh.value ;
       					//+"&searchType=${scri.searchType}&keyword=${scri.keyword}"
       		}
       		function winOpen(ele){
       			//document.domain="myDomain.com";
       			
       	
       			opener.location.href = ele.value;
       			self.close();
       			return false;
					  
       		}
       		function winOpen2(ele){
       			//document.domain="myDomain.com";
       			
       	
       			opener.location.href = ele.name;
       			self.close(); 
       			return false;
					  
       		}
       	</script>
        

</head>
<body>
  
                                                	<form name="myform"  method="post" enctype="multipart/form-data" action="/mContentReset.do">
                                        <input type="hidden" name="mno" id="mno" value="${log.mno}">  
                                        <input type="hidden" name="lno" id="lno" value="${log.lno}">      	
                            	<input type="hidden" name="updater" id="updater" value="${memberName}">
                            	<input type="hidden" name="updaterright" id="updaterright" value="${memberRight}">
                            	<input type="hidden" name="ano" id="ano" value="${memberNo}">
                           
                            	
<table class="table table-bordered" style="text-align:center" border="1" cellpadding="0" cellspacing="0">
<tr>
   <td style="background-color:#F2F2F2"><B>작성일</B></td>
  <td colspan="3"><span style="float:left"><fmt:formatDate value="${log.writedate}" pattern="yyyy-MM-dd HH:mm:ss" /></span></td>

</tr>  
<tr>
   <td style="background-color:#F2F2F2"><B>수정일</B></td>
  <td colspan="3"><span style="float:left"><fmt:formatDate value="${log.updatedate}" pattern="yyyy-MM-dd HH:mm:ss" /></span></td>

</tr>  
<tr> 
   <td style="background-color:#F2F2F2" width="150"><B>제목</B></td> 
   <td colspan="3"><span style="float:left">${log.subject}</span><input type="hidden" value="${log.subject}" name="subject" id="subject"/></td>
</tr>
<tr style="float:center">
   <td width="150" style="background-color:#F2F2F2"><B>이전 작성자</B></td> 
   <td>
   <span style="float:left">
  
     <div class="dropdown">
  <button type="button"  class="dropbtn"> <B>${log.writer}</B></button>
  <div class="dropdown-content">
  <c:choose>
  <c:when test="${memberNo == adminInfo.ano}">
   <span>${log.writer}(<c:out value="${adminInfo.adminId}"/>)</span>
      <a onclick="winOpen2(this)"  name="/adminMyPage.do" >마이페이지</a>
  </c:when>
  <c:otherwise>
   <span>${log.writer}(<c:out value="${adminInfo.adminId}"/>)</span>
    <a onclick="winOpen2(this)"  name="/lsend.do?writerno=${log.updateano }">쪽지보내기</a>
    </c:otherwise>
    </c:choose>
  </div>
</div>
   </span>
   </td>
   <td width="150" style="background-color:#F2F2F2"><B>작성자 권한</B></td> 
   <td>
   		<span style="float:left">
   			
   				${log.right}
   			
   		</span>
   	</td>
   	
</tr>
<tr>
<td width="150" style="background-color:#F2F2F2"><B>편집자</B></td> 
  <td>
   <span style="float:left">
  
     <div class="dropdown">
  <button type="button"  class="dropbtn"> <B>${log.updater}</B></button>
  <div class="dropdown-content">
  <c:choose>
  <c:when test="${memberNo == uadminInfo.ano}">
  <span>${log.updater}(<c:out value="${uadminInfo.adminId}"/>)</span>
    <a onclick="winOpen2(this)"  name="/adminMyPage.do" >마이페이지</a>
  </c:when>
  <c:otherwise>
     	<span>${log.updater}(<c:out value="${uadminInfo.adminId}"/>)</span>
    <a onclick="winOpen2(this)"  name="/lsend.do?writerno=${log.updateano }">쪽지보내기</a>
    </c:otherwise>
    </c:choose>
  </div>
</div>
   </span>
   </td>
   <td width="150" style="background-color:#F2F2F2"><B>편집자 권한</B></td> 
   <td>
   		<span style="float:left">
   			
   				${log.updaterright}
   			
   		</span>
   	</td>
</tr>

<tr>
   <td style="background-color:#F2F2F2"><B>내용</B></td>
   <td colspan="3"><textarea style="resize: none; outline: none; background-color:white; background:clear; border:0; border-radius: 0rem;"
    class="form-control py-4"   name="content" id="content"  rows="15" cols="40" readonly  >${log.content}</textarea></td>
</tr>

<tr>
   <td style="background-color:#F2F2F2"><B>파일 첨부</B></td>
   <td colspan="3"><input style="float:left" type="file" name="attachment" id="attachment" disabled></td>
</tr>




<tr>
<td colspan="4" style="text-align: center"><button type="button" class="btn btn-primary" name="updatebtn" id="updatebtn" onclick="yes()">복원</button></td>														
							</tr>

</table>
</form>
</body>
<script src="/resources/plugin/chart/datamap/d3.min.js"></script>
<script src="/resources/plugin/chart/datamap/topojson.js"></script>
<script src="/resources/plugin/chart/datamap/datamaps.kor.min.js"></script> 




</html>