<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/core" %> 

<c:choose>
	<c:when test="${empty approvalList }">
		<tr>
			<td  colspan = "7" style="text-align: center">검색된 데이터가 없습니다.</td>
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
