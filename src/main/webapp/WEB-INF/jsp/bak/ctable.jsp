<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value='${toDay}' pattern='MM월 dd일' var="nowDate"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" id="top">




 <jsp:include page="header.jsp"/>

  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>코로나 현황</h2>
       
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
      

                       
                       
                        <div class="card mb-4">
		    <div  class="card-header" style="background-color:#1977cc">
                                <i style="color:white" class="icofont-table"></i>
                                <B style="color:white">일일 현황 (<fmt:formatDate value="${days.d0}" pattern="MM월 dd일"/>) </B>
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
		    <div class="card-header" style="background-color:#1977cc">
                                <i style="color:white" class="icofont-table"></i>
                                <B style="color:white">총 현황 (누적 및 현재 상황)</B>
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
		    <div class="card-header" style="background-color:#1977cc">
                                <i style="color:white" class="icofont-table"></i>
                               <B style="color:white">지역별 확진자</B>
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
                                    <div class="card-header" style="background-color:#1977cc">
                                        <i  class="icofont-pie-chart"></i>
                                        <B style="color:white">지역별 확진자 그래프</B>
                                    </div>
                                    <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted" >지역별 현재 확진자 </div>
                                  
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="card mb-4">
                                    <div class="card-header" style="background-color:#1977cc">
                                        <i  class="icofont-chart-bar-graph"></i>
                                        <B style="color:white">일주일 확진자 수</B>
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                                    <div class="card-footer small text-muted" >일주일간 일일 확진자 추세</div>
                                </div>
                            </div>
          
                          
                        </div>
                   




      </div>
    </section>

  </main><!-- End #main -->

 <jsp:include page="footer.jsp"/>


    <script>
     // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#292b2c';

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
                  max: 300,
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
         	    labels: ["서울.경기", "강원", "충북", "충남","경북","경남","전북","전남","제주"],
         	    datasets: [{
         	      data: [<c:out value="${ctable.iSeoul}" />, <c:out value="${ctable.iGangwon}" />, <c:out value="${ctable.iChungbuk}" />,
         	    	 <c:out value="${ctable.iChungnam}" />, <c:out value="${ctable.iGyungbuk}" />, <c:out value="${ctable.iGyungnam}" />, 
         	    		<c:out value="${ctable.iJunbuk}" />, <c:out value="${ctable.iJunnam}" />, <c:out value="${ctable.iJeju}" />],
         	      backgroundColor: ['#1977cc','#FF8000', '#dc3545', '#ffc107', '#28a745', '#0B0B61','#8000FF','#FF00FF','#2E2E2E'],
         	    }],
         	  },
         	});
         </script>



</body>

</html>