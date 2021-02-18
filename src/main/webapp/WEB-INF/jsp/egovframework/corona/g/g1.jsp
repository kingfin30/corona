<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" id="top">
 <style>
    	* { padding: 0; margin: 0; }
    	canvas { background: #eee; display: block; margin: 0 auto; }
    </style>
 <jsp:include page="header.jsp"/>




  <main id="main">

    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
    

    
      <div class="container">
     

        <div class="d-flex justify-content-between align-items-center">
          <h2>Games</h2>
        
        </div>

      </div>
    </section><!-- End Breadcrumbs Section -->
    
   
    
    
    

    <section class="inner-page">
  
 
       <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

      
   <jsp:include page="div.jsp"/>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">
      	 <div class="card mb-4">
		    <div  class="card-header" style="background-color:#1977cc">
                               
                                <B style="color:white">벽돌깨기 </B>
                            </div>	
                            <div class="card-body">
                            	
	<canvas id="myCanvas" width="600" height="400"></canvas>
	
                            </div>
		</div>
      




       </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
      
    </section>

  </main><!-- End #main -->

  

 <jsp:include page="footer.jsp"/>




</body>
   <script>
   var canvas = document.getElementById("myCanvas");
   var ctx = canvas.getContext("2d");
   var ballRadius = 10;
   var x = canvas.width/2;
   var y = canvas.height-30;
   var dx = 2;
   var dy = -2;
   var paddleHeight = 10;
   var paddleWidth = 75;
   var paddleX = (canvas.width-paddleWidth)/2;
   var rightPressed = false;
   var leftPressed = false;
   var brickRowCount = 8;
   var brickColumnCount = 6;
   var brickWidth = 60;
   var brickHeight = 20;
   var brickPadding = 10;
   var brickOffsetTop = 30;
   var brickOffsetLeft = 30;
   var score = 0;
   var lives = 3;

   var bricks = [];
   for(var c=0; c<brickColumnCount; c++) {
     bricks[c] = [];
     for(var r=0; r<brickRowCount; r++) {
       bricks[c][r] = { x: 0, y: 0, status: 1 };
     }
   }

   document.addEventListener("keydown", keyDownHandler, false);
   document.addEventListener("keyup", keyUpHandler, false);
   document.addEventListener("mousemove", mouseMoveHandler, false);

   function keyDownHandler(e) {
       if(e.key == "Right" || e.key == "ArrowRight") {
           rightPressed = true;
       }
       else if(e.key == "Left" || e.key == "ArrowLeft") {
           leftPressed = true;
       }
   }

   function keyUpHandler(e) {
       if(e.key == "Right" || e.key == "ArrowRight") {
           rightPressed = false;
       }
       else if(e.key == "Left" || e.key == "ArrowLeft") {
           leftPressed = false;
       }
   }

   function mouseMoveHandler(e) {
     var relativeX = e.clientX - canvas.offsetLeft;
     if(relativeX > 0 && relativeX < canvas.width) {
       paddleX = relativeX - paddleWidth/2;
     }
   }
   function collisionDetection() {
     for(var c=0; c<brickColumnCount; c++) {
       for(var r=0; r<brickRowCount; r++) {
         var b = bricks[c][r];
         if(b.status == 1) {
           if(x > b.x && x < b.x+brickWidth && y > b.y && y < b.y+brickHeight) {
             dy = -dy;
             b.status = 0;
             score++;
             if(score == brickRowCount*brickColumnCount) {
               alert("YOU WIN, CONGRATS!");
               document.location.reload();
             }
           }
         }
       }
     }
   }

   function drawBall() {
     ctx.beginPath();
     ctx.arc(x, y, ballRadius, 0, Math.PI*2);
     ctx.fillStyle = "#0095DD";
     ctx.fill();
     ctx.closePath();
   }
   function drawPaddle() {
     ctx.beginPath();
     ctx.rect(paddleX, canvas.height-paddleHeight, paddleWidth, paddleHeight);
     ctx.fillStyle = "#0095DD";
     ctx.fill();
     ctx.closePath();
   }
   function drawBricks() {
     for(var c=0; c<brickColumnCount; c++) {
       for(var r=0; r<brickRowCount; r++) {
         if(bricks[c][r].status == 1) {
           var brickX = (r*(brickWidth+brickPadding))+brickOffsetLeft;
           var brickY = (c*(brickHeight+brickPadding))+brickOffsetTop;
           bricks[c][r].x = brickX;
           bricks[c][r].y = brickY;
           ctx.beginPath();
           ctx.rect(brickX, brickY, brickWidth, brickHeight);
           ctx.fillStyle = "#0095DD";
           ctx.fill();
           ctx.closePath();
         }
       }
     }
   }
   function drawScore() {
     ctx.font = "16px Arial";
     ctx.fillStyle = "#0095DD";
     ctx.fillText("Score: "+score, 8, 20);
   }
   function drawLives() {
     ctx.font = "16px Arial";
     ctx.fillStyle = "#0095DD";
     ctx.fillText("Lives: "+lives, canvas.width-65, 20);
   }

   function draw() {
     ctx.clearRect(0, 0, canvas.width, canvas.height);
     drawBricks();
     drawBall();
     drawPaddle();
     drawScore();
     drawLives();
     collisionDetection();

     if(x + dx > canvas.width-ballRadius || x + dx < ballRadius) {
       dx = -dx;
     }
     if(y + dy < ballRadius) {
       dy = -dy;
     }
     else if(y + dy > canvas.height-ballRadius) {
       if(x > paddleX && x < paddleX + paddleWidth) {
         dy = -dy;
       }
       else {
         lives--;
         if(!lives) {
           alert("GAME OVER");
           document.location.reload();
         }
         else {
           x = canvas.width/2;
           y = canvas.height-30;
           dx = 3;
           dy = -3;
           paddleX = (canvas.width-paddleWidth)/2;
         }
       }
     }

     if(rightPressed && paddleX < canvas.width-paddleWidth) {
       paddleX += 7;
     }
     else if(leftPressed && paddleX > 0) {
       paddleX -= 7;
     }

     x += dx;
     y += dy;
     requestAnimationFrame(draw);
   }

   draw();
 </script>
</html>