package com.board.mapper;


import com.board.domain.BoardDTO;
import com.board.domain.PageVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/*** 게시판 Mapper */
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
     * 게시판 상세
     * @param bno
     * @return
     * @throws Exception
     */
    public BoardDTO boardDetail(int bno) throws Exception;
    /**
     * 게시판 작성
     * @param board
     * @throws Exception
     */
    public void boardInsert(BoardDTO board) throws Exception;
    /**
     * 게시판 수정
     * @param board
     * @return
     * @throws Exception
     */
    public int boardUpdate(BoardDTO board) throws Exception;

    /** 게시글 삭제
     * @return*/
    public boolean boardDelete(int bno) throws Exception;
    /**
     *
     * @param page
     * @return
     * @throws Exception
     */
    public List<BoardDTO> boardListService(PageVO page) throws Exception;


    /**
     * 조회수
     * @param bno
     * @return
     * @throws Exception
     */
    public boolean viewCntUpdate(int bno) throws Exception;
}

