package com.board.paging;

import com.board.domain.PageVO;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Pagination {
    private PageVO page;
    private int totalCount;
    private int startPage;
    private int endPage;
    private boolean prev;
    private boolean next;
    private int displayPageNum = 5; //화면 하단에 보여지는 페이지 버튼의 수


    public PageVO getPage() {
        return page;
    }

    public void setPage(PageVO page) {
        this.page = page;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        this.calcData();
    }

    private void calcData() {

        //제일 마지막 페이지
        endPage = (int) (Math.ceil(page.getPage() / (double) displayPageNum) * displayPageNum);


        startPage = (endPage - displayPageNum) + 1;
        if (startPage <= 0) startPage = 1;

        int tempEndPage = (int) (Math.ceil(totalCount / (double) page.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        prev = startPage != 1;
        next = endPage * page.getPerPageNum() < totalCount;

    }

    public int StartPage() {
        return startPage;
    }

    public void StartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public boolean isPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean isNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }

    public int getDisplayPageNum() {
        return displayPageNum;
    }

    public void setDisplayPageNum(int displayPageNum) {
        this.displayPageNum = displayPageNum;
    }


}
