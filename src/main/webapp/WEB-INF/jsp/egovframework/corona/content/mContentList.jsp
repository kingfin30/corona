<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>
<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value='${toDay}' pattern='yyyy-MM-dd' var="nowDate"/>
<fmt:parseNumber value='${toDay.time / (1000*60*60)}'  var="nowDays" integerOnly="true" scope="request"/>


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
     
        <script>var msg2 = '${msg2}';
       		if(msg2!=null && msg2!=""){
    	  	 alert(msg2);
    		}
       	</script>
       	<script>var msgdelete = '${msgdelete}';
       		if(msgdelete!=null && msgdelete!=""){
    	  	 alert(msgdelete);
    		}
       	</script>
       	<style>
       	.blinking_red{
	-webkit-animation:blink_red 0.5s ease-in-out infinite alternate;
    -moz-animation:blink_red 0.5s ease-in-out infinite alternate;
    animation:blink_red 0.5s ease-in-out infinite alternate;
}
	.blinking_orange{
	-webkit-animation:blink_orange 0.5s ease-in-out infinite alternate;
    -moz-animation:blink_orange 0.5s ease-in-out infinite alternate;
    animation:blink_orange 0.5s ease-in-out infinite alternate;
}
	.blinking_purple{
	-webkit-animation:blink_purple 0.5s ease-in-out infinite alternate;
    -moz-animation:blink_purple 0.5s ease-in-out infinite alternate;
    animation:blink_purple 0.5s ease-in-out infinite alternate;
}
@-webkit-keyframes blink_red{
    0% {opacity:0.8;}
    100% {opacity:1; box-shadow: 0 0 3px red;}
}
@-moz-keyframes blink_red{
    0% {opacity:0.8;}
    100% {opacity:1; box-shadow: 0 0 3px red;}
}
@keyframes blink_red{
    0% {opacity:0.8;}
    100% {opacity:1; box-shadow: 0 0 3px red;}
}

@-webkit-keyframes blink_orange{
    0% {opacity:0.7;}
    100% {opacity:1; box-shadow: 0 0 4px orange;}
}
@-moz-keyframes blink_orange{
    0% {opacity:0.8;}
    100% {opacity:1; box-shadow: 0 0 4px orange;}
}
@keyframes blink_orange{
    0% {opacity:0.8;}
    100% {opacity:1; box-shadow: 0 0 4px orange;}
}

