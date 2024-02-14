package com.example.test1.dao;

import java.util.HashMap;

import com.example.test1.model.User;

public interface UserService {

	HashMap<String, Object> searchUser(HashMap<String, Object> map); // 로그인

	void joinUser(HashMap<String, Object> map); // 회원가입

	HashMap<String, Object> checkUser(HashMap<String, Object> map); // 아이디 중복확인

	HashMap<String, Object> searchEditUser(HashMap<String, Object> map);
}
