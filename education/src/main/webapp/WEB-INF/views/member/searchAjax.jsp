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
			<tr onclick="location.href='${path1}/member/approvalRead.do?bno=${list.bno }'">
				<td>${list.bno }</td>
				<td id="td">${list.userid }</td>
				<td>${list.title }</td>
				<td>${list.reg_date }</td>
				<td>${list.sign_date }</td>
				<td>${list.approver }</td>
				<td>${list.sign_status }</td>
			</tr>
		</c:forEach>
		</c:otherwise>
	</c:choose>
