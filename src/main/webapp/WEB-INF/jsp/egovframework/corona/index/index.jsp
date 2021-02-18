<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" id="top">


        <script>var submsg = '${submsg}';
       		if(submsg!=null && submsg!=""){
    	  	 alert(submsg);
    		}
       	</script>
       	   <script>
    		function subscribeCheck(){
          		if(document.myform.cname.value ==""){
          			alert("이름을 입력해주세요.");
          			
          			document.myform.cname.focus();
          			return false;
          		}
          	
          		if(document.myform.cbirth.value == ""){
          			alert("생년월일을 입력해주세요.");
          			document.myform.cbirth.focus();
          			return false;
          		}
          		if(document.myform.cbirth.value.length != 6){
          			alert("생년월일 6자리를 확인해주세요.");
          			document.myform.cbirth.focus();
          			return false;
          		}
        		if(document.myform.mailaddress.value == ""){
          			alert("메일 입력해주세요.");
          			document.myform.mailaddress.focus();
          			return false;
          		}
        		var mailPattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

          		if(!mailPattern.test(document.myform.mailaddress.value)){
          			alert("이메일 양식을 입력해주세요.");
          			return false;
          		}
          		
        	
      
          		
          	
          	
          		return true;

          	}
    		 function onMail(ele){
    	        
    	        
    		      
    		  		ele.value = ele.value.replace(" ", "");       
    		  	
    		  		
    	          }
          </script>
      


 <jsp:include page="header.jsp"/>


  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container">
      <h1>Welcome to Coronalab</h1>
      <h2>코로나 확진자 수 조회</h2>
      <a href="#appointment" class="btn-get-started scrollto"><BIG>구독하기</BIG><i class="bx bx-chevron-right"></i></a>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    <!-- ======= Why Us Section ======= -->
    <section id="why-us" class="why-us">
      <div class="container">

        <div class="row">
          <div class="col-lg-4 d-flex align-items-stretch">
            <div class="content">
              <h3>코로나랩이란?</h3>
              <p>
                현재 전세계적으로 대유행하고 있는 코로나 확진자를 관리하며 확진자에 대한 정보에 대한 입력을 즉시 반영하여 페이지에서 확인할 수 있습니다. #STAYATHOME
              </p>
              <div class="text-center">
                <a href="#" class="more-btn">Learn More <i class="bx bx-chevron-right"></i></a>
              </div>
            </div>
          </div>
          <div class="col-lg-8 d-flex align-items-stretch">
            <div class="icon-boxes d-flex flex-column justify-content-center">
              <div class="row">
                <div class="col-xl-4 d-flex align-items-stretch">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class="bx bx-receipt"></i>
                    <h4>일일 코로나 현황</h4>
                    <p>국내서 발생한 하루 동안 코로나 확진자, 격리해제 인원 및 사망자 정보를 확인할 수 있습니다.</p>
                  </div>
                </div>
                <div class="col-xl-4 d-flex align-items-stretch">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class="bx bx-cube-alt"></i>
                    <h4>지역 코로나 현황</h4>
                    <p>국내 코로나 확진 인원에 대해 지역별로는 얼마나 있는지 확인한 후 비율을 확인할 수 있습니다.</p>
                  </div>
                </div>
                <div class="col-xl-4 d-flex align-items-stretch">
                  <div class="icon-box mt-4 mt-xl-0">
                    <i class="bx bx-images"></i>
                    <h4>일주일 확진자 수</h4>
                    <p>일주일 동안 확진자 수가 어떻게 변하는지에 대한 정보를 시각적 데이터로 나타냅니다.</p>
                  </div>
                </div>
              </div>
            </div><!-- End .content-->
          </div>
        </div>

      </div>
    </section><!-- End Why Us Section -->


    <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts">
      <div class="container">

        <div class="row">

          <div class="col-lg-3 col-md-6">
            <div class="count-box">
              <i class="icofont-doctor-alt"></i>
              <span data-toggle="counter-up">${table.iConfirm}</span>
              <p>일일 확진자 수</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mt-5 mt-md-0">
            <div class="count-box">
              <i class="icofont-laboratory"></i>
              <span data-toggle="counter-up">${table.iRealese}</span>
              <p>일일 격리해제 수</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
            <div class="count-box">
              <i class="icofont-patient-bed"></i>
              <span data-toggle="counter-up">${table.iDead}</span>
              <p>일일 사망자 수</p>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
            <div class="count-box">
              <i class="icofont-doctor-alt"></i>
              <span data-toggle="counter-up">${table.sumConfirm}</span>
              <p>총 확진자 수</p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Counts Section -->
    
     <!-- ======= Appointment Section ======= -->
    <section id="appointment" class="appointment section-bg">
      <div class="container">

        <div class="section-title">
          <h2>이메일 구독 신청</h2>
          <p>이메일 구독을 신청하면 매일 갱신되는 코로나 확진자 수 정보나 기타 정보를 매일 메일로 받아보실 수 있습니다.</p>
        </div>

        <form action="/insertMail.do" method="post" name="myform" role="form">
          <div class="form-row">
            <div class="col-md-4 form-group">
              <input type="text" name="cname" class="form-control" oninput="onMail(this)" id="cname" placeholder="이름" >
            	<span style="color:red"></span> 
            </div>
             <div class="col-md-4 form-group">
              <input type="text" class="form-control" name="cbirth" id="cbirth" maxlength="6" oninput="onMail(this)" placeholder="생년월일 6자리" >
              
            </div>
            <div class="col-md-4 form-group">
              <input type="text" class="form-control" name="mailaddress" id="mailaddress" oninput="onMail(this)" placeholder="이메일">
              
            </div>
        
          </div>
           

        
          <div class="mb-3">
           
          </div>
          <div class="text-center"><button type="submit" class="appointment-btn scrollto"  style="border-color:#1977cc"  name="sub_btn"
          onclick="return subscribeCheck()"><BIG>구독하기</BIG></button></div>
        </form>

      </div>
    </section><!-- End Appointment Section -->





  </main><!-- End #main -->

 <jsp:include page="footer.jsp"/>


</body>

</html>