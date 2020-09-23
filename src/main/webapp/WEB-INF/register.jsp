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

    <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>

<%--    <script type="text/javascript">--%>
<%--        window.onload = function (){--%>
<%--            var join = document.getElementById("join");--%>
<%----%>
<%--            join.onclick = function (){--%>
<%--                alert("회원가입이 되었습니다.");--%>
<%--            }--%>
<%--        };--%>
<%--//     </script>--%>

</head>

<!-- 게시판 회원가입 -->
<body>
<form role="form" method="post" autocomplete="off">
    <p>
        <label for="userid">아이디</label>
        <input type="text" id="userid" name="userid"/>

        <button type="button" class="idcheck">아이디 확인</button>
    </p>

    <p class="result">
        <span class="msg">아이디를 확인해주세요.</span>
    </p>
    <p>
        <label for="userpass">패스워드</label>
        <input type="password" id="userpass" name="userpass"/>
    </p>
    <p>
        <label for="username">닉네임</label>
        <input type="text" id="username" name="username"/>
    </p>


        <button type="submit" id="submit" disabled="disabled">가입</button>


<%--    <button class="btn btn-primary" id="join" onclick="location.href='/login'">가입</button>--%>
    <button class="btn btn-primary" onclick="location.href='/list'">목록</button>
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

</body>
</html>