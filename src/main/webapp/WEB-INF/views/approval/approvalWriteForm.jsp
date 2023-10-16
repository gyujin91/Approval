 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
   
    <style>
        .content {
            width: 1200px;
            margin: auto;
        }
        .content h2 {
            text-align: center;
            font-weight: bold;
            margin: 50px 0;
        }
        .content .form_wrap {
            width: 800px;
            margin: auto;
            margin-bottom: 50px;
        }
        .form_wrap .mb-3 {
            margin: 30px 0;
        }
        .form_wrap .form-label {
            font-weight: bold;
            font-size: 25px;
        }
        .form_wrap textarea {
            height: 250px;
        }
        .input_group {
            text-align: center;
            margin: 50px 0 50px 0;
        }
        .input_group .btn {
            width: 100px;
            height: 50px;
        }

      
    </style>
</head>
<body>
	<div class="content">
		<c:if test="${empty dto }">
			<h2>게시판 등록</h2>
		</c:if>
		<c:if test="${!empty dto }">
			<h2>게시판 상세보기</h2>
		</c:if>
		<div class="form_wrap" id="form_wrap">
			<form id="frm">
				<table class="table table-bordered border-primary">
					<thead>
						<tr>
							<td>결재요청</td>
							<td>과장</td>
							<td>부장</td>
						</tr>
					</thead>
					<tbody>
						<tr id="trCheck">
							<td><input type="checkbox" class="form-check-input" id="chk1" name="chk1" disabled="disabled"></td>
							<td><input type="checkbox" class="form-check-input" id="chk2" name="chk2" disabled="disabled"></td>
							<td><input type="checkbox" class="form-check-input" id="chk3" name="chk3" disabled="disabled"></td>
						</tr>
					</tbody>
				</table>
				<!-- 게시판 등록 -->
				<c:if test="${empty dto }">
					<div class="mb-3">
						<label for="bno" class="form-label">번호</label>
						<input type="number" class=form-control id="bno" name="bno" value="${bnum }" readonly>
					</div>
					<div class="mb-3">
						<label for="userId" class="form-label">작성자</label>
						<input type="text" class="form-control" id="userId" name="userId" value="${sessionScope.loginMap.USERID }" readonly>
					</div>
				</c:if>
				<!-- 게시판 상세보기 -->
				<c:if test="${!empty dto }">
					<div class="mb-3">
						<label for="bno" class="form-label">번호</label>
						<input type="number" class=form-control id="bno" name="bno" value="${dto.bno }" readonly>
					</div>
					<div class="mb-3">
						<label for="userId" class="form-label">작성자</label>
						<input type="text" class="form-control" id="userId" name="userId" value="${dto.userId }" readonly>
					</div>
				</c:if>
					<div class="mb-3">
						<label for="title" class="form-label">제목</label>
						<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요." required="required" value="${dto.title }" >
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">내용</label>
						<textarea rows="3" class="form-control" id="content" name="content" placeholder="내용을 입력하세요." required="required">${dto.content }</textarea>
					</div>
					<input type="hidden" class=form-control id="sign_status" name="sign_status" readonly value="${dto.sign_status }">
					
					<div class="input_group">
					<c:choose>
						<c:when test="${sessionScope.loginMap.RANK == 'CC' || sessionScope.loginMap.RANK == 'DD'}">
							<input type="button" value="임시저장" class="btn btn-primary" id="tep">
							<input type="button" value="결재" class="btn btn-primary" id="end1">						
						</c:when>
						<c:otherwise>
							<input type="button" value="반려" class="btn btn-info" id="ret">
							<input type="button" value="결재" class="btn btn-info" id="end2">
						</c:otherwise>
					</c:choose>
					</div>
			</form>
		</div>
		<%-- <div class="history" style="margin-bottom: 200px">
			<form action="">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>번호</th>
							<th>글번호</th>
							<th>결재자</th>
							<th>결재일</th>
							<th>결재상태</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="">
								<tr>
									<td>히스토리가 없습니다.</td>
								</tr>
							</c:when>
						</c:choose>
						<c:otherwise>
							<c:forEach items="" var="">
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</tbody>
				</table>
			</form>				
		</div> --%>
	</div>
	
