package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Emp;
import com.example.test1.model.Student;

@Mapper
public interface StudentMapper {
	List<Student> selectStudentList(HashMap<String, Object> map);
	
	// 사원 리스트
	List<Emp> empList();
	// 학생 업데이트
	void stuUpdate();
	
	Student stuInfo();
	
}
