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
<script language=javascript>
  document.onkeydown = winClose;

  function winClose()

   {
    if(event.keyCode == 27){
    window.close();
     } 
   }

</script>




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
  min-width: 150px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 10px 16px;
  text-decoration: none;
  display: block;
  width:200px;
   text-align:center;
}
.dropdown-content span {
  color: white;
  background-color:#1977cc;
  border-color:#1977cc;
  padding: 10px 10px;
  text-decoration: none;
  text-align:center;
  width:200px;
  display: block;
}

.dropdown-content a:hover {background-color: rgba( 255, 255, 255, 1 )}

.dropdown:hover .dropdown-content {display: block;}

.dropbtn:focus {
  background-color: rgba( 255, 255, 255, 1 );
  border: none;
  outline:none;
  }
  
  .linkbtn{
  background-color: rgba( 255, 255, 255, 1 );
   border: none;
  outline:none;
  }
  .linkbtn:focus {
	
  border: none;
  outline:none;
  }
    .linkbtn:hover {
    
  color:blue;
  border: none;
  outline:none;
  text-decoration:underline;
  font-weight:bold;
  }
   .linkbtn2{

  color : blue;
   border: none;
  outline:none;
  }
    .linkbtn2:focus {
 color:purple;
  border: none;
  outline:none;
  }
    .linkbtn2:hover {
  color:purple;
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
 <div class="card mb-4">
		    <div class="card-header" style="background-color:#1977cc">
                            
                               <B style="color:white">받은 쪽지</B>
                            </div>	
                            <div class="card-body">


		<table width="350px">
		<tr>
		<td>
		<form method="post" name="frm" id="frm">
			
		<div class="input-group">
	
                    							<div class="input-group-append">
                    			
    				  
								<label class="form-controll" for="adminId">보낸 사람 :</label>&nbsp;&nbsp;&nbsp;
   							   <div class="dropdown">
  <button type="button"  class="dropbtn"><B><c:out value="${lreceiver.writer}"/></B></button>
  <div class="dropdown-content">
  	
  	<c:choose>
  	<c:when test="${adminService.anoCheck(lreceiver.writerno) != 0 }">
  		<span><B><c:out value="${adminService.adminData(lreceiver.writer).getAdminName()}"/>(<c:out value="${lreceiver.writer}"/>)</B></span>
  		<a onclick="winOpen2(this)" name="/lsend.do?writerno=${lreceiver.writerno}">답장</a>
   </c:when>
  		 <c:otherwise>
  		 	<span style="text-decoration:line-through;color:color:#A4A4A4"><B>탈퇴한 회원(<c:out value="${lreceiver.writer}"/>)</B></span>
  		 </c:otherwise>    
 </c:choose>
 
  
  </div>
</div>
							

    						
    				
                    							</div>
                							</div>
                							 </form>
		</td>
		
		</tr>
		
		
		<tr>
		<td>
		<br/>
		</td>
		</tr>
			
			
			
		
			
			<tr>
			<form method="post" name="myform">
			<td>
				  <textarea style="resize: none; outline: none; background-color:white; background:clear;"
    class="form-control py-4"   name="content" id="content"  rows="15" cols="30" readonly  ><c:out value="${lreceiver.content}"></c:out></textarea>
			</td>
			
				</form>
			</tr>
		
		
		</table>
		
		<button class="linkbtn" onclick="winOpen(this)" value="/lsend.do?writerno=${lreceiver.writerno}" style="float:right">답장</button>
		


	</div>
	</div>
</body>
  		<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
     
       
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
</html>