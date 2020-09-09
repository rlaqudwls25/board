package com.board.mapper;

import com.board.domain.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/*** 회원가입 Mapper */
@Repository
@Mapper
public interface MemberMapper {



    public void register(MemberVO vo) throws Exception;


    public MemberVO login(MemberVO vo) throws Exception;
}




