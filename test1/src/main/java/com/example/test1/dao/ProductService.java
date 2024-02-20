package com.example.test1.dao;

import java.util.HashMap;

public interface ProductService {

	HashMap<String, Object> productList(HashMap<String, Object> map);

	HashMap<String, Object> productTransInfo(HashMap<String, Object> map);
	
	HashMap<String, Object> sellYn(HashMap<String, Object> map);
	
	HashMap<String, Object> productDelete(HashMap<String, Object> map);
	
	HashMap<String, Object> productInsert(HashMap<String, Object> map);
	
	HashMap<String, Object> productSelect(HashMap<String, Object> map);
}
