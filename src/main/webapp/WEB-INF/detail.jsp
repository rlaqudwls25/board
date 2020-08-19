<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
        // 단순 스크립트는 헤더 사이에 넣는다
    </script>

</head>
<body>

<div style="text-align: center">
<h2>게시글 상세</h2>
</div>



<div class="container">
    <form action="/insertProc" method="post" >
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

            <c:if test="${detail.fileName ne null}">
            <tr>
                        <td bgcolor="white">
                            첨부파일</td>
                        <td align="left"><a href="/fileDownload.do?fileName=${detail.fileName}"> ${detail.fileName}</a></td>

            </tr>
            </c:if>

    </form>
    <div class="btn-group btn-group-sm" role="group" style="float:right;">
    <button class="btn btn-primary" onclick="location.href='/update/${detail.bno}'">수정</button>
    <button class="btn btn-danger" onclick="del(${detail.bno})">삭제</button>
    <button class="btn btn-primary" onclick="location.href='/list'">목록</button>

</div>
</div>

<div class="container">
    <label for="content">comment</label>
    <form name="commentInsertForm" method="post" >
        <div class="input-group">
            <input type="hidden" name="bno" value="${detail.bno}"/>
            <input type="text" class="form-control" id="content" name="content" placeholder="내용을 입력하세요">
            <span class="input-group-btn">
                <button class="btn btn-primary" type="button" name="commentInsertBtn">등록</button>
            </span>
        </div>
    </form>
</div>

<div class="container">
    <div class="commentList"></div>
</div>

<%@include file="bootstrap.jsp"%>
<%@include file="comment.jsp"%>
</body>
</html>
