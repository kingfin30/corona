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
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        
          <script>
      		function setValues(){
      			var sh = document.getElementById("mailType");
      			document.makeForm.mailb.value = sh.value;
      			
      			if(sh.value ==""){
      				document.makeForm.mailb.readOnly=false;
      			}else
      				document.makeForm.mailb.readOnly=true;
      		
      			
      		}
      		
          	function joinCheck(){
          		if(document.makeForm.adminId.value ==""){
          			alert("아이디를 입력해주세요.");
          			document.makeForm.adminId.focus();
          			return false;
          		}
          		if(document.makeForm.reid.value==""){
          			alert("아이디 중복체크를 해주세요.");
          			return false;
          		}
          		if(document.makeForm.adminName.value == ""){
          			alert("이름을 입력해주세요.");
          			document.makeForm.adminName.focus();
          			return false;
          		}
        		if(document.makeForm.adminPassword1.value == ""){
          			alert("비밀번호를 입력해주세요.");
          			document.makeForm.adminPassword1.focus();
          			return false;
          		}
          		if(document.makeForm.adminPassword.value ==""){
          			alert("비밀번호를 확인해주세요.");
          			document.makeForm.adminPassword.focus();
          			return false;
          		}
          	
          	
          		if(document.makeForm.mailf.value ==""){
          			alert("메일을 확인해주세요.");
          			document.makeForm.mailf.focus();
          			return false;
          		}
          		if(document.makeForm.mailb.value ==""){
          			alert("메일을 확인해주세요.");
          			document.makeForm.mailb.focus();
          			return false;
          		}
          		if(document.makeForm.contact1.value==""){
          			alert("연락처를 확인해주세요.");
          			document.makeForm.contact1.focus();
          			return false;
          		}
          		if(document.makeForm.contact2.value=="" || document.makeForm.contact2.value.length < 3){
          			alert("연락처를 확인해주세요.");
          			document.makeForm.contact2.focus();
          			return false;
          		}
          		if(document.makeForm.contact3.value=="" || document.makeForm.contact3.value.length < 4){
          			alert("연락처를 확인해주세요.");
          			document.makeForm.contact3.focus();
          			return false;
          		}
          		if(document.makeForm.adminPassword1.value != document.makeForm.adminPassword.value){
          			alert("비밀번호가 일치하지 않습니다.");
          			document.makeForm.adminPassword.focus();
          			return false;
          		}
          		return true;

          	}
          	
          	function idCheck() {
   				var ID = $("adminId").val();
          		
        		if(document.makeForm.adminId.value.length == 0){
        			document.makeForm.reid.value="";
   					alert("아이디를 입력해주세요.");
   					document.makeForm.adminId.focus();
   				
          			return false;
        		}
          		else if(document.makeForm.adminId.value.length <= 2){
          			document.makeForm.reid.value="";
   					alert("아이디는 3자 이상을 입력해주세요.");
   					document.makeForm.adminId.focus();
          			return false;
          		}
          		
          		$.ajax({
          			url:"/idChk.do",
          		    type: "post",
          		    dataType: "json", //서버로부터 내가 받는 데이터의 타입
          			//contentType : "application/json;charset=UTF-8;",
          		    data: {"adminId" : $("#adminId").val()} ,
          		    success: function(data){
          		         if(data == 0){
          		         	console.log("아이디 없음");
          		       		document.makeForm.reid.value="Y";
          		       		$("#adminId").css("background-color", "#B0F6AC");
          		       		$("#id_text").css("color", "#34aadc");
          		       		$("#id_text").text("사용할수 있는 아이디 입니다.");
          		         }else if(data == 1){
          		         	console.log("아이디 있음");
          		         	$("#adminId").css("background-color", "#FFCECE");
							$("#id_text").css("color", "rgb(255,100,103)");
							$("#id_text").text("중복된 아이디가 존재합니다.");
          		         	document.makeForm.reid.value="";
          		         	
          		         
          		     	 	$("#adminId").css("background-color", "#FFCECE");
          		         	document.makeForm.adminId.focus();
          		         	
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
      <script type="text/javascript"> 
      	$(function(){ 
      		$("#alert-success").hide(); 
      		$("#alert-danger").hide(); 
      	$("input").keyup(function(){ 
      		var pwd1=$("#adminPassword1").val(); 
      		var pwd2=$("#adminPassword").val(); 
      		if(pwd1 != "" && pwd2 != ""){ 
      			if(pwd1 == pwd2){ 
      				$("#adminPassword1").css("background-color", "#B0F6AC");
      				$("#adminPassword").css("background-color", "#B0F6AC");
      				$("#alert-success").show(); 
      				$("#alert-danger").hide(); 
      			
      			}else{ 
      				$("#adminPassword1").css("background-color", "#FFCECE");
      				$("#adminPassword").css("background-color", "#FFCECE");
      				$("#alert-success").hide(); 
      				$("#alert-danger").show(); 
      			 
      			} 
      		} 
      		}); 
      }); 
      	</script>

          <script>
          function onID(ele){
        	
        	  check1 = /[^\\!-z]/;
        	  check2 = /\s/;
        	  check3 = /[~!@\#$%^&*\()\-=+_''\;<>\/.\`:\""\\,\[\]?|{}]/;
        	  
        	
        	if(check1.test(ele.value)) {
        		
				$("#id_text").css("color", "rgb(255,100,103)");
				$("#id_text").text("한글은 입력되지 않습니다.");
				ele.value = ele.value.replace(/[^\\!-z]/gi, "");
        	}
        	else if(check2.test(ele.value)) {
        		
				$("#id_text").css("color", "rgb(255,100,103)"); 
				$("#id_text").text("공백은 입력되지 않습니다.");  
				ele.value = ele.value.replace(/\s/gi, "");  
        	}
        	else if(check3.test(ele.value)) {
        		
				$("#id_text").css("color", "rgb(255,100,103)"); 
				$("#id_text").text("특수문자는 입력되지 않습니다.");
				ele.value = ele.value.replace(/[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi, "");
        	}else{
        		$("#adminId").css("background-color", "#fff");
            	$("#id_text").text("");
        	}
        	
        	
        	/*
        	ele.value = ele.value.replace("ㅂ", "q");
        	ele.value = ele.value.replace("ㅃ", "q"); 
        	ele.value = ele.value.replace("ㅈ", "w");
        	ele.value = ele.value.replace("ㅉ", "w");
        	ele.value = ele.value.replace("ㄷ", "e");
        	ele.value = ele.value.replace("ㄸ", "e");
        	ele.value = ele.value.replace("ㄱ", "r");
        	ele.value = ele.value.replace("ㄲ", "r");
        	ele.value = ele.value.replace("ㅅ", "t");
        	ele.value = ele.value.replace("ㅆ", "t");
        	ele.value = ele.value.replace("ㅛ", "y");
        	ele.value = ele.value.replace("ㅕ", "u");
        	ele.value = ele.value.replace("ㅑ", "i");
        	ele.value = ele.value.replace("ㅐ", "o");
        	ele.value = ele.value.replace("ㅒ", "o"); 
        	ele.value = ele.value.replace("ㅔ", "p");
        	ele.value = ele.value.replace("ㅖ", "p"); 
        	ele.value = ele.value.replace("ㅁ", "a");
        	ele.value = ele.value.replace("ㄴ", "s");
        	ele.value = ele.value.replace("ㅇ", "d");
        	ele.value = ele.value.replace("ㄹ", "f");
        	ele.value = ele.value.replace("ㅎ", "g");
        	ele.value = ele.value.replace("ㅗ", "h");
        	ele.value = ele.value.replace("ㅓ", "j");
        	ele.value = ele.value.replace("ㅏ", "k");
        	ele.value = ele.value.replace("ㅣ", "l");
        	ele.value = ele.value.replace("ㅋ", "z");
        	ele.value = ele.value.replace("ㅌ", "x");
        	ele.value = ele.value.replace("ㅍ", "v");
        	ele.value = ele.value.replace("ㅠ", "b");
        	ele.value = ele.value.replace("ㅜ", "n");
        	ele.value = ele.value.replace("ㅡ", "m"); 
        	*/
        	ele.value = ele.value.toLowerCase();
	  		    
	  		     
	  		document.makeForm.reid.value="";
	  		
          }
          function onPW(ele){
        	 $("#alert-success").hide(); 
        	 $("#alert-danger").hide();
        	 $("#adminPassword1").css("background-color", "#fff");
				$("#adminPassword").css("background-color", "#fff");
        	 ele.value = ele.value.replace(/[~!@\#$%^&*\()\-=+_'\;<>\/.\`:\"\\,\[\]?|{}]/gi, ""); 
          }
        
          </script>
     


    </head>
    <body class="sb-nav-fixed">
         <jsp:include page="nav.jsp"/>
    
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                          <h1 class="mt-4"><i class="fas fa-pencil-alt"></i> 관리자 등록</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item"><a href="/adminList.do"> 관리자 목록</a></li>
                             <li class="breadcrumb-item active">관리자 등록</li>
                        </ol>
                      
                       
                        <div class="card mb-4">
		    <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                              관리자 등록
                            </div>	
                            <div class="card-body">
                            <form name="makeForm" method="post" action="/make.do">
				
                            	<table  class="table table-bordered" border="1">
			
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="background-color:#F2F2F2"><label for="cno"><B>아이디&nbsp;<span style="color:red">*</span></B>
	   			  </td>
	   			  
	    		  <td colspan='2'>
	    		  <div class = "input-group">
	    		  <input size="25" type="text" id="adminId" name="adminId" maxlength = "12" oninput="onID(this)" autocomplete="off" /><input id="reid" name="reid" hidden>
	    		  <!-- oninput="return idCheck(this)" -->
	    		  <!-- --><button class="btn btn-primary" type="button" id="idCheck_btn" onclick="idCheck()">아이디 조회</button> 
	    		 
	       		  </div>
	       		  <div class="check_font" id="id_text"></div>
	       		  <span id="idCheck"><small>※3~12자 이내 영문 소문자, 숫자 (한글, 영어 대문자, 공백, 특수문자는 입력되지 않습니다.)</small></span>
	       		  </td>
			</tr>
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="background-color:#F2F2F2"><label for="cno"><B>이름&nbsp;<span style="color:red">*</span></B></td>
	    		  <td colspan='2'><input size="25" type="text" id="adminName" name="adminName" maxlengh="10"/></td>
	       		  
			</tr>
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="background-color:#F2F2F2"><label for="cno"><B>패스워드&nbsp;<span style="color:red">*</span></B></td>
	    		  <td colspan='2'><input size="25" maxlength="16"  type="password" id="adminPassword1" name="adminPassword1" oninput="onPW(this)") /></td>
	       		  
			</tr>
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="background-color:#F2F2F2"><label for="cno"><B>패스워드 확인&nbsp;<span style="color:red">*</span></B></td>
	   			  
	    		  <td colspan='2'><input size="25"   type="password" id="adminPassword" name="adminPassword" oninput="onPW(this)" maxlength="16"/><br/>
	    		  <span style="color:#34aadc" id="alert-success">비밀번호가 일치합니다.</span> 
	    		  <span style="color:rgb(255,100,103)"  id="alert-danger">비밀번호가 일치하지 않습니다.</span>


	    		  </td>
	       		  
			</tr>
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="background-color:#F2F2F2"><label for="cno"><B>이메일&nbsp;<span style="color:red">*</span></B></td>
	   			  <div class = "input-group">
	    		  <td colspan='2'><input  size="10" type="text" id="mailf" name="mailf"   />
	    		  @
	    		  <input size="20" type="text" id="name" name="mailb" id="mailb"  />
	    		 <select type="text" id="mailType" name="mailType" oninput = "setValues()" >
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
	   			  <td style="background-color:#F2F2F2"><label for="cno"><B>개인 연락처&nbsp;<span style="color:red">*</span></B></td>
	   			  <div class = "input-group">
	    		  <td colspan='2'><select type="text" id="contact1" name="contact1"    >
										<option value="" selected disabled>선택</option>
           								<option value="010">010</option>
            							<option value="011">011</option>
            							<option value="016">016</option>
            							<option value="017">017</option>
            							<option value="019">019</option>            					
            							
            							
									</select>
									<span>-</span>
									<input size="10" type="text" id="contact2" maxlength="4" name="contact2"  />
									<span>-</span>
									<input size="10" type="text" id="contact3" maxlength="4" name="contact3" /></td>
	       		  </div>
	</tr>

			
			
				
	       		  
		
			</table>
			 <div class = "input-group justify-content-center">
					<button class="btn btn-primary" type="submit" onclick="return joinCheck()" id="submit" name="submit">등록</button>&nbsp;
									<button class="btn btn-primary"  type="button"  onclick=
										"location.href = 
										'adminList.do'">목록</button>
					
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
