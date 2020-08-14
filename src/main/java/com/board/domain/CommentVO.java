package com.board.domain;

import lombok.Getter;
import lombok.Setter;

import javax.xml.soap.Text;
import java.sql.Timestamp;

@Setter
@Getter
public class CommentVO {

    private int rid; //댓글 번호
    private int bno; //댓글이 달린 게시글 번호
    private String content; // 내용
    private String regid; // 댓글 작성자
    private Timestamp regdt; // 댓글 작성 시간




}
