package com.board.paging;

import com.board.domain.PageVO;
import lombok.Getter;
import lombok.Setter;


/**
 * 페이징
 */
@Getter
@Setter
public class Pagination {

    // 현재 페이지 번호
    private PageVO page;

    // 총 페이지 수
    private int totalCount;

    // 시작 페이지
    private int startPage;

    // 끝 페이지
    private int endPage;

    // 이전 페이지
    private boolean prev;

    // 다음 페이지
    private boolean next;

    // 화면 하단에 보여지는 페이지 버튼의 수
    private int displayPageNum = 5;


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

    /**
     * 끝 페이지 번호
     */
    private void calcData() {

        endPage = (int) (Math.ceil(page.getPage() / (double) displayPageNum) * displayPageNum);

        startPage = (endPage - displayPageNum) + 1;
        if (startPage <= 0) startPage = 1;


        int tempEndPage = (int) (Math.ceil(totalCount / (double) page.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }
        prev = startPage == 1?false : true;
        next = endPage * page.getPerPageNum() < totalCount?true:false;
    }
}
