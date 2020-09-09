package com.board.domain;


import lombok.Getter;
import lombok.Setter;

/*** 회원가입 리스트*/
@Setter
@Getter

public class MemberVO {

    //사용자 아이디
    private String userid;

    //사용자 비밀번호
    private String userpass;

    //사용자 이름
    private String username;


}
