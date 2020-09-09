package com.board.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;


/*** 파일 다운로드 컨트롤러 */
@Controller
public class FileDownController {
    /**
     * 파일 다운로드
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping(value = "fileDownload.do")
    public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception{
        String filename = request.getParameter("fileName");
        String realFilename="";

        // 파일 인코딩
        try{
            String browser = request.getHeader("User-Agent");
            if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
                filename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
            }else {
                filename = new String(filename.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
            }
        }catch (UnsupportedEncodingException ex){
            System.out.println("UnsupportedEncodingException");
        }
        realFilename = "C:\\upload\\" + filename;
        System.out.println(realFilename);
        File file1 = new File(realFilename);
        if(!file1.exists()){
            return;
        }

        // 파일명 저장
        response.setContentType("application/octer-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");


        // 파일 크기 저장
        try{
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream(realFilename);

            int count = 0;
            byte[] bytes = new byte[512];

            while ((count = fis.read(bytes)) != -1){
                os.write(bytes, 0, count);
            }
            fis.close();
            os.close();
        }catch (Exception e){
            System.out.println("FileNotFoundException : " + e);
        }
    }
}

