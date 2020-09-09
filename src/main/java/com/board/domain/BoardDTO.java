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


/*** 게시판 리스트 */
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
   private String DEL_CHK;

   // 첨부파일 제목
   private String fileName;

   // 업로드 파일
   private MultipartFile uploadFile;

   // 조회수
   private int viewCnt;


}