@-webkit-keyframes blink_purple{
    0% {opacity:0.8;}
    100% {opacity:1; box-shadow: 0 0 3px purple;}
}
@-moz-keyframes blink_purple{
    0% {opacity:0.8;}
    100% {opacity:1; box-shadow: 0 0 3px purple;}
}
@keyframes blink_purple{
    0% {opacity:0.8;}
    100% {opacity:1; box-shadow: 0 0 3px purple;}
}


       	</style>
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
   
      			
       			location.href="mContentList.do?&page=1&perPageNum="+ sh.value ;
       					//+"&searchType=${scri.searchType}&keyword=${scri.keyword}"
       		}
       	</script>
       	    <style>
            	.hover{background-color:#fdf7df;}
            	.graytd{background-color:#fcfcfc;}
            </style>
               <script>
            	$(document).ready(function(){
            		$('tbody tr').hover(
            				function (){$(this).addClass('hover');},
            				function (){$(this).removeClass('hover');});
            	});
            </script>
       	 	<script>
    	$(document).ready(function(){
			var formObj = $("form[name='myform']");
			var checkObj = $("input[name='chk']:checked");
			
			// 수정 
			$("#btnDelete").on("click", function(){
				
				
				 if($('input:checkbox[name="chk"]:checked').length==0){
					 alert('1개 이상의 컨텐츠를 선택해주세요.');
				 }

						
				 else{ 
					 if(confirm( $('input:checkbox[name="chk"]:checked').length+"개의 컨텐츠를 삭제하시겠습니까?")){
					formObj.attr("action", "mContentDeleteCheck.do");
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
                       <h1 class="mt-4"><i class="fas fa-table"></i> 메일 컨텐츠 목록</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item active">메일 컨텐츠 목록</li>
                        </ol>
                      
                        <div class="row"></div>
                         <div class="card mb-4">
                         <div class="card-body">
                         ※ 메일 컨텐츠를 등록할 수 있습니다. <br/>
                          ※ 컨텐츠는 수정일 순으로 정렬됩니다.<br/>
                         ※ 정기 컨텐츠는 하나만 지정 가능합니다.<br/>
         	※ 정기 컨텐츠로 설정하면 상단에 고정됩니다. <br/>  

                         </div>
                         </div>
                              
                        

<!-- 데이터 테이블-->
                        
                        <div class="card mb-4">
                            <div class="card-header">
                            	
                               		 <i class="fas fa-table mr-1 "></i>
                                		메일 컨텐츠 테이블
                                		<select name="s1" id="s1" oninput="setPerPageNums()"  >
                                    	<option value="10" <c:if test="${scri.perPageNum == '10'}" > selected </c:if>  >10개 보기</option>
                                    	<option value="20" <c:if test="${scri.perPageNum == '20'}" > selected </c:if> >20개 보기</option>
                                    	<option value="50" <c:if test="${scri.perPageNum == '50'}" > selected </c:if> >50개 보기</option>
                                    	<option value="100" <c:if test="${scri.perPageNum == '100'}" > selected </c:if> >100개 보기</option>
                                    </select>
                               	<div style="float: right;">
                               		  
                                	<button  class="btn btn-primary" type="button" id ="btnChange" onclick = "location.href = 'mContentWriteView.do' " >컨텐츠 등록</button>
                             </div>
                            </div>
                          
                           		
                            
                        
                            
                                
                            <div class="card-body">
                        
                       
                                <div class="table-responsive">
                               <form name="myform" action="adminDeleteCheck.do" method=post>
                               		
					
  				
                                    <table class="table table-bordered"   width="100%" cellspacing="0">
                                        <thead style="background-color:#F2F2F2">
                                            <tr>
                                            <th width="50px" style="text-align: center"><input type="checkbox" name="checkall" onchange="check(this.form.chk)"/></th>
                                            	<th style="text-align:center" width="60px" nowrap>번호</th>
                                                <th style="text-align:center">제목</th>
                                          
                                                <th style="text-align:center" width="200px" nowrap>등록일</th>
                                               <th style="text-align:center" width="200x" nowrap>최근 수정일</th> 
                                            
                                                
                                                                                                
                                            </tr>
                                        </thead>
                                 
                                        <tbody>
                                        
                                        
                                        
                                   <c:if test="${mContentPeriod ne null}">
                                   <fmt:parseNumber value='${mContentPeriod.regdate.time / (1000*60*60)}'   integerOnly="true" var="oldDaysx" scope="page"/>
						<fmt:parseNumber value='${mContentPeriod.updatedate.time / (1000*60*60)}'   integerOnly="true" var="oldDaysy" scope="page"/>
						<c:set value="${nowDays - oldDaysx}" var="rdateDiff2"/>
						<c:set value="${nowDays - oldDaysy}" var="udateDiff2"/>
                                   
                                  <tr style="background-color:#FFE0E0">
                                 
                                          <td style="text-align: center; color:#FF4040"><B>※ </B>
                                          
                                           </td>
								<td width="80px" style="text-align: center" nowrap > <B style="color:#FF4040;"><img height="25" src="/assets/img/PERIOD.png"/>	</B> </td>
							
								<td>
								
									 
								
  								<c:if test="${rdateDiff2 < 24}">
								<img class="blinking_red" height="18" src="/assets/img/NEW.png"/>
								
								</c:if>
								<c:if test="${udateDiff2 < 24 && mContentPeriod.regdate != mContentPeriod.updatedate}">
								<img class="blinking_purple" height="18" src="/assets/img/UPDATE.png"/>
								
								</c:if>
								<a style="color:#FF4040" href="mContentReadView.do?mno=${mContentPeriod.mno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
										<B> ${mContentPeriod.subject} </B>
													 			
								</a>  
								</td>
							
					
						
								<td style="text-align: center"><B style="color:#FF4040"><fmt:formatDate value="${mContentPeriod.regdate}" pattern="yyyy-MM-dd hh:mm:ss" /></B></td>
								<td style="text-align: center"><B style="color:#FF4040">
								<c:choose>
										<c:when test="${mContentPeriod.regdate != mContentPeriod.updatedate}">
											<fmt:formatDate value="${mContentPeriod.updatedate}" pattern="yyyy-MM-dd hh:mm:ss" />
										</c:when>
										<c:otherwise>
											수정기록없음
										</c:otherwise> 
									</c:choose>
								</B></td>														
							</tr>
							</c:if>
					
					
					
                                        	<c:forEach items="${mContentList}" var = "mContentList">
                                          <tr>
                                          <td style="text-align: center"><input type="checkbox" name="chk" value="${mContentList.mno}" onchange="check2(this.form.checkall)"  class="checkSelect"/>
                                          <fmt:parseNumber value='${mContentList.regdate.time / (1000*60*60)}'   integerOnly="true" var="oldDays" scope="page"/>
						<fmt:parseNumber value='${mContentList.updatedate.time / (1000*60*60)}'   integerOnly="true" var="oldDays2" scope="page"/>
						<c:set value="${nowDays - oldDays}" var="rdateDiff"/>
						<c:set value="${nowDays - oldDays2}" var="udateDiff"/>
                                           </td>
								<td  style="text-align: center" nowrap >&nbsp;<c:out value="${pageMaker.totalCount - mContentList.rnum + 1}" />&nbsp;</td>
							
								<td>
								
									
							
									<c:if test="${mContentList.period eq 'use'}">
											<img class="blinking_orange" height="18" src="/assets/img/PERIOD.png"/>		
										</c:if>				
								<c:if test="${rdateDiff < 24}">
								<img class="blinking_red" height="18" src="/assets/img/NEW.png"/>
								
								</c:if>
								<c:if test="${udateDiff < 24 && mContentList.regdate != mContentList.updatedate}">
								<img class="blinking_purple" height="18" src="/assets/img/UPDATE.png"/>
								
								</c:if>
							<a  href="mContentReadView.do?mno=${mContentList.mno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}">
										<B> ${mContentList.subject} </B>
												
									</a>
					
								</td>
			
					
						
								<td style="text-align: center"><fmt:formatDate value="${mContentList.regdate}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
								<td style="text-align: center">
									<c:choose>
										<c:when test="${mContentList.regdate != mContentList.updatedate}">
											<fmt:formatDate value="${mContentList.updatedate}" pattern="yyyy-MM-dd hh:mm:ss" />
										</c:when>
										<c:otherwise>
											수정기록없음
										</c:otherwise>
									</c:choose>
								</td>														
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
     					 	<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
     					 	<option value="c"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
      						
      						
    					</select>
    				   
								
   							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" />
							
    							<button class="btn btn-primary" id="searchBtn" type="button" ><BIG><i class="fas fa-search"></i></BIG></button>
    						
    				
                    							</div>
                							</div>
                	<script>
      						$(function(){
        						$('#searchBtn').click(function() {
          						self.location = "mContentList.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + 
          						$("select[name='searchType'] option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
       							 });
    						  });   
   		
      					</script>
                						</form>
				
  										<ul class="pagination justify-content-center mt-5">
    										<c:if test="${scri.page != 1}">
    							<li class="page-item"><a class="page-link" href="mContentList.do${pageMaker.makeSearch(1)}">
    							<i class="fa fa-angle-double-left" style="font-size:20px;"></i></a></li>   
    						</c:if>
    						<c:if test="${pageMaker.prev}">
    							<li class="page-item"><a class="page-link" href="mContentList.do${pageMaker.makeSearch(pageMaker.startPage - 1)}"> 
								<i class="fa fa-angle-left" style="font-size:20px;"></i>
								 </a></li>
    						</c:if>
    						

    						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    							
    							<c:choose>
    								<c:when test="${idx eq scri.page }">
    								<li class="page-item-active" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>
    									<a class="page-link" href="mContentList.do${pageMaker.makeSearch(idx)}"><B>${idx}</B></a></li>
    								</c:when>
    								<c:otherwise>
    								<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : '' }" />>
    									<a class="page-link" href="mContentList.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
    								</c:otherwise>
    							</c:choose>
    						</c:forEach>
    						

    						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    							<li class="page-item"><a class="page-link" href="mContentList.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">
									<i class="fa fa-angle-right" style="font-size:20px;"></i>
								 </a></li>
    						 </c:if>
    						 <c:if test="${scri.page != pageMaker.totalPage}">
    							<li class="page-item"><a class="page-link" href="mContentList.do${pageMaker.makeSearch(pageMaker.totalPage)}"> 
    								<i class="fa fa-angle-double-right" style="font-size:20px;"></i>
								 </a></li>
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
