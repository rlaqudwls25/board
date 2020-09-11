<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

</head>
<body>

<form role="form" method="post" autocomplete="off">
    <p>
        <label for="userid">아이디</label>
        <input type="text" id="userid" name="userid" value="${userid}"/>
    </p>
    <p>
        <label for="userpass">비밀번호</label>
        <input type="password" id="userpass" name="userpass"/>
    </p>
    <p>
        <button type="submit">회원 탈퇴</button>
    </p>
    <p>
        <a href="/list">처음으로</a>
    </p>
</form>
</body>
</html>