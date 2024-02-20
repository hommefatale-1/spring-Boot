package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Product;

@Mapper
public interface ProductMapper {

	List<Product> selectProductList(HashMap<String, Object> map);

	List<Product> selectProductTransInfo(HashMap<String, Object> map);

	List<Product> selectsellYnList(HashMap<String, Object> map);

	void deleteProduct(HashMap<String, Object> map);
	
	void insertProduct(HashMap<String, Object> map);
	
	Product selectProductDetail(HashMap<String, Object> map);
}
