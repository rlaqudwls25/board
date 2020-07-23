package com.board.service;

import java.util.List;

import com.board.domain.BoardDTO;
import org.springframework.stereotype.Service;

@Service
public interface BoardService {
    public boolean registerBoard(BoardDTO params);

    public BoardDTO getBoardDetail(Long idx);

    public boolean deleteBoard(Long idx);

    public List<BoardDTO> getBoardList();

}
