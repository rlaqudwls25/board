package com.board.service;

import java.util.List;

import com.board.domain.BoardDTO;
import com.board.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class BoardService {

    @Autowired
    BoardMapper mBoardMapper;

    public List<BoardDTO> boardListService() throws Exception{

        return mBoardMapper.boardList();
    }

    public BoardDTO boardDetailService(int bno) throws Exception{

        return mBoardMapper.boardDetail(bno);
    }

    public int boardInsertService(BoardDTO board) throws Exception{

        return mBoardMapper.boardInsert(board);
    }

    public int boardUpdateService(BoardDTO board) throws Exception{

        return mBoardMapper.boardUpdate(board);
    }

    public int boardDeleteService(int bno) throws Exception{

        return mBoardMapper.boardDelete(bno);
    }


}
