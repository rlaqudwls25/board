
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>


<script>
    // 댓글 저장
    $('[name=commentInsertBtn]').click(function () {
        var insertData = $('[name=commentInsertForm]').serialize();
        commentInsert(insertData);
    });

    // 댓글 리스트
    function commentList() {
        var bno = '${detail.bno}';
        $.ajax({
            url : '/comment/list',
            type : 'get',
            data : {'bno': bno},
            success : function(data) {
                var a ='';
                $.each(data, function(key, value) {
                    a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                    a += '<div class="commentInfo'+value.rid+'">'+'댓글번호 : '+value.rid+' / 작성자 : '+value.regid;
                    a += '<a onclick="commentUpdate('+value.rid+',\''+value.content+'\');"> 수정 </a>';
                    a += '<a onclick="commentDelete('+value.rid+');"> 삭제 </a> </div>';
                    a += '<div class="commentContent'+value.rid+'"> <p> 내용 : '+value.content +'</p>';
                    a += '</div></div>';

                });
                $(".commentList").html(a);
            }
        });
    }

    // 댓글 등록
    function commentInsert(insertData) {
        $.ajax({
            url : '/comment/insert',
            type : 'post',
            data : insertData,
            success : function(data) {
                if(data == 1){
                    alert("댓글이 등록되었습니다")
                    commentList();
                    $('[name=content]').val('');
                }
            }
        });
    }

    // 댓글 수정
    function commentUpdate(rid, content) {
        var a ='';

        a += '<div class="input-group">';
        a += '<input type="text" class="form-control" id="up" name="content_'+rid+'" value="'+content+'"/>';
        a += '<span class="input-group-btn"><button class="btn btn-primary" type="button" onclick="commentUpdateProc('+rid+');">수정</button> </span>';
        a += '</div>';

        $('.commentContent'+rid).html(a);

    }

    // 댓글 수정
    function commentUpdateProc(rid) {
        var updateContent = $('[name=content_'+rid+']').val();
        var udt = document.getElementById("up").value;
        if(!udt){
            alert("댓글을 수정 해주세요");
            return false;
        }
        $.ajax({
            url : '/comment/update',
            type : 'post',
            data : {'content' : updateContent, 'rid' : rid},
            success : function (data) {
                if(data == 1)
                alert("댓글이 수정되었습니다.")
                commentList(rid);
            }
        });

    }

    // 댓글 삭제
    function commentDelete(rid) {
        var bno = '${detail.bno}';
        $.ajax({
            url: '/comment/delete/' + rid,
            type: 'post',
            success: function (data) {
                if (data == 1)
                    alert("댓글이 삭제되었습니다")
                    commentList(bno);
            }
        });
    }

    $(document).ready(function () {
        commentList();
    });

</script>