package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.BoardService;
import com.example.test1.dao.SampleService;
import com.example.test1.model.Student;
import com.google.gson.Gson;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	// 게시글 목록
	@RequestMapping("/boardList.do") // 주소
	public String boardList(Model model) throws Exception {

		return "/board-list"; // jsp웹파일
	}

	// 게시글 상세보기
	@RequestMapping("/boardView.do")
	public String boardView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/board-view";
	}

	// 게시글 작성하기
	@RequestMapping("/boardAdd.do")
	public String boardAdd(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/board-add";
	}

	// 게시글 수정하기
	@RequestMapping("/updateBoard.do")
	public String updateBoard(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/update-Board";
	}

	// 게시글 목록
	@RequestMapping(value = "/board.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String board(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.selectBoardList(map);
		return new Gson().toJson(resultMap);
	}

	// 게시글 상세보기
	@RequestMapping(value = "/boardDetail.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardDetail(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.selectBoardInfo(map);
		return new Gson().toJson(resultMap);
	}

	// 게시글 삭제하기
	@RequestMapping(value = "/boardDelete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardDelete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.deleteBoardList(map);
		return new Gson().toJson(resultMap);
	}

	// 게시글 작성하기
	@RequestMapping(value = "/boardAdd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.addBoardList(map);
		return new Gson().toJson(resultMap);
	}

	// 게시글 수정하기
	@RequestMapping(value = "/boardUdate.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardUdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.updateBoardAdd(map);
		return new Gson().toJson(resultMap);
	}

	// 댓글 달기
	@RequestMapping(value = "/boardComment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardComment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.addComment(map);
		return new Gson().toJson(resultMap);
	}

	// 댓글 수정시 저장
	@RequestMapping(value = "/editComment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editComment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = boardService.editComment(map);
		return new Gson().toJson(resultMap);
	}

}