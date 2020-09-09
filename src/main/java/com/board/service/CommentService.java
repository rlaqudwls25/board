package com.board.service;

import com.board.domain.CommentVO;
import com.board.mapper.BoardMapper;
import com.board.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/*** 댓글 서비스 */
@Service
public class CommentService {

    @Autowired
    CommentMapper mCommentMapper;


    /**
     * 댓글 목록
     * @return
     * @throws Exception
     * @param bno
     */
    public List<CommentVO> commentListService(int bno) throws Exception{
        return mCommentMapper.commentList(bno);
    }

    /**
     * 댓글 작성
     * @param comment
     * @return
     * @throws Exception
     */
    public int commentInsertService(CommentVO comment) throws Exception{
        return mCommentMapper.commentInsert(comment);
    }

    /**
     * 댓글 수정
     * @param comment
     * @return
     * @throws Exception
     */
    public int commentUpdateService(CommentVO comment) throws Exception{
        return mCommentMapper.commentUpdate(comment);
    }

    /**
     * Comment Seq (Rid) 파라미터로 댓글 지우기
     * @param rid
     * @return
     * @throws Exception
     */
    public int commentDeleteServiceRid(int rid) throws Exception{
        return mCommentMapper.commentDeleteByRid(rid);
    }

    /**
     * Comment Seq (Rid) 파라미터로 댓글 지우기
     * @param rid
     * @return
     * @throws Exception
     */
    public int commentDeleteServiceBno(int bno) throws Exception{
        return mCommentMapper.commentDeleteByBno(bno);
    }
}
