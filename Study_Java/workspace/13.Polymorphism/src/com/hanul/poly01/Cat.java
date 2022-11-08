package com.hanul.poly01;

public class Cat extends Animal{	//하위클래스 : Animal Class 상속
	@Override	//재정의 : 상위클래스가 정의한 메소드를 수정
	public void cry() {
		System.out.println("야옹");
	}//cry()
	
	public void night() {
		System.out.println("고양이는 야행성이다");
	}//night()
}//class
