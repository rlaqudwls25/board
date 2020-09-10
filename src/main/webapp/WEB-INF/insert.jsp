<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert Form</title>
    <script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
</head>
<body>
<div style="text-align: center">
<h2> 게시글 작성 </h2>
</div>


<!-- 게시판 작성 -->
<div class="container">
    <form action="/insertProc" method="post" enctype="multipart/form-data">
        <input type="hidden" name="DEL_CHK" value="N">
        <div class="form-group">
            <label for="subject">제목</label>
            <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요.">
        </div>
        <div class="form-group">
            <label for="writer">작성자</label>\
            <input type="text" class="form-control" id="writer" name="writer" placeholder="내용을 입력하세요.">
        </div>

        <div class="form-group">
            <textarea name="editor1" id="editor1" row="10" clos="80"></textarea>

        </div>

        <div >
            <td bgcolor="blue" width="100"></td>
            <td align="left">
        <input type="file" name="uploadFile"/></td>
        </div>
            <div class="form-group"></div>

        <button type="submit" class="btn btn-primary">작성</butt

            on>
        <button type="submit" class="btn btn-primary">목록</button>

        <script> CKEDITOR.replace('editor1');
        </script>
    </form>
</div>

<%@ include file="bootstrap.jsp"%>

</body>
</html>

