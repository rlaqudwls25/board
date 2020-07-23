package com.board.mapper;


import com.board.domain.BoardDTO;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface BoardMapper {

    public int boardCount() throws Exception;
}
