<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Write</title>
</head>
<style>
    h2 {
        text-align: center;
    }
    table {
        width: 100%;

    }
    #outter{
        display: block;
        width: 100%;
        margin: auto;
    }
    a{
        text-decoration: blue;
    }
</style>

<script>
    function selChange() {
        var sel = document.getElementById('perPageNum').value;
        location.href="list?page=${pagination.page}&perPageNum="+sel;

    }
</script>
<body>
<h2>게시판</h2>
<div id="outter">
    <div style="float: right;">
        <select id="perPageNum" name="sel" onchange="selChange()">
            <option value="5"
                    <c:if test="${pagevo.perPageNum == 5}">selected</c:if>>5줄 보기</option>
        </select>

    </div>
</div>
<button class ="btn btn-primary" onclick="location.href='/insert'">글쓰기</button>
<div class="container">
    <table class="table table-hover">
        <tr>
            <th>No</th>
            <th>Subject</th>
            <th>Writer</th>
            <th>Date</th>
        </tr>
        <c:forEach var ="e" items="${list}">
            <tr onclick="location.href='/detail/${e.bno}'">
                <td>${e.bno}</td>
                <td>${e.subject}</td>
                <td>${e.writer}</td>
                <td>${e.regDate}</td>

            </tr>
        </c:forEach>
    </table>
</div>

<ul class="btn-group pagiantion">
    <c:if test="${pagination.prev}">
        <li>
            <a href="<c:url value="/list?page=${pagination.startPage-1}"/>">
                <i class="fa fa-chevron-left"></i>
            </a>
        </li>
    </c:if>
    <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="pageNum">
        <li>
            <a href='<c:url value="/list?page=${pageNum}"/>'><i class="fa">${pageNum}</i></a>
        </li>
        <c:choose>
            <c:when test="${pageNum == pagiantion.page}">
                <b>${pageNum }</b>
            </c:when>
            <c:when test="${pageNum == pagination.page}">
                <a href="list?page=${pageNum}&perPageNum=${pagination.perPageNum}">${pageNum}</a>
            </c:when>
        </c:choose>
    </c:forEach>
    <c:if test="${pagination.next && pagination.endPage >0}">
        <li>
            <a href='<c:url value="/list?page=${pagination.endPage+1}"/>'>
                <i class="fa fa-chevron-right"></i>
            </a>
        </li>
    </c:if>
</ul>


<%@ include file="bootstrap.jsp"%>
</body>
</html>

