<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<header>
    <div class="header">
        <div class="header_wrap">      	
            <div class="link_box">
            <!-- 로그인 후 -->
            <c:if test="${!empty sid }">
            	<span style="font-weight: bold; font-size: 1.3em; margin-right: 15px">${sid }님 환영합니다.</span>             
                <a href="${path }/member/logout.do">로그아웃</a>
                <a href="${path }/member/mypage.do">마이페이지</a>
            </c:if>
            <!-- 로그인 전 -->
            <c:if test="${empty sid }">
            	<a href="${path }/member/loginForm.do">로그인</a>                        
                <a href="${path }/member/joinForm.do">회원가입</a>
                <a href="${path }/board/list.do">게시판</a>
            </c:if>
            </div>       
        </div>   
    </div>
</header>