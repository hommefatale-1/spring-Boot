package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.ProductService;
import com.google.gson.Gson;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	@RequestMapping("/productList.do")
	public String main(Model model) throws Exception {

		return "/product-list";
	}

	@RequestMapping("/productList2.do")
	public String main2(Model model) throws Exception {

		return "/product-list2";
	}

	@RequestMapping("/productList3.do")
	public String main3(Model model) throws Exception {

		return "/product-list3";
	}

	@RequestMapping("/productView.do")
	public String productView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/product-View";
	}

	@RequestMapping("/ProductAdd.do")
	public String ProductAdd(Model model) throws Exception {

		return "/product-Add";
	}
	
	@RequestMapping("/productModify.do")
	public String productModify(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/product-modify";
	}

	@RequestMapping(value = "/productList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardinsert(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.productList(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/productList2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productList2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.productTransInfo(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/productList3.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productList3(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.sellYn(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/productdelete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productdelete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.productDelete(map);
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/productView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.productSelect(map);
		return new Gson().toJson(resultMap);
	}
	

	@RequestMapping(value = "/productAdd.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.productInsert(map);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/productModify.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productModify(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.productSelect(map);
		return new Gson().toJson(resultMap);
	}
}
