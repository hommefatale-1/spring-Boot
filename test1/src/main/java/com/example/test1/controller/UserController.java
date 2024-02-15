package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.UserService;
import com.google.gson.Gson;

@Controller

public class UserController {
	@Autowired
	UserService userService;

	@Autowired
	HttpSession session;

	@RequestMapping("/main.do")
	public String main(Model model) throws Exception {

		return "/main"; // jsp웹파일
	}

//회원정보수정	페이지
	@RequestMapping("/user/edit.do")
	public String edit(Model model) throws Exception {
		System.out.println(session.getAttribute("userId"));
		return "/user-edit"; // jsp웹파일
	}

//로그인 페이지	
	@RequestMapping("/login.do")
	public String login(Model model) throws Exception {

		return "/login"; // jsp웹파일
	}

	@RequestMapping("/join.do")
	public String join(Model model) throws Exception {

		return "/join"; // jsp웹파일
	}

	@RequestMapping("/selectUser.do")
	public String selectUser(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/select-user"; // jsp웹파일
	}

	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.searchUser(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/join.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String join(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.joinUser(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/Check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String Check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.checkUser(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/selectUser.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.searchEditUser(map);
		return new Gson().toJson(resultMap);
	}
}