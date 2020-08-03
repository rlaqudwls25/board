package com.board.controller;

import com.board.domain.BoardDTO;
import com.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;


@Controller
public class BoardController {

    @Autowired
    BoardService mBoardService;


    @RequestMapping(value = "/write",method = {RequestMethod.GET, RequestMethod.POST})
    public String boardList(Model model) throws Exception {
       model.addAttribute("write", mBoardService.boardListService());
        return "write";

    }

    @RequestMapping(value = "/detail/{bno}",method = {RequestMethod.GET, RequestMethod.POST})
    public String boardDetail(@PathVariable int bno, Model model) throws Exception{

        model.addAttribute("detail", mBoardService.boardDetailService(bno));

        return "detail";
    }

    @RequestMapping(value = "/insert",method = {RequestMethod.GET, RequestMethod.POST})
    public String boardInsertForm() {
        return "insert";
    }

    @RequestMapping(value = "/insertProc",method = {RequestMethod.GET, RequestMethod.POST})
    public String boardInsertProc(HttpServletRequest request) throws Exception{

        BoardDTO board = new BoardDTO();

        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setWriter(request.getParameter("writer"));

        mBoardService.boardInsertService(board);

        return "redirect:/write";
    }

    @RequestMapping(value = "/update/{bno}",method = {RequestMethod.GET, RequestMethod.POST})
    public String boardUpdateForm(@PathVariable int bno, Model model) throws Exception{


        model.addAttribute("detail", mBoardService.boardDetailService(bno));

        return "update";
    }

    @RequestMapping(value = "/updateProc",method = {RequestMethod.GET, RequestMethod.POST})
    public String boardUpdateProc(HttpServletRequest request) throws Exception{

        BoardDTO board = new BoardDTO();
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setBno(Integer.parseInt(request.getParameter("bno")));

        mBoardService.boardUpdateService(board);

        return "redirect:/detail/"+request.getParameter("bno");

    }

    @RequestMapping(value = "/delete/{bno}")
    public String boardDelete(@PathVariable int bno) throws Exception{

        mBoardService.boardDeleteService(bno);

        return "redirect:boardList";
    }


}