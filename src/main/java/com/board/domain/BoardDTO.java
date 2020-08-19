package com.board.domain;

import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.annotations.MapKey;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
// 데이터 전달 목적
public class BoardDTO {
/** Controller 와 service 간에 주고 받을 객체 정의 */

   private int bno;
   private String subject;
   private String content;
   private String writer;
   private LocalDateTime regDate;
   private String DEL_CHK;
   private String fileName;
   private MultipartFile uploadFile;
   private int viewCnt;


}