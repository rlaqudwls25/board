<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

    <script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>
    <script type="text/javascript">
        window.onload = function (){
            var idt = document.getElementById("check");

            idt.onclick = function (){
                alert("게시글이 저장되었습니다")
            }
        };

    </script>
</head>
<body>
<div style="text-align: center">
<h2> 게시글 수정 </h2>
</div>

<!-- 게시판 수정 -->
<div class="container">
    <form action="/updateProc" method="post">
        <div class="form-group">
            <label for="subject">제목</label>
            <input type="text" class="form-control" name="subject" id="subject" value="${detail.subject}">
<%--            <input type="text" class="form-control" id="subject" name="subject">--%>
        </div>
        <div class="form-group">
            <label for="writer">작성자</label>
            <input type="text" class="form-control" id="writer" name="writer" value="${detail.writer}">

            <textarea name="editor1" id="editor1" rows="10" cols="80">${detail.content}</textarea>
        </div>

        <input type="hidden" name="bno" value="${bno}"/>
        <button type="submit" class="btn btn-primary" id="check" name="check">수정</button>

        <script> CKEDITOR.replace('editor1');
        </script>
    </form>
</div>
<!-- 게시판 수정 끝 -->

<%@ include file="bootstrap.jsp"%>

</body>
</html>
