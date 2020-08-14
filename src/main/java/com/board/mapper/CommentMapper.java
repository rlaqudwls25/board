package com.board.mapper;


import com.board.domain.CommentVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CommentMapper {



    public int commentCount() throws Exception;

    public List<CommentVO> commentList(int bno) throws Exception;

    public int commentInsert(CommentVO comment) throws Exception;

    public int commentUpdate(CommentVO comment) throws Exception;

    public int commentDelete(int rid) throws Exception;


}
