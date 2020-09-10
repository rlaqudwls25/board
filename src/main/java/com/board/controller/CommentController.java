package com.board.controller;

import com.board.domain.CommentVO;
import com.board.service.BoardService;
import com.board.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

/*** 댓글 컨트롤러 */
@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    CommentService mCommentService;

    /**
     * 댓글 리스트
     * @param model
     * @return
     * @throws Exception
     */
    @RequestMapping("/list")
    @ResponseBody
    private List<CommentVO> mCommentServiceList(Model model, int bno) throws Exception{
        return mCommentService.commentListService(bno);
    }

    /**
     * 댓글 작성
     * @param
     * @param content
     * @return
     * @throws Exception
     */
    @RequestMapping("/insert")
    @ResponseBody
    private int mCommentServiceInsert(@RequestParam int bno, @RequestParam String content) throws Exception{
        CommentVO comment = new CommentVO();

        comment.setBno(bno);
        comment.setContent(content);
        comment.setRegid("test");

        return mCommentService.commentInsertService(comment);
    }

    /**
     * 댓글 수정
     * @param rid
     * @param content
     * @return
     * @throws Exception
     */
    @RequestMapping("/update")
    @ResponseBody
    private int mCommentServiceUpdateProc(@RequestParam int rid, @RequestParam String content) throws Exception{

        CommentVO comment = new CommentVO();
        comment.setRid(rid);
        comment.setContent(content);

        return mCommentService.commentUpdateService(comment);

    }

    /**
     * 댓글 삭제
    * @param rid
     * @return
     * @throws Exception
     */
    @RequestMapping("/delete/{rid}")
    @ResponseBody
    private int mCommentServiceDeleteRid(@PathVariable int rid) throws Exception{

        return mCommentService.commentDeleteServiceRid(rid);
    }
}
