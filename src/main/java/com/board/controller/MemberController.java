package com.board.controller;


import com.board.domain.MemberVO;
import com.board.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 회원가입 컨트롤러
 */
@Controller
public class MemberController {

    private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    MemberService memberService;

    /**
     * 회원가입 get
     * @throws Exception
     */
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String getRegister() throws Exception {
        Logger.info("get register");

        return "/register";
    }

    /**
     * 회원가입 post
     * @param vo
     * @return
     * @throws Exception
     */

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String postRegsiter(MemberVO vo) throws Exception {
        Logger.info("post register");

        String inputPass = vo.getUserpass();

        memberService.register(vo);

        return "redirect:/list";
    }

    /**
     * 회원가입 중복
     * @param request
     * @return
     * @throws Exception
     */
    @ResponseBody
    @RequestMapping(value = "/idcheck" , method = RequestMethod.POST)
    public int postIdcheck(HttpServletRequest request) throws Exception{
        Logger.info("post idcheck");

        String userid = request.getParameter("userid");
        MemberVO idcheck = memberService.idcheck(userid);

        int result = 0;

        if(idcheck != null){
            result = 1;
        }
        return result;
    }

    /**
     * 
     * @param vo
     * @param request
     * @return
     * @throws Exception
     */
//    @RequestMapping(value = "/login", method = {RequestMethod.GET})
//    public String getLogin(MemberVO vo, HttpServletRequest request) throws Exception{
//        Logger.info("get login");
//
//        HttpSession session = request.getSession();
//
//        MemberVO login = memberService.login(vo);
//
//        if(login == null) {
//            session.setAttribute("member", null);
//        }else{
//            session.setAttribute("member", login);
//        }
//        return "/login";
//    }

    /**
     * 로그인 post
     * @param vo
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/login", method = {RequestMethod.POST, RequestMethod.GET})
    public String postLogin(MemberVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
        Logger.info("post login");

            HttpSession session = request.getSession();

            if(request.getMethod().equals("GET")){
                if(session.getAttribute("member") == null){
                    session.setAttribute("msg", null);
                }
            }

            if(request.getMethod().equals("POST")) {
                MemberVO login = memberService.login(vo);

                if (login == null) {
                    session.setAttribute("member", null);
                    session.setAttribute("msg", false);
                } else {
                    session.setAttribute("member", login);
                    session.setAttribute("msg", true);
                }
            }
            return "/login";
        }

    /**
     * 로그아웃
      * @param session
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception{
        Logger.info("get logout");

        session.invalidate();

        return "redirect:/list";
    }

    /**
     * 회원정보 수정 get
     * @throws Exception
     */
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public void getModify() throws Exception{
        Logger.info("get modify");
    }

    /**
     * 회원정보 수정 post
     * @throws Exception
     */
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String postModify(HttpSession session, MemberVO vo) throws Exception{

        Logger.info("post modify");
        MemberVO a = (MemberVO)session.getAttribute("member");

        vo.setUserid(a.getUserid());
        memberService.modify(vo);

        session.invalidate();

        return "/list";

    }

    /**
     * 회원 탈퇴
     * @throws Exception
     */
    @RequestMapping(value = "/withdraw", method = RequestMethod.GET)
    public void getWithdraw() throws Exception{
        Logger.info("get withdraw");
    }


}
