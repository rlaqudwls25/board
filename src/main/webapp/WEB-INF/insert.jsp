<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert Form</title>
    <script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>

    <style type="text/css">
        .btn-primary {
            float: right;
            height: 35px;
        /*    border: 1px solid black;*/
        /*    font-weight: bold !important;*/
        /*    padding: 5px 7px !important;*/
        /*    background: skyblue !important;*/
        /*    color: black !important;*/
            border-radius: 7px;
        }
        .btn-primary2{
            /*float: left;*/
            /*border: 1px solid black;*/
            /*font-weight: bold;*/
            /*padding: 5px 7px;*/
            /*background: skyblue;*/
            /*color: black;*/
            /*border-radius: 7px;*/
        }
    </style>

    <script type="text/javascript">
        function checkForm(){
            var subject = document.getElementById('subject');
            var data = CKEDITOR.instances.editor1.getData();

            if(subject.value.length == 0){
                alert("제목을 다시 입력해주세요!");
                return false;
            }
            if(data.length == 0){
                alert("내용을 다시 입력해주세요!");
                return false;
            }else {
                alert("저장되었습니다.");
                return true;
            }
        }
    </script>
</head>
<body>
<div style="text-align: center">
<h2> 게시글 작성 </h2>
</div>

<!-- 게시판 작성 시작-->
<div class="container">
    <button type="button" class="btn-primary" onclick="location.href = '/list'">목록</button>
    <form action="/insertProc" method="post" enctype="multipart/form-data" onsubmit="return checkForm();">
        <input type="hidden" name="delChk" value="N">
        <br>
        <div class="form-group">
            <label for="subject">제목</label>
            <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요." size="10" maxlength="30">
        </div>
        <div class="form-group">
            <label for="writer">작성자</label>
            <input type="text" class="form-control" id="writer" name="writer" value="${member.username}" readonly="readonly">
        </div>
        <div class="form-group">
            <textarea name="content" id="editor1" row="10" clos="80"></textarea>
        </div>
        <div>
            <td bgcolor="blue" width="100"></td>
            <td align="left">
        <input type="file" name="uploadFile"/></td>
        </div>
            <div class="form-group"></div>
        <button type="submit" class="btn-primary" id="check" name="check" style="float: left">작성</button>
        <script> CKEDITOR.replace('editor1');</script>
    </form>
</div>
<!-- 게시판 작성 끝 -->
<%@ include file="bootstrap.jsp"%>
</body>
</html>

