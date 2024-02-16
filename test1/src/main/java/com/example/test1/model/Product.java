package com.example.test1.model;

import lombok.Data;

@Data
public class Product {
	private String itemNo;
	private String itemName;
	private int price;
	private int sRate;
	private int pRate;
	private String contents;
	private String sellYn;
	private String trabnsInfo;

}
