package com.example.test1.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;

//게시글 리스트 보기
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
		Board board = boardMapper.selectBoardInfo(map);
		resultMap.put("info", board);
		resultMap.put("result", "success");
		return resultMap;
	}

//게시글 삭제
	@Override
	public HashMap<String, Object> deleteBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

}
