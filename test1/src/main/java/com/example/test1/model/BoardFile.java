package com.example.test1.model;

import lombok.Data;

@Data
public class BoardFile {

	private int fileNo; // STU_NO
	private int boardNo; // STU_NAME
	private String filePath;
	private String fileOrgName;
	private String fileName;
	private String fileSize;
	private String fileEts;
	
	private String path;
}
