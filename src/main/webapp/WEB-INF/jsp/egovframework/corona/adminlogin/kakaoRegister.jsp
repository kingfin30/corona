<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" id="top">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Coronalab</title>
     
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <script>
        //54658ae6f100be178de5ca014b906ae6
        window.Kakao.init("54658ae6f100be178de5ca014b906ae6");
        
        function kakaoLogin() {
  
        	window.Kakao.Auth.login({
        		scope: 'account_email',
        		success: function(authObj){
        			console.log(authObj);
        			window.Kakao.API.request({
        				url:'/v2/user/me',
        				success: res =>  {
        					const kakao_account =res.account_email;
        					console.log(kakao_account);

        					
        				}
        			});
        		}
        	});
        }
        </script>
        
        <style>
        .carousel-item {
  height: 100vh;
  min-height: 350px;
  background: no-repeat center center scroll;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background:url("/assets/img/background.jpg");

}

.card-signin {
  border: 0;
  border-radius: 1rem;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin .card-body {
  padding: 2rem;
}

.form-signin {
  width: 100%;
}

.form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input {
  height: auto;
  border-radius: 2rem;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}



/* Fallback for Edge
-------------------------------------------------- */

@supports (-ms-ime-align: auto) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input::-ms-input-placeholder {
    color: #777;
  }
}

/* Fallback for IE
-------------------------------------------------- */

@media all and (-ms-high-contrast: none),
(-ms-high-contrast: active) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input:-ms-input-placeholder {
    color: #777;
  }
}
        </style>
            <script>var msg = '${msg}';
       		if(msg!=null && msg!=""){
    	  	 alert(msg);
    		}
       	</script>

    </head>

   
    <body  class="sb-nav-fixed">
     <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="/index.do"><img src="/resources/assets/img/logo2.png" alt="" width="220" height="40"> </a>
            
             <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <div class="input-group">
                    <div class="input-group-append"></div>
                </div>
            </form>

            <!-- Navbar Search-->
            <div class="collapse navbar-collapse" id="navbarResponsive">
        		 <ul class="navbar-nav ml-auto">
        		
	    
                <li class="nav-item dropdown active">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                       
                        <a class="dropdown-item" href="/index.do"><i class="fas fa-home"></i> &nbsp;사용자 홈</a>
                    </div>
                </li>
            </ul>
      		</div>
        </nav>
        <br /> <br /> <br /><br /><br/>   <br/> <br/> <br/><br/>
        <main> 
            <div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center">카카오 계정 등록</h5>
            <form name="form1" class="form-signin" method="post" action="/kakaoRegisterChk.do">
              <div class="form-label-group">
                <input type="text" name="adminId" id="adminId" class="form-control"  required autofocus>
                <label for="inputEmail">ID</label>
              </div>

              <div class="form-label-group">
                <input type="password" name="adminPassword" id="adminPassword" class="form-control"  required>
                 <input type="hidden" name="account" id="account" class="form-control" value="${vo.account}" >
                <label for="inputPassword">Password</label>
              </div>
 <button class="btn btn-lg btn-primary btn-block text-uppercase" style="background-color:#FFFF00;border-color:#FFFF00;color:#3B170B" type="submit">&nbsp;카카오 계정 등록</button>
          
              <br/>


              <!-- <a href="#"><small>비밀번호 찾기</small></a> -->
       
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
          
   </main>             

       
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        
    </body>
</html>
