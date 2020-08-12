package com.board.mapper;


import com.board.domain.BoardDTO;
import com.board.domain.PageVO;
import com.board.domain.CommentVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BoardMapper {

    public int countBoardListTotal();
    /**
     * 게시글 갯수
     * @return
     * @throws Exception
     */
    public int countBoardList() throws Exception;

    /** 게시글 목록
     * @param page*/
    public List<BoardDTO> boardList(PageVO page) throws Exception;
    /**
     * @param bno
     * @return
     * @throws Exception
     */
    public BoardDTO boardDetail(int bno) throws Exception;
    /**
     * @param board
     * @throws Exception
     */
    public void boardInsert(BoardDTO board) throws Exception;
    /**
     * @param board
     * @return
     * @throws Exception
     */
    public int boardUpdate(BoardDTO board) throws Exception;

    /** 게시글 삭제
     * @return*/
    public boolean boardDelete(int bno) throws Exception;
    /**
     * @param page
     * @return
     * @throws Exception
     */
    public List<BoardDTO> boardListService(PageVO page) throws Exception;



}

