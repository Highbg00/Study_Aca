package com.hanul.cart;

import java.io.Serializable;

public class CartDTO implements Serializable {
	
	private String name;	// 상품명
	private int price;		// 상품 가격
	private int cnt;		// 주문 수량
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	
}
