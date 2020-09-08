package com.board.controller;


import com.board.domain.MemberVO;
import com.board.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import static java.awt.SystemColor.info;

/**
 * 회원가입 컨트롤러
 */
@Controller
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    MemberService service;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
        public void getRegister() throws Exception{

        }

        @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String postRegsiter(MemberVO vo) throws Exception{

        service.register(vo);

        return "/register";

        }

}
