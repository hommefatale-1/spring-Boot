package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Student;

@Mapper
public interface SampleMapper {
	List<Student> selectStuList(HashMap<String, Object> map); // 학생 목록

	void updateStu(HashMap<String, Object> map); // 학생 정보 수정

	void insertStu(HashMap<String, Object> map); // 학생 추가

	Student selectId(HashMap<String, Object> map); // 아이디 중복체크
	
	
}
