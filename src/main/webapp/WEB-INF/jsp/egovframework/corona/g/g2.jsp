<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko" id="top">

 <jsp:include page="header.jsp"/>
  <style>
    .word-ending-container {
      display: flex;
      flex-direction: column;
      align-items: center;
    }
    .prev-word {
      font-style: italic;
    }
    .time-container {
      color: red;
    }
    .input-container {
    }
    #input-word {
    }
    body, body * { 
	 margin: 0px; padding: 0px; 
	

	 line-height: 1.7; 
} 

#formArea * { margin-bottom: 20px; } 
#formArea br { margin-bottom: 0px; } 
#formArea input.text { margin-right: 10px; width: 30px; text-align: center; } 

#tbodyArea td { padding: 2px 5px; text-align: center; } 

#check_Correct { margin-top: 10px } 
  </style>
  
  <script type="text/javascript">

// 만든이 : http://tonks.tistory.com/115 

var question = []; 
var count = 0; 

/*  ─────────────────────  메세지 설정  ─────────────────────  */ 

var notice = { 
		 notOne: "한 칸에 숫자를 하나씩 입력하세요.", // Enter each digit into each input field. 
		 notNumber: "숫자가 아닙니다.", 			 // It's not digit. 
		 repeated: "같은 숫자가 이미 있습니다. 다른 숫자를 입력하세요.", // No digits can be duplicated. 
		 correct: "정답입니다.", 				 // Congratulations. Your answer is correct. 
		 incorrect: "틀렸습니다. 새 게임을 진행하세요." // Your answer is incorrect. Start a new game. 
}; 


/*  ────────────────────  메세지 팝업창  ────────────────────  */ 

function alertWindow ( message ) { // "alert()" 대신에, 팝업창을 만듦

	 var text   = "<p>" + message + "</p><br />"; 
	      text += "<button onclick=' self.close() '> 창 닫기 </button>"; // Close button. 

	 var bodyStyle = "font-family: sans-serif; font-size: 12px; text-align: center;"; 

	 var winStyle = "width=300,height=100,resizable=0,status=0,toolbar=0,menubar=0,location=0,scrollbars=0"; 

	 var alertWin = window.open( "" , "_blank" , winStyle ); 
	      alertWin.document.body.innerHTML = text; 
	      alertWin.document.body.style.cssText = bodyStyle; 
} 


/*  ───────────────────   문제 출제용 함수   ───────────────────  */ 

function setQuestion ( lengths ) { 

	 var array = [ 8, 6, 1, 0, 4, 5, 6, 7, 8, 9 ]; 
	      array.sort(  function(){ return Math.random() * this.length }  ); 
	      
	 array.toString();

	 return array.slice( 0, lengths ); 
} 


/*  ─────────────────────  재시작용  ─────────────────────  */  

function reStarting () { count = 0; question = []; } 


/*  ───────────────────   게임 진행할 함수   ───────────────────  */ 

function playOneRound ( tagList ) { 

	 var lengths = tagList.length; 

	 if ( count == 0 ) { 
		 while ( question.length < lengths ) question = setQuestion( lengths ); 
	 } 


	 var guess = []; 
	 var bulls = cows = 0; 
	 var final; 

	 for ( var x = 0; x < lengths; x++ ){ guess[ x ] = tagList[ x ].value; }


	 var questionText = question.join().replace( /,/g , "" ); 
	 var guessText = guess.join().replace( /,/g , "" ); 

	 for ( var x = 0; x < lengths; x++ ) { 

		 var tag = tagList[ x ]; 
		 var value = tag.value.replace( / /g, "" ); 


		 var position = guessText.search( value ); 

		 if ( !value || value > 9 ) { 
			 tag.select(); 
			 return alertWindow( notice.notOne ); 
		 } 
		 else if (  isNaN( value )  ) { 
			 tag.select(); 
			 return alertWindow( notice.notNumber ); 
		 } 
		 else if (  position > -1  && position != x ) { 
			 tag.select(); 
			 return alertWindow( notice.repeated ); 
		 } 


		 position = questionText.search( value ); 

		 if ( position == x ){ bulls += 1; } 
		 else if ( position > -1 ){ cows += 1; }  
	 } 


	 if ( bulls < lengths && count == 8 ){ final = notice.incorrect; } 
	 else if ( bulls == lengths ){ final = notice.correct; } 

	 questionText = question.join( ", " ); 
	 guessText = guess.join( ", " ); 


	 var score = { 
		 count: count, 
		 bulls: bulls, 
		 cows: cows, 
		 question: questionText, 
		 guess: guessText, 
		 final: final 
	 }; 


	 if ( final ){ reStarting(); } 
	 else { count++; } 

	 return score; 
} 
</script>




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
                               
                                <B style="color:white">숫자야구 </B>
                            </div>	
                            <div class="card-body">
                            <div style="float: left;">
	 <p>0 ~ 9 중에서 숫자를 입력한 후, "결과 보기" 버튼을 누르세요. &nbsp; &nbsp;&nbsp;</p>

	 <!-- ──────────────── 입력 부분 ──────────────── --> 
	 <form id="formArea">
	 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 <input type="text" class="text" /><input type="text" class="text" />
		 <input type="text" class="text" /><input type="text" class="text" />
	 </form>

	 <button class="btn btn-primary" onclick="bullsAndCows()"> 결과 보기 </button>
	 <button class="btn btn-primary" onclick="reStarting(); deleteText()"> 새로 시작하기 </button>

	 <p id="check_Correct"></p>
