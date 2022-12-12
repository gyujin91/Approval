<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

</head>
<body>
	<form>
		<table width="1400" height="650">
			<tr>
				<td width="100%" height="10%">회원가입</td>
			</tr>
			<tr>
				<td height="60%" align="center" valign="top">
					<hr> <br>
					<p align="left" style="padding-left: 160px">
						<br> <br> 
						ID : <input type="text" size="10" maxlength="15" name="id" id="id"> 
							<input type="button" name="idChk" value="중복체크" id="idChk"> <br> <br>
						비밀번호 : <input type="password" size="15" maxlength="20" name="pass" id="pw1"><br> <br>
					         비밀번호 확인 : <input type="password" size="15" maxlength="20" name="pass2" id="pw2"><br><br>
					         이름 : <input type="text" size="13" name="name" id="name"><br> <br>
					         이메일 : <input type="text" size="15" name="email1" id="email1">@<input type="text" size="15" name="email2" id="email2"><br>
						<br> 휴대폰 : <select name="tel1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="019">019</option>
						</select> - <input type="text" name="tel2" size="5" maxlength="4" id="ph2">
						- <input type="text" name="tel3" size="5" maxlength="4" id="ph3"><br>
						<br> 성별 : <input type="radio" name="gender" value="남자">
						남자&nbsp;&nbsp; <input type="radio" name="gender" value="여자">
						여자<br> <br> 주민번호 : <input type="text" name="jumin1"
							id="jumin1"> - <input type="password" name="jumin2"
							id="jumin2"><br> <br> 주소 : <input type="text"
							name="address" size="15" maxlength="15"><br> *주소는
						(시/도)만 입력해주세요 (예: 경기도, 서울특별시, 경상남도 등)
					</p>
				</td>
			</tr>
			<tr>
				<td align="center">
					<hr> <br> <input type="button" id="regi_btn" value="가입신청">&nbsp;
					<input type="reset" value="다시입력">&nbsp; <input
					type="button" value="취소">
				</td>
			</tr>
		</table>
	</form>


	<script>
    $(function () {
    	
    	// 아이디 중복 체크
        $("#idChk").click(function() {
            var id = $("#id").val();

            var engNum = /^[a-zA-Z0-9]*$/;

            if(id == '') {

            } else if(!engNum.test(id)) {
                alert("아이디는 영어, 숫자 조합만 가능합니다");
                $("#id").val("");
                $("#id").focus();
            } else if(id == 'test') {
                alert("이 아이디는 사용 불가능한 아이디 입니다.");
                $("#id").val("");
                $("#id").focus();
            } else {
                alert("사용 가능한 아이디");
                // 활성화,비활성화 - disabled
                $("#id").prop("disabled", true);
            }
        })
        
 		// 비밀번호 확인
 		$("#regi_btn").click(function() {
 			var pw1 = $("#pw1").val();
 	    	var pw2 = $("#pw2").val();
 	    	
 	    	if(pw1 != pw2) {
 	    		alert("비밀번호가 일치 하지 않습니다.");
 	    		return false;
 	    	} else {
 	    		("비밀번호가 일치 합니다.");
 	    		return true;
 	    	}
 		})
 		

 		// 이름 5글자 이하만 사용가능
        $("#name").keyup(function() {
        	
        	if($("#name").val().length > 5) {
        		alert("이름은 5글자 이하만 사용 가능");
        		$("#name").val( $("#name").val().slice(0, 5) );
        	}
        })
        
        // 이메일 유효성 검사
        $("#regi_btn").click(function() {
        	var regEmail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        	var email = $("#email1").val() + "@" + $("#email2").val();
        	
        	if(!regEmail.test(email)) {
        		alert("이메일 형식이 올바르지 않습니다.");
        		$("#email2").focus();
        		return false;       		
        	} 
    
        })
        
        // 핸드폰 2번째창에서 3번째 창으로 자동 커서 이동
        $("#tel2").keyup(function() {
        	if( ("#tel2").val().length >  4 ) {
        		$("#tel3").focus();
        	}
        })
    })
	</script>


</body>
</html>
