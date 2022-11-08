package com.hanul.fruit;

import java.text.DecimalFormat;

public class FruitDAO {
	//디폴트 생성자 메소드 : 생성자 메소드가 없을 경우 JVM 자동으로 제공
	public FruitDAO() {}

	//객체배열(fruit[])을 매개변수로 전달받는 생성자 메소드 구현
	private FruitDTO[] fruit;
	public FruitDAO(FruitDTO[] fruit) {
		this.fruit = fruit;
	}
	
	//가격계산
	public void getPrice() {
		for (int i = 0; i < fruit.length; i++) {
			//int price = fruit[i].getCost() * fruit[i].getQty();
			//fruit[i].setPrice(price);
			fruit[i].setPrice(fruit[i].getCost() * fruit[i].getQty());
		}
	}//getPrice()

	//가격의 내림차순 정렬
	public void priceDescSort() {
		for (int i = 0; i < fruit.length; i++) {
			for (int j = i + 1; j < fruit.length; j++) {
				if(fruit[i].getPrice() < fruit[j].getPrice()) {
					FruitDTO temp = fruit[i];
					fruit[i] = fruit[j];
					fruit[j] = temp;
				}
			}
		}		
	}//priceDescSort()
	
	//출력
	public void display() {
		DecimalFormat df = new DecimalFormat("￦#,##0");
		System.out.println("================================");
		System.out.println("과일명\t단가\t수량\t가격");
		System.out.println("================================");
		for (int i = 0; i < fruit.length; i++) {
			System.out.print(fruit[i].getName() + "\t");
			System.out.print(df.format(fruit[i].getCost()) + "\t");
			System.out.print(fruit[i].getQty() + "\t");
			System.out.print(df.format(fruit[i].getPrice()) + "\n");
		}
		System.out.println("================================");
	}//display()
	
}//class
