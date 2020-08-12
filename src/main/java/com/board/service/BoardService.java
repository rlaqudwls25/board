package com.board.service;

import java.util.List;

import com.board.domain.BoardDTO;
import com.board.domain.PageVO;
import com.board.domain.CommentVO;
import com.board.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class BoardService {

    @Autowired
    BoardMapper mBoardMapper;


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
     *
     * @param board
     * @throws Exception
     */
    public void boardInsertService(BoardDTO board) throws Exception{

        mBoardMapper.boardInsert(board);
    }

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


}
