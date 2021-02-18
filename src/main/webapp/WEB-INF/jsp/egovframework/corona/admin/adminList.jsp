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
            <style>
            	.hover{ background-color:#fdf7df;}
            	.graytd{background-color:#fcfcfc;}
            </style>
            
              <script>
            	$(document).ready(function(){
            		$('tbody tr').hover(
            				function (){$(this).addClass('hover');},
            				function (){$(this).removeClass('hover');});
            	});
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
  
  .linkbtn{
  background-color: white;
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
  }
   .linkbtn2{
  background-color: white;
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
            
     
        <script>var msg2 = '${msg2}';
       		if(msg2!=null && msg2!=""){
    	  	 alert(msg2);
    		}
       	</script>
       	       	 <script>
       	var checkflag = false;
       	function check(field) {
       	        if (checkflag == false ) {
       	                for (i = 0; i < field.length; i++) {
       	                	if(field[i].disabled != true)
       	                		field[i].checked = true;
       	                		
       	                	checkflag = true;
       	                }
       	             
       	             if(field.disabled != true)
	                		field.checked = true;
       	                
       	        checkflag = true;
       	        return "몽땅해제";
       	        
       	        }else {
       	                for (i = 0; i < field.length; i++) {
       	                field[i].checked = false;
       	             checkflag = false;
       	                }
       	             
       	             field.checked = false;
       	             
       	        checkflag = false;
       	        return "몽땅선택";
       	        }
       	}
       	
    	function check2(field) {
   	        if (checkflag == true) {
   	        	
   	        		field.checked = false;
   	        	
   	        
   	        checkflag = false;
   	       
   	        }
   	}
     
       	</script>
       	
       	     	<script>
       		function setPerPageNums(){
       			var sh = document.getElementById("s1");
   
      			
       			location.href="adminList.do?&page=1&perPageNum="+ sh.value ;
       					//+"&searchType=${scri.searchType}&keyword=${scri.keyword}"
       		}
       	</script>
       	 	<script>
    	$(document).ready(function(){
			var formObj = $("form[name='myform']");
			var checkObj = $("input[name='chk']:checked");
			
			// 수정 
			$("#btnDelete").on("click", function(){
				
				
				 if($('input:checkbox[name="chk"]:checked').length==0){
					 alert('1명 이상의 관리자를 선택해주세요.')
				 }

						
				 else{ 
					 if(confirm( $('input:checkbox[name="chk"]:checked').length+"명의 관리자를 삭제하시겠습니까?")){
					formObj.attr("action", "adminDeleteCheck.do");
					formObj.attr("method", "post");
					formObj.submit();			
					}
				 }
			})
		
			// 취소
			// 목록
		
		})
       	</script>
       	         
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="/resources/vendor/jquery/jquery.slim.min.js"></script>
          
    </head>
    <body class="sb-nav-fixed">
        <jsp:include page="/WEB-INF/jsp/egovframework/corona/admin/nav.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                       <h1 class="mt-4"><i class="fas fa-table"></i> 관리자 목록</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item active">관리자 목록</li>
                        </ol>
                      
                        <div class="row"></div>
                         <div class="card mb-4">
                         <div class="card-body">
                         ※ 최고 관리자는 삭제가 불가능합니다.<br/>  
                          ※ 최고 관리자는 <span style="color:red">*</span>로 표시됩니다.<br/> 
                          ※ 이름을 누르면 상세보기 화면으로 넘어갑니다.<br/> 
                          ※ 아이디에 마우스를 갖다대면 드롭다운 항목이 나타납니다.
                         </div>
                         </div>
                              
                        

<!-- 데이터 테이블-->
                        
                        <div class="card mb-4">
                            <div class="card-header">
                            	
                               		 <i class="fas fa-table mr-1 "></i>
                                		<span>관리자 테이블</span>  
                                		<select name="s1" id="s1" oninput="setPerPageNums()"  >
                                    	<option value="10" <c:if test="${scri.perPageNum == '10'}" > selected </c:if>  >10개 보기</option>
                                    	<option value="20" <c:if test="${scri.perPageNum == '20'}" > selected </c:if> >20개 보기</option>
                                    	<option value="50" <c:if test="${scri.perPageNum == '50'}" > selected </c:if> >50개 보기</option>
                                    	<option value="100" <c:if test="${scri.perPageNum == '100'}" > selected </c:if> >100개 보기</option>
                                    </select>
                               	<div style="float: right;">
                               		
                                	<button  class="btn btn-primary" type="button" id ="btnChange" onclick = "location.href = 'adminView.do' " >관리자 등록</button>
                             </div>
                            </div>
                          
                           		
                            
                        
                            
                                
                            <div class="card-body">
                        
                       
                                <div class="table-responsive">
                               <form name="myform" action="adminDeleteCheck.do" method=post>
                               		
					
  				
                                    <table class="table table-bordered"   width="100%" cellspacing="0">
                                        <thead style="background-color:#F2F2F2">
                                            <tr>
                                            <th width="50px" style="text-align: center"><input type="checkbox" name="checkall" onchange="check(this.form.chk)"/></th>
                                            	<th  width="60px" nowrap>번호</th>
                                            	<th>이름</th>
                                                <th>아이디</th>
                                                
                                                <th>이메일</th>
                                                <th>개인 연락처</th>
                                                <th>권한</th>
                                                <th>등록일</th>
                                            
                                                
                                                                                                
                                            </tr>
                                        </thead>
                                 
                                        <tbody>
                                        	<c:forEach items="${adminList}" var = "adminList">
                                          <tr>
                                          <td style="text-align: center"><input type="checkbox" name="chk" value="${adminList.ano}" onchange="check2(this.form.checkall)" class="checkSelect" 
                                          <c:if test="${adminList.right eq '최고관리자'}">disabled</c:if> /></td>
								<td width="60px" nowrap style="text-align:center"><c:out value="${pageMaker.totalCount - adminList.rnum + 1}" /></td>
							
								
								<td><a style="color:black" href="adminRead.do?ano=${adminList.ano}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"><B><c:out value="${adminList.adminName}" /></B></a></td>
								<td>								 <div class="dropdown">
 												 <button type="button"  class="dropbtn"><B><c:out value="${adminList.adminId}"/></B></button>
  													<div class="dropdown-content">
  														<c:choose>
  													<c:when test="${memberNo == adminList.ano}">
 													 <span>${adminList.adminName} (<c:out value="${adminList.adminId}"/>)</span>
    													<a href="/adminMyPage.do">마이페이지</a>
 													 </c:when>
 												 <c:otherwise>
  											  <span>${adminList.adminName} (<c:out value="${adminList.adminId}"/>)</span>
    												<a href="/lsend.do?writerno=${adminList.ano}">쪽지보내기</a>
    										</c:otherwise> 
    												</c:choose>
  											</div>
										</div></td>
								<td><c:out value="${adminList.amail}" /></td>
								<td><c:out value="${adminList.acontact}" /></td>
								<td>
									<c:choose>
										<c:when test="${adminList.right eq null}"> 일반관리자 </c:when>
										<c:otherwise> <B><c:out value="${adminList.right}" /></B> </c:otherwise>
									</c:choose>

								
								</td>
							
								
								
								<!--  -->
						
								<td><fmt:formatDate value="${adminList.regDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
																						
							</tr>
                                       	</c:forEach>
                                       
                                        </tbody>
                                           <tfoot style="background-color:#F2F2F2" >
                                        
                                        <td colspan="8">
                                       
                                        	  <div style="float: right;">
                                   
										<button class="btn btn-primary" type="button" name="btnDelete" id ="btnDelete" style="background-color:#FE2E64; border-color:#FE2E64" >선택 삭제</button>
										</div>
										</td>
                                        
                                        </tfoot>
                                    </table>
                                    </form>
                                       <div class="container  mt-5">
                                    	<form role="form" method="get" >
                                    	<input type="hidden" id="page" name="page" value="1"> 
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
                              				<div class="input-group justify-content-center">
                    							<div class="input-group-append">
                    					 			<select name="searchType" >
     					 	<option value="n" selected disabled <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>----------</option>
     					 	<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>아이디</option>
     					 	<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>이름</option>
      						
      						
    					</select>
    				   
								
   							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />
							
    							<button class="btn btn-primary" id="searchBtn" type="button" ><BIG><i class="fas fa-search"></i></BIG></button>
    						
    					<script>
      						$(function(){
        						$('#searchBtn').click(function() {
          						self.location = "adminList.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + 
          						$("select[name='searchType'] option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
       							 });
    						  });   
   		
      					</script>
                    							</div>
                							</div>
                						</form>
				
  										<ul class="pagination justify-content-center mt-5">
    										<c:if test="${scri.page!=1}">
    							<li class="page-item"><a class="page-link" href="adminList.do${pageMaker.makeSearch(1)}"> <i class="fa fa-angle-double-left" style="font-size:20px;"></i></a></li>
    						</c:if>
    						<c:if test="${pageMaker.prev}">
    							<li class="page-item"><a class="page-link" href="adminList.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"> <i class="fa fa-angle-left" style="font-size:20px;"></i> </a></li>
    						</c:if>
    						

    						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    							
    							<c:choose>
    								<c:when test="${idx eq scri.page }">
    								<li class="page-item-active" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>
    									<a class="page-link" href="adminList.do${pageMaker.makeSearch(idx)}"><B>${idx}</B></a></li>
    								</c:when>
    								<c:otherwise>
    								<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>
    									<a class="page-link" href="adminList.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
    								</c:otherwise>
    							</c:choose>
    						</c:forEach>
    						

    						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    							<li class="page-item"><a class="page-link" href="adminList.do${pageMaker.makeSearch(pageMaker.endPage + 1)}"> <i class="fa fa-angle-right" style="font-size:20px;"></i> </a></li>
    						 </c:if>
    						 <c:if test="${scri.page != pageMaker.totalPage}">
    							<li class="page-item"><a class="page-link" href="adminList.do${pageMaker.makeSearch(pageMaker.totalPage)}"> <i class="fa fa-angle-double-right" style="font-size:20px;"></i> </a></li>
    						</c:if>
    					
  										</ul>
									</div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                                 
           				
                                    
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
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
     
       
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        
    </body>
</html>
