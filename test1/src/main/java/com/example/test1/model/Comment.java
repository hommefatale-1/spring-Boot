package com.example.test1.model;

import lombok.Data;

@Data
public class Comment {
	private int commentNo;
	private int boardNo;
	private String cmt;
	private String userId;
	private String pcommentNo;
	private String cdateTime;
	private String udateTime;
	
	private String cDate;
	private boolean updateFlg = true;
}
