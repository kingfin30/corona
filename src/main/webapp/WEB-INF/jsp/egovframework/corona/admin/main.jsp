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
         <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script>var adminmsg = '${adminmsg}';
       		if(adminmsg !=null && adminmsg !=""){
    	  	 alert(adminmsg);
    		}
       	</script>
       	         
          <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="/resources/vendor/jquery/jquery.slim.min.js"></script>
          <script>var msg = '${msg}';
       		if(msg!=null && msg!=""){
    	  	 alert(msg);
    		}
       	</script>
       	 

          
    </head>

    <body class="sb-nav-fixed">
        <jsp:include page="nav.jsp"/>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4"><i class="fas fa-home"></i> 대시보드</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">대시보드</li>
                        </ol>
                      
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Primary Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><svg class="svg-inline--fa fa-angle-right fa-w-8" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512" data-fa-i2svg=""><path fill="currentColor" d="M224.3 273l-136 136c-9.4 9.4-24.6 9.4-33.9 0l-22.6-22.6c-9.4-9.4-9.4-24.6 0-33.9l96.4-96.4-96.4-96.4c-9.4-9.4-9.4-24.6 0-33.9L54.3 103c9.4-9.4 24.6-9.4 33.9 0l136 136c9.5 9.4 9.5 24.6.1 34z"></path></svg><!-- <i class="fas fa-angle-right"></i> --></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Warning Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><svg class="svg-inline--fa fa-angle-right fa-w-8" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512" data-fa-i2svg=""><path fill="currentColor" d="M224.3 273l-136 136c-9.4 9.4-24.6 9.4-33.9 0l-22.6-22.6c-9.4-9.4-9.4-24.6 0-33.9l96.4-96.4-96.4-96.4c-9.4-9.4-9.4-24.6 0-33.9L54.3 103c9.4-9.4 24.6-9.4 33.9 0l136 136c9.5 9.4 9.5 24.6.1 34z"></path></svg><!-- <i class="fas fa-angle-right"></i> --></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Success Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><svg class="svg-inline--fa fa-angle-right fa-w-8" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512" data-fa-i2svg=""><path fill="currentColor" d="M224.3 273l-136 136c-9.4 9.4-24.6 9.4-33.9 0l-22.6-22.6c-9.4-9.4-9.4-24.6 0-33.9l96.4-96.4-96.4-96.4c-9.4-9.4-9.4-24.6 0-33.9L54.3 103c9.4-9.4 24.6-9.4 33.9 0l136 136c9.5 9.4 9.5 24.6.1 34z"></path></svg><!-- <i class="fas fa-angle-right"></i> --></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Danger Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><svg class="svg-inline--fa fa-angle-right fa-w-8" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="angle-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 256 512" data-fa-i2svg=""><path fill="currentColor" d="M224.3 273l-136 136c-9.4 9.4-24.6 9.4-33.9 0l-22.6-22.6c-9.4-9.4-9.4-24.6 0-33.9l96.4-96.4-96.4-96.4c-9.4-9.4-9.4-24.6 0-33.9L54.3 103c9.4-9.4 24.6-9.4 33.9 0l136 136c9.5 9.4 9.5 24.6.1 34z"></path></svg><!-- <i class="fas fa-angle-right"></i> --></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                                         <div class="card mb-4">
		    <div  class="card-header" >
                                <i class="icofont-table"></i>
                                <B >일일 현황</B>
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
                      
                               
                        
          
                       
                        <!--  
                        <div class="card mb-4">
                            <div class="card-header">
                               <i class="fas fa-chart-area mr-1"></i>
                               <B >일주일</B>
                            </div>
                            <div class="card-body"><div id="columnchart_material" style="width: 100%; height: 500px;"></div></div>
                            <div class="card-footer small text-muted">일주일간 확지자 추세</div>
                        </div>
                            -->

                        
                        
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
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
       
     
       
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
         <!-- 
         <script>
      // Set new default font family and font color to mimic Bootstrap's default styling
         Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
         Chart.defaults.global.defaultFontColor = '#292b2c';

         // Area Chart Example
         var ctx = document.getElementById("myAreaChart");
         var myLineChart = new Chart(ctx, {
           type: 'line',
           data: {
             labels: [
            	 
            	"<fmt:formatDate value="${days.d6}" pattern="MM/dd"/>", 
            	"<fmt:formatDate value="${days.d5}" pattern="MM/dd"/>", 
            	"<fmt:formatDate value="${days.d4}" pattern="MM/dd"/>", 
            	"<fmt:formatDate value="${days.d3}" pattern="MM/dd"/>", 
            	"<fmt:formatDate value="${days.d2}" pattern="MM/dd"/>", 
            	"<fmt:formatDate value="${days.d1}" pattern="MM/dd"/>", 
            	"<fmt:formatDate value="${days.d0}" pattern="MM/dd"/>" ],
             datasets: [{
               label: "확진자 수",
               lineTension: 0.3,
               backgroundColor: "rgba(2,117,216,0.2)",
               borderColor: "rgba(2,117,216,1)",
               pointRadius: 4,
               pointBackgroundColor: "rgba(2,117,216,1)",
               pointBorderColor: "rgba(255,255,255,0.8)",
               pointHoverRadius: 4,
               pointHoverBackgroundColor: "rgba(2,117,216,1)",
               pointHitRadius: 50,
               pointBorderWidth: 2,
               data: [
            	   <c:out value="${ctable.day6}" />, <c:out value="${ctable.day5}" />, <c:out value="${ctable.day4}" />,
             	  <c:out value="${ctable.day3}" />, <c:out value="${ctable.day2}" />, <c:out value="${ctable.day1}" />, <c:out value="${ctable.day0}" />],
             }],
           },
           options: {
             scales: {
               xAxes: [{
                 time: {
                   unit: 'date'
                 },
                 gridLines: {
                   display: false
                 },
                 ticks: {
                   maxTicksLimit: 10
                 }
               }],
               yAxes: [{
                 ticks: {
                   min: 0,
                   max: 150,
                   maxTicksLimit: 5
                 },
                 gridLines: {
                   color: "rgba(0, 0, 0, .125)",
                 }
               }],
             },
             legend: {
               display: false
             }
           }
         });
         </script>
          -->
           <script>
     // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#292b2c';
        function getMax(){
        	var a = new Array(<c:out value="${ctable.day6}" />, <c:out value="${ctable.day5}" />, <c:out value="${ctable.day4}" />,
          	  <c:out value="${ctable.day3}" />, <c:out value="${ctable.day2}" />, <c:out value="${ctable.day1}" />, <c:out value="${ctable.day0}" />);
            var n;
            for(var i=0; i<a.length; i++){
                if(i==0){
                    n=a[i];
                }else{
                    if(a[i]>n)n=a[i];
                }
            }
            return n;
        }
        

        // Bar Chart Example
        var ctx = document.getElementById("myBarChart");
        var myLineChart = new Chart(ctx, {
          type: 'bar',
          data: {
            labels: ["<fmt:formatDate value="${days.d6}" pattern="MM/dd"/>", 
            	"<fmt:formatDate value="${days.d5}" pattern="MM/dd"/>", 
            	"<fmt:formatDate value="${days.d4}" pattern="MM/dd"/>", 
            	"<fmt:formatDate value="${days.d3}" pattern="MM/dd"/>", 
            	"<fmt:formatDate value="${days.d2}" pattern="MM/dd"/>", 
            	"<fmt:formatDate value="${days.d1}" pattern="MM/dd"/>", 
            	"<fmt:formatDate value="${days.d0}" pattern="MM/dd"/>" ],
            datasets: [{
              label: "확진자 수",
              backgroundColor: "#1977cc",
              borderColor: "#3291e6",
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
                  max: getMax(),
                  maxTicksLimit: 10
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
         	    labels: ["서울.경기.인천","부산.울산","대구","광주","대전.세종", "강원", "충청","경상","전라","제주"],
         	    datasets: [{
         	      data: [<c:out value="${lc.seNow + lc.icNow + lc.kkNow}" />, <c:out value="${lc.psNow + lc.usNow}" />,
         	    	 <c:out value="${lc.tgNow}" />, <c:out value="${lc.kjNow}" />, 
         	    		<c:out value="${lc.tjNow + lc.sjNow}" />, 
         	    			<c:out value="${lc.kwNow}" />, <c:out value="${lc.cbNow + lc.cnNow}" />,
         	    				<c:out value="${lc.kbNow + lc.knNow}" />, <c:out value="${lc.jbNow + lc.jnNow}" />,
         	    					 <c:out value="${lc.jjNow}" />         	    		],
         	      backgroundColor: ['#1977cc','#FF8000', '#dc3545', '#ffc107', '#28a745', '#0B0B61','#8000FF','#FF00FF','#2E2E2E','#2E9AFE',
         	    	   "#2EFEF7" ],
         	    }],
         	  },
         	});
         </script>
         <!-- 
       <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
        	 ['날짜', '격리해제', '확진', '사망'],
             ['<fmt:formatDate value="${days.d6}" pattern="MM/dd"/>',  <c:out value="${t.r6}" />,      <c:out value="${t.c6}" />,		<c:out value="${t.d6}" />],
             ['<fmt:formatDate value="${days.d5}" pattern="MM/dd"/>',  <c:out value="${t.r5}" />,      <c:out value="${t.c5}" />,		<c:out value="${t.d5}" />],
             ['<fmt:formatDate value="${days.d4}" pattern="MM/dd"/>',  <c:out value="${t.r4}" />,      <c:out value="${t.c4}" />,		<c:out value="${t.d4}" />],
             ['<fmt:formatDate value="${days.d3}" pattern="MM/dd"/>',  <c:out value="${t.r3}" />,      <c:out value="${t.c3}" />,		<c:out value="${t.d3}" />],
             ['<fmt:formatDate value="${days.d2}" pattern="MM/dd"/>',  <c:out value="${t.r2}" />,      <c:out value="${t.c2}" />,		<c:out value="${t.d2}" />],
             ['<fmt:formatDate value="${days.d1}" pattern="MM/dd"/>',  <c:out value="${t.r1}" />,      <c:out value="${t.c1}" />,		<c:out value="${t.d1}" />],
             ['<fmt:formatDate value="${days.d0}" pattern="MM/dd"/>',  <c:out value="${t.r0}" />,      <c:out value="${t.c0}" />,		<c:out value="${t.d0}" />]
        ]);

        var options = {
          chart: {
            title: '일주일 현황',
            subtitle: '일주일간 일일 현황',
          }
        };

        var chart = new google.charts.Bar(document.getElementById('columnchart_material'));

        chart.draw(data, google.charts.Bar.convertOptions(options));
      }
    </script>
         -->
    </body>
</html>
