package com.board.domain;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Setter
@Getter
public class CommentVO {

    private int rid;
    private int bno;
    private String content;
    private String regid;
    private Timestamp regdt;




}
