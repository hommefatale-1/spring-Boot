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

	// 게시글 작성하기
	HashMap<String, Object> addBoardList(HashMap<String, Object> map);

	// 게시글 수정
	HashMap<String, Object> updateBoardAdd(HashMap<String, Object> map);

	// 댓글 작성
	HashMap<String, Object> addComment(HashMap<String, Object> map);
	
	//댓글 수정
	HashMap<String, Object> editComment(HashMap<String, Object> map);
	
}
