<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
<%--    <link rel="stylesheet" href="../css/new_main.css" type="text/css">--%>
    <h2>회원가입 페이지</h2>

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
            if(form.password.value == ""){
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
    <div id="content">
        <div>
            <h3><label for="userid">아이디</label></h3>
            <span class="box int_id">
                <input type="text" id="userid" class="int" maxlength="10">
            </span>
            <span class="error_next_box"></span>
        </div>
        <div>
            <h3><label for="password">비밀번호</label></h3>
            <span class="box int_pass">
                <input type="password" id="password" class="int" maxlength="20">
            </span>
            <span class="error_next_box"></span>
        </div>
        <div>
            <h3>
                <label for="yy">생년원일</label>
            </h3>
            <div id="bir_wrap">
                <div id="bir_yy">
                <span class="box">
                    <input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)">
                </span>
                </div>
                <div id="bir_mm">
                <span class="box">
                    <select id="mm" class="sel">
                        <option>월</option>
                        <option value="01">01</option>
                        <option value="02">02</option>
                        <option value="03">03</option>
                        <option value="04">04</option>
                        <option value="05">05</option>
                        <option value="06">06</option>
                        <option value="07">07</option>
                        <option value="08">08</option>
                        <option value="09">09</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                </span>
                </div>

                <div id="bir_dd">
                <span class="box">
                    <input type="text" id="dd" class="int" maxlength="2" placeholder="일(2자)">
               </span>
                </div>
            </div>
            <span class="error_next_box"></span>
            <div>
                <h3 class="join_title"><label for="gender">성별</label></h3>
                <span class="box gender_code">
                <select id="gender" class="sel">
                    <option>성별</option>
                    <option value="남">남</option>
                    <option value="여">여</option>
                </select>
            </span>
                <span class="error_next_box">필수 정보입니다.</span>
        </div>
        <div class="btn_area">
            <input type="submit" id="btnJoin" value="가입하기"/>
        </div>
    </div>
    </div>
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
