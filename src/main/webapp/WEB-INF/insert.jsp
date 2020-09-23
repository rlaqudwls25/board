<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">


<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert Form</title>
    <script src="//cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>

    <script type="text/javascript">

        function checkForm(){
            var subject = document.getElementById('subject');
            var data = CKEDITOR.instances.editor1.getData();

            if(subject.value.length == 0){
                alert("막혔어요");
                return false;
            }
            if(data.length == 0){
                alert("막혔어요");
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
    <form action="/insertProc" method="post" enctype="multipart/form-data" onsubmit="return checkForm();">
        <input type="hidden" name="delChk" value="N">
        <div class="form-group">
            <label for="subject">제목</label>
            <input type="text" class="form-control" id="subject" name="subject" placeholder="제목을 입력하세요.">
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
        <button type="submit" class="btn btn-primary" id="check" name="check" >작성</button>
        <script> CKEDITOR.replace('editor1');</script>

    </form>
    <button class="btn btn-primary" onclick="location.href = '/list'">목록</button>
</div>

<!-- 게시판 작성 끝 -->

<%@ include file="bootstrap.jsp"%>

</body>
</html>

