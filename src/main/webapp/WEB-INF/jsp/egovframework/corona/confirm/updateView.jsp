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
           <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
          <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").readOnly = false;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
  

  
       <script type="text/javascript">
		$(document).ready(function(){
			
			$("#cancel_btn").on("click", function(){
				event.preventDefault();
			
				location.href = "read.do?cno=${update.cno}&page=${scri.page}"
						+"&perPageNum=${scri.perPageNum}"
						+"&searchType=${scri.searchType}&keyword=${scri.keyword}";		
				
			})
			
			$("#reset_btn").on("click", function(){
				event.preventDefault();
				if(confirm('정말 초기화 하시겠습니까?'))
				{ location.href = 
				'change.do?cno=${update.cno}';}else{return false;}
				
			})
		})
	
	</script>
	 <script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			$("#update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				var con = confirm("정말로 변경하시겠습니까?");
				if(con){
					formObj.attr("action", "save.do");
					formObj.attr("method", "post");
					formObj.submit();
				}
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		

	</script>
    </head>
    <body class="sb-nav-fixed">
         <jsp:include page="/WEB-INF/jsp/egovframework/corona/admin/nav.jsp"/>
      
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4"><i class="fas fa-edit"></i> 개인정보 수정</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item "><a href="list.do">확진자 목록</a></li>
                             <li class="breadcrumb-item "><a href="read.do?cno=${update.cno}">내용확인</a></li>
                             <li class="breadcrumb-item active">개인정보 수정</li>
                        </ol>
                       
                        <div class="card mb-4">
		    <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                              개인정보 수정
                            </div>	
                            <div class="card-body">
                            <form name="updateForm" role="form" method="post" action="save.do">
					<input type="hidden" name="cno" value="${update.cno}" readonly="readonly"/>
						
  					<input type="hidden" id="page" name="page" value="${scri.page}"> 
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
 					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
 					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				
                            	<table  class="table table-bordered" border="1">
                            	
			<tr >
			
				<th colspan='3' style="background-color:#F2F2F2"><label for="cno"><B><BIG>번호</BIG></B></label>
									<B><BIG><c:out value="${update.rnum}" /><B><BIG></th>
				
			</tr>
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="background-color:#F2F2F2"><label for="cno"><B>이름</B></td>
	    		  <td colspan='2'><input type="text" id="name" name="name" value="${update.name}" class="chk" title="이름을 입력하세요."/></td>
	       		  
			</tr>
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="background-color:#F2F2F2"><label for="cno"><B>주민번호 7자리</B></td>
	    		  <td colspan='2'>
	    		   <input type="text" id="birthinfo" maxlength="6" size="20" name="birthinfo" value="${update.birthinfo}"/><span>-</span>
	    		  <input type="text" id="sortno" maxlength="1" size="1" name="sortno" value="${update.sortno }" /><span><BIG> ●●●●●● </BIG></span>
	    		  </td>
	       		  
			</tr>
			 	<tr>
			<th style="background-color:#F2F2F2"><B>연락처&nbsp;<span style="color:red">*</span></B></th>
	    		    <td colspan='2'><select type="text" id="contact1" name="contact1"    >
										<option value="">선택</option>
										<option value="${contact1 }" selected hidden>${contact1 }</option>
           								<option value="010">010</option>
            							<option value="011">011</option>
            							<option value="016">016</option>
            							<option value="017">017</option>
            							<option value="019">019</option>            					
            							
            							
									</select>
									<span>-</span>
									<input size="10" type="text" id="contact2" maxlength="4" name="contact2" value="${contact2 }" />
									<span>-</span>
									<input size="10" type="text" id="contact3" maxlength="4" name="contact3" value="${contact3 }" /></td>
	       		  </tr>
	       		  
	       		  
	       		      <tr><!-- 첫번째 줄 시작 -->
	   			  <th style="background-color:#F2F2F2"><B>휴대폰 OS</B></th>
	    		  <td colspan='2'>
	    		  		<select type="text" id="cellOs" name="cellOs"    >
										<option value="" >선택</option>
										<option value="${update.cellOs }" selected hidden>${update.cellOs }</option>
										<option value="Android">Android</option>
           								<option value="ios">ios</option>            							
            							<option value="기타">기타</option>            						
            							
									</select>
	    		  
					</td>
	       		  
			</tr>
			
			
	       		  <tr><!-- 첫번째 줄 시작 -->
	   			  <th style="background-color:#F2F2F2"><B>주소&nbsp;<span style="color:red">*</span></B></th>
	    		  <td colspan='2'>
	    		  <input type="text" id="sample6_postcode" size="50" name="address_no" value="${update.address_no}" placeholder="우편번호" readonly/>
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" readonly/><br/>
					<input type="text" size="50" id="sample6_address" name="address" value="${update.address}" placeholder="주소" readonly/><br/>
				<input type="text" size="50" id="sample6_detailAddress" name="address_detail" value="${update.address_detail}" placeholder="상세주소" readonly/>
					<input type="text" size="40" id="sample6_extraAddress" name="address_extra" value="${update.address_extra}" placeholder="참고항목" readonly/> 
	    		  
	    		  </td>
	       		  </tr>
	       		
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="background-color:#F2F2F2"><label for="cno"><B>상태</B></td>
	    		  <td colspan='2'><c:out value="${update.state}" /></td>
	       		  
			</tr>
			
			
				<tr><!-- 첫번째 줄 시작 -->
	   			  <td style="background-color:#F2F2F2"><label for="cno"><B>확진 날짜</B></td>
	    		  <td colspan='2'><fmt:formatDate value="${update.confirm_date}" pattern="yyyy-MM-dd"/>	</td>
	       		  
			</tr>
				
			</table>
			</form>
			<div class = "input-group justify-content-center">
				
					<button class="btn btn-primary" type="submit" id="update_btn">저장</button>&nbsp;
					<button class="btn btn-primary" type="button" id="reset_btn">초기화</button>&nbsp;
					<button class="btn btn-primary" type="button" id="cancel_btn">취소</button>
					
				</div>
	
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
