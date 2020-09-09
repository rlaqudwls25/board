package com.board.domain;

import lombok.Getter;
import lombok.Setter;

import javax.xml.soap.Text;
import java.sql.Timestamp;

/*** 댓글 리스트*/
@Setter
@Getter
public class CommentVO {


    // 댓글 번호
    private int rid;

    // 댓글이 달린 게시글 번호
    private int bno;

    // 내용
    private String content;

    // 댓글 작성자
    private String regid;

    // 댓글 작성 시간
    private Timestamp regdt;




}
