<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

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
<%--        #btn_group button{--%>
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

    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

    <script>
        function check(){
            if(!checkUserId(form.userid.value)){
                return false;
            }else if(!checkPass(form.userid.value, form.userpass.value)){
                return false;
            }
            alert("회원가입이 되었습니다");
            return true;
        }

        function checkEmpty(){
            if(form.userid.value == ""){
                alert("아이디를 입력해주세요");
                return false;
            }
            if(form.userpass.value == ""){
                alert("비밀번호를 입력해주세요");
                return false;
            }
            return "list";
        }

        function checkUserId(id){
            if(!checkEmpty(id)){
                return false;
            }
            return true;
        }

        function checkPass(id, password){
            if(!checkEmpty(password)){
                return false;
            }
            if(id==password){
                alert("아이디와 비밀번호를 같을 수 없습니다");
                form.password.value="";
                return false;
            }
            return true;
        }
    </script>

</head>
<!-- 게시판 회원가입 -->
<body>

<form name="form" method="post" autocomplete="off" onsubmit="return check()">
    <table width="700" border="1px" align="center">
        <tr>
            <th colspan="2">회원 기본 정보</th>
        </tr>
        <tr>
            <td>아이디</td>
            <td><input type="text" name="userid" >4~12자의 영문 대소문자와 숫자로만 입력</td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="userpass">4~12자의 영문 대소문자와 숫자로만 입력</td>
        </tr>
        <tr>
            <td>이름</td>
            <td><input type="text" name="username"></td>
        </tr>
    </table>
    <p align="center">
    <button class="btn btn-primary" onclick="location.href='/register'">회원가입</button>

<%--    <button type="button" class="btn btn-primary" onclick="location.href='/list'">목록</button>--%>

    </p>
</form>
<!-- 게시판 회원가입 끝-->
<script>
    $(".idcheck").click(function () {
        var query = {userid : $("#userid").val()};

        $.ajax({
            url : '/idcheck',
            type : "post",
            data : query,
            success : function (data) {

                if (data == 1){
                    $(".result .msg").text("사용 불가");
                    $(".result .msg").attr("style", "color:#f00");
                    $("#submit").attr("disabled", "disabled");
                }else{
                    $(".result .msg").text("사용 가능");
                    $(".result .msg").attr("style", "color:blue");
                    $("#submit").removeAttr("disabled");
                }
            }
        });
    });
</script>
<%@ include file="bootstrap.jsp"%>
</body>
</html>
