<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value='${toDay}' pattern='MM월 dd일' var="nowDate"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" id="top">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
          <script src="/resources/vendor/jquery/jquery.slim.min.js"></script>
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
              <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<style>
        .hover{ background-color:#fdf7df;}
        .graytd{background-color:#fcfcfc;}
</style>
<!--맵 초기화 -->
            <script>
            
            	$(document).ready(function(){
            		$('#map').hover(
            				function (){
            					$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
                        		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
                        		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
                        		
                        		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
                        		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
            					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
            					
                        		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
                        		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
                        		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
                        		
                        		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
                        		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
                        		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
                        		
                        		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
                        		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
                        		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
                        		
                        		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
                        		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
            					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
            					
                        		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
                        		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
            					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
            					
                        		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
                        		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
            					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
            					
                        		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
                        		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
            					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
            					
                        		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
                        		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
            					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
            					
                        		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
                        		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
            					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
            					
                        		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
                        		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
            					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
            					
                        		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
                        		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
            					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
            					
                        		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
                        		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
            					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
            					
                        		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
                        		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
            					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
            					
                        		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
                        		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
            					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
            					
                        		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
                        		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
                        		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            				
            				},
            				function (){
            					$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
                        		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
                        		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
                        		
                        		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
                        		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
            					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
            					
                        		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
                        		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
                        		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
                        		
                        		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
                        		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
                        		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
                        		
                        		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
                        		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
                        		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
                        		
                        		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
                        		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
            					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
            					
                        		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
                        		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
            					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
            					
                        		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
                        		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
            					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
            					
                        		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
                        		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
            					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
            					
                        		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
                        		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
            					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
            					
                        		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
                        		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
            					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
            					
                        		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
                        		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
            					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
            					
                        		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
                        		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
            					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
            					
                        		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
                        		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
            					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
            					
                        		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
                        		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
            					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
            					
                        		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
                        		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
            					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
            					
                        		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
                        		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
                        		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            				}
            				);
            		$('map').graytd(
            				function (){$('#seoul1').css("background-color", "#E0F8F1")}		
            		)
            	});
            </script>
                <script>
            	function push1(ele){
            	
            		location.href="/confirm/table.do?sortTable=1#sort";
            	}
            	function push2(ele){
            	
            		location.href="/confirm/table.do?sortTable=2#sort";
            	}
            	function push3(ele){
            
            		location.href="/confirm/table.do?sortTable=3#sort";
            	}
            </script>
           



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
                                <B style="color:white">코로나 현황 (<fmt:formatDate value="${days.d0}" pattern="MM월 dd일"/>) </B>
                            </div>	
                            <div class="card-body">
                            	<table style="text-align:center"  class="table table-bordered" border="2">
			<tr style="background-color:#E0F8F1">
				<th  colspan="3"><BIG>확진</BIG></th>
				<th colspan="2"><BIG>격리 해제</BIG></th>
				<th colspan="2"><BIG>사망</BIG></th>
			</tr>
			<tr  >
				<th  width="150px">오늘(<fmt:formatDate value="${days.d0}" pattern="MM월 dd일"/>)</th>
				<th >현재</th>
				<th >누적</th>
				<th  width="150px">오늘(<fmt:formatDate value="${days.d0}" pattern="MM월 dd일"/>)</th>
				<th>누적</th>
				<th width="150px">오늘(<fmt:formatDate value="${days.d0}" pattern="MM월 dd일"/>)</th>
				<th >누적</th>
			</tr>
			<tr><!-- 첫번째 줄 시작 -->
	   			  <td>${ctable.iConfirm}</td>
	    		  <td>${ctable.sumConfirm}</td>
	       		  <td>${pageMaker.totalCount}</td>
	       		  
	       		  
	       		   <td>${ctable.iRealese}</td>
	    		  <td>${ctable.sumRelease}</td>
	    		  
	    		  
	       		  <td>${ctable.iDead}</td>
	       		   <td>${ctable.sumDead}</td>
			</tr>
			</table>
	
                            </div>
		</div>
		
	
		<div class="card mb-4">
		    <div  class="card-header" style="background-color:#1977cc">
                                <i style="color:white" class="icofont-table"></i>
                                <B style="color:white">코로나 비율 (
                                <c:choose>
                                <c:when test="${subTable.sortTable == 1 }">
                                <fmt:formatDate value="${days.d0}" pattern="MM월 dd일"/>
                                </c:when>
                                <c:when test="${subTable.sortTable == 2}">
                               	 현재
                                </c:when>
                                <c:when test="${subTable.sortTable == 3}">
                               	 누적
                                </c:when>
                                </c:choose>
                                
                                ) </B>
                            </div>	
                            <div class="card-body">
                             <div class="card mb-4">
		<div class="card-header" id="sort" >
		<button <c:if test="${subTable.sortTable == 1}"> style="background-color:#81BEF7"</c:if> class="btn btn-primary"
		onclick="push1(this)" name="1">
		오늘	
		</button >
			<button  <c:if test="${subTable.sortTable == 2}"> style="background-color:#81BEF7"</c:if>
			
			class="btn btn-primary"
			onclick="push2(this)" name="2">
		현재
		</button>
			<button  <c:if test="${subTable.sortTable == 3}"> style="background-color:#81BEF7"</c:if>
			
			class="btn btn-primary"
			onclick="push3(this)" name="3">
		누적	
		</button>
		</div>
		</div>
		
		<c:choose>
		<c:when test="${subTable.sortTable == 1}">
                            	<div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                     
                                        남녀 비율
                                    </div>
                                    <div class="card-body">
                                    <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand"><div class=""></div>
                                    </div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                    
                                   <div id="donutchart" style="width: 450px; height: 500px;"></div>
                                   
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                                                         내.외국인 비율
                                    </div>
                                    <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                    <div id="donutchart1" style="width: 450px; height: 500px;"></div></div>
                                </div>
                            </div>
                        </div>
                        </c:when>
                        
                        <c:when test="${subTable.sortTable == 2}">
                            	<div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                     
                                        남녀 비율
                                    </div>
                                    <div class="card-body">
                                    <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand"><div class=""></div>
                                    </div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                    
                                   <div id="donutchart3" style="width: 450px; height: 500px;"></div>
                                   
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                                                         내.외국인 비율
                                    </div>
                                    <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                    <div id="donutchart2" style="width: 450px; height: 500px;"></div></div>
                                </div>
                            </div>
                        </div>
                        </c:when>
                        
                        <c:when test="${subTable.sortTable == 3}">
                            	<div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                     
                                        남녀 비율
                                    </div>
                                    <div class="card-body">
                                    <div class="chartjs-size-monitor">
                                    <div class="chartjs-size-monitor-expand"><div class=""></div>
                                    </div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                    
                                   <div id="donutchart5" style="width: 450px; height: 500px;"></div>
                                   
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                                                         내.외국인 비율
                                    </div>
                                    <div class="card-body"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                                    <div id="donutchart4" style="width: 450px; height: 500px;"></div></div>
                                </div>
                            </div>
                        </div>
                        </c:when>
                        </c:choose>
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
                                        <i style="color:white" class="fas fa-globe"></i>
                                        <B style="color:white">지역별 확진자</B>
                                    </div>
                                    <div class="card-body">
                                     <div>
                                    <span style="color:red">( )</span>안은 전일 대비 증가 수치입니다. 
                                    </div>
                                    <div id="map" name="map" style="position: relative; width:550px; height: 600px; border: 0px black solid; float:left" ></div>
                                      <div style="float:right">
                                       &nbsp;
                                    <table style="text-align:center; font-size:15px"  class="table table-bordered" border="2">
                                    <tr style="background-color:#E0F8F1">
                                    	<th>&nbsp;지역&nbsp;</th>
                                    	<th>&nbsp;현재&nbsp;</th>
                                    	<th>&nbsp;누적&nbsp;</th>
                                    </tr>
                                     <tr>
                                    	<td style="background-color:#E0F8F1" name="kyunggi1" id="kyunggi1">경기</td>
                                    	<td name="kyunggi2" id="kyunggi2"><c:out value='${lc.kkNow}' /> </td>
                                    	<td name="kyunggi3" id="kyunggi3"><c:out value='${lc.kkAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.kkToday}' />)</small></span></td>
                                    </tr>
                         
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="chungbuk1" id="chungbuk1">충북</td>
                                    	<td name="chungbuk2" id="chungbuk2"><c:out value='${lc.cbNow}' /> </td>
                                    	<td name="chungbuk3" id="chungbuk3"><c:out value='${lc.cbAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.cbToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="chungnam1" id="chungnam1">충남</td>
                                    	<td name="chungnam2" id="chungnam2"><c:out value='${lc.cnNow}' /> </td>
                                    	<td name="chungnam3" id="chungnam3"><c:out value='${lc.cnAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.cnToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="cunbuk1" id="cunbuk1">전북</td>
                                    	<td name="cunbuk2" id="cunbuk2"><c:out value='${lc.jbNow}' /> </td>
                                    	<td name="cunbuk3" id="cunbuk3"><c:out value='${lc.jbAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.jbToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="cunnam1" id="cunnam1">전남</td>
                                    	<td name="cunnam2" id="cunnam2"><c:out value='${lc.jnNow}' /> </td>
                                    	<td name="cunnam3" id="cunnam3"><c:out value='${lc.jnAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.jnToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="kyungbuk1" id="kyungbuk1">경북</td>
                                    	<td name="kyungbuk2" id="kyungbuk2"><c:out value='${lc.kbNow}' /> </td>
                                    	<td name="kyungbuk3" id="kyungbuk3"><c:out value='${lc.kbAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.kbToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="kyungnam1" id="kyungnam1">경남</td>
                                    	<td name="kyungnam2" id="kyungnam2"><c:out value='${lc.knNow}' /> </td>
                                    	<td name="kyungnam3" id="kyungnam3"><c:out value='${lc.knAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.knToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="kangwon1" id="kangwon1">강원</td>
                                    	<td name="kangwon2" id="kangwon2"><c:out value='${lc.kwNow}' /> </td>
                                    	<td name="kangwon3" id="kangwon3"><c:out value='${lc.kwAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.kwToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="Jeju1" id="Jeju1">제주</td>
                                    	<td name="Jeju2" id="Jeju2"><c:out value='${lc.jjNow}' /> </td>
                                    	<td name="Jeju3" id="Jeju3"><c:out value='${lc.jjAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.jjToday}' />)</small></span></td>
                                    </tr>
                               
                                    
                                    </table>
                                     &nbsp;
                                    
                                    </div>
                                    <div style="float:right">
                                     &nbsp;
                                    <table style="text-align:center; font-size:15px"  class="table table-bordered" border="2">
                                    <tr style="background-color:#E0F8F1">
                                    	<th>&nbsp;지역&nbsp;</th>
                                    	<th>&nbsp;현재&nbsp;</th>
                                    	<th>&nbsp;누적&nbsp;</th>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="seoul1" id="seoul1">서울</td>
                                    	<td name="seoul2" id="seoul2">${lc.seNow }</td>
                                    	<td name="seoul3" id="seoul3">${lc.seAcc }
                                    	<span><small style="color:red"> (▲<c:out value='${lc.seToday}' />)</small></span></td>
                                    </tr>
                                   
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="incheon1" id="incheon1">인천</td>
                                    	<td name="incheon2" id="incheon2"><c:out value='${lc.icNow}' /> </td>
                                    	<td name="incheon3" id="incheon3"><c:out value='${lc.icAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.icToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="pusan1" id="pusan1">부산</td>
                                    	<td name="pusan2" id="pusan2"><c:out value='${lc.psNow}' /> </td>
                                    	<td name="pusan3" id="pusan3"><c:out value='${lc.psAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.psToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="ulsan1" id="ulsan1">울산</td>
                                    	<td name="ulsan2" id="ulsan2"><c:out value='${lc.usNow}' /> </td>
                                    	<td name="ulsan3" id="ulsan3"><c:out value='${lc.usAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.usToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="taegu1" id="taegu1">대구</td>
                                    	<td name="taegu2" id="taegu2"><c:out value='${lc.tgNow}' /> </td>
                                    	<td name="taegu3" id="taegu3"><c:out value='${lc.tgAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.tgToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="kwangju1" id="kwangju1">광주</td>
                                    	<td name="kwangju2" id="kwangju2"><c:out value='${lc.kjNow}' /> </td>
                                    	<td name="kwangju3" id="kwangju3"><c:out value='${lc.kjAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.kjToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="taejun1" id="taejun1">대전</td>
                                    	<td name="taejun2" id="taejun2"><c:out value='${lc.tjNow}' /> </td>
                                    	<td name="taejun3" id="taejun3"><c:out value='${lc.tjAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.tjToday}' />)</small></span></td>
                                    </tr>
                                    <tr>
                                    	<td style="background-color:#E0F8F1" name="sejong1" id="sejong1">세종</td>
                                    	<td name="sejong2" id="sejong2"><c:out value='${lc.sjNow}' /> </td>
                                    	<td name="sejong3" id="sejong3"><c:out value='${lc.sjAcc}' />
                                    	<span><small style="color:red"> (▲<c:out value='${lc.sjToday}' />)</small></span></td>
                                    </tr>
                              
                               
                                    
                                    </table>
                                    &nbsp;
                                    
                                    </div>
                                    
                                    
                                    
                                    </div>
                                    <div class="card-footer small text-muted" >지역별 확진자 </div>
                                  
                                
                            </div>
                            <!--  
                                <div class="card mb-4">
                                    <div class="card-header" style="background-color:#1977cc">
                                        <i style="color:white" class="fa fa-area-chart"></i>
                                        <B style="color:white">일주일 현황</B>
                                    </div>
                                    <div class="card-body">
                                   
                                    &nbsp; <div id="columnchart_material" style="width: 100%; height: 500px;"></div> </div>
                                    <div class="card-footer small text-muted" >일주일간 일일 현황 추세</div>
                               
                                </div>
                            
          -->
                          
                     
                   




      </div>
    </section>

  </main><!-- End #main 

 <jsp:include page="footer.jsp"/>
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
<!--  
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
-->
         <!--  <script src="/assets/demo/chart-pie-demo.js"></script>
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
         	      data: [1, 1,1,
         	    	 1, 1, 1, 
         	    		1, 1, 1],
         	      backgroundColor: ['#1977cc','#FF8000', '#dc3545', '#ffc107', '#28a745', '#0B0B61','#8000FF','#FF00FF','#2E2E2E'],
         	    }],
         	  },
         	});
         </script>
         -->
         <script src="/resources/plugin/chart/datamap/d3.min.js"></script>
       
         
