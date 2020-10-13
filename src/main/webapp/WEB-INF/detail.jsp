<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta property="og:url"           content="http://localhost:8080/detail/515" />s
    <meta property="og:type"          content="website" />
    <meta property="og:title"         content="Your Website Title" />
    <meta property="og:description"   content="Your description" />
    <meta property="og:image"         content="" />

    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

    <title>Detail</title>
    <style>

        ul{
            list-style: none;
            padding: 15px;
        }
        .sns-url-layer{
            padding-top: 30px;
        }
        .sns-layer{
            background: white;
            width: 300px;
            height: 200px;
            padding: 0px -5px;
            border: solid 1px black;
            border-radius: 7px;
        }
        .sns-sub-layer{
            width: 100%;
            height: 40px;
            background: lightgray;
            border: solid 0px black;
            padding: 10px;
            border-radius: 7px;
        }

        #topMenu {
            height: 30px;
            width: 500px;
            float: right;
        }
        #topMenu ul {
            /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
            list-style-type: none; margin: 0px; padding: 0px;
        }


        #topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
            color: white; background-color: #2d2d2d; float: left; line-height: 30px; vertical-align: middle; text-align: center; position: relative;
        }
        .menuLink, .submenuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
            text-decoration:none;
            display: block;
            width: 80px;
            font-size: 12px;
            font-weight: bold;
            font-family: "Trebuchet MS", Dotum;
            cursor: pointer;

        }
        .menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
            color: white;
        }
        .topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
            color: red; background-color: #4d4d4d;
        }
        .longLink { /* 좀 더 긴 메뉴 스타일 설정 */
            width: 130px;
        }
        .submenuLink{
            color: #2d2d2d;
            background-color: white;
            border: solid 1px black;
            margin-right: -1px;
        }
        .submenu{
            position: absolute;
            height: 0px;
            overflow: hidden;
            transition: height .2s;
            -webkit-transition: height .2s;
            -moz-transition: height .2s;
            -o-transition: height .2s;
            width: 770px; /* [변경] 가로 드랍다운 메뉴의 넓이 */ left: 0;
        }
        .submenu li {
            display: inline-block;
        }
        .topMenuLi:hover .submenu {
            height: 32px;
        }
        .btn-primary{
            background: blue;

        }
    </style>

    <script>
        window.fbAsyncInit = function() {
            FB.init({
                appId      : '718393278753548',
                autoLogAppEvents : true,
                xfbml      : true,
                version    : 'v8.0'
            });
            FB.AppEvents.logPageView();
        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement(s);
            js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        function shareFacebook() {
            FB.ui({
                    method: 'share',
                    href: 'https://developers.facebook.com/docs/' ,
                },
                function (response) {
                    if (response && !response.error_code) {
                        alert('공유 완료');
                    } else {
                        alert('공유 실패');
                    }
                }
            );
        }
    </script>

    <script>
        function CopyUrlToClipboard() {
            var obShareUrl = document.getElementById("ShareUrl");
            obShareUrl.value = window.document.location.href;  // 현재 URL 을 세팅해 줍니다.
            obShareUrl.select();  // 해당 값이 선택되도록 select() 합니다
            document.execCommand("copy"); // 클립보드에 복사합니다.
            obShareUrl.blur(); // 선택된 것을 다시 선택안된것으로 바꿈니다.
            alert("URL이 클립보드에 복사되었습니다");
        }

    </script>

    <script>
        Kakao.init('9d6029283b4625ca94caf8837cb5020e');
        function sendLinkKakao(){
            Kakao.Link.sendDefault({
                objectType: 'feed',
                content: {
                    title: '게시글',
                    description: '',
                    imageUrl: '',
                    link: {
                        mobileWebUrl: 'http://localhost:8080/detail/${detail.bno}',
                        webUrl: 'http://localhost:8080/detail/${detail.bno}'
                    }
                },
                buttons: [
                    {
                        title: 'Web으로 보기',
                        link: {
                            mobileWebUrl: 'http://localhost:8080/detail/${detail.bno}',
                            webUrl: 'http://localhost:8080/detail/${detail.bno}'
                        }
                    },
                    {
                        title: 'App으로 보기',
                        link: {
                            mobileWebUrl: 'http://localhost:8080/detail/${detail.bno}',
                            webUrl: 'http://localhost:8080/detail/${detail.bno}'
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
    </form>
    <br>
    <div class="sns-layer">
        <div class="sns-sub-layer">
            <strong>SNS공유하기</strong>
        </div>
        <ul>
            <li>
                <a onclick="sendLinkKakao();">
                    <img src="/img/kakaoimg.png" height="50" width="50"/>
                    <span style="color: black">카카오톡</span>
                </a>
                <a onclick="shareFacebook();">
                    <img src="/img/facebook.png" height="50" width="50"/>
                    <span style="color: black">페이스북</span>
                </a>
                <div class="sns-url-layer">
                    <input type="text" id = "ShareUrl">
                    <span> <button class="btn-primary" onClick="CopyUrlToClipboard();">URL 복사</button></span>
                </div>
            </li>
        </ul>
    </div>
    <div class="btn-group btn-group-sm" role="group" style="float:right;">
        <button class="btn btn-primary" onclick="location.href='/update/${detail.bno}'">수정</button>
        <button class="btn btn-danger" onclick="del(${detail.bno})">삭제</button>
        <button class="btn btn-primary" onclick="location.href='/list'">목록</button>
    </div>
    <br>
    <br>
<%--    <div>--%>
<%--        <div id="shareMenu">--%>
<%--            <ui>--%>
<%--                <a id="kakao-link-btn"  onclick="sendLinkKakao();">--%>
<%--                <img src="http://dn.api1.kage.kakao.co.kr/14/dn/btqa9B90G1b/GESkkYjKCwJdYOkLvIBKZ0/o.jpg" width="50" height="50" />--%>
<%--                </a>--%>
<%--            </ui>--%>
<%--            <div class="fb-share-button">--%>
<%--                data-href="http://localhost:8080/list"--%>
<%--                data-layout="button_count">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <br>--%>
<%--        <br>--%>
<%--    </div>--%>
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
