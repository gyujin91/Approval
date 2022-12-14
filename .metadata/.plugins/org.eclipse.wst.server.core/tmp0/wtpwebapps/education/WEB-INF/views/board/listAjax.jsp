<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	        </tbody>
</table>