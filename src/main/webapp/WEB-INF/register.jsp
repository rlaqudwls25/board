<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title></title>

    <script type="text/javascript">
        window.onload = function (){
            var join = document.getElementById("join");

            join.onclick = function (){
                alert("회원가입이 되었습니다.");

            }
        };


    </script>
</head>

<!-- 게시판 회원가입 -->
<body>
<form role="form" method="post" autocomplete="off">
    <p>
        <label for="userid">아이디</label>
        <input type="text" id="userid" name="userid"/>
    </p>
    <p>
        <label for="userpass">패스워드</label>
        <input type="password" id="userpass" name="userpass"/>
    </p>
    <p>
        <label for="username">사용자</label>
        <input type="text" id="username" name="username"/>
    </p>
    <p>
        <button class="btn btn-primary" id="join" onclick="location.href='/login'">가입</button>
    </p>

</form>
<p>
    <button class="btn btn-primary" onclick="location.href='/list'">목록</button>
</p>
</body>
</html>