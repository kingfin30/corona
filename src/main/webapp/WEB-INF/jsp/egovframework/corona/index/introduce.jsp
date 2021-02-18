<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" id="top">

 <jsp:include page="header.jsp"/>





  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>자기소개</h2>
       
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->

    <section class="inner-page">
      <div class="container">
      
	<section id="about" class="about">
      	  <div class="container-fluid">
        	    <div class="row">
                  <div class="col-xl-5 col-lg-6  d-flex justify-content-center align-items-stretch">
                       <img src="/assets/img/profile3.jpg" rel="icon">
                  </div>

          <div class="col-xl-7 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5">
            <h2>임성묵 :</h2>
            <h3>HelloWorld!</h3>
            <p>2020년 8월 3일 부로 서울특별시 가산동에 위치한 (주)아사달에 입사했으며, <br/>
		현재 전자정부프레임워크를 활용한 개인 프로젝트를 진행중이다.
		Hello World! 라는 문구는 어느 프로그래밍을 배우든 가장 첫 시작을 <br/>
		나타내는 단어이며 첫 회사에서 새로운 시작을 나타내는 뜻을 내포하고있다.</p>

            <div class="icon-box">
              <div class="icon"><i class="bx bx-fingerprint"></i></div>
              <h4 class="title"><a href="https://www.suwon.go.kr/index.do" target="_blank">수원시 거주</a></h4>
              <p class="description">경기도 수원시에 거주중이며,<br/> 출신지는 서울 금천구 시흥동이다.</p>
            </div>

            <div class="icon-box">
              <div class="icon"><i class="bx bx-gift"></i></div>
              <h4 class="title"><a href="http://www.hongik.ac.kr/index.do" target="_blank">홍익대학교 재학중</a></h4>
              <p class="description">홍익대학교 컴퓨터정보통신공학에 재학중이며,<br/> 2021년 2월 졸업예정자이다.</p>
            </div>

            <div class="icon-box">
              <div class="icon"><i class="bx bx-atom"></i></div>
              <h4 class="title"><a href="http://www.asadal.com/" target="_blank">(주)아사달</a></h4>
              <p class="description">현재 시스템 사업부 시스템 개발팀에 재직중이다.</p>
            </div>

          </div>
        </div>

      </div>
    </section>




      </div>
    </section>

  </main><!-- End #main -->

 <jsp:include page="footer.jsp"/>



</body>

</html>