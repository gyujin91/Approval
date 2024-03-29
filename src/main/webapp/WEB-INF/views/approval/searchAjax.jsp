<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/core" %> 

<c:choose>
	<c:when test="${empty approvalList }">
		<tr>
			<td  colspan = "9" style="text-align: center">검색된 데이터가 없습니다.</td>
		</tr>
	</c:when>
	<c:otherwise>
		<c:forEach items="${approvalList }" var="list">
			<tr onclick="location.href='${path1 }/ member/approvalRead.do?bno=${list.bno }'">
				<td>${list.bno }</td>
				<td>${list.userId }</td>
				<td>${list.title }</td>
				<td>${list.content }</td>
				<td>${list.reg_date }</td>
				<td>${list.sign_date }</td>
				<td>${list.update_date }</td>
				<td>${list.approver }</td>
				<c:if test="${list.sign_status == '임시저장' }"><td style="color: #D7DF01">${list.sign_status }</td></c:if>
				<c:if test="${list.sign_status == '결재대기' }"><td style="color: #000000">${list.sign_status }</td></c:if>
				<c:if test="${list.sign_status == '결재중' }"><td style="color: #00BFFF">${list.sign_status }</td></c:if>
				<c:if test="${list.sign_status == '결재완료' }"><td style="color: #2E2EFE">${list.sign_status }</td></c:if>
				<c:if test="${list.sign_status == '반려' }"><td style="color: #FF0000">${list.sign_status }</td></c:if>
			</tr>
		</c:forEach>
		</c:otherwise>	
	</c:choose>
	
	<tr>
		<td colspan="10" style="text-align: center">
			<!-- **처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
               <c:if test="${pageMap.curBlock > 1}">
                   <a href="javascript:list('1')">[처음]</a>
               </c:if>
               
               <!-- **이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
               <c:if test="${pageMap.curBlock > 1}">
                   <a href="javascript:list('${pageMap.prevPage}')">[이전]</a>
               </c:if>
               
               <!-- **하나의 블럭에서 반복문 수행 시작페이지부터 끝페이지까지 -->
               <c:forEach var="num" begin="${pageMap.blockBegin}" end="${pageMap.blockEnd}">
                   <!-- **현재페이지이면 하이퍼링크 제거 -->
                   <c:choose>
                       <c:when test="${num == pageMap.curPage}">
                           <span style="color: red">${num}</span>&nbsp;
                       </c:when>
                       <c:otherwise>
                           <a href="javascript:list('${num}')">${num}</a>&nbsp;
                       </c:otherwise>
                   </c:choose>
               </c:forEach>
               
               <!-- **다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
               <c:if test="${pageMap.curBlock <= pageMap.totBlock}">
                   <a href="javascript:list('${pageMap.nextPage}')">[다음]</a>
               </c:if>
               
               <!-- **끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
               <c:if test="${pageMap.curPage <= pageMap.totPage}">
                   <a href="javascript:list('${pageMap.totPage}')">[끝]</a>
               </c:if>
		</td>
	</tr>
