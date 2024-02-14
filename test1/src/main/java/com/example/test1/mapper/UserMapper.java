package com.example.test1.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.User;

@Mapper
public interface UserMapper {
	User selectUser(HashMap<String, Object> map);	//로그인

	void insertUser(HashMap<String, Object> map);	//회원가입	

}
