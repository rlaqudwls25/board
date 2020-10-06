<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <style type="text/css">
        #btn_share{
            width: 15%;
            height: 50px;
            background: yellow;
            font-family: Dotum,'돋움',Helvetica,sans-serif;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            color: black;
            text-align: center;
        }
    </style>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>


    <title>Detail</title>
    <script>
        function sendLinkKakao(){
            Kakao.init('9d6029283b4625ca94caf8837cb5020e');
            Kakao.Link.sendDefault({
                objectType: 'feed',
                content: {
                    title: '게시글',
                    description: '',
                    imageUrl: '',
                    link: {
                        mobileWebUrl: 'http://localhost:8080/list',
                        webUrl: 'http://localhost:8080/list'
                    }
                },
                buttons: [
                    {
                        title: 'Web으로 보기',
                        link: {
                            mobileWebUrl: 'http://localhost:8080/list',
                            webUrl: 'http://localhost:8080/list'
                        }
                    },
                    {
                        title: 'App으로 보기',
                        link: {
                            mobileWebUrl: 'http://localhost:8080/list',
                            webUrl: 'http://localhost:8080/list'
                        }
                    }
                ]
            });
        }
    </script>
    <script>
        function del(bno) {
            var chk = confirm("정말 삭제하시겠습니까?");
            if (chk) {
                location.href='/delete/${bno}';
            }
        }

        window.onload = function (){
            document.getElementById('content').onkeypress = function (e){
                if(e.keyCode ==13){
                    e.preventDefault();
                    var insertData = $('[name=commentInsertForm]').serialize();
                    commentInsert(insertData);

                }
            };

            // document.getElementById('up').onkeypress = function (e){
            //     if(e.keyCode==13){
            //         e.preventDefault();
            //         var updateData = $('[name=content_8]').serialize();
            //         commentUpdate(updateData);
            //     }
            // }
        };
    </script>

</head>

<body>

<div style="text-align: center">
<h2>게시글 상세</h2>
</div>

<!-- 게시판 상세 시작 -->
<div class="container">
    <form action="/insertProc" method="post" >
        <div>
            <label>제목</label>
            <p>${detail.subject}</p>
        </div>
        <div>
            <label>작성자</label>
            <p>${detail.writer}</p>
        </div>
        <div>
            <label>작성날짜</label>
            <p>${detail.regDate}</p>
        </div>
        <div>
            <label>조회수</label>
            <p>${detail.viewCnt}</p>
        </div>
        <div>
            <label>내용</label>
            ${detail.content}
        </div>
        <div>
        <c:if test="${detail.fileName ne null}">
            <label>첨부파일</label>
            <a href="/fileDownload.do?fileName=${detail.fileName}">${detail.fileName}</a>
        </c:if>
        </div>
        <button type="button" id="btn_share" onclick="sendLinkKakao();">카카오톡 공유</button>

<%--        <span class="sociallink ml-1">--%>
<%--    <a href="javascript:sendLinkKakao()" id="kakao-link-btn" title="카카오톡으로 공유">--%>
<%--        <img src="{% static 'images/kakaotalk.png' %}" width=36 alt="Kakaotalk">--%>
<%--    </a>--%>
<%--</span>--%>
    </form>
    <div class="btn-group btn-group-sm" role="group" style="float:right;">
        <button class="btn btn-primary" onclick="location.href='/update/${detail.bno}'">수정</button>
        <button class="btn btn-danger" onclick="del(${detail.bno})">삭제</button>
        <button class="btn btn-primary" onclick="location.href='/list'">목록</button>
    </div>
</div>
<!-- 게시글 상세 끝 -->
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
