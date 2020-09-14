package com.board.mapper;

import com.board.domain.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/**
 * 회원가입 Mapper
 */
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
     * 회원가입 중복
     * @param userid
     * @return
     * @throws Exception
     */
    public MemberVO idcheck(String userid) throws Exception;

    /**
     * 로그인
     * @param vo
     * @return
     * @throws Exception
     */
    public MemberVO login(MemberVO vo) throws Exception;

    /**
     * 회원정보 수정
     * @param vo
     * @throws Exception
     */
    public void modify(MemberVO vo) throws Exception;

    /**
     * 회원탈퇴
     * @param vo
     * @throws Exception
     */
    public void withdraw(MemberVO vo) throws Exception;
}






