package com.board.controller;

import com.board.domain.BoardDTO;
import com.board.domain.PageVO;
import com.board.domain.CommentVO;
import com.board.paging.Pagination;
import com.board.service.BoardService;
import com.board.service.CommentService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.UUID;


@Controller
public class BoardController {

    @Autowired
    BoardService mBoardService;
    @Autowired
    CommentService mCommentService;


    @RequestMapping(value = "/list",method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardList(PageVO page,Model model) throws Exception {


        ModelAndView mav = new ModelAndView("/list") ;
        Pagination pagination = new Pagination();

       pagination.setPage(page);
       pagination.setTotalCount(100);

       pagination.setTotalCount(mBoardService.countBoardListTotal());
       List<BoardDTO> list = mBoardService.boardListService(page);

       model.addAttribute("replyVO", new CommentVO());
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
    public String boardInsertForm() throws Exception {

        return "insert";
    }

    @RequestMapping(value = "/insertProc",method = {RequestMethod.GET, RequestMethod.POST})
    public String boardInsertProc(HttpServletRequest request, BoardDTO dto) throws Exception{

        BoardDTO board = new BoardDTO();

        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setWriter(request.getParameter("writer"));
        board.setDEL_CHK(request.getParameter("DEL_CHK"));

        mBoardService.boardInsertService(board);

        String fileName = null;
        MultipartFile uploadFile = dto.getUploadFile();

        /**
         * 확장자 구하기
         */
        if(!uploadFile.isEmpty()) {
            String originalFileName = uploadFile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName);

            /**
             * uuid 구하기
             */
            UUID uuid = UUID.randomUUID();
            fileName = uuid+"."+ext;
            uploadFile.transferTo(new File("C:\\upload\\" + fileName));
        }
        dto.setFileName(fileName);
        mBoardService.boardInsertService(dto);


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
        mCommentService.commentDeleteServiceBno(bno);

        return "redirect:/list";
    }




}