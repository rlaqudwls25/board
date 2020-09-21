package com.board.service;

import java.util.List;

import com.board.domain.BoardDTO;
import com.board.domain.PageVO;
import com.board.mapper.BoardMapper;
import com.board.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 게시판 Service
 */
@Service
public class BoardService {

    @Autowired
    BoardMapper mBoardMapper;
    @Autowired
    CommentMapper mCommentMapper;

    /**
     * 게시판 목록
     * @param page
     * @return
     * @throws Exception
     */
    public List<BoardDTO> boardListService(PageVO page) throws Exception{
        return mBoardMapper.boardListService(page);
    }

    /**
     * 게시판 상세
     * @param bno
     * @return
     * @throws Exception
     */
    public BoardDTO boardDetailService(int bno) throws Exception{
        return mBoardMapper.boardDetail(bno);
    }

    /**
     * 게시판 작성
     * @param board
     * @throws Exception
     */
    public void boardInsertService(BoardDTO board) throws Exception{
        mBoardMapper.boardInsert(board);
    }

    /**
     * 게시판 수정
     * @param board
     * @return
     * @throws Exception
     */
    public int boardUpdateService(BoardDTO board) throws Exception{
        return mBoardMapper.boardUpdate(board);
    }

    /**
     * 게시판 삭제
     * @param bno
     * @return
     * @throws Exception
     */
    public boolean boardDeleteService(int bno) throws Exception{
        return mBoardMapper.boardDelete(bno);

    }
    /**
     * 게시판 총 목록
     * @return
     * @throws Exception
     */
    public int countBoardListTotal() throws Exception {
        return mBoardMapper.countBoardList();
    }

    /**
     * 게시판 조회수
     * @param bno
     * @return
     * @throws Exception
     */
    public boolean viewCntUpdate(int bno) throws Exception{
        return mBoardMapper.viewCntUpdate(bno);
    }
}
