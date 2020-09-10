package com.board.controller;


import com.board.domain.MemberVO;
import com.board.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/*** 회원가입 컨트롤러 */
@Controller
//@RequestMapping("/member/*")
public class MemberController
{

    private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    MemberService memberService;

        // 회원가입 get
        @RequestMapping(value = "/register", method = RequestMethod.GET)
        public void getRegister() throws Exception{
        Logger.info("get register");

        }
        // 회원가입 post
        @RequestMapping(value = "/register", method = RequestMethod.POST)
        public String postRegsiter(MemberVO vo) throws Exception{
            Logger.info("post register");

        memberService.register(vo);

        return "redirect:/list";

        }

        // 로그인
        @RequestMapping(value = "/login", method = RequestMethod.GET)
        public String login(MemberVO vo, HttpServletRequest request) throws Exception{
            Logger.info("post login");

            HttpSession session = request.getSession();

            MemberVO login = memberService.login(vo);

            if(login == null){
                session.setAttribute("member", null);
            }else{
                session.setAttribute("member", login);
            }
            return "redirect:/login";
        }

}
