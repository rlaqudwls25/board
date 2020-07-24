package com.board.domain;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Getter
@Setter
public class BoardDTO {

   private int bno;
   private String subject;
   private String content;
   private String writer;
   private Data reg_date;

}