package com.hanul.fruit;

import java.text.DecimalFormat;
import java.util.ArrayList;

public class FruitDAO {
	//생성자 메소드 초기화
	private ArrayList<FruitDTO> list;
	public FruitDAO(ArrayList<FruitDTO> list) {
		this.list = list;
	}
	
	//가격계산
	public void getPrice() {
		for (int i = 0; i < list.size(); i++) {
			int price = list.get(i).getCost() * list.get(i).getQty();
			list.get(i).setPrice(price);
		}
		
		for (FruitDTO dto : list) {
			dto.setPrice(dto.getCost() * dto.getQty());
		}		
	}
	
	//가격의 내림차순 정렬
	public void priceDescSort() {
		for (int i = 0; i < list.size(); i++) {
			for (int j = i + 1; j < list.size(); j++) {
				if(list.get(i).getPrice() < list.get(j).getPrice()) {
					FruitDTO temp = list.get(i);
					list.set(i, list.get(j));
					list.set(j, temp);
				}
			}
		}
	}
	
	//출력1
	public void display() {
		DecimalFormat df = new DecimalFormat("￦#,##0");
		System.out.println("================================");
		System.out.println("과일명\t단가\t수량\t가격");
		System.out.println("================================");
		for (FruitDTO dto : list) {
			System.out.print(dto.getName() + "\t");
			System.out.print(df.format(dto.getCost()) + "\t");
			System.out.print(dto.getQty() + "\t");
			System.out.print(df.format(dto.getPrice()) + "\n");			
		}
		System.out.println("================================");
	}
	
	//출력2 : printf()
	public void displayPrintf() {
		for (FruitDTO dto : list) {
			String name = dto.getName();
			int cost = dto.getCost();
			int qty = dto.getQty();
			int price = dto.getPrice();
			System.out.printf("%-4s\t%5d\t%3d\t%10d\n", name, cost, qty, price);
		}
	}
}//class
