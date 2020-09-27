<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="../css/new_main.css" type="text/css">
    <h2>로그인 페이지</h2>

<script>
    function loginCheck() {
        if(form.userid.value == ""){
            alert("아이디를 다시 입력해주세요");
            return false;
        }
        if(form.password.value == ""){
            alert("비밀번호를 다시 입력해주세요");
            return false;
        }
        return "/list";
    }
</script>
</head>
<body>
<!-- 게시판 로그인 시작 -->
<form name="form" method="post" autocomplete="off" action="/login" onsubmit="return loginCheck()">
    <div id="content">
        <div>
            <h3><label for="userid">아이디</label></h3>
            <span class="box int_id">
                <input type="text" id="userid" class="int" maxlength="20">
            </span>
        </div>
        <div>
            <h3><label for="password">비밀번호</label></h3>
            <span class="box int=pass">
                <input type="password" id="password" class="int" maxlength="10">
            </span>
        </div>
        <div class="btn_area">
            <button type="submit" id="btnJoin">로그인</button>
        </div>
        <div class="btn_area">
            <button type="button" id="btnJoin2" onclick="location.href='/register'">회원가입 하기</button>
        </div>
</div>
</form>
<c:if test="${member != null}">
    <p>${member.username}님 환영합니다</p>

    <a href="/logout">로그아웃</a>
    <a href="/modify">회원정보 수정</a>
</c:if>
<!-- 게시판 로그인 끝 -->
</body>
</html>