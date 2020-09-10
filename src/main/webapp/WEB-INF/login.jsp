<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>

</head>


<body>

<!-- 게시판 로그인-->
<c:if test="${member == null}">
<form role="form" method="get" autocomplete="off" action="/login">

    <p>
        <label for="userid">아이디</label>
        <input type="text" name="userid" id="userid"/>
    </p>

    <p>
        <lable for="userpass">비밀번호</lable>
        <input type="password" name="userpass" id="usesrpass"/>
    </p>
    <button type="submit">로그인</button>
</form>
    <button class="btn btn-primary" onclick="location.href='/register'">회원가입</button>

</c:if>

<c:if test="${msg == false}">
    <p style="color: #f00;">로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주세요.</p>
</c:if>

<c:if test="${member != null}">
    <p>${member.username}님 환영합니다</p>
</c:if>

<button class="btn btn-primary" onclick="location.href='/list'">돌아가기</button>
<!-- 게시판 로그인 끝 -->

</body>
</html>