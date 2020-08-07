package com.board.controller;

import com.board.domain.BoardDTO;
import com.board.domain.PageVO;
import com.board.paging.Pagination;
import com.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class BoardController {

    @Autowired
    BoardService mBoardService;


    @RequestMapping(value = "/list",method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardList(PageVO page) throws Exception {


        ModelAndView mav = new ModelAndView("/list") ;
        Pagination pagination = new Pagination();

       pagination.setPage(page);
       pagination.setTotalCount(100);

       pagination.setTotalCount(mBoardService.countBoardListTotal());
       List<BoardDTO> list = mBoardService.boardListService(page);
       mav.addObject("list",list);
       mav.addObject("pagination",pagination);

       return mav;

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
        board.setDEL_CHK(request.getParameter("DEL_CHK"));

        mBoardService.boardInsertService(board);

        return "redirect:/list";
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

    @RequestMapping(value = "/delete/{bno}", method = RequestMethod.GET)
    public String boardDelete(@PathVariable int bno) throws Exception{


        mBoardService.boardDeleteService(bno);

        return "redirect:/list";
    }
}