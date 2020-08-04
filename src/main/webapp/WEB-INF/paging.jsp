<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div>
    <c:if test="${pagination.curRange ne 1}">
        <a href="#" onclick="fn_paging(1)">[처음]</a>
    </c:if>
    <c:if test="${pagination.curPage ne 1}">
        <a href="#" onclick="fn_paging('${pagination.prevPage}")>[이전]</a>
    </c:if>
    <c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage}">
        <c:choose>
            <c:when test="${pageNum eq pagination.curPage}">
                <span style="font-weight: bold;"><a href="#" onclick="fn_paging('${pageNum}')">${pageNum}</a> </span>
            </c:when>
            <c:otherwise>
                <a href="#" onClick="fn_paging('${pageNum}')">${pageNum}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
        <a href="#" onClick="fn_paging('${pagination.nextPage }')">[다음]</a>
    </c:if>
    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
        <a href="#" onClick="fn_paging('${pagination.pageCnt }')">[끝]</a>
    </c:if>
</div>

<div>
    총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
</div>
