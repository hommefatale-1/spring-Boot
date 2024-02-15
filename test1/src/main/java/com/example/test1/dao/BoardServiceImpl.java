package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;
import com.example.test1.model.Comment;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;

//게시글 목록 보기
	@Override
	public HashMap<String, Object> selectBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Board> list = boardMapper.selectBoardList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		return resultMap;
	}

//게시글 상세보기
	@Override
	public HashMap<String, Object> selectBoardInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		// 조회수 증가
		String str = (String) map.get("str");
		if (str.equals("new")) {
			boardMapper.updateHit(map);
		}

		// 조회수 증가하기
		// boardMapper.updateHit(map);
		// 게시글 상세 조회
		Board board = boardMapper.selectBoardInfo(map);
		resultMap.put("info", board);
		// 게시글 상세보기에 댓글나오기
		List<Comment> commentList = boardMapper.selectCommentList(map);
		resultMap.put("commentList", commentList);
		resultMap.put("result", "success");
		return resultMap;
	}

	// 게시글 삭제
	@Override
	public HashMap<String, Object> deleteBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.deleteBoard(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 게시글 작성
	@Override
	public HashMap<String, Object> addBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.insertBoard(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");

		}
		return resultMap;
	}

	// 게시글 수정
	@Override
	public HashMap<String, Object> updateBoardAdd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.updateBoard(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 댓글 달기
	@Override
	public HashMap<String, Object> addComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			// 성공시
			boardMapper.insertComment(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			// 실패시
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 댓글 수정
	@Override
	public HashMap<String, Object> editComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			boardMapper.updateComment(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

}