</div>
<table style="float: left;width: 250px" border="1">
	 <thead><tr><th colspan="3"> &nbsp;SCORE </th></tr></thead>

	 <!-- ──────────────── 출력 부분 ──────────────── --> 
	 <tbody id="tbodyArea">
		 <tr><td> 1회 </td><td style="width: 60px;">&nbsp;</td><td style="width: 125px;">&nbsp;</td></tr>
		 <tr><td> 2회 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 3회 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 4회 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 5회 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 6회 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 7회 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 8회 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
		 <tr><td> 9회 </td><td>&nbsp;</td><td>&nbsp;</td></tr>
	 </tbody>

</table>
<p style="clear: both"><p>
                            
                
	
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
 <script type="text/javascript">

/*  ─────────────────────  관련 태그들  ─────────────────────  */ 

var formArea = document.getElementById( "formArea" ); 
var inputList = formArea.getElementsByTagName( "input" ); 

var tbodyArea = document.getElementById( "tbodyArea" ); 
var trList = tbodyArea.getElementsByTagName( "tr" ); 

var check_Correct = document.getElementById( "check_Correct" ); 


/*  ───────────────────   게임 실행 & 결과 출력  ──────────────────  */ 

function bullsAndCows () { 

	 var result = playOneRound( inputList ); 

	 if ( result == undefined ) return; 

	 var strikes = result.bulls; 
	 var balls = result.cows; 
	 var roundScore =  strikes + " 스트라이크 │ " + balls + " 볼"; 


	 var count = result.count; 
	 if ( count == 0 ){ deleteText(); } 

	 var question = result.question; 
	 var guess = result.guess; 

	 var tr = trList [ count ]; 

	 var td1 = tr.getElementsByTagName( "td" )[ 1 ]; 
	 var td2 = tr.getElementsByTagName( "td" )[ 2 ]; 

	 td1.innerHTML = guess; 
	 td2.innerHTML = roundScore; 


	 var text = ""; 
	 var final = result.final; 

	 if ( final ) { 
		 if ( strikes < inputList.length ){ text = final + "정답은 " + question + " 입니다."; } 
		 else { text = final; } 
	 } 

	 check_Correct.innerHTML = ""; 

	 formArea.reset(); 
	 inputList[0].focus(); 
} 


/*  ──────────────────  마우스 커서, 자동 이동  ──────────────────  */ 

function changeFocus ( tag , next , event ){ 

	 event = event || window.event; 

	 var keyCode = event.which || event.keyCode;

	 if ( keyCode == 8 || keyCode == 46 ){ return; } 

	 else if ( tag.value.length == 1 ){ inputList[ next ].select(); } 
} 

inputList[ 0 ].onkeyup = function( e ){ changeFocus ( this , 1 , e ) }; 
inputList[ 1 ].onkeyup = function( e ){ changeFocus ( this , 2 , e ) }; 

if ( inputList[ 3 ] != undefined ){ 
	 inputList[ 2 ].onkeyup = function( e ) { changeFocus( this , 3 , e ) }; 
} 


/*  ─────────────────────    리셋 효과   ─────────────────────  */ 

function deleteText () { 

	 inputList[0].focus(); 

	 for ( var x = 0; x < trList.length; x++ ) { 

		 var tr = trList [ x ]; 
		 var tdList = tr.getElementsByTagName( "td" ); 

		 tdList[ 1 ].innerHTML = "&nbsp;"; 
		 tdList[ 2 ].innerHTML = "&nbsp;"; 
	 } 
} 

</script>



</body>
 

</html>