<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
     body {
     background-color: #F3EBF6;
     font-family: 'Ubuntu', sans-serif;
    }
    
    .main {
        background-color: #FFFFFF;
        width: 400px;
        height: 400px;
        margin: 7em auto;
        border-radius: 1.5em;
        box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
    }
    
    .sign {
        padding-top: 40px;
        color: #8C55AA;
        font-family: 'Ubuntu', sans-serif;
        font-weight: bold;
        font-size: 23px;
    }
    
    .un {
    width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
    form.form1 {
        padding-top: 40px;
    }
    
    .pass {
            width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: 'Ubuntu', sans-serif;
    }
    
   
    .un:focus, .pass:focus {
        border: 2px solid rgba(0, 0, 0, 0.18) !important;
        
    }
    
    .submit {
      cursor: pointer;
        border-radius: 5em;
        color: #fff;
        background: linear-gradient(to right, #9C27B0, #E040FB);
        border: 0;
        padding-left: 40px;
        padding-right: 40px;
        padding-bottom: 10px;
        padding-top: 10px;
        font-family: 'Ubuntu', sans-serif;
        margin-left: 35%;
        font-size: 13px;
        box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
    }
    
    .forgot {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #E1BEE7;
        padding-top: 15px;
    }
    
    a {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #E1BEE7;
        text-decoration: none
    }
    
    @media (max-width: 600px) {
        .main {
            border-radius: 0px;
        }
  </style>  
</head>
<body>
  
  <div class="main">
    <p class="sign" align="center">Sign in</p>
    <form class="form1"  id="fr" method="POST">
	      <input class="un " type="text"  name="userId" id="userId" align="center" placeholder="아이디" required>
	      <input class="pass" type="password" name="userPw" id="userPw" align="center" placeholder="패스워드" required>
	      <button class="submit" type="button" id="btn">로그인</button>
	      <p class="forgot" align="center"><a href="#">계정이 없는 경우 관리자에게 문의 바랍니다.</a></p> 
     </form>     
   </div>
   
   <script>
  	
   		
  		/* $("#btn").click(function() {
  			var userid = $("#userid").val();
  			var userpw = $("#userpw").val();
  			
  			if(userid == "") {
  				alert("아이디를 입력하세요.");
  				$("#userid").focus();
  				
  			} else if(userpw == "") {  				
  				alert("비밀번호를 입력하세요.");
  				$("#userpw").focus(); 				
  			} else {
  				$("#fr").attr("action", "member/loginCheck.do").submit();
  			}
  			
  		})
  		
 		$(function(){
  			var loginCheck = '${loginCheck}';
  			
  			if(loginCheck == 'useridFail') {
  				alert("등록 되어 있지 않는 아이디 입니다.");
  				$("#uesrid").focus();
  				
  			} else if(loginCheck == 'userpwFail') {
  				alert("비밀번호가 틀렸습니다.");
  				$("#userpw").focus();
  				
  			}  			 
  		}) */
  		
  		$(function(){

			$("#btn").click(function() {
  			var userId = $("#userId").val();
  			var userPw = $("#userPw").val();
  			
  			if(userId == "") {
  				alert("아이디를 입력하세요.");
  				$("#userId").focus();
  				
  			} else if(userPw == "") {  				
  				alert("비밀번호를 입력하세요.");
  				$("#userPw").focus();
  			} else {
  				$("#fr").attr("action", "member/loginCheck.do").submit();
  			}
  			
  		})
  			var loginCheck = '${loginCheck}';
  			
  			if(loginCheck == 'useridFail') {
  				alert("등록 되어 있지 않는 아이디 입니다.");
  				$("#userId").focus();
  				
  			} else if(loginCheck == 'userpwFail') {
  				alert("비밀번호가 틀렸습니다.");
  				$("#userPw").focus();
  				
  			}
  			
		
  		// enter 로그인 
		/* $("#userId #userPw").on("keydown", function(e){
			if (e.code == "Enter"){
				$("#btn").click();
			}
		}) */
 })
  	



  		
  </script>
</body>
</html>