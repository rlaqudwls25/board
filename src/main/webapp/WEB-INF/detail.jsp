<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detail</title>
    <script>
        function del(bno) {
            var chk = confirm("정말 삭제하시겠습니까?");
            if (chk) {
                location.href='/delete/${bno}';
            }

        }
        //단순 스크립트는 헤더 사이에 넣는다
    </script>
</head>
<body>
<h2>게시글 상세</h2>

<button class="btn btn-primaty" onclick="location.href='/update/${detail.bno}'">수정</button>
<button class="btn btn-danger" onclick="del(${board.bno})">삭제</button>


<div class="container">
    <form action="/insertProc" method="post">
        <div class="form-group">
            <label>제목</label>
            <p>${detail.subject}</p>
        </div>
        <div class="form-group">
            <label>작성자</label>
            <p>${detail.writer}</p>
        </div>
        <div class="form-group">
            <label>작성날짜</label>
            <p>${detail.regDate}</p>
        </div>
        <div class="form-group">
            <label>내용</label>
            <p>${detail.content}</p>
        </div>
        <input type="button" onclick="location.href='/list/${board.bno}'"value="목록">

    </form>
</div>

<div class="my-3 p-3 bg-white rounded shadow=sm" style="padding-top: 10px">
    <%--@elvariable id="replyVO" type=""--%>
    <form:form name="form" id="form" role="form" modelAttribute="replyVO" method="post">
        <form:hidden path="bid" id="bid"/>
        <div class="row">
            <div class="col-sm-10">
                <form:textarea path="content" id="content" class="form-control" rows="3" placeholder="댓글을 입력해주세요"></form:textarea>
            </div>
            <div class="col-sm-2">
                <form:input path="regid" class="form-control" id="regid" placeholder="댓글 작성자"></form:input>
                <button type="button" class="btn btn-sm btn-primary" id="btnSaveReply" style="width: 100%; margin-top: 10px">저 장</button>
            </div>
            </div>
    </form:form>
        </div>
    <div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
        <h6 class="border-bottom pb-2 mb-0">Reply list</h6>
        <div id="replyList"></div>
</div>

<%@include file="bootstrap.jsp"%>
</body>
</html>
