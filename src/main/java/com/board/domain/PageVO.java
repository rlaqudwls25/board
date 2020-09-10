package com.board.domain;


/*** 페이지 리스트*/
public class PageVO {

    // 현재 페이지 번호
    private int page;

    // 한 페이지당 보여줄 게시글의 수
    private int perPageNum;

    public int getPageStart() {
        return (this.page - 1) * perPageNum;
    }

    public PageVO() {
        this.page = 1;
        this.perPageNum = 10;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        if (page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }
    }

    public int getPerPageNum() {
        return perPageNum;
    }

    public void setPerPageNum(int pageCount) {
        int cnt = perPageNum;
        if (pageCount != cnt) {
            perPageNum = cnt;
        } else {
            perPageNum = pageCount;
        }
    }

}