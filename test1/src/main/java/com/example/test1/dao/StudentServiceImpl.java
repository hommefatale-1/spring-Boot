package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.StudentMapper;
import com.example.test1.model.Emp;
import com.example.test1.model.Student;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	StudentMapper studentMapper;
	
	@Override
	public List<Student> searchStudentList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.selectStudentList(map);
	}

	@Override
	public List<Emp> firstService() {
		// TODO Auto-generated method stub
		List<Emp> e = studentMapper.empList();
		return e;
	}

	@Override
	public void stuUpdate() {
		// TODO Auto-generated method stub
		studentMapper.stuUpdate();
	}

	@Override
	public Student stuInfo() {
		// TODO Auto-generated method stub
		
		return studentMapper.stuInfo();
	}
	
	

}
