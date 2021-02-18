<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="asapro" uri="http://www.asadal.com" %>
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
  color: black;
  background-color:white;
  border-color:black;
  padding: 10px 10px;
  text-decoration: none;
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
   
      			
       			location.href="letterist.do?&page=1&perPageNum="+ sh.value ;
       					//+"&searchType=${scri.searchType}&keyword=${scri.keyword}"
       		}
       		function winOpen(ele){
       			//document.domain="myDomain.com";
       			
       	
       			window.open(ele.value, ele.name, 'toolbar=no, menubar=no, scrollbars=no, resizable=no, width=400, height= 600,  top=200, left=500'); 
       			return false;
					  
       		}
       	</script>
       	 	<script>
    	$(document).ready(function(){
			var formObj = $("form[name='myform']");
			var checkObj = $("input[name='chk']:checked");
			
			// 수정 
			$("#btnDelete").on("click", function(){
				
				
				 if($('input:checkbox[name="chk"]:checked').length==0){
					 alert('1개 이상의 쪽지를 선택해주세요.')
				 }
 
						
				 else{ 
					 if(confirm("쪽지 "+ $('input:checkbox[name="chk"]:checked').length+"개를 삭제하시겠습니까?")){
					formObj.attr("action", "sendDelete.do");
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
                       <h1 class="mt-4"><i class="fas fa-mail-bulk"></i> 보낸쪽지함</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item active">보낸쪽지함</li>
                        </ol>
                      
                        <div class="row"></div>
                         <div class="card mb-4">
                         <div class="card-body">
                         ※ 보낸 쪽지 확인이 가능합니다.<br/>  
                                  ※ esc키를 누르면 쪽지창이 닫힙니다.  
                         </div>
                         </div>
                              
                        

<!-- 데이터 테이블-->
                        
                       
                           
                            	
                               		 <i class="fas fa-envelope-open "></i>
                                		<span>쪽지 목록</span>  
                                		<select name="s1" id="s1" oninput="setPerPageNums()"  >
                                    	<option value="10" <c:if test="${scri.perPageNum == '10'}" > selected </c:if>  >10개 보기</option>
                                    	<option value="20" <c:if test="${scri.perPageNum == '20'}" > selected </c:if> >20개 보기</option>
                                    	<option value="50" <c:if test="${scri.perPageNum == '50'}" > selected </c:if> >50개 보기</option>
                                    	<option value="100" <c:if test="${scri.perPageNum == '100'}" > selected </c:if> >100개 보기</option>
                                    </select>
                               	<div style="float: right;">
                               		<!-- 
                                	<button  class="btn btn-primary" type="button" id ="btnChange" onclick = "location.href = 'adminView.do' " >관리자 등록</button>
                                	 -->
                             </div>
                          
                          
                           		
                            
                        
                            
                 
                        
                       
                               <form name="myform" action="" method=post>
                                 
				
                               		
					
  				
                                    <table class="table table-bordered"   width="100%" cellspacing="0">
                                        <thead style="background-color:#F2F2F2">
                                            <tr>
                                            <th width="50px" style="text-align: center"><input type="checkbox" name="checkall" onchange="check(this.form.chk)"/></th>
                                            	<th  width="60px" nowrap>번호</th>
                                                <th>내용</th>
                                                <th width="250px">받는 사람</th>                                    
                                                <th width="250px">보낸 날짜</th>
                                            
                                                
                                                                                                
                                            </tr>
                                        </thead>
                                 
                                        <tbody>
                                        	<c:forEach items="${letterList}" var = "letterList">
                                        		
                                          <tr>
                                          <td style="text-align: center"><input type="checkbox" name="chk" value="${letterList.lsno}" onchange="check2(this.form.checkall)" class="checkSelect"/> 
                                       </td>
								<td width="60px" nowrap style="text-align:center"><c:out value="${pageMaker.totalCount - letterList.rnum + 1}" /></td>
							
								<td>
									<button class="linkbtn" style="color:black" onclick="winOpen(this)" title="${letterList.content}" value="/sendRead.do?lsno=${letterList.lsno}" name="letterRead" id="letterRead">
								${asapro:longWordCutter30(letterList.content)}  
									</button>
								</td>
								<td ><B>
								
								 <nav width="1000px">
<c:choose>
<c:when test="${service.rfListCount(letterList.lsno) >1 }">
<ul class="navbar-nav ml-auto ml-md-0">
<li class="nav-item dropdown">
<c:set var='lastAno' value='${service.rfList(letterList.lsno).get(service.rfListCount(letterList.lsno) - 1).getAno()}' />
<a style="color:black" class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><c:out value="${service.rfList(letterList.lsno).get(0).getAdminId()}"/> 

외<c:out value="${service.rfListCount(letterList.lsno)-1}"/>명

</a>
  
   <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
<c:forEach items="${service.rfList(letterList.lsno)}" var="rfList">
  <span>
  <c:choose>
  <c:when test="${adminLoginService.anoCheck(rfList.ano) >0}">
  <c:out value="${rfList.adminId}"/>
  
   	<c:choose>
   		<c:when test="${rfList.getRflag() == 'N' }"> 
   		(읽지않음)
   		</c:when>
   		<c:otherwise>
   		(읽음)
   		</c:otherwise>
   	</c:choose>
  
  
  <c:if test="${rfList.ano != lastAno}">,</c:if><br/></span>
  
  </c:when>
  <c:otherwise>
  <span style="text-decoration:line-through;color:#A4A4A4"><c:out value="${rfList.adminId}"/>(탈퇴한 회원)</span>
    <c:if test="${rfList.ano != lastAno}">,</c:if><br/></span>
  </c:otherwise>
  </c:choose>
  
</c:forEach>
</div>
</li>
   </ul>
   </c:when>
   <c:otherwise>
   	<span><c:out value="${service.rfList(letterList.lsno).get(0).getAdminId()}"/>
   	<c:choose>
   		<c:when test="${service.rfList(letterList.lsno).get(0).getRflag() == 'N' }">
   		(읽지않음)
   		</c:when>
   		<c:otherwise>
   		(읽음)
   		</c:otherwise>
   	</c:choose>
   	</span>
   </c:otherwise>
   </c:choose>
 

</nav>
								
								</B></td>
									
								<!--  -->
						
								<td ><fmt:formatDate value="${letterList.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
																						
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
     					 	<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>받는 사람</option>
     					 	
      						
      						
    					</select>
    				   
								
   							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />
							
    							<button class="btn btn-primary" id="searchBtn" type="button" ><BIG><i class="fas fa-search"></i></BIG></button>
    						
    					<script>
      						$(function(){
        						$('#searchBtn').click(function() {
          						self.location = "sendList.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + 
          						$("select[name='searchType'] option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
       							 });
    						  });   
   		
      					</script>
                    							</div>
                							</div>
                						</form>
				
  										<ul class="pagination justify-content-center mt-5">
    										<c:if test="${scri.page!=1}">
    							<li class="page-item"><a class="page-link" href="sendList.do${pageMaker.makeSearch(1)}"> <i class="fa fa-angle-double-left" style="font-size:20px;"></i></a></li>
    						</c:if>
    						<c:if test="${pageMaker.prev}">
    							<li class="page-item"><a class="page-link" href="sendList.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"> <i class="fa fa-angle-left" style="font-size:20px;"></i> </a></li>
    						</c:if>
    						

    						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    							
    							<c:choose>
    								<c:when test="${idx eq scri.page }">
    								<li class="page-item-active" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>
    									<a class="page-link" href="sendList.do${pageMaker.makeSearch(idx)}"><B>${idx}</B></a></li>
    								</c:when>
    								<c:otherwise>
    								<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>
    									<a class="page-link" href="sendList.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
    								</c:otherwise>
    							</c:choose>
    						</c:forEach>
    						

    						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    							<li class="page-item"><a class="page-link" href="sendList.do${pageMaker.makeSearch(pageMaker.endPage + 1)}"> <i class="fa fa-angle-right" style="font-size:20px;"></i> </a></li>
    						 </c:if>
    						 <c:if test="${scri.page != pageMaker.totalPage}">
    							<li class="page-item"><a class="page-link" href="sendList.do${pageMaker.makeSearch(pageMaker.totalPage)}"> <i class="fa fa-angle-double-right" style="font-size:20px;"></i> </a></li>
    						</c:if>
    					
  										</ul>
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
