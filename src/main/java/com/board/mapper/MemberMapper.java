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

    /**
     * 회원가입
     * @param vo
     * @throws Exception
     */
    public void register(MemberVO vo) throws Exception;

    /**
     * 로그인
     * @param vo
     * @return
     * @throws Exception
     */
    public MemberVO login(MemberVO vo) throws Exception;
}




