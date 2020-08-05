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

   public int getBno() {
      return bno;
   }

   public void setBno(int bno){
      this.bno = bno;
   }

   public String getSubject() {
      return subject;
   }

   public void setSubject(String subject){
      this.subject = subject;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content){
      this.content = content;
   }

   public String getwriter() {
      return writer;
   }

   public void setWriter(String writer){
      this.writer = writer;
   }

   public int countBoardList() {

      return (Integer) selectOne("board.countBoardList");
   }

}