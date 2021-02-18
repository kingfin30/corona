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
		<script>var mailmsg2 = '${mailmsg2}';
       		if(mailmsg2!=null && mailmsg2 !=""){
    	  	 alert(mailmsg2);
    		}
       	</script>
       	  <script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='myform']");
			var hi = ${result};
			
			
			$("#btnWrite").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				
				if( $('input:checkbox[name="period"]:checked').length == 1 && hi == 1){
					alert("정기 컨텐츠가 존재합니다.\n체크 박스를 해제해주세요");
					return false;
				}else{
					formObj.submit();
				}
				
			});
			
			$("#listbtn").on("click", function(){

				location.href = "mContentList.do?page=${scri.page}"
					+"&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
		})
		function fn_valiChk(){
			var regForm = $("form[name='myform'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		

	</script>
	<script>
	function fnChkByte(obj, maxByte)
	{
	    var str = obj.value;
	    var str_len = str.length;


	    var rbyte = 0;
	    
	    var rlen = 0;
	    var one_char = "";
	    var str2 = "";


	    for(var i=0; i<str_len; i++)
	    {
	        one_char = str.charAt(i);
	        if(escape(one_char).length > 4)
	        {
	            rbyte += 2;                                         //한글2Byte
	        }
	        else
	        {
	            rbyte++;                                            //영문 등 나머지 1Byte
	        }


	        if(rbyte <= maxByte)
	        {
	            rlen = i+1;                                          //return할 문자열 갯수
	        }
	     }
	 
	  

	     if(rbyte > maxByte)
	     {
	  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
	  document.getElementById('byteInfo1').style.color="red";
	  document.getElementById('byteInfo2').style.color="red";
	  document.getElementById('contentbyte').value = maxByte;
	  document.getElementById('shut').innerText="본문은 최대 " + maxByte + "byte를 초과할 수 없습니다.";
	  //alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
	  str2 = str.substr(0,rlen);                                  //문자열 자르기
	  obj.value = str2;
	  fnChkByte(obj, maxByte);
	 
	     }
	     else
	     {
	    	
	        document.getElementById('byteInfo1').innerText = rbyte;
	        document.getElementById('contentbyte').value = rbyte;
	        if(rbyte < maxByte){
	        document.getElementById('byteInfo1').style.color="black";
	  	  document.getElementById('byteInfo2').style.color="black";
	  	  document.getElementById('shut').innerText="";}
	     }
	}
	</script>
        
        
   


    </head>
    <body class="sb-nav-fixed">
         <jsp:include page="/WEB-INF/jsp/egovframework/corona/admin/nav.jsp"/>
    
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                          <h1 class="mt-4"><i class="fas fa-pencil-alt"></i> 메일 컨텐츠 작성</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item "><a href="/mContentList.do">메일 컨텐츠 목록</a></li>
                              <li class="breadcrumb-item active">메일 컨텐츠 작성</li>
                         
                        </ol>
                          <div class="row"></div>
                         <div class="card mb-4">
                         <div class="card-body">
                         ※ 메일 컨텐츠를 작성합니다.<br/>
                         ※ 정기 컨텐츠는 하나만 지정 가능합니다.
                         </div>
                         </div>
                         <div class="card mb-4">
		    <div  class="card-header" >
                               
                                <B >메일 컨텐츠</B>
                            </div>	
                            <div class="card-body">
                            	<form name="myform"  method="post" enctype="multipart/form-data" action="/mContentWrite.do">
                            	<input type="hidden" name="writer" id="writer" value="${memberName}">
                            	<input type="hidden" name="right" id="right" value="${memberRight}">
                            	<input type="hidden" name="ano" id="ano" value="${memberNo}">
<table class="table table-bordered" style="text-align:center" border="1" cellpadding="0" cellspacing="0">
<tr>
   <td style="background-color:#F2F2F2" width="150"><B>제목</B></td> 
   <td><input class="form-control py-4 chk" type="text" id="subject" name="subject" size="40"  title="제목을 입력하세요."></td>
</tr>

<tr>
   <td style="background-color:#F2F2F2"><B>내용</B></td>
   <td><textarea oninput="fnChkByte(this,'10000')" style="resize: none;" class="form-control py-4 chk"  name="content" id="content"  rows="15" cols="40" title="내용을 입력하세요."></textarea>
   <span style="float:right" id="byteInfo2"> / 10000bytes</span><span style="float:right" id="byteInfo1">0</span><input id="contentbyte" name="contentbyte" type="hidden"></input><br/>
   <span style="float:right; color:red" id="shut"></span> </td>
</tr>
<tr>
   <td style="background-color:#F2F2F2"><B>정기 컨텐츠</B></td>
   <td><input style="float:left"  type="checkbox" name="period" id="period" value="use">
   		<input type="hidden" name="period" id="period" value="nouse">
   </td>
</tr>
<tr>
   <td style="background-color:#F2F2F2"><B>파일 첨부</B></td>
   <td><input style="float:left" type="file" name="attachment" id="attachment" disabled></td>
</tr>
<tr>
   <td  colspan="2">
   <div style="float:right">
   &nbsp;<button   type="button" class="btn btn-primary" name="listbtn" id="listbtn">
            <span class="default"><span> 목록  </span><i class="fas fa-reply"></i></span>
        </button>
        
        &nbsp;<button  type="button" class="btn btn-primary" name="btnWrite" id="btnWrite">
            <span class="default"><span> 저장</span><i class="fas fa-save"></i></span>
        </button></td>
        &nbsp;
        </div>
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
