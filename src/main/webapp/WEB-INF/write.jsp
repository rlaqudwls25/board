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
        <jsp:useBean id="write" scope="request" type="java.util.List"/>
        <c:forEach var ="e" items="${write}">
            <tr onclick="location.href='/detail/${e.bno}'">
                <td>${e.bno}</td>
                <td>${e.subject}</td>
                <td>${e.writer}</td>
                <td>${e.regDate}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<td colspan="2">
    <table>
        <tr>
            <td><button type="button" onclick="location.href='boardUpdateForm.do?idx=${board.bno}'">글수정</button> </td>
            <td><button type="button" onclick="location.href='boarddelete.do?idx=${board.bno}'">글삭제</button> </td>
            <td><button>글목록</button></td>
        </tr>
    </table>
</td>

<%@ include file="bootstrap.jsp"%>
</body>
</html>


