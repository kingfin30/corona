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
		<script>var mailmsg = '${mailmsg}';
       		if(mailmsg!=null && mailmsg !=""){
    	  	 alert(mailmsg);
    		}
       	</script>
        
   


    </head>
    <body class="sb-nav-fixed">
         <jsp:include page="nav.jsp"/>
    
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                          <h1 class="mt-4">메일 전송(구글 SMTP)</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item active">메일 보내기</li>
                         
                        </ol>
                         <div class="card mb-4">
		    <div  class="card-header" >
                               
                                <B >메일 전송</B>
                            </div>	
                            <div class="card-body">
                            	<form name="contact-form" class="form" action="<c:url value='/sendMail.do'/>" method="post">
                            	<div class="input-group justify-content-center">
        <label>
            <span>받는 사람 : </span> </label>&nbsp;&nbsp;&nbsp;
            <input width = "200px" type="text" class="form-control py-4" name="receiver" value="" placeholder="받는 사람" required>
       
    </div>
      <br/> 
    <div class="input-group justify-content-center">
      
        <label>
            <span>제목  :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input width = "200px" type="text" class="form-control py-4" name="subject" value="" placeholder="제목" required>
       
    </div>
        <br/> 
      
    <div class="input-group justify-content-center">
        <label>
            <span>내용 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <textarea type="html" width = "200px" class="form-control py-4" name="message" rows="10" placeholder="메시지" required></textarea>
       
       
    </div>
    <br/>
      <div style="float:right">
        <button  type="submit" class="btn btn-primary">
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
