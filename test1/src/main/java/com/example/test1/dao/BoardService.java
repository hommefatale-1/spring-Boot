package com.example.test1.dao;

import java.util.HashMap;

public interface BoardService {
//리턴은 무조건 HashMap<String, Object> 하기!!!
	// 게시글 목록
	HashMap<String, Object> selectBoardList(HashMap<String, Object> map);

	// 게시글 상세보기
	HashMap<String, Object> selectBoardInfo(HashMap<String, Object> map);

	// 게시글 삭제하기
	HashMap<String, Object> deleteBoardList(HashMap<String, Object> map);
}
