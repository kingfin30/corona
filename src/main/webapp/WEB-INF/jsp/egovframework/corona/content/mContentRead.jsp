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
		<script>var msg33 = '${msg33}';
       		if(msg33!=null && msg33 !=""){
    	  	 alert(msg33);
    		}
       	</script>
       	 	<script>
       		function setPerPageNums(){
       			var sh = document.getElementById("s1");
   
      			
       			location.href="mContentReadView.do?mno=${mContentRead.mno}&subPage=1&perSubPageNum="+ sh.value +"#pagingList";
       					//+"&searchType=${scri.searchType}&keyword=${scri.keyword}"
       		}
       	</script>
       	<script>
       		function winOpen(ele){
       			//document.domain="myDomain.com";
       			
       	
       			window.open(ele.title, ele.name , 'toolbar=no, menubar=no, scrollbars=no, resizable=no, width=800, height= 810,  top=200, left=100'); 
       			return false;
       		}
       		function winOpen2(ele){
       			//document.domain="myDomain.com";
       			
       	
       			window.open(ele.title, ele.name , 'toolbar=no, menubar=no, scrollbars=no, resizable=no, width=800, height= 650,  top=200, left=100'); 
       			return false;
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
       	 <script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='myform']");
			
			// 수정 
			$("#update_btn").on("click", function(){
				formObj.attr("action", "mContentUpdateView.do");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			// 취소
			// 목록
			$("#list_btn").on("click", function(){

				location.href = "mContentList.do?page=${scri.page}"
					+"&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
			$("#delete_btn").on("click", function(){
				 if(!confirm("컨텐츠를 삭제하시겠습니까?" )){
					 return false;
				 }

				location.href = "mContentDelete.do?mno=${mContentRead.mno}&page=${scri.page}"
					+"&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
		})
		
		</script>
        
   


    </head>
    <body class="sb-nav-fixed">
         <jsp:include page="/WEB-INF/jsp/egovframework/corona/admin/nav.jsp"/>
    
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                          <h1 class="mt-4"><i class="fas fa-search"></i> 메일 컨텐츠 보기</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item "><a href="/admin.do"> 대시보드</a></li>
                             <li class="breadcrumb-item "><a href="/mContentList.do">메일 컨텐츠 목록</a></li>
                              <li class="breadcrumb-item active">메일 컨텐츠 보기</li>
                         
                        </ol>
                          <div class="row"></div>
                         <div class="card mb-4">
                         <div class="card-body">
                         ※ 메일 컨텐츠 입니다.</br>
                              ※ 로그 목록에 편집 취소를 누르면 정기 컨텐츠 체크 여부를 제외한 나머지 제목과 본문만 수정됩니다.</br>
              ※ esc키를 누르면 로그창이 닫힙니다.                 
                         </div>
                         </div>
                         <div class="card mb-4">
		    <div  class="card-header" >
                               
                                <B >메일 컨텐츠</B>
                            </div>	
                            <div class="card-body">
                            	<form name="myform"  method="post" enctype="multipart/form-data" action="/mContentWrite.do">
                            	<input type="hidden" id="mno" name="mno" value="${mContentRead.mno}" />
  					<input type="hidden" id="page" name="page" value="${scri.page}"> 
  					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
 					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
 					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
                            
<table class="table table-bordered" style="text-align:center" border="1" cellpadding="0" cellspacing="0">
<tr >
			
				<th colspan='4' style="background-color:#F2F2F2;text-align:left"><label for="cno"><B><BIG>&nbsp;&nbsp;번호&nbsp;&nbsp;</BIG></B></label>
									<B><BIG><c:out value="${mContentRead.rnum}" /><B><BIG></th>
				
			</tr>
<tr>
   <td style="background-color:#F2F2F2" width="150"><B>제목</B></td> 
   <td colspan="3"><span style="float:left">${mContentRead.subject}</span></td>
</tr>
<tr style="float:center">
   <td width="150" style="background-color:#F2F2F2"><B>최초 작성자</B></td> 
   <td>
   <span style="float:left">
   <div class="dropdown">
  <button type="button"  class="dropbtn"><B>${mContentRead.writer}</B></button>
  <div class="dropdown-content">
  	
  	<c:choose>
  	<c:when test="${memberNo == adminInfo.ano}">
  		<span>${mContentRead.writer} (<c:out value="${adminInfo.adminId}"/>)</span>
  		<a href="/adminMyPage.do">마이페이지</a>
  	</c:when>
  	<c:otherwise>
  		<span>${mContentRead.writer} (<c:out value="${adminInfo.adminId}"/>)</span>
    	<a href="/lsend.do?writerno=${mContentRead.ano }">쪽지보내기</a>
    </c:otherwise>
    </c:choose>
  
  </div>
</div>
   
   
   </span>
   </td>
   <td width="150" style="background-color:#F2F2F2"><B>작성자 권한</B></td> 
   <td><span style="float:left">${mContentRead.right}</span></td>
</tr>
<c:if test="${check != 0 }">
<tr style="float:center">
   <td width="150" style="background-color:#F2F2F2"><B>최종 수정자</B></td> 
   <td>
   <span style="float:left">
 
     <div class="dropdown">
  <button type="button" class="dropbtn"><B>${mContentRead.updater}</B></button>
  <div class="dropdown-content">
    
    	<c:choose>
  	<c:when test="${memberNo == uadminInfo.ano}">
  		<span>${mContentRead.updater} (<c:out value="${uadminInfo.adminId}"/>)</span>
  		<a href="/adminMyPage.do">마이페이지</a>
  	</c:when>
  	<c:otherwise>
  		<span>${mContentRead.updater} (<c:out value="${uadminInfo.adminId}"/>)</span>
    	<a href="/lsend.do?writerno=${mContentRead.updateano }">쪽지보내기</a>
    </c:otherwise>
    </c:choose>
  </div>
</div>
   
   </span>
   </td>
   <td width="150" style="background-color:#F2F2F2"><B>수정자 권한</B></td> 
   <td>
   	<span style="float:left">
   		
   				${mContentRead.updaterright}
   			
   	
   	</span>
   	
   	</td>
</tr>
</c:if>
<tr>
   <td style="background-color:#F2F2F2"><B>내용</B></td>
   <td colspan="3">
   
   <!--  --> 
   <textarea style="resize: none; outline: none; background-color:white; background:clear; border:0; border-radius: 0rem;"
    class="form-control py-4"   name="content" id="content"  rows="30" cols="40" disabled  >${mContentRead.content}</textarea>
    
    </td>
</tr>

<tr>
   <td style="background-color:#F2F2F2"><B>최초 작성</B></td>
  <td colspan="3"><span style="float:left"><fmt:formatDate value="${mContentRead.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></span></td>

</tr>
<tr>
   <td style="background-color:#F2F2F2"><B>최근 수정</B></td>
   <td colspan="3"><span style="float:left"><fmt:formatDate value="${mContentRead.updatedate}" pattern="yyyy-MM-dd HH:mm:ss" /></span></td>	
</tr>
<tr>
   <td style="background-color:#F2F2F2"><B>정기 컨텐츠</B></td>
   <td colspan="3"><input style="float:left"  type="checkbox" name="period" id="period" <c:if test="${mContentRead.period eq 'use'}">checked</c:if> disabled value="use">
   
   		<input type="hidden" name="period" id="period" value="${mContentRead.period }">
   </td>
</tr>
<tr>
   <td style="background-color:#F2F2F2"><B>파일 첨부</B></td>
   <td colspan="3"><input style="float:left" type="file" name="attachment" id="attachment" disabled></td>
</tr>
<tr>
   <td colspan="4">
   <div style="float:right">
   <button  type="button" name="update_btn" id="update_btn" class="btn btn-primary">
            <span class="default"><span> 수정 </span></span>
        </button>
      
        <button  type="button" name="list_btn" id="list_btn" class="btn btn-primary">
            <span class="default"><span> 목록 </span></span>
        </button>
        
         <button  type="button" name="delete_btn" id="delete_btn" style="background-color:red; border-color:red" class="btn btn-primary">
            <span class="default"><span> 삭제 </span></span> 
        </button>
        </div>
        </td>
        
</tr>
</table>
</form>

<div class="card mb-4">

                            <div class="card-header" id="pagingList">
                            	
                               		 <i class="fas fa-table mr-1 "></i>
                                		메일 컨텐츠 로그
                                		<select name="s1" id="s1" oninput="setPerPageNums()"  >
                                    	<option value="10" <c:if test="${sucri.perSubPageNum == '10'}" > selected </c:if>  >10개 보기</option>
                                    	<option value="20" <c:if test="${sucri.perSubPageNum == '20'}" > selected </c:if> >20개 보기</option>
                                    	<option value="50" <c:if test="${sucri.perSubPageNum == '50'}" > selected </c:if> >50개 보기</option>
                                    	<option value="100" <c:if test="${sucri.perSubPageNum == '100'}" > selected </c:if> >100개 보기</option>
                                    </select>
                                		
                             
                            </div>
                          
                           		
                            
                        
                            
                                
                            <div class="card-body" >
                            
                            <form name="myform2"  method=post action="/mContentReset.do">
                               		
					
  				<input type="hidden" name="loglno" id="loglno"></input>
  				<input type="hidden" name="logmno" id="logmno"></input>
                                    <table class="table table-bordered"   width="500px" cellspacing="0" style="padding:20px" >
                                        <thead style="background-color:#F2F2F2">
                                            <tr>
                                            
                                            	<th style="text-align:center" width="60px" nowrap>번호</th>
                                               
                                          
                                               
                                               <th style="text-align:center">작성일</th>
                                                <th style="text-align:center" width="150px">작성</th> 
                                                <th style="text-align:center" width="150px">편집.수정</th>    
                                                <!-- 
                                               <th style="text-align:center" width="150px" nowrap><i font-size="30px" class="fas fa-undo"></i></th>
                                             -->
                                                
                                                                                                
                                            </tr> 
                                        </thead>
                                 
                                        <tbody> 
                                 
					
                                        	<c:forEach items="${mContentLogList}" var = "mContentLogList">
                                          <tr>
                                          
								<td  style="text-align: center" nowrap >&nbsp;<c:out value="${pageMaker.totalCount - mContentLogList.rnum + 1}" />&nbsp;</td>
							
								<td>
								&nbsp;
									<button class="linkbtn" type="button" onclick="winOpen(this)"
									title="mContentLogReadView.do?mno=${mContentLogList.mno }&lno=${mContentLogList.lno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}"
									name="blank1">
										<B><BIG><fmt:formatDate value="${mContentLogList.writedate}" pattern="yyyy-MM-dd HH:mm:ss" /> </BIG>&nbsp;<small><fmt:formatDate value="${mContentLogList.updatedate}" pattern="yyyy-MM-dd HH:mm:ss" />에 수정됨</small> </B>
																
									</button>&nbsp;&nbsp;<small><span style="color:green"><c:out value="${mContentLogList.commentx}"/></span></small>
								    
								<c:if test="${mContentLogList.updatelno>0}">
									<span ><button type="button" class="linkbtn2" onclick="winOpen2(this)"
									title="mContentLogReadBack.do?mno=${mContentLogList.mno }&lno=${mContentLogList.updatelno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}" 
									name="blank2"> 
									
									<small>(되돌린 게시글)</small></button>
									</span>
								</c:if>
								
								</td>
								<td style="text-align:center">
								 <div class="dropdown">
  <button type="button"  class="dropbtn"><B><c:out value="${mContentLogList.writer}"/></B></button>
  <div class="dropdown-content">
  <c:choose>
  <c:when test="${memberNo == logadminInfo.adminRead(mContentLogList.ano).ano}">
  <span>${mContentLogList.writer} (<c:out value="${logadminInfo.adminRead(mContentLogList.ano).adminId}"/>)</span>
    <a href="/adminMyPage.do">마이페이지</a>
  </c:when>
  <c:otherwise>
    <span>${mContentLogList.writer} (<c:out value="${logadminInfo.adminRead(mContentLogList.ano).adminId}"/>)</span>
    <a href="/lsend.do?writerno=${mContentLogList.ano}">쪽지보내기</a>
    </c:otherwise> 
    </c:choose>
  </div>
</div>
									
								</td>
								<td style="text-align:center">
								 <div class="dropdown">
  <button type="button"  class="dropbtn"><B><c:out value="${mContentLogList.updater}"/></B></button>
  <div class="dropdown-content">
  <c:choose>
  <c:when test="${memberNo == logadminInfo.adminRead(mContentLogList.updateano).ano}">
  	<span>${mContentLogList.updater} (<c:out value="${logadminInfo.adminRead(mContentLogList.updateano).adminId}"/>)</span>
    <a href="/adminMyPage.do">마이페이지</a>
  </c:when>
  <c:otherwise>
    <span>${mContentLogList.updater} (<c:out value="${logadminInfo.adminRead(mContentLogList.updateano).adminId}"/>)</span>
    <a href="/lsend.do?writerno=${mContentLogList.updateano }">쪽지보내기</a>
    </c:otherwise>
    </c:choose>
  </div>
</div>
									
								</td>
			
								<!-- 
								<td style="text-align: center"><button type="button" class="btn btn-primary" 								
								onclick="location.href = '/mContentReset.do?mno=${mContentLogList.mno}&lno=${mContentLogList.lno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}'"
								name="updatebtn" id="updatebtn"><small>편집 취소</small></button></td>			 -->											
							</tr>
                                       	</c:forEach>
                                       
                                        </tbody>
                                         <!--   <tfoot style="background-color:#F2F2F2" >
                                        
                                        <td colspan="8">
                                       
                                        	  <div style="float: right;">
                             
										</div>
										</td>
                                        
                                        </tfoot> -->
                                    </table>
                                    </form>
                                    <div class="container  mt-5">
                                    	
                                    	<input type="hidden" id="subPage" name="subPage" value="1"> 
  					<input type="hidden" id="perSubPageNum" name="perSubPageNum" value="${sucri.perSubPageNum}"> 
                              			
                	
				
  										<ul class="pagination justify-content-center mt-5">
    										<c:if test="${sucri.subPage != 1}">
    							<li class="page-item"><a class="page-link" href="mContentReadView.do${pageMaker.makeQuery(1)}#pagingList">
    							<i class="fa fa-angle-double-left" style="font-size:20px;"></i></a></li>   
    						</c:if>
    						<c:if test="${pageMaker.prev}">
    							<li class="page-item"><a class="page-link" href="mContentReadView.do${pageMaker.makeQuery(pageMaker.startPage - 1)}#pagingList"> 
								<i class="fa fa-angle-left" style="font-size:20px;"></i>
								 </a></li>
    						</c:if>
    						

    						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    							
    							<c:choose>
    								<c:when test="${idx eq sucri.subPage }">
    								<li class="page-item-active" <c:out value="${pageMaker.sucri.subPage == idx ? 'class=info' : '' }" />>
    									<a class="page-link" href="mContentReadView.do${pageMaker.makeQuery(idx)}#pagingList"><B>${idx}</B></a></li>
    								</c:when>
    								<c:otherwise>
    								<li class="page-item" <c:out value="${pageMaker.sucri.subPage == idx ? 'class=info' : '' }" />>
    									<a class="page-link" href="mContentReadView.do${pageMaker.makeQuery(idx)}#pagingList">${idx}</a></li>
    								</c:otherwise>
    							</c:choose>
    						</c:forEach>
    						

    						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    							<li class="page-item"><a class="page-link" href="mContentReadView.do${pageMaker.makeQuery(pageMaker.endPage + 1)}#pagingList">
									<i class="fa fa-angle-right" style="font-size:20px;"></i>
								 </a></li>
    						 </c:if>
    						 <c:if test="${sucri.subPage != pageMaker.totalPage}">
    							<li class="page-item"><a class="page-link" href="mContentReadView.do${pageMaker.makeQuery(pageMaker.totalPage)}#pagingList"> 
    								<i class="fa fa-angle-double-right" style="font-size:20px;"></i>
								 </a></li>
    						</c:if>
    					
  										</ul>
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
                </div>
            
        
      
        
    </body>
       
             <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
     
       
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
</html>
