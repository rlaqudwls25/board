package com.board.service;

import com.board.domain.MemberVO;
import com.board.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 회원가입 Service
 */
@Service
public class MemberService {
    @Autowired
    MemberMapper mmemberMapper;

    /**
     * 회원가입
     * @param vo
     * @throws Exception
     */
    public void register(MemberVO vo) throws Exception{
        mmemberMapper.register(vo);
    }

    /**
     * 로그인
     * @param vo
     * @return
     * @throws Exception
     */
    public MemberVO login(MemberVO vo) throws Exception{
        return mmemberMapper.login(vo);
    }

    /**
     * 회원정보 수정
     * @param vo
     * @throws Exception
     */
    public void modify(MemberVO vo) throws Exception{
        mmemberMapper.modify(vo);
    }

    /**
     * 회원 탈퇴
     * @param vo
     * @throws Exception
     */
    public void withdraw(MemberVO vo) throws Exception{
        mmemberMapper.withdraw(vo);
    }
}
