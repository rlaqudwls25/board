package com.board.mapper;

import com.board.domain.MemberVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


/**
 * 회원가입 Mapper
 */
@Repository
@Mapper
public interface MemberMapper {


    public void register(MemberVO vo) throws Exception;


}




