<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
</head>

<body>

<form role ="form" method="post" autocomplete="off">
    <p>
        <label for="username">새로운 닉네임</label>
        <input type="text" id="username" name="username" value="${username}"/>
    </p>

    <p>
        <label for="userpass">새로운 비밀번호</label>
        <input type="password" id="userpass" name="userpass"/>
    </p>
    <p>
        <button type="submit">회원정보 수정</button>
    </p>

    <a href="/list">처음으로</a>
</form>
</body>
</html>