<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value='${toDay}' pattern='MM월 dd일' var="nowDate"/>





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" id="top">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Asadal-mook</title>
        <link rel="icon" type="image/x-icon" href="/resources/assets/img/favicon.ico" />
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
       
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="/index.do"><img src="/resources/assets/img/logo.png" alt="" width="50" height="50">  <B><BIG>Asadal</BIG>-mook</B></a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
             <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <div class="input-group-append"></div>
                </div>
            </form>
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <div class="input-group-append"></div>
                </div>
            </form>

            <!-- Navbar Search-->
            <div class="collapse navbar-collapse" id="navbarResponsive">
        		 <ul class="navbar-nav ml-auto">
        		 <li class="nav-item ">
           				<a class="nav-link " href="/index.do"><B>홈</B>
                 			</a>
          			</li>
          			<li class="nav-item ">
            			<a class="nav-link" href="/intro.do"><B>소개</B>
                 			</a>
          			</li>

           			<li class="nav-item active">
            			<a class="nav-link" href="/confirm/table.do"><B>확진자 조회</B></a>
          				</li>
	    
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                       
                        <a class="dropdown-item" href="/login.do">관리자 사이트</a>
                    </div>
                </li>
            </ul>
      		</div>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                    
                        <div class="sb-sidenav-menu-heading">테이블 조회</div>
                      	<li class="nav-item active">
           				<a class="nav-link " href="/confirm/table.do"><B>확진자 현황</B>
                 			</a>
          			</li>
          			
                  
                </nav>
      
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">확진자 현황</h1>
                       
                        <div class="card mb-4">
		    <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                일일 현황
                            </div>	
                            <div class="card-body">
                            	<table  class="table table-bordered" border="1">
			<tr>
				<th>확진</th>
				<th>격리 해제</th>
				<th>사망</th>
			</tr>
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td>${ctable.iConfirm}</td>
	    		  <td>${ctable.iRealese}</td>
	       		  <td>${ctable.iDead}</td>
			</tr>
			</table>
	
                            </div>
		</div>
		<div class="card mb-4">
		    <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                총 현황
                            </div>	
                            <div class="card-body">
                            	<table  class="table table-bordered" border="1">
			 <tr>
	<th>누적 확진자</th>
	<th>현재 확진자</th>
	<th>누적 격리 해제</th>
	<th>누적 사망</th>
	</tr>
	<tr><!-- 첫번째 줄 시작 -->
	    <td>${pageMaker.totalCount}</td>
	    <td>${ctable.sumConfirm}</td>
	     <td>${ctable.sumRelease}</td>
	       <td>${ctable.sumDead}</td>
	    
	</tr>
			</table>
	
                            </div>
		</div>
		
