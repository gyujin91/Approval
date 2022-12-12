<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path1" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 목록</title>
    <link rel="stylesheet" href="${path1 }/resources/css/css.css">
    <link rel="stylesheet" href="${path1 }/resources/css/normalize.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <style>
    	.boardList {
    		width: 1200px;
    		margin: auto;
			text-align: center; 
			margin-top : 100px;
    	}
    	.select {
            margin-left: 70px; 
        }
        .select > .searchTxt {
        	width: 150px;
        }
        .select > #search {
        	width: 80px;
            margin-left: 20px;
        }
        .table {
            width: 1400px;
            margin: auto;
            margin-top: 100px;
            table-layout: fixed;
        }
        .table > td {
        	width: 16%;
        }
        .btn_group {
            text-align: center;
            margin-top: 30px;
            margin-bottom: 50px;
        }
        .btn_group > a, button {
            width: 100px;
        }
        
        
    </style>
</head>
<body>
	<div class="boardList">
		<h2>게시판 목록</h2>
	</div>
	
		<div class="select">
			<form name="search_form" id="search_form" method="post" action="list.do">
				<input type = "hidden" name = "pageNo" id = "pageNo" value = "1">
				<input type = "hidden" name = "listSize" id = "listSize" value = "10">
				<select name="searchType" id="searchType">
					<option value="select" selected="selected">선택</option>
					<option value="mem_name">작성자</option>
					<option value="board_subject">제목</option>
					<option value="board_content">제목+내용</option>
				</select>
				<input type ="text" name ="searchTxt" id ="searchTxt" value="${map.searchTxt }">
				<input type="button" name="search" id="search" value="검색">
	        	<br><br>
				<input type="date" name="startDate" id="startDate" value="${map.startDate }"> ~ <input type="date" name="endDate" id="endDate" value="${map.endDate }">
			</form>
		</div> 
	
	<form name="frm" id="frm">
	    <table class="table table-striped table-hover">
	        <thead>
	            <tr>
	            	<th><input type="checkbox" value="check" id="chkAll" name="chkAll"></th>
	                <th>번호</th>
	                <th>제목</th>
	                <th>작성자</th>
	                <th>아이디</th>
	                <th>내용</th>
	                <th>작성일</th>
	                <th>수정일</th>
	                <th>조회수</th>
	                <th>사용여부</th>
	            </tr>
	        </thead>
	        <tbody>
	         <c:forEach items="${boardList }" var="board">          
	             <tr>
	             	<td><input type="checkbox" value="" id="chk" name="chk"></td>
	                 <td>${board.seq }</td>
	                 <td><a href="${path1 }/board/read.do?seq=${board.seq}">${board.board_subject }</a></td>
	                 <td>${board.mem_name }</td>
	                 <td>${board.mem_id }</td>
	                 <td>${board.board_content }</td>
	                 <td>${board.reg_date }</td>
	                 <td>${board.upt_date }</td>
	                 <td>${board.view_cnt }</td>
	                 <td>${board.useyn }</td>
	             </tr>                        
	         </c:forEach>
	       
	         <tr>
				<td colspan="10" style="text-align: center">
					<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
	                <c:if test="${pageMap.curBlock > 1}">
	                    <a href="javascript:list('1')" class="page">[처음]</a>
	                </c:if>
	                
	                <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
	                <c:if test="${pageMap.curBlock > 1}">
	                    <a href="javascript:list('${pageMap.prevPage}')" class="page">[이전]</a>
	                </c:if>
	                
	                <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
	                <c:forEach var="num" begin="${pageMap.blockBegin}" end="${pageMap.blockEnd}">
	                    <!-- **현재페이지이면 하이퍼링크 제거 -->
	                    <c:choose>
	                        <c:when test="${num == pageMap.curPage}">
	                            <span style="color: red">${num}</span>&nbsp;
	                        </c:when>
	                        <c:otherwise>
	                            <a href="javascript:list('${num}')" class="page">${num}</a>&nbsp;
	                        </c:otherwise>
	                    </c:choose>
	                </c:forEach>
	                
	                <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
	                <c:if test="${pageMap.curBlock <= pageMap.totBlock}">
	                    <a href="javascript:list('${pageMap.nextPage}')" class="page">[다음]</a>
	                </c:if>
	                
	                <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
	                <c:if test="${pageMap.curPage <= pageMap.totPage}">
	                    <a href="javascript:list('${pageMap.totPage}')" class="page">[끝]</a>
	                </c:if>
				</td>
			</tr>	
	        </tbody>
	               
	    </table>
	    <div class="btn_group">
	        <a href="${path1 }/board/writeForm.do" class="btn btn-primary">등록</a>
	        <button type="button" class="btn btn-primary" id="delBtn">삭제</button>
	    </div>
    </form>
    
  
 
    <script>
    
	    $("#search").click(function() {
			$("#search").attr("action", "list.do").attr("method", "post").submit();
		})
	
	    $("#search").click(function(){
			$.ajax({
				//	요청
				url : "listAjax.do",	// action
				// 데이터를 한번에 전달 하기 위해 직렬화(serialize)
				data : $("#search_form").serialize(),	// parameter, json{key:value}, map{key=value} 
				type : "post",	//	method
				
				// 응답
				success : function(result){
					
					$("#frm").html(result);
									
				},
				error : function(){				
					alert("전송 실패");
				}
			})
		})		
    
   
	   $(function(){
			$("#searchType").val('${map.searchType}');
		})
		
		function list(num){
			$("#pageNo").val(num);
			$("#search").click();
		}
	    
   
        $(function() {
            // 전체체크, 해제
            $("#chkAll").click(function() {
                if($("#chkAll").is(":checked")) {
                    $("input[name='chk']").prop("checked", true);
                } else {
                    $("input[name='chk']").prop("checked", false);
                }
            })

            $("input[name='chk']").click(function() {
                var total = $("input[name='chk']").length;
                var checked = $("input[name='chk']:checked").length

                if(total != checked) {
                    $("#chkAll").prop("checked", false);
                } else {
                    $("#chkAll").prop("checked", true);
                }
            })

            $("#delBtn").click(function() {
                    if($("input[name='chk']:checked").length == 0) {
                        alert("항목을 선택하세요.");
                    }

                    $("input[name='chk']:checked").parent().parent().remove();
                    $("#delBtn").is(":chked").parent().parent().remove();
                    
                    
            })
            
           
        })
    </script>
    
</body>
</html>