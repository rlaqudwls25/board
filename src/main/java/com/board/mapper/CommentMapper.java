package com.board.mapper;


import com.board.domain.CommentVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/*** 댓글 Mapper */
@Repository
@Mapper
public interface CommentMapper {

    /**
     * 댓글 카운트
     * @return
     * @throws Exception
     */
    public int commentCount() throws Exception;

    /**
     * 댓글 항목
     * @param bno
     * @return
     * @throws Exception
     */
    public List<CommentVO> commentList(int bno) throws Exception;

    /**
     * 댓글 작성
     * @param comment
     * @return
     * @throws Exception
     */
    public int commentInsert(CommentVO comment) throws Exception;

    /**
     * 댓글 수정
     * @param comment
     * @return
     * @throws Exception
     */
    public int commentUpdate(CommentVO comment) throws Exception;

    /**
     *
     * @param rid
     * @return
     * @throws Exception
     */
    public int commentDeleteByRid(int rid) throws Exception;

    /**
     *
     * @param bno
     * @return
     * @throws Exception
     */
    public int commentDeleteByBno(int bno) throws Exception;


}
