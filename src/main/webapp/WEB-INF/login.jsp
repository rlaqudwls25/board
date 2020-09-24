<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>

<script>

    function loginCheck() {
        if(form.userid.value == ""){
            alert("아이디를 다시 입력해주세요");
            return false;
        }
        if(form.userpass.value == ""){
            alert("비밀번호를 다시 입력해주세요");
            return false;
        }
        return true;
    }
</script>
</head>
<body>

<!-- 게시판 로그인 시작 -->
<form name="form" method="post" autocomplete="off" action="/login" onsubmit="return loginCheck()">
    <p>
        <label for="userid">아이디</label>
        <input type="text" name="userid" id="userid"/>
    </p>
    <p>
        <lable for="userpass">비밀번호</lable>
        <input type="password" name="userpass" id="userpass"/>
    </p>
    <input type="submit" name="로그인"/>
</form>

    <button class="btn btn-primary" onclick="location.href='/register'">회원가입</button>

<c:if test="${member != null}">
    <p>${member.username}님 환영합니다</p>

    <a href="/logout">로그아웃</a>
    <a href="/modify">회원정보 수정</a>
</c:if>

    <button class="btn btn-primary" onclick="location.href='/list'">돌아가기</button>
<!-- 게시판 로그인 끝 -->

</body>
</html>