package com.example.test1.model;

import lombok.Data;

@Data
public class Board {
	private int boardNo; 
	private String title; 
	private String contents;
	private int hit;
	private String userId;
	private String kind;
	private String cdateTime;
	private String udataTime;
	
	private String userName;
	private int commCnt;
}
