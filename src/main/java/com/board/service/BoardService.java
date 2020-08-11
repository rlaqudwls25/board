package com.board.service;

import java.util.List;

import com.board.domain.BoardDTO;
import com.board.domain.PageVO;
import com.board.domain.ReplyVO;
import com.board.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BoardService {

    @Autowired
    BoardMapper mBoardMapper;

    public List<BoardDTO> boardListService(PageVO page) throws Exception{

        return mBoardMapper.boardListService(page);
    }

    public BoardDTO boardDetailService(int bno) throws Exception{

        return mBoardMapper.boardDetail(bno);
    }

    public void boardInsertService(BoardDTO board) throws Exception{

        mBoardMapper.boardInsert(board);
    }

    public int boardUpdateService(BoardDTO board) throws Exception{

        return mBoardMapper.boardUpdate(board);
    }

    public boolean boardDeleteService(int bno) throws Exception{

        return mBoardMapper.boardDelete(bno);
    }

    public int countBoardListTotal() throws Exception {
        return mBoardMapper.countBoardList();
    }

    public List<ReplyVO> getReplyList(int bid) throws Exception {
        return mBoardMapper.getReplyList(bid);
    }

    public int saveReply(ReplyVO replyVO) throws Exception {
        return mBoardMapper.saveReply(replyVO);
    }

    public int updateReply(ReplyVO replyVO) throws Exception {
        return mBoardMapper.updateReply(replyVO);
    }

    public int deleteReply(int rid) throws Exception {
        return mBoardMapper.deleteReply(rid);
    }







}
