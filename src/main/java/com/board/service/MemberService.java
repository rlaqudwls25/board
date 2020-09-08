package com.board.service;

import com.board.domain.MemberVO;
import com.board.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
    @Autowired
    MemberMapper mmemberMapper;

    public void register(MemberVO vo) throws Exception{
        mmemberMapper.register(vo);
    }
}
