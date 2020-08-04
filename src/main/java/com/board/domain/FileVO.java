package com.board.domain;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class FileVO {

    private int fno;
    private int bno;
    private String fileName;     //저장할 파일
    private String fileOriName;  //실제 파일
    private String fileUrl;

    public int fno(){
        return fno;
    }

    public void fno(int fno){
        this.fno = fno;
    }



}
