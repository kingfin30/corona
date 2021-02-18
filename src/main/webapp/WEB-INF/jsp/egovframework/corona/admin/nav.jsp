   <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@page import="java.net.URLEncoder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
<c:set value="${memberNo}" var="memberAno"/>
	
            <a class="navbar-brand" href="/index.do"><img src="/resources/assets/img/logo2.png" alt="" width="220" height="40"> </a>
              &nbsp; &nbsp; &nbsp;
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <div class="input-group-append"></div>
                </div>
            </form>
                 	<style>
       	.blinking{
	-webkit-animation:blink 0.5s ease-in-out infinite alternate;
    -moz-animation:blink0.5s ease-in-out infinite alternate;
    animation:blink 0.5s ease-in-out infinite alternate;

@-webkit-keyframes blink{
    0% {opacity:0.8;}
    100% {opacity:1; color:white;}
}
@-moz-keyframes blink{
    0% {opacity:0.8;}
    100% {opacity:1; color:white;}
}
@keyframes blink{
    0% {opacity:0.8;}
    100% {opacity:1; color:white;}






       	</style>
            <!-- Navbar-->
            
               		
      
                    <span><B><a style="color:gold" href="/adminMyPage.do"><c:out value="${memberName}"/></a></B></span> <span style="color:white"> 님 환영합니다 </span> &nbsp;
            <ul class="navbar-nav ml-auto ml-md-0">
   
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw blink"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                    	<a class="dropdown-item" href="/admin.do"><i class="fas fa-home"></i> &nbsp;관리자 홈</a>
                        <a class="dropdown-item" href="/index.do" target="_blank"><i class="fas fa-home"></i> &nbsp;사용자 홈</a>
                        <a class="dropdown-item" href="/adminMyPage.do"><i class="far fa-id-card"></i> &nbsp;마이페이지</a>
                         <a class="dropdown-item" href="/letter.do"><i class="icon fa fa-paper-plane"></i> &nbsp;쪽지보내기</a>
                          <a class="dropdown-item" href="/receiveList.do"><i class="fas fa-envelope-open-text"></i> &nbsp;받은 쪽지함 
                          (
                     	<c:choose>
                     	<c:when test="${letterService.readCount(memberAno) == 0 }"	>
                          <span>
                         0
                          </span>
                          </c:when>
                          <c:otherwise>
                          <span style="color:red">
                          <c:out value="${letterService.readCount(memberAno)}"/>
                          </span>
                          </c:otherwise>
                          </c:choose>
                          )</a>
                          <a class="dropdown-item" href="/sendList.do"><i class="fas fa-mail-bulk"></i> &nbsp;보낸 쪽지함</a>
                            <!--
                        <a class="dropdown-item" href="/sender.do">메일 보내기(테스트)</a>
                      
                        <a class="dropdown-item" href="/sender2.do"><i class="fas fa-laptop-code"></i> 파일첨부 메일(테스트)</a>
                        -->
                        	<div class="dropdown-divider"></div>
                        	<a class="dropdown-item" href="/logout.do"><i class="fas fa-sign-out-alt"></i> &nbsp;로그아웃</a>
                        
                    </div>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <br/>
                    <div class="sb-sidenav-menu">
                    	<div class="nav">
                            <div class="sb-sidenav-menu-heading">Main</div>
                            <a class="nav-link" href="/admin.do">
                               <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>대시 보드</a>
                               
                             
                            
                        </div>
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Manage</div>
                            <a class="nav-link" href="/confirm/list.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	확진자 목록
                            </a>
                             <a class="nav-link" href="/adminList.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	관리자 목록
                            </a>
                        </div>
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Content</div>
                            <a class="nav-link" href="/subscribeList.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	구독자 목록
                            </a>
                            
                             <a class="nav-link" href="/mContentList.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                	메일 컨텐츠
                            </a>
                             
                        </div>
                   
                    </div>
                   
                </nav>
            </div>
            <style>

 </style>           
         