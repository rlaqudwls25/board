package com.board.mapper;


import com.board.domain.BoardDTO;
import com.board.domain.PageVO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface BoardMapper {


    /** 게시글 개수 */
    public int boardCount() throws Exception;

    /** 게시글 목록
     * @param page*/
    public List<BoardDTO> boardList(PageVO page) throws Exception;

    /** 게시글 상세 */
    public BoardDTO boardDetail(int bno) throws Exception;

    /** 게시글 작성 */
    public void boardInsert(BoardDTO board) throws Exception;

    /** 게시글 수정 */
    public int boardUpdate(BoardDTO board) throws Exception;

    /** 게시글 삭제
     * @return*/
    public boolean boardDelete(int bno) throws Exception;

     public int countBoardList() throws Exception;
}
