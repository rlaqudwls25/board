package com.board.domain;

import java.time.LocalDateTime;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Text;


/**
 * 게시판 리스트
 */
@Getter
@Setter
public class BoardDTO {

   // 게시글 번호
   private int bno;

   // 게시글 제목
   private String subject;

   // 게시글 내용
   private String content;

   // 작성자
   private String writer;

   // 작성 시간
   private LocalDateTime regDate;

   // 삭제 체크
   private String delChk;

   // 첨부파일 제목
   private String fileName;

   // 업로드 파일
   private MultipartFile uploadFile;

   // 조회수
   private int viewCnt;

   // 최근 게시물
   private boolean recent;

   public boolean isRecent() {
      this.recent = true;
      LocalDateTime currentTime = LocalDateTime.now();
      if (regDate.getHour() - currentTime.getHour() < 24) {
         return this.recent = true;
      } else {
         return this.recent = false;
      }
   }

   //제목 확인
   private boolean subChk;

   public boolean isSubChk(){
      this.subChk = true;
      if(subject == null){
         return this.subChk = true;
      }else{
         return this.subChk = false;
      }
   }


   //내용 확인
}

