package com.example.test1.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.FirstMapper;

@Service
public class FirstServiceImpl implements FirstService{

	@Autowired
	FirstMapper firstMapper;



	
}
