<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title></title>

<%--    <style>--%>
<%--        #test_btn1{--%>
<%--            border-top-left-radius: 5px;--%>
<%--            border-bottom-left-radius: 5px;--%>
<%--            margin-right:-4px;--%>
<%--        }--%>
<%--        #test_btn2{--%>
<%--            border-top-right-radius: 5px;--%>
<%--            border-bottom-right-radius: 5px;--%>
<%--            margin-left:-3px;--%>
<%--        }--%>
<%--        #test_btn3{--%>
<%--            border-top-right-radius: 5px;--%>
<%--            border-bottom-right-radius: 5px;--%>
<%--            margin-left:-3px;--%>
<%--        }--%>
<%--        .btn_group button{--%>
<%--            border: 1px solid skyblue;--%>
<%--            background-color: rgba(0,0,0,0);--%>
<%--            color:blue;--%>
<%--            padding: 5px;--%>
<%--        }--%>
<%--        #btn_group button:hover{--%>
<%--            color:white;--%>
<%--            background-color:skyblue;--%>
<%--        }--%>
<%--    </style>--%>
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
        return "/list";
    }
</script>
</head>
<body>
<!-- 게시판 로그인 시작 -->
<form name="form" method="post" autocomplete="off" action="/login" onsubmit="return loginCheck()">
    <div class="btn_group">
        <p align="center">
<%--        <button type="button" class="btn btn-primary" id="test_btn3" onclick="location.href='/list'">목록</button>--%>
    <table width="275" border="2px" align="center">
    <tr>
        <th colspan="2">로그인</th>
    </tr>
    <tr>
        <td>아이디</td>
        <td><input type="text" name="userid" id="userid"></td>
    </tr>
    <tr>
        <td>비밀번호</td>
        <td><input type="password" name="userpass" id="userpass"></td>
    </tr>
    </table>
        <button class ="btn btn-primary" id="test_btn1">로그인</button>
        <button type="button" class="btn btn-primary" id="test_btn2" onclick="location.href='/register'">회원가입</button>
    </p>
</div>
</form>
<div class="btn_group">
<p align="center">

</p>
</div>
<c:if test="${member != null}">
    <p>${member.username}님 환영합니다</p>

    <a href="/logout">로그아웃</a>
    <a href="/modify">회원정보 수정</a>
</c:if>
<!-- 게시판 로그인 끝 -->
<%@ include file="bootstrap.jsp"%>
</body>
</html>