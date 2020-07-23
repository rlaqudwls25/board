package com.board.controller;

import com.board.domain.BoardDTO;
import com.board.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.board.service.BoardService;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;

@Controller
public class BoardController {

    @Autowired
    BoardMapper mBoardMapper;


    @GetMapping(value = "/board/write")
    public String boardController() throws Exception {

        System.out.println(mBoardMapper.boardCount());
        return "write";

    }

}