<script src="/resources/plugin/chart/datamap/topojson.js"></script>
<script src="/resources/plugin/chart/datamap/datamaps.kor.min.js"></script> 
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

<script>
jQuery(document).ready(function(){
    var basic = new Datamap({
        element : document.getElementById("map"),
        scope : 'kor',
        fills : {
            defaultFill : "#ABDDA4", 
            authorHasTraveledTo : "#fa0fa0",
        
            'colorTest' : '#C0C1C1',
         
            
            
            
        },
        setProjection : function(element) {
            var projection = d3.geo.equirectangular().center([ 0, 0 ])
                                 .rotate([ -128, -36 ])
                                 .scale(6000)
                                 .translate([ element.offsetWidth / 2, element.offsetHeight / 2 ]);
            var path = d3.geo.path().projection(projection);
            return {path : path, projection : projection};
        },
        geographyConfig : {
          
        	highlightBorderColor : '#1977cc',
            popupTemplate : function(geography, data) {
            	
            	if(data.sete == 1){
					$('#seoul1').css("background-color", "#81F7D8");$('#seoul2').css("background-color", "#CEF6F5");$('#seoul3').css("background-color", "#CEF6F5");
					$('#seoul1').css("font-weight", "900");$('#seoul2').css("font-weight", "900");$('#seoul3').css("font-weight", "900");
					$('#seoul1').css("font-size", "20px");$('#seoul2').css("font-size", "20px");$('#seoul3').css("font-size", "20px");
					
					$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
					$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
					$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
					$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
					$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
					$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
					$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
					$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
					$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
					$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
					$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
					$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
					$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
					$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
					$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
					$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
					$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
					$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
					$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
					$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
					$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
					$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
					$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
					$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
					$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
					$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
					$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
					$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
					$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
					$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
					$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
					
				}else if(data.sete == 2){
					$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
					$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
					$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
					
					$('#incheon1').css("background-color", "#81F7D8");$('#incheon2').css("background-color", "#CEF6F5");$('#incheon3').css("background-color", "#CEF6F5");
					$('#incheon1').css("font-weight", "900");$('#incheon2').css("font-weight", "900");$('#incheon3').css("font-weight", "900");
					$('#incheon1').css("font-size", "20px");$('#incheon2').css("font-size", "20px");$('#incheon3').css("font-size", "20px");
					
					$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
					$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
					$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
					$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
					$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
					$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
					$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
					$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
					$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
					$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
					$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
					$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
					$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
					$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
					$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
					$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
					$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
					$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
					$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
					$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
					$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
					$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
					$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
					$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
					$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
					$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
					$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
					$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
					$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 3){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
					$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
					$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
					$('#pusan1').css("background-color", "#81F7D8");$('#pusan2').css("background-color", "#CEF6F5");$('#pusan3').css("background-color", "#CEF6F5");
            		$('#pusan1').css("font-weight", "900");$('#pusan2').css("font-weight", "900");$('#pusan3').css("font-weight", "900");
            		$('#pusan1').css("font-size", "20px");$('#pusan2').css("font-size", "20px");$('#pusan3').css("font-size", "20px");
            		
					$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
					$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		 
					$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
					$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
					$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
					$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
					$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
					$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
					$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
					$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
					$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
					$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
					$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
					$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
					$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
					$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
					$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
					$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
					$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
					$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
					$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
					$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
					$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
					$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
					$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
					$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
					$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
					$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 4){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
					$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
					$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
					$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
					$('#ulsan1').css("background-color", "#81F7D8");$('#ulsan2').css("background-color", "#CEF6F5");$('#ulsan3').css("background-color", "#CEF6F5");
					$('#ulsan1').css("font-weight", "900");$('#ulsan2').css("font-weight", "900");$('#ulsan3').css("font-weight", "900");
            		$('#ulsan1').css("font-size", "20px");$('#ulsan2').css("font-size", "20px");$('#ulsan3').css("font-size", "20px");
            		
					$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
					$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
					$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
					$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
					$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
					$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
					$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
					$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
					$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
					$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
					$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
					$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
					$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
					$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
					$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
					$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
					$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
					$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
					$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
					$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
					$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
					$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
					$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
					$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
					$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
					$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 5){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#81F7D8");$('#taegu2').css("background-color", "#CEF6F5");$('#taegu3').css("background-color", "#CEF6F5");
            		$('#taegu1').css("font-weight", "900");$('#taegu2').css("font-weight", "900");$('#taegu3').css("font-weight", "900");
            		$('#taegu1').css("font-size", "20px");$('#taegu2').css("font-size", "20px");$('#taegu3').css("font-size", "20px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 6){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#81F7D8");$('#kwangju2').css("background-color", "#CEF6F5");$('#kwangju3').css("background-color", "#CEF6F5");
            		$('#kwangju1').css("font-weight", "900");$('#kwangju2').css("font-weight", "900");$('#kwangju3').css("font-weight", "900");
					$('#kwangju1').css("font-size", "20px");$('#kwangju2').css("font-size", "20px");$('#kwangju3').css("font-size", "20px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 7){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#81F7D8");$('#taejun2').css("background-color", "#CEF6F5");$('#taejun3').css("background-color", "#CEF6F5");
            		$('#taejun1').css("font-weight", "900");$('#taejun2').css("font-weight", "900");$('#taejun3').css("font-weight", "900");
					$('#taejun1').css("font-size", "20px");$('#taejun2').css("font-size", "20px");$('#taejun3').css("font-size", "20px");
					
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
					
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 8){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
            		$('#sejong1').css("background-color", "#81F7D8");$('#sejong2').css("background-color", "#CEF6F5");$('#sejong3').css("background-color", "#CEF6F5");
            		$('#sejong1').css("font-weight", "900");$('#sejong2').css("font-weight", "900");$('#sejong3').css("font-weight", "900");
					$('#sejong1').css("font-size", "20px");$('#sejong2').css("font-size", "20px");$('#sejong3').css("font-size", "20px");
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 9){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
            		$('#kyunggi1').css("background-color", "#81F7D8");$('#kyunggi2').css("background-color", "#CEF6F5");$('#kyunggi3').css("background-color", "#CEF6F5");
            		$('#kyunggi1').css("font-weight", "900");$('#kyunggi2').css("font-weight", "900");$('#kyunggi3').css("font-weight", "900");
					$('#kyunggi1').css("font-size", "20px");$('#kyunggi2').css("font-size", "20px");$('#kyunggi3').css("font-size", "20px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 10){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#81F7D8");$('#chungbuk2').css("background-color", "#CEF6F5");$('#chungbuk3').css("background-color", "#CEF6F5");
            		$('#chungbuk1').css("font-weight", "900");$('#chungbuk2').css("font-weight", "900");$('#chungbuk3').css("font-weight", "900");
					$('#chungbuk1').css("font-size", "20px");$('#chungbuk2').css("font-size", "20px");$('#chungbuk3').css("font-size", "20px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 11){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#81F7D8");$('#chungnam2').css("background-color", "#CEF6F5");$('#chungnam3').css("background-color", "#CEF6F5");
            		$('#chungnam1').css("font-weight", "900");$('#chungnam2').css("font-weight", "900");$('#chungnam3').css("font-weight", "900");
					$('#chungnam1').css("font-size", "20px");$('#chungnam2').css("font-size", "20px");$('#chungnam3').css("font-size", "20px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 12){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
            		
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#81F7D8");$('#cunbuk2').css("background-color", "#CEF6F5");$('#cunbuk3').css("background-color", "#CEF6F5");
            		$('#cunbuk1').css("font-weight", "900");$('#cunbuk2').css("font-weight", "900");$('#cunbuk3').css("font-weight", "900");
					$('#cunbuk1').css("font-size", "20px");$('#cunbuk2').css("font-size", "20px");$('#cunbuk3').css("font-size", "20px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 13){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#81F7D8");$('#cunnam2').css("background-color", "#CEF6F5");$('#cunnam3').css("background-color", "#CEF6F5");
            		$('#cunnam1').css("font-weight", "900");$('#cunnam2').css("font-weight", "900");$('#cunnam3').css("font-weight", "900");
					$('#cunnam1').css("font-size", "20px");$('#cunnam2').css("font-size", "20px");$('#cunnam3').css("font-size", "20px");
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff"); 
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 14){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");					
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
            		$('#kyungbuk1').css("background-color", "#81F7D8");$('#kyungbuk2').css("background-color", "#CEF6F5");$('#kyungbuk3').css("background-color", "#CEF6F5");
            		$('#kyungbuk1').css("font-weight", "900");$('#kyungbuk2').css("font-weight", "900");$('#kyungbuk3').css("font-weight", "900");
					$('#kyungbuk1').css("font-size", "20px");$('#kyungbuk2').css("font-size", "20px");$('#kyungbuk3').css("font-size", "20px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 15){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");      		
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#81F7D8");$('#kyungnam2').css("background-color", "#CEF6F5");$('#kyungnam3').css("background-color", "#CEF6F5");
            		$('#kyungnam1').css("font-weight", "900");$('#kyungnam2').css("font-weight", "900");$('#kyungnam3').css("font-weight", "900");
					$('#kyungnam1').css("font-size", "20px");$('#kyungnam2').css("font-size", "20px");$('#kyungnam3').css("font-size", "20px");
					
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 16){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400", "#fff");$('#chungbuk3').css("font-weight", "400", "#fff");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
            		$('#kangwon1').css("background-color", "#81F7D8");$('#kangwon2').css("background-color", "#CEF6F5");$('#kangwon3').css("background-color", "#CEF6F5");
            		$('#kangwon1').css("font-weight", "900");$('#kangwon2').css("font-weight", "900");$('#kangwon3').css("font-weight", "900");
					$('#kangwon1').css("font-size", "20px");$('#kangwon2').css("font-size", "20px");$('#kangwon3').css("font-size", "20px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}else if(data.sete == 17){
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");					
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#81F7D8");$('#Jeju2').css("background-color", "#CEF6F5");$('#Jeju3').css("background-color", "#CEF6F5");
            		$('#Jeju1').css("font-weight", "900");$('#Jeju2').css("font-weight", "900");$('#Jeju3').css("font-weight", "900");
            		$('#Jeju1').css("font-size", "20px");$('#Jeju2').css("font-size", "20px");$('#Jeju3').css("font-size", "20px");
            	}else{
            		$('#seoul1').css("background-color", "#E0F8F1");$('#seoul2').css("background-color", "#fff");$('#seoul3').css("background-color", "#fff");
            		$('#seoul1').css("font-weight", "400");$('#seoul2').css("font-weight", "400");$('#seoul3').css("font-weight", "400");
            		$('#seoul1').css("font-size", "15px");$('#seoul2').css("font-size", "15px");$('#seoul3').css("font-size", "15px");
            		
            		$('#incheon1').css("background-color", "#E0F8F1");$('#incheon2').css("background-color", "#fff");$('#incheon3').css("background-color", "#fff");
            		$('#incheon1').css("font-weight", "400");$('#incheon2').css("font-weight", "400");$('#incheon3').css("font-weight", "400");
					$('#incheon1').css("font-size", "15px");$('#incheon2').css("font-size", "15px");$('#incheon3').css("font-size", "15px");
					
            		$('#pusan1').css("background-color", "#E0F8F1");$('#pusan2').css("background-color", "#fff");$('#pusan3').css("background-color", "#fff");
            		$('#pusan1').css("font-weight", "400");$('#pusan2').css("font-weight", "400");$('#pusan3').css("font-weight", "400");
            		$('#pusan1').css("font-size", "15px");$('#pusan2').css("font-size", "15px");$('#pusan3').css("font-size", "15px");
            		
            		$('#ulsan1').css("background-color", "#E0F8F1");$('#ulsan2').css("background-color", "#fff");$('#ulsan3').css("background-color", "#fff");
            		$('#ulsan1').css("font-weight", "400");$('#ulsan2').css("font-weight", "400");$('#ulsan3').css("font-weight", "400");
            		$('#ulsan1').css("font-size", "15px");$('#ulsan2').css("font-size", "15px");$('#ulsan3').css("font-size", "15px");
            		
            		$('#taegu1').css("background-color", "#E0F8F1");$('#taegu2').css("background-color", "#fff");$('#taegu3').css("background-color", "#fff");
            		$('#taegu1').css("font-weight", "400");$('#taegu2').css("font-weight", "400");$('#taegu3').css("font-weight", "400");
            		$('#taegu1').css("font-size", "15px");$('#taegu2').css("font-size", "15px");$('#taegu3').css("font-size", "15px");
            		
            		$('#kwangju1').css("background-color", "#E0F8F1");$('#kwangju2').css("background-color", "#fff");$('#kwangju3').css("background-color", "#fff");
            		$('#kwangju1').css("font-weight", "400");$('#kwangju2').css("font-weight", "400");$('#kwangju3').css("font-weight", "400");
					$('#kwangju1').css("font-size", "15px");$('#kwangju2').css("font-size", "15px");$('#kwangju3').css("font-size", "15px");
					
            		$('#taejun1').css("background-color", "#E0F8F1");$('#taejun2').css("background-color", "#fff");$('#taejun3').css("background-color", "#fff");
            		$('#taejun1').css("font-weight", "400");$('#taejun2').css("font-weight", "400");$('#taejun3').css("font-weight", "400");
					$('#taejun1').css("font-size", "15px");$('#taejun2').css("font-size", "15px");$('#taejun3').css("font-size", "15px");
					
            		$('#sejong1').css("background-color", "#E0F8F1");$('#sejong2').css("background-color", "#fff");$('#sejong3').css("background-color", "#fff");
            		$('#sejong1').css("font-weight", "400");$('#sejong2').css("font-weight", "400");$('#sejong3').css("font-weight", "400");
					$('#sejong1').css("font-size", "15px");$('#sejong2').css("font-size", "15px");$('#sejong3').css("font-size", "15px");
					
            		$('#kyunggi1').css("background-color", "#E0F8F1");$('#kyunggi2').css("background-color", "#fff");$('#kyunggi3').css("background-color", "#fff");
            		$('#kyunggi1').css("font-weight", "400");$('#kyunggi2').css("font-weight", "400");$('#kyunggi3').css("font-weight", "400");
					$('#kyunggi1').css("font-size", "15px");$('#kyunggi2').css("font-size", "15px");$('#kyunggi3').css("font-size", "15px");
					
            		$('#chungbuk1').css("background-color", "#E0F8F1");$('#chungbuk2').css("background-color", "#fff");$('#chungbuk3').css("background-color", "#fff");
            		$('#chungbuk1').css("font-weight", "400");$('#chungbuk2').css("font-weight", "400");$('#chungbuk3').css("font-weight", "400");
					$('#chungbuk1').css("font-size", "15px");$('#chungbuk2').css("font-size", "15px");$('#chungbuk3').css("font-size", "15px");
					
            		$('#chungnam1').css("background-color", "#E0F8F1");$('#chungnam2').css("background-color", "#fff");$('#chungnam3').css("background-color", "#fff");
            		$('#chungnam1').css("font-weight", "400");$('#chungnam2').css("font-weight", "400");$('#chungnam3').css("font-weight", "400");
					$('#chungnam1').css("font-size", "15px");$('#chungnam2').css("font-size", "15px");$('#chungnam3').css("font-size", "15px");
					
            		$('#cunbuk1').css("background-color", "#E0F8F1");$('#cunbuk2').css("background-color", "#fff");$('#cunbuk3').css("background-color", "#fff");
            		$('#cunbuk1').css("font-weight", "400");$('#cunbuk2').css("font-weight", "400");$('#cunbuk3').css("font-weight", "400");
					$('#cunbuk1').css("font-size", "15px");$('#cunbuk2').css("font-size", "15px");$('#cunbuk3').css("font-size", "15px");
					
            		$('#cunnam1').css("background-color", "#E0F8F1");$('#cunnam2').css("background-color", "#fff");$('#cunnam3').css("background-color", "#fff");
            		$('#cunnam1').css("font-weight", "400");$('#cunnam2').css("font-weight", "400");$('#cunnam3').css("font-weight", "400");
					$('#cunnam1').css("font-size", "15px");$('#cunnam2').css("font-size", "15px");$('#cunnam3').css("font-size", "15px");
					
            		$('#kyungbuk1').css("background-color", "#E0F8F1");$('#kyungbuk2').css("background-color", "#fff");$('#kyungbuk3').css("background-color", "#fff");
            		$('#kyungbuk1').css("font-weight", "400");$('#kyungbuk2').css("font-weight", "400");$('#kyungbuk3').css("font-weight", "400");
					$('#kyungbuk1').css("font-size", "15px");$('#kyungbuk2').css("font-size", "15px");$('#kyungbuk3').css("font-size", "15px");
					
            		$('#kyungnam1').css("background-color", "#E0F8F1");$('#kyungnam2').css("background-color", "#fff");$('#kyungnam3').css("background-color", "#fff");
            		$('#kyungnam1').css("font-weight", "400");$('#kyungnam2').css("font-weight", "400");$('#kyungnam3').css("font-weight", "400");
					$('#kyungnam1').css("font-size", "15px");$('#kyungnam2').css("font-size", "15px");$('#kyungnam3').css("font-size", "15px");
					
            		$('#kangwon1').css("background-color", "#E0F8F1");$('#kangwon2').css("background-color", "#fff");$('#kangwon3').css("background-color", "#fff");
            		$('#kangwon1').css("font-weight", "400");$('#kangwon2').css("font-weight", "400");$('#kangwon3').css("font-weight", "400");
					$('#kangwon1').css("font-size", "15px");$('#kangwon2').css("font-size", "15px");$('#kangwon3').css("font-size", "15px");
					
            		$('#Jeju1').css("background-color", "#E0F8F1");$('#Jeju2').css("background-color", "#fff");$('#Jeju3').css("background-color", "#fff");
            		$('#Jeju1').css("font-weight", "400");$('#Jeju2').css("font-weight", "400");$('#Jeju3').css("font-weight", "400");
            		$('#Jeju1').css("font-size", "15px");$('#Jeju2').css("font-size", "15px");$('#Jeju3').css("font-size", "15px");
            	}
            	
            	
                return '<div ><table class="table table-bordered" border="1" style="text-align:center; background-color:white" name="tl" id="tl"><tr style="background-color:#1977cc; color:white"><th colspan="2">' 
                + geography.properties.name + '</th> <tr ><td>현재</td><td>누적</td><tr><td>'
                +data.hit+'</td><td>'+data.hitSum
                + '<span><small style="color:red"> (▲'+  data.hitToday+ ')</small></span></td></tr></table></div>'
            },
            highlightBorderWidth : 2
        },
        data : {
            "KR.SO" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.seNow}' /> , "hitSum" : <c:out value='${lc.seAcc}' /> , "hitToday" : <c:out value='${lc.seToday}' /> , "sete" : 1},		//서울
            "KR.IN" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.icNow}' />  , "hitSum" : <c:out value='${lc.icAcc}' />, "hitToday" : <c:out value='${lc.icToday}' /> , "sete" : 2},		//인천
            "KR.PU" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.psNow}' />  , "hitSum" : <c:out value='${lc.psAcc}' /> , "hitToday" : <c:out value='${lc.psToday}' /> , "sete" : 3},		//부산
            "KR.UL" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.usNow}' />  , "hitSum" : <c:out value='${lc.usAcc}' /> , "hitToday" : <c:out value='${lc.usToday}' /> , "sete" : 4},		//울산
            "KR.TG" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.tgNow}' />  , "hitSum" : <c:out value='${lc.tgAcc}' /> , "hitToday" : <c:out value='${lc.tgToday}' /> , "sete" : 5},		//대구
            "KR.KJ" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.kjNow}' />  , "hitSum" : <c:out value='${lc.kjAcc}' /> , "hitToday" : <c:out value='${lc.kjToday}' /> , "sete" : 6},		//광주
            "KR.TJ" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.tjNow}' />  , "hitSum" : <c:out value='${lc.tjAcc}' /> , "hitToday" : <c:out value='${lc.tjToday}' /> , "sete" : 7},		//대전
            "KR.SJ" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.sjNow}' />  , "hitSum" : <c:out value='${lc.sjAcc}' /> , "hitToday" : <c:out value='${lc.sjToday}' /> , "sete" : 8},		//세종
            "KR.KG" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.kkNow}' />  , "hitSum" : <c:out value='${lc.kkAcc}' /> , "hitToday" : <c:out value='${lc.kkToday}' /> , "sete" : 9},		//경기
            "KR.GB" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.cbNow}' />  , "hitSum" : <c:out value='${lc.cbAcc}' /> , "hitToday" : <c:out value='${lc.cbToday}' /> , "sete" : 10},		//충북   
            "KR.GN" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.cnNow}' />  , "hitSum" : <c:out value='${lc.cnAcc}' /> , "hitToday" : <c:out value='${lc.cnToday}' /> , "sete" : 11},		//충납            
            "KR.CB" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.jbNow}' /> , "hitSum" : <c:out value='${lc.jbAcc}' /> , "hitToday" : <c:out value='${lc.jbToday}' /> , "sete" : 12},		//전북
            "KR.CN" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.jnNow}' />  , "hitSum" : <c:out value='${lc.jnAcc}' /> , "hitToday" : <c:out value='${lc.jnToday}' /> , "sete" : 13},		//전남
            "KR.KB" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.kbNow}' />  , "hitSum" : <c:out value='${lc.kbAcc}' /> , "hitToday" : <c:out value='${lc.kbToday}' /> , "sete" : 14},		//경북
            "KR.KN" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.knNow}' />  , "hitSum" : <c:out value='${lc.knAcc}' /> , "hitToday" : <c:out value='${lc.knToday}' /> , "sete" : 15},		//경남
            "KR.KW" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.kwNow}' />  , "hitSum" : <c:out value='${lc.kwAcc}' /> , "hitToday" : <c:out value='${lc.kwToday}' /> , "sete" : 16},		//강원
            "KR.CJ" : {"fillKey" : "colorTest", "hit" : <c:out value='${lc.jjNow}' />  , "hitSum" : <c:out value='${lc.jjAcc}' /> , "hitToday" : <c:out value='${lc.jjToday}' /> , "sete" : 17}		//제주
            
            
            
            
            
            
            
            
            
           
            
            
            
        }
    });
	
	
});
</script>
  <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['남성(오늘)',     <c:out value="${boy_to}"/>],
          ['여성(오늘)',      <c:out value="${girl_to}"/>]
       
        ]);

        var options = {
       
          pieHole: 0.5,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['dummy1',0],
          ['dummy2',0],
          ['내국인(오늘)',     <c:out value="${nfor_to}"/>],
          ['외국인(오늘)',      <c:out value="${for_to}"/>]
       
        ]);

        var options = {
       
          pieHole: 0.5,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart1'));
        chart.draw(data, options);
      }
    </script>
        <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['dummy1',0],
          ['dummy2',0],
          ['내국인(현재)',     <c:out value="${nfor}"/>],
          ['외국인(현재)',      <c:out value="${fore}"/>],
       
        ]);

        var options = {
       
          pieHole: 0.5,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart2'));
        chart.draw(data, options);
      }
    </script>
      <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['남성(현재)',     <c:out value="${boy}"/>],
          ['여성(현재)',      <c:out value="${girl}"/>]
       
        ]);

        var options = {
       
          pieHole: 0.5,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart3'));
        chart.draw(data, options);
      }
    </script>
        <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['dummy1',0],
          ['dummy2',0],
          ['내국인(누적)',     <c:out value="${nfor_sum}"/>],
          ['외국인(누적)',      <c:out value="${for_sum}"/>]
       
        ]);

        var options = {
       
          pieHole: 0.5,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart4'));
        chart.draw(data, options);
      }
    </script>
      <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
        
          ['남성(누적)',     <c:out value="${boy_sum}"/>],
          ['여성(누적)',      <c:out value="${girl_sum}"/>]
       
        ]);

        var options = {
       
          pieHole: 0.5,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart5'));
        chart.draw(data, options);
      }
    </script>

         



</body>

</html>