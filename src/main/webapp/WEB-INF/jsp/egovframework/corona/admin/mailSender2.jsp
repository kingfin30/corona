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
                          <h1 class="mt-4">메일 전송(자바 메일)</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item active">메일 보내기</li>
                         
                        </ol>
                         <div class="card mb-4">
		    <div  class="card-header" >
                               
                                <B >메일 전송(파일 첨부)</B>
                            </div>	
                            <div class="card-body">
                            	<form  method="post" enctype="multipart/form-data" action="/fileSend.do">
<table class="table table-bordered" border="1" cellpadding="0" cellspacing="0">
<tr>
   <td>Title</td>
   <td><input class="form-control py-4" type="text" id="subject" name="subject" size="40"></td>
</tr>
<tr>
   <td>To</td>
   <td><input class="form-control py-4" type="text" id="receiver" name="receiver" size="40"></td>
</tr>
<tr>
   <td>Content</td>
   <td><textarea class="form-control py-4"  name="message"  rows="10" cols="40"></textarea></td>
</tr>
<tr>
   <td>File</td>
   <td><input type="file" name="attachment" id="attachment"></td>
</tr>
<tr>
   <td colspan="2"><button style="float:right"  type="submit" class="btn btn-primary">
            <span class="default">보내기 <i class="icon fa fa-paper-plane"></i></span>
        </button></td>
</tr>
</table>
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
