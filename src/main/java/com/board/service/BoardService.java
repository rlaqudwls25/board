package com.board.service;

import java.util.List;

import com.board.domain.BoardDTO;
import com.board.domain.PageVO;
import com.board.mapper.BoardMapper;
import com.board.mapper.CommentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BoardService {

    @Autowired
    BoardMapper mBoardMapper;
    @Autowired
    CommentMapper mCommentMapper;

    /**
     *
     * @param page
     * @return
     * @throws Exception
     */
    public List<BoardDTO> boardListService(PageVO page) throws Exception{

        return mBoardMapper.boardListService(page);
    }

    /**
     *
     * @param bno
     * @return
     * @throws Exception
     */
    public BoardDTO boardDetailService(int bno) throws Exception{

        return mBoardMapper.boardDetail(bno);
    }

    /**
     *aa
     * @param board
     * @throws Exception
     */
    public void boardInsertService(BoardDTO board) throws Exception{

        mBoardMapper.boardInsert(board);
    }

    /**
     *
     * @param bno
     * @return
     * @throws Exception
     */

    /**
     *
     * @param board
     * @return
     * @throws Exception
     */
    public int boardUpdateService(BoardDTO board) throws Exception{

        return mBoardMapper.boardUpdate(board);
    }

    /**
     *
     * @param bno
     * @return
     * @throws Exception
     */
    public boolean boardDeleteService(int bno) throws Exception{

        return mBoardMapper.boardDelete(bno);

    }

    /**
     *
     * @return
     * @throws Exception
     */
    public int countBoardListTotal() throws Exception {
        return mBoardMapper.countBoardList();
    }

    public BoardDTO viewCnt(int bno) throws Exception {
        return mBoardMapper.viewCntUpdate(bno);

    }


}
