
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="utf-8"%>


<script>
    /**
     *게시글 번호
     * @type {string}
     */
    var bno = '${detail.bno}';

    $('[name=commentInsertBtn]').click(function () { //댓글 등록 버튼
        var insertData = $('[name=commentInsertForm]').serialize(); //commentinsertform에 내용을 가져옴
        commentInsert(insertData); // insert 함수호출
    });


    /**
     *댓글 목록
     */
    function commentList() {
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


    /**
     *댓글 등록
     * @param insertData
     */

    function commentInsert(insertData) {
        $.ajax({
            url : '/comment/insert',
            type : 'post',
            data : insertData,
            success : function (data) {
                if(data ==1){
                    commentList();
                    $('[name=content]').val('');
                }
            }
        });
    }

    /**
     *댓글 수정
     * @param rid
     * @param content
     */

    function commentUpdate(rid, content) {
        var a ='';


        a += '<div class="input-group">';
        a += '<input type="text" class="form-control" name="content_'+rid+'" value="'+content+'"/>';
        a += '<span class="input-group-btn"><button class="btn btn-primary" type="button" onclick="commentUpdateProc('+rid+');">수정</button> </span>';
        a += '</div>';

        $('.commentContent'+rid).html(a);

    }

    /**
     *댓글 수정
     * @param rid
     */

    function commentUpdateProc(rid) {
        var updateContent = $('[name=content_'+rid+']').val();

        $.ajax({
            url : '/comment/update',
            type : 'post',
            data : {'content' : updateContent, 'rid' : rid},
            success : function (data) {
                if(data == 1) commentList(bno); //댓글 수정후 목록 출력

            }
        });

    }

    /**
     *댓글 삭제
     * @param rid
     */

    function commentDelete(rid) {
        $.ajax({
            url: '/comment/delete/' + rid,
            type: 'post',
            success: function (data) {
                if (data == 1)
                    commentList(bno); //댓글 삭제후 목록 출력
            }
        });
    }

    $(document).ready(function () {
        commentList(); //페이지 로딩시 댓글 목록 출력
    });

</script>