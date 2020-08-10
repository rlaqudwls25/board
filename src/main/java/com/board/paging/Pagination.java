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

        //끝 페이지 번호 = (현재 페이지 번호 / 화면에 보여질 페이지 번호의 갯수) * 화면에 보여질 페이지 번호의 갯수)
        endPage = (int) (Math.ceil(page.getPage() / (double) displayPageNum) * displayPageNum);

        startPage = (endPage - displayPageNum) + 1;
        if (startPage <= 0) startPage = 1;


        int tempEndPage = (int) (Math.ceil(totalCount / (double) page.getPerPageNum()));
        if (endPage > tempEndPage) {
            endPage = tempEndPage;
        }

        prev = startPage != 1?false : true;
        next = endPage * page.getPerPageNum() > totalCount?true:false;

    }


}
