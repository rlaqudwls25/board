package com.board.domain;

import org.springframework.data.domain.Page;

public class PageVO {

    private int page;  //현재 페이지 번호
    private int perPageNum; //한 페이지당 보여줄 게시글의 수

    public int getPageStart() {
        return (this.page-1)*perPageNum;
    }

    public PageVO(){
        this.page = 1;
        this.perPageNum = 10;
    }

    public int getPage() {
        return page;
    }
    public void setPage(int page){
        if(page <= 0){
            this.page = 1;
        }else{
            this.page = page;
        }
    }

    public int getPerPageNum() {
        return perPageNum;
    }
    public void setPerPageNum(int pageCount){ //페이지당 보여줄 게시글 수 변함 X
        int cnt = this.perPageNum;
        if(pageCount != cnt){
            //pageCount = 페이지 카운트  cnt = 갯수
            this.perPageNum = cnt;
        }else{
            this.perPageNum = pageCount;
        }
    }


    public void setTotalCount(int i) {
    }
}
