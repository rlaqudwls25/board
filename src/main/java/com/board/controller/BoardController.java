package com.board.controller;

import com.board.domain.BoardDTO;
import com.board.domain.PageVO;
import com.board.domain.CommentVO;
import com.board.paging.Pagination;
import com.board.service.BoardService;
import com.board.service.CommentService;
import com.mysql.cj.util.StringUtils;
import com.sun.media.jfxmedia.logging.Logger;
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
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;


/**
 * 게시판 컨트롤러
 */
@Slf4j
@Controller
public class BoardController {

    @Autowired
    BoardService mBoardService;
    @Autowired
    CommentService mCommentService;

    /**
     * 게시판 리스트
     * @param page
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/list", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView boardList(PageVO page, Model model) throws Exception {

        ModelAndView mav = new ModelAndView("/list");
        Pagination pagination = new Pagination();

        pagination.setPage(page);
        pagination.setTotalCount(100);

        pagination.setTotalCount(mBoardService.countBoardListTotal());
        List<BoardDTO> list = mBoardService.boardListService(page);

        model.addAttribute("replyVO", new CommentVO());
        mav.addObject("list", list);
        mav.addObject("pagination", pagination);

        return mav;
    }

    /**
     * 게시판 상세
     * @param bno
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/detail/{bno}", method = {RequestMethod.GET, RequestMethod.POST})
    public String boardDetail(@PathVariable int bno, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        model.addAttribute("detail", mBoardService.boardDetailService(bno));
        model.addAttribute("board", mBoardService.viewCntUpdate(bno));

        Cookie cookies[] = request.getCookies();
        Map mapCookie = new HashMap();
        if(request.getCookies() != null){
            for(int i=0; i<cookies.length; i++) {
                Cookie obj = cookies[i];
                mapCookie.put(obj.getName(),obj.getValue());
            }
        }

        // 저장된 쿠키중에 viewCnt만 불러오기
        String cookie_viewCnt = (String) mapCookie.get("viewCnt");
        // 저장될 새로운 쿠키값 생성
        String new_cookie_viewCnt = "|" + bno;

        if(StringUtils.indexOfIgnoreCase(cookie_viewCnt, new_cookie_viewCnt) == -1){
            Cookie cookie = new Cookie("viewCnt", cookie_viewCnt + new_cookie_viewCnt);
            response.addCookie(cookie);

            BoardDTO board = mBoardService.boardDetailService(bno);

        }
        return "detail";
    }

    /**
     * 게시판 작성
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insert", method = {RequestMethod.GET, RequestMethod.POST})
    public String boardInsertForm() throws Exception {


        return "insert";
    }

    /**
     * 게시판 작성
     * @param request
     * @param dto
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/insertProc", method = {RequestMethod.GET, RequestMethod.POST})
    public String boardInsertProc(BoardDTO dto) throws Exception {

        BoardDTO board = new BoardDTO();

        String fileName = null;
        MultipartFile uploadFile = dto.getUploadFile();

        // 확장자 구하기
        if (!uploadFile.isEmpty()) {
            String originalFileName = uploadFile.getOriginalFilename();
            String ext = FilenameUtils.getExtension(originalFileName);

            // uuid 구하기
            UUID uuid = UUID.randomUUID();
            fileName = uuid + "." + ext;
            uploadFile.transferTo(new File("C:\\upload\\" + fileName));
        }
        dto.setFileName(fileName);

        mBoardService.boardInsertService(dto);

        return "redirect:/list";
    }

    /**
     * 게시판 수정
     * @param bno
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/update/{bno}", method = {RequestMethod.GET, RequestMethod.POST})
    public String boardUpdateForm(@PathVariable int bno, Model model) throws Exception {

        model.addAttribute("detail", mBoardService.boardDetailService(bno));

        return "update";
    }

    /**
     * 게시판 수정
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/updateProc", method = {RequestMethod.GET, RequestMethod.POST})
    public String boardUpdateProc(HttpServletRequest request) throws Exception {

        BoardDTO board = new BoardDTO();
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setBno(Integer.parseInt(request.getParameter("bno")));

        mBoardService.boardUpdateService(board);

        return "redirect:/detail/" + request.getParameter("bno");

    }

    /**
     * 게시판 삭제
     * @param bno
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/delete/{bno}", method = RequestMethod.GET)
    public String boardDelete(@PathVariable int bno) throws Exception {
        mBoardService.boardDeleteService(bno);
        mCommentService.commentDeleteServiceBno(bno);

        return "redirect:/list";
    }

//    @RequestMapping(value = "/write", method = RequestMethod.GET)
//    public void getWrite(HttpSession session, Model model) throws Exception{
//        Logger.info
//    }
}