<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
	.content {
		width: 1200px;
		margin : auto;
		padding-top : 100px;
	}
	.top {
		float: right;
		margin-right : 165px;
		
	}
	.selectBox {
		margin-bottom : 50px;
	}
	
</style>
</head>
<body>
<!--	<p>${sessionScope.loginMap}</p>  -->
<div class="top">
	<p>${sessionScope.loginMap.USERNAME }(${sessionScope.loginMap.EMP_RANK  })님 환영합니다.</p>
	<a href="${path1 }/member/logOut.do">로그아웃</a>
</div>
<div class="content">
	<a href="${path1 }/member/writeForm.do" class="btn btn-primary">글쓰기</a>
	<!-- 직급이 부장, 과장일 경우 에만 대리결제 버튼 ON -->
	<c:if test="${
					sessionScope.loginMap.RANK == 'AA' ||
					sessionScope.loginMap.RANK == 'BB'
				 }">
		<button type="button" class="btn btn-primary">대리결제</button>
	</c:if>
	
	<div class="selectBox">
		<form name="search_form" id="search_form" action="approvalList.do" method="post">
			<select name="searchType" id="searchType">
				<option value="select" selected="selected">선택</option>
				<option value="userId">작성자</option>
				<option value="approver">결재자</option>
				<option value="content">제목+내용</option>
			</select>
			<select name="searchType2" id="searchType2">
				<option value="select" selected="selected">결재상태</option>
				<option value="tep" id="tep">임시저장</option>
				<option value="wat" id="wat">결재대기</option>
				<option value="ing" id="ing">결재중</option>
				<option value="end" id="end">결재완료</option>
				<option value="ret" id="ret">반려</option>
			</select>
			<input type="date" name="startDate" id="startDate" value="${map.startDate }"> ~ <input type="date" name="endDate" id="endDate" value="${map.endDate }">
			<input type="text" name="searchTxt" id="searchTxt" value="${map.searchTxt }" placeholder="검색어를 입력하세요.">
			<input type="button" name="search" id="search" value="검색" class="btn btn-info">
		</form>
	</div>
	
	
	<form id="frm" name="frm">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>등록일</th>
					<th>결재일</th>
					<th>수정일</th>
					<th>결재자</th>
					<th>결재상태</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>					
					<c:when test="${empty approvalList}">
						<tr>
							<td colspan="9" style="text-align: center">검색된 데이터가 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${approvalList }" var="list"> 
							<tr onclick="location.href='${path1 }/ member/approvalRead.do?bno=${list.bno }'">
								<td>${list.bno }</td>
								<td>${list.userId }</td>
								<td>${list.title }</td>
								<td>${list.content }</td>
								<td><fmt:formatDate value="${list.reg_date}" pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${list.sign_date}" pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${list.update_date}" pattern="yyyy-MM-dd" /></td>
								<td>${list.approver }</td>
								<c:if test="${list.sign_status == '임시저장' }"><td style="color: #D7DF01">${list.sign_status }</td></c:if>
								<c:if test="${list.sign_status == '결재대기' }"><td style="color: #000000">${list.sign_status }</td></c:if>
								<c:if test="${list.sign_status == '결재중' }"><td style="color: #0B610B">${list.sign_status }</td></c:if>
								<c:if test="${list.sign_status == '결재완료' }"><td style="color: #2E2EFE">${list.sign_status }</td></c:if>
								<c:if test="${list.sign_status == '반려' }"><td style="color: #FF0040">${list.sign_status }</td></c:if>
							</tr>
						</c:forEach> 
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</form>
</div>

<script type="text/javascript">
	var loginChk = '${loginMap}';
	
	if(loginChk == null || loginChk == "") {
		alert("로그인 해주시기 바랍니다."); 
		location.href = "home";
	}
	
	// 결재 상태에 따라 <td> 안의 데이터의 색상 변경
	var status = '${dto.sign_status}';
	
	if(status == 'tep') {
		$(".status").val().css("color", "red");
	}
	
	$(function() {
		$("#searchType").val('${map.searchType}');
		
		$("#search").click(function() {
			$("#search_form").attr("action", "approvalList.do").attr("method", "post").submit();
		})
		
			$("#search").click(function() {
				$.ajax({
					// 요청
					url : "searchAjax.do",	// action
					// 데이터를 한번에 전달 하기 위해 직렬화(serialize)
					data : $("#search_form").serialize(),	// parameter, json{key:value}, map{key=value} 
					type : "post",	// method
					// 응답
					success : function(result) {
						$("#frm").html(result);
					},
						
					error : function() {
						alert("전송 실패");
					}
				})
			})
		}) 
	
</script>

</body>
</html>