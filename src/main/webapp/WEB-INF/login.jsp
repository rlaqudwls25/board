<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>

<script>
    // window.onload = function () {
    //     var regCheck = document.getElementById("check");
    //
    //     regCheck.onclick = function (member) {
    //         if(member == null){
    //             alert("다시 한번 확인해주세요");
    //         }else {
    //             alert("로그인 되었습니다!");
    //         }
    //     }
    // }

    function checkId() {
        if(frm.userid.value == ""){
            alert("다시 한 번 확인해주세요");
            frm.userid.focus();
            return false;

        }else if(frm.userpass.value == ""){
            alert("값을 입력 해주세요");
            frm.userpass.focus();
            return false;
        }
        return true;
    }
</script>
</head>
<body>

<!-- 게시판 로그인 시작 -->
<c:if test="${msg == null}">
<form name="frm" method="post" autocomplete="off" action="/login" onsubmit="return checkId()">

    <p>
        <label for="userid">아이디</label>
        <input type="text" name="userid" id="userid"/>
    </p>

    <p>
        <lable for="userpass">비밀번호</lable>
        <input type="password" name="userpass" id="userpass"/>
    </p>
        <input type="submit" name="로그인"></input>
</form>
    <button class="btn btn-primary" onclick="location.href='/register'">회원가입</button>
</c:if>

<c:if test="${msg == false}">
    <p style="color:#f00;">로그인에 실패했습니다. 아이디 또는 패스워드를 다시 입력해주세요.</p>
</c:if>

<c:if test="${member != null}">
    <p>${member.username}님 환영합니다</p>

    <a href="/logout">로그아웃</a>
    <a href="/modify">회원정보 수정</a>
</c:if>

    <button class="btn btn-primary" onclick="location.href='/list'">돌아가기</button>
<!-- 게시판 로그인 끝 -->

</body>
</html>