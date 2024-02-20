package com.example.test1.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.test1.dao.BoardService;
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

	// 파일업로드
	@RequestMapping("/FileEx.do") // 주소
	public String FileEx(Model model) throws Exception {

		return "/upload"; // jsp웹파일
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

	// 파일 업로드
	@RequestMapping("/fileUpload.dox")
	public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("boardNo") int boardNo,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		String url = null;
		String path = "c:\\img";
		try {

			// String uploadpath = request.getServletContext().getRealPath(path);
			String uploadpath = path;
			String originFilename = multi.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			long size = multi.getSize();
			String saveFileName = genSaveFileName(extName);

			System.out.println("uploadpath : " + uploadpath);
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			String path2 = System.getProperty("user.dir");
			System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img");
			if (!multi.isEmpty()) {
				File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
				multi.transferTo(file);

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("BOARDNO", boardNo);
				map.put("path", "../img/");
				map.put("fileName", saveFileName);
				map.put("orgName", originFilename);
				map.put("fileSize", size);
				map.put("fileEts", extName);
				
				boardService.addBoardFile(map);
				// insert 쿼리 실행
				// testService.addBoardImg(map);

				model.addAttribute("filename", multi.getOriginalFilename());
				model.addAttribute("uploadPath", file.getAbsolutePath());

				return "redirect:list.do";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:list.do";
	}

	// 현재 시간을 기준으로 파일 이름 생성
	private String genSaveFileName(String extName) {
		String fileName = "";

		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(Calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;

		return fileName;
	}

}