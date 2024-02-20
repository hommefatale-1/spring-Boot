package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.ProductMapper;
import com.example.test1.model.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductMapper productMapper;

	@Override
	public HashMap<String, Object> productList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> Product = new HashMap<String, Object>();

		try {
			List<Product> list = productMapper.selectProductList(map);
			Product.put("list", list);
			Product.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			Product.put("result", "fail");
		}

		return Product;
	}

	@Override
	public HashMap<String, Object> productTransInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();

		try {
			List<Product> list = productMapper.selectProductTransInfo(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> sellYn(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			List<Product> list = productMapper.selectsellYnList(map);
			resultMap.put("list", list);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

//제품삭제
	@Override
	public HashMap<String, Object> productDelete(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			productMapper.deleteProduct(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	// 제품추가하기
	@Override
	public HashMap<String, Object> productInsert(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			productMapper.insertProduct(map);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}

		return resultMap;
	}
	//상세보기
	@Override
	public HashMap<String, Object> productSelect(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			Product product = productMapper.selectProductDetail(map);
			resultMap.put("list", product);
			resultMap.put("result", "success");
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			resultMap.put("result", "fail");
		}

		return resultMap;
	}

}
