package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;

@Mapper
public interface BoardMapper {
	// 게시글 목록
	List<Board> selectBoardList(HashMap<String, Object> map);

	// 게시글 상세보기
	Board selectBoardInfo(HashMap<String, Object> map);

	// 게시글 삭제
	void deleteBoard(HashMap<String, Object> map);

	// 게시글 조회수 증가
	void updateHit(HashMap<String, Object> map);

	// 게시글 작성
	void insertBoard(HashMap<String, Object> map);
}
