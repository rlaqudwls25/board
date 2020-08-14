package com.board.service;

import com.board.domain.CommentVO;
import com.board.mapper.BoardMapper;
import com.board.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentService {

    @Autowired
    CommentMapper mCommentMapper;


    /**
     *
     * @return
     * @throws Exception
     * @param bno
     */
    public List<CommentVO> commentListService(int bno) throws Exception{
        return mCommentMapper.commentList(bno);

    }

    /**
     *
     * @param comment
     * @return
     * @throws Exception
     */
    public int commentInsertService(CommentVO comment) throws Exception{
        return mCommentMapper.commentInsert(comment);
    }

    /**
     *
     * @param comment
     * @return
     * @throws Exception
     */
    public int commentUpdateService(CommentVO comment) throws Exception{
        return mCommentMapper.commentUpdate(comment);
    }

    /**
     *
     * @param rid
     * @return
     * @throws Exception
     */
    public int commentDeleteService(int rid) throws Exception{
        return mCommentMapper.commentDelete(rid);
    }
}
