package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Emp;
import com.example.test1.model.Student;

public interface SampleService {
	

	List<Student> searchStuList(HashMap<String, Object> map);

	void editStu(HashMap<String, Object> map);

	void addStu(HashMap<String, Object> map);

	Student searchId(HashMap<String, Object> map);

	HashMap<String, Object> searchUser(HashMap<String, Object> map);

	void addUser(HashMap<String, Object> map);
	

}
