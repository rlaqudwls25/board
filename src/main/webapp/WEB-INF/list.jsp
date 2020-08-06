<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Write</title>
</head>
<body>
<h2>게시글 목록</h2>
<button class ="btn btn-primary" onclick="location.href='/insert'">글쓰기</button>
<div class="container">
    <table class="table table-hover">
        <tr>
            <th>No</th>
            <th>Subject</th>
            <th>Writer</th>
            <th>Date</th>
        </tr>
        <jsp:useBean id="list" scope="request" type="java.util.List"/>
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
    <jsp:useBean id="pagination" scope="request" type="com.sun.xml.internal.bind.v2.runtime.unmarshaller.UnmarshallingContext.State"/>
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
                <i class="fa fa-chevron-right"></i>
            </a>
        </li>
    </c:if>
</ul>


<%@ include file="bootstrap.jsp"%>
</body>
</html>


