package com.example.test1.dao;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
import com.example.test1.model.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	HttpSession session;

	public HashMap<String, Object> searchUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
	
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectUser(map);
		//아이디가 없는경우
		if (user == null) {
			resultMap.put("result", "fail");
			resultMap.put("message", "아이디가 존재하지 않습니다.");
		} else {
			//로그인 성공했을떄
			String pwd = (String) map.get("pwd");
			if (user.getPwd().equals(pwd)) {
				resultMap.put("result", "success");
				resultMap.put("message", user.getUserName() + "님 환영합니다.");
				session.setAttribute("userId", user.getUserId());
				session.setAttribute("userName", user.getUserName());
			} else {
				//아이디는 맞으나 비번이 틀린경우
				resultMap.put("result", "fail");
				resultMap.put("message", "비밀번호가 일치하지 않습니다.");
			}

		}
		return resultMap;
	}

	@Override
	public void joinUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		userMapper.insertUser(map);
	}

	@Override
	public HashMap<String, Object> checkUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectUser(map);
		if(user == null) {
			resultMap.put("message", "사용 가능한 아이디 입니다. \n 사용하시겠습니까?");
			resultMap.put("result", "success");
		}else {
			resultMap.put("message", "이미 사용중인 아이디 입니다.");
			resultMap.put("result", "fail");
		}
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchEditUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectUser(map);
		resultMap.put("user", user);
		return resultMap;
	}

}
