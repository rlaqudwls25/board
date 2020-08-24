<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>List</title>
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
    /*.table th {*/
    /*    text-align:center;*/
    /*}*/
</style>

<script>
    function selChange() {
        var sel = document.getElementById('perPageNum').value;
        location.href="list?page=${pagination.page}&perPageNum="+sel;

    }
</script>
<body>
<h2>게시판</h2>

<p>조회수 : ${object.viewCnt}</p>

<div class="container">
    <table class="table table-hover">

            <th>No </th>
            <th>Subject</th>
            <th>Writer</th>
            <th>Date</th>
            <th>조회수</th>

        <c:forEach var ="e" items="${list}">
            <tr onclick="location.href='/detail/${e.bno}'">
                <td>${e.bno}</td>
                <td>${e.subject}</td>
                <td>${e.writer}</td>
                <td width="20%"><fmt:formatDate value="${e.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
                <td>${e.viewCnt}</td>

            </tr>
        </c:forEach>

    </table>
    <button class ="btn btn-primary" onclick="location.href='/insert'">글쓰기</button>
</div>
<div style="text-align: center">
<ul class="btn-group pagination" style="margin: 0 auto">
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
    </c:forEach>
    <c:if test="${pagination.next && pagination.endPage >0}">
        <li>
            <a href='<c:url value="/list?page=${pagination.endPage+1}"/>'>
                <i class="fa fa-chevron-right"></i></a>
        </li>
    </c:if>
</ul>
</div>
<%@ include file="bootstrap.jsp"%>
</body>
</html>


