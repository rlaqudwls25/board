package com.board.controller;

import com.board.domain.BoardDTO;
import com.board.domain.PageVO;
import com.board.domain.CommentVO;
import com.board.paging.Pagination;
import com.board.service.BoardService;
import com.board.service.CommentService;
import com.mysql.cj.util.StringUtils;
import jdk.internal.instrumentation.Logger;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Slf4j
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
        model.addAttribute("board", mBoardService.viewCntUpdate(bno));

        //조회소 + 1
        mBoardService.viewCntUpdate(bno);

        return "detail";
    }

    @RequestMapping(value = "/insert",method = {RequestMethod.GET, RequestMethod.POST})
    public String boardInsertForm() throws Exception {

        return "insert";
    }

    @RequestMapping(value = "/insertProc",method = {RequestMethod.GET, RequestMethod.POST})
    public String boardInsertProc(HttpServletRequest request, BoardDTO dto) throws Exception{

        BoardDTO board = new BoardDTO();

//        board.setSubject(request.getParameter("subject"));
//        board.setContent(request.getParameter("content"));
//        board.setWriter(request.getParameter("writer"));
//        board.setDEL_CHK(request.getParameter("DEL_CHK"));
//
        //mBoardService.boardInsertService(board);

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

//    @RequestMapping(value = "/{bno}")
//    public String viewCntUpdate(HttpServletResponse response, HttpServletRequest request, @PathVariable int bno, Model model) throws Exception {
//        저장된 쿠키 불러오기
//        Cookie cookies[] = request.getCookies();
//        Map mapCookie = new HashMap();
//
//        if(request.getCookies() != null){
//            for(int i=0; i<cookies.length; i++){
//                Cookie obj = cookies[i];
//                mapCookie.put(obj.getName(), obj.getValue());
//            }
//        }
//         저장된 쿠키중에 viewCnt만 불러오기
//        String cookie_viewCnt = (String) mapCookie.get("viewCnt");
//        저장된 새로운 쿠키값 생성
//        String new_cookie_viewCnt = "|" + bno;
//
//        저장된 쿠키에 새로운 쿠키값이 존재하는 지 검사
//        if(StringUtils.indexOfIgnoreCase(cookie_viewCnt, new_cookie_viewCnt) == -1){
//            없을 경우 쿠키 생성
//            Cookie cookie = new Cookie("viewCnt", cookie_viewCnt + new_cookie_viewCnt);
//            response.addCookie(cookie);
//
//            조회수 업데이트
//            mBoardService.viewCntUpdate(bno);
//
//        }
//        boolean object = mBoardService.viewCntUpdate(bno);
//        model.addAttribute("object", object);
//        return "list";
//
//    }



}