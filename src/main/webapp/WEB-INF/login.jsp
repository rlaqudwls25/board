<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
</head>


<body>

<form role="form" method="get" autocomplete="off" action="/login">

    <p>
        <label for="userid">아이디</label>
        <input type="text" name="userid" id="userid"/>
    </p>

    <p>
        <lable for="userpass">비밀번호</lable>
        <input type="password" name="userpass" id="userpass"/>
    </p>
    <p><button type="submit">로그인</button> </p>
</form>
<p>${member.username}님 환영합니다</p>

</body>
</html>