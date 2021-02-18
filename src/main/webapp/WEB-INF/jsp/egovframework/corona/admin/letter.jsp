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
		<script>var lettermsg = '${lettermsg}';
       		if(lettermsg!=null && lettermsg !=""){
    	  	 alert(lettermsg);
    		}
       	</script>
       		<script>
       		function winOpen(ele){
       			//document.domain="myDomain.com";
       			
       	
       			window.open(ele.title, ele.name, 'toolbar=no, menubar=no, scrollbars=no, resizable=no, width=400, height= 800,  top=200, left=500'); 
       			return false;
					  
       		}
       		function inputCheck(ele, ele2){
       			if(ele.value == "" ){
       				alert("받는 사람을 입력하세요.");
       				return false;
       			}
       		
       		}
       	</script>
       	  <script>
       	var checkflag = false;
       	function check(field, ele) {
       	        if (checkflag == false ) {
       	               		field.value="전체 전송";
       	               	$("#receiver").css("background-color", "#FFCECE");
       	             $("#receiver").css("color", "red");
       	                	field.disabled=true;
       	                	ele.disabled=true;
       	                	checkflag = true;
       	                	
       	        
       	                
       	     
       	        return "몽땅해제";
       	        
       	        }else {
       	        	
       	               field.value="";
       	            $("#receiver").css("background-color", "white");
      	             $("#receiver").css("color", "black"); 
       	               field.disabled=false;
       	            ele.disabled=false;
       	             checkflag = false;
       	               
       	             
       	             
       	             
       	      
       	        return "몽땅선택";
       	        }
       	}
       	
    
   	
     
       	</script>
        
   


    </head>
    <body class="sb-nav-fixed">
         <jsp:include page="/WEB-INF/jsp/egovframework/corona/admin/nav.jsp"/>
    
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                          <h1 class="mt-4"><i class="icon fa fa-paper-plane"></i> 쪽지보내기</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item active">쪽지 보내기</li>
                         
                        </ol>
                         <div class="card mb-4">
		    <div  class="card-header" >
                               
                                <B >쪽지보내기</B>
                            </div>	
                            <div class="card-body">
                            	<form name="xxx" id="xxx" class="form" action="<c:url value='/letterSend.do'/>" method="post">
                            	
                            	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	 <input type="checkbox" name="chk" onchange="check(this.form.receiver, this.form.searchbtn)" value="1"  class="checkSelect"/><input type="hidden" name="chk" value="0"  class="checkSelect"/><span>전체선택</span>
                            	<div class="input-group justify-content-center">
       
        <label>
            <span>받는 사람 : </span> </label>&nbsp;&nbsp;&nbsp;
            <input width = "200px" type="text" class="form-control py-4" style="background-color:white" name="receiver" id="receiver" value="" placeholder="받는 사람 ( 선택버튼을 이용해 입력해주세요 )"  readonly required>
            <button onclick="winOpen(this)" class="btn btn-primary" type="button" name="searchbtn" id="searchbtn"
            title="/letterSearch.do">
            &nbsp;선택 <i class="fas fa-search"></i>&nbsp;</button>
       
    </div>
   
        <br/> 
      
    <div class="input-group justify-content-center">
        <label>
            <span>내용 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <textarea  width = "200px" class="form-control py-4" name="message" id="message" rows="10" placeholder="메시지" required ></textarea>
       
       
    </div>
    <br/>
      <div style="float:right">
        <button  type="submit" class="btn btn-primary" onclick="return inputCheck(this.form.receiver, this.form.message)">
            <span class="default">보내기 <i class="icon fa fa-paper-plane"></i></span>
        </button>
        </div>
</form>
	
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