<script type="text/javascript">
	
	$(function() {
	
	var status = '${dto.sign_status}';
	var rank = '${sessionScope.loginMap.RANK}';
	var approver = '${sessionScope.loginMap.USERNAME }';
	// 결재 대기 상태 라면 title, content의 속성을 readonly true로 
	// 임시저장, 결재 버튼 hide
	// 상단의 trCheck의 chk1 속성 checked true
	if(status == 'wat') {	// 결재대기
		$("#title").attr("readonly", true);
		$("#content").attr("readonly", true);
		$("#tep").hide();
		$("#end1").hide();
		$("#trCheck #chk1").prop("checked", true);
	} else if(status == 'ing') {	// 결재진행중
		// 과장일 경우
		if(rank == 'BB') {
			$("#title").attr("readonly", true);
			$("#content").attr("readonly", true);
			$("#ret").hide();
			$("#end2").hide();
			$("#trCheck #chk1").prop("checked", true);
			$("#trCheck #chk2").prop("checked", true);
		} else if(rank == 'AA') {
			// 부장일 경우
			$("#title").attr("readonly", true);
			$("#content").attr("readonly", true);
			$("#trCheck #chk1").prop("checked", true);
			$("#trCheck #chk2").prop("checked", true);
		}
	} else if(status == 'end') { // 최종 결재 완료
		// 부장이 최종 결정 완료 했을 경우
		$("#title").attr("readonly", true);
		$("#content").attr("readonly", true);
		$("#ret").hide();
		$("#end2").hide();
		$("#trCheck input[type=checkbox]").prop("checked", true);
	} 
	
	// 사원, 대리 임시저장
	$("#tep").click(function() {
		if(status == '') {
			// 결재상태가 없다면 상태 값을 임시저장으로 변경 
			$("#sign_status").val('tep');
			$("#frm").attr("action", "approvalWrite.do").attr("method", "post").submit();
		} else {
			// 임시저장 상태에서 다시 임시저장 클릭 시
			$("#frm").attr("action", "approvalUpdate.do").attr("method", "post").submit();
		}
	})
	
	// 사원, 대리 결재요청
	$("#end1").click(function() {
		// 결재상태  '결재대기'
		$("#sign_status").val('wat');
		
		var dto = '${dto}';
		
		// dto가 비어 있지 않다면
		if(dto != "") {
			// 상세보기에서 결재 버튼 - 수정
			$("#frm").attr("action", "approvalUpdate.do").attr("method", "post").submit();
		} else {
			// 글쓰기에서 결재 버튼 - 등록
			$("#frm").attr("action", "approvalWrite.do").attr("method", "post").submit();
		} 
	})
	
		// 과장, 부장 결재 처리
		$("#end2").click(function() {
			// 과장일 경우
			if(rank == 'BB') {		  
				$("#approver").val('approver');	
				$("#sign_status").val('ing');
				$("#frm").attr("action", "approvalUpdate.do").attr("method", "post").submit();
			} else if(rank == 'AA') {
				// 부장일 경우
				$("#approver").val('approver');
				$("#sign_status").val('end');
				$("#frm").attr("action", "approvalUpdate.do").attr("method", "post").submit();
			}
		})
		
		// 과장, 부장 반려 처리
		$("#ret").click(function() {
			// 반려는 과장, 부장 똑같이 작동
			$("#title").attr("readonly", false);	// 제목 수정 가능하게
			$("#content").attr("readonly", false);	// 내용 수정 가능하게				
			$("#sign_status").val('ret');			// 결재상태 '반려'
			$("#frm").attr("action", "approvalUpdate.do").attr("method", "post").submit();
		})
	})
</script>
</body>
</html>