<!-- 
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area mr-1"></i>
                                	확진자 추세 (일주일)
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                        </div>
 -->

		 <div class="card mb-4">
		    <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                지역별 현황
                            </div>	
                            <div class="card-body">
                            	<table  class="table table-bordered" border="1">
			<tr>
				<th>서울.경기</th>
				<th>강원</th>
				<th>충북</th>
				<th>충남</th>
				<th>경북</th>
				<th>경남</th>
				<th>전북</th>
				<th>전남</th>
				<th>제주</th>
				<th scope="col">총합</th>
			</tr>
			<tr><!-- 첫번째 줄 시작 -->
	   			<td><c:out value="${ctable.iSeoul}" /></td>
	    		<td><c:out value="${ctable.iGangwon}" /></td>
	     		<td><c:out value="${ctable.iChungbuk}" /></td>
	       		<td><c:out value="${ctable.iChungnam}" /></td>
	    		<td><c:out value="${ctable.iGyungbuk}" /></td>
	     		<td><c:out value="${ctable.iGyungnam}" /></td>
	       		<td><c:out value="${ctable.iJunbuk}" /></td>
	    		<td><c:out value="${ctable.iJunnam}" /></td>
	     		<td><c:out value="${ctable.iJeju}" /></td>
	     		<td><c:out value="${ctable.iSum}" /></td>
			</tr>
			</table>
	
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar mr-1"></i>
                                        일주일 확진자 수
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">일주일간 확진자 추세</div>
                                </div>
                            </div>
          
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-pie mr-1"></i>
                                        지역별 그래프
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted">지역별 확진자 그래프</div>
                                  
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Asadal-mook 2020</div>
                    
                        </div>
                    </div>
                </footer>
                </div>
                </div>
                
           
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="/assets/demo/chart-area-demo.js"></script>
       <!--   <script src="/assets/demo/chart-bar-demo.js"></script>-->
  <script>
     // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#292b2c';

        // Bar Chart Example
        var ctx = document.getElementById("myBarChart");
        var myLineChart = new Chart(ctx, {
          type: 'bar',
          data: {
            labels: ["<fmt:formatDate value="${days.d6}" pattern="MM월 dd일"/>", 
            	"<fmt:formatDate value="${days.d5}" pattern="MM월 dd일"/>", 
            	"<fmt:formatDate value="${days.d4}" pattern="MM월 dd일"/>", 
            	"<fmt:formatDate value="${days.d3}" pattern="MM월 dd일"/>", 
            	"<fmt:formatDate value="${days.d2}" pattern="MM월 dd일"/>", 
            	"<fmt:formatDate value="${days.d1}" pattern="MM월 dd일"/>", 
            	"<fmt:formatDate value="${days.d0}" pattern="MM월 dd일"/>" ],
            datasets: [{
              label: "확진자 수",
              backgroundColor: "rgba(2,117,216,1)",
              borderColor: "rgba(2,117,216,1)",
              data: [<c:out value="${ctable.day6}" />, <c:out value="${ctable.day5}" />, <c:out value="${ctable.day4}" />,
            	  <c:out value="${ctable.day3}" />, <c:out value="${ctable.day2}" />, <c:out value="${ctable.day1}" />, <c:out value="${ctable.day0}" />],
            }],
          },
          options: {
            scales: {
              xAxes: [{
                time: {
                  unit: 'day'
                },
                gridLines: {
                  display: false
                },
                ticks: {
                  maxTicksLimit: 7
                }
              }],
              yAxes: [{
                ticks: {
                  min: 0,
                  max: 300,
                  maxTicksLimit: 20
                },
                gridLines: {
                  display: true
                }
              }],
            },
            legend: {
              display: false
            }
          }
        });

        </script>

         <!--  <script src="/assets/demo/chart-pie-demo.js"></script>-->
         <script>
      // Set new default font family and font color to mimic Bootstrap's default styling
         Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
         Chart.defaults.global.defaultFontColor = '#292b2c';

         // Pie Chart Example

         var ctx = document.getElementById("myPieChart");
         var myPieChart = new Chart(ctx, {
         	  type: 'pie',
         	  data: {
         	    labels: ["서울.경기", "강원", "충북", "충남","경북","경남","전북","전남","제주"],
         	    datasets: [{
         	      data: [<c:out value="${ctable.iSeoul}" />, <c:out value="${ctable.iGangwon}" />, <c:out value="${ctable.iChungbuk}" />,
         	    	 <c:out value="${ctable.iChungnam}" />, <c:out value="${ctable.iGyungbuk}" />, <c:out value="${ctable.iGyungnam}" />, 
         	    		<c:out value="${ctable.iJunbuk}" />, <c:out value="${ctable.iJunnam}" />, <c:out value="${ctable.iJeju}" />],
         	      backgroundColor: ['#007bff','#FF8000', '#dc3545', '#ffc107', '#28a745', '#0B0B61','#8000FF','#FF00FF','#2E2E2E'],
         	    }],
         	  },
         	});
         </script>
    </body>
</html>
