package com.hanul.poly02;

public class Dog extends Animal{	//추상클래스를 상속 ▶ 추상메소드의 재정의가 필수
	@Override
	public void cry() {				//상위클래스에서 선언만 한 추상메소드를 반드시 재정의(Override)
		System.out.println("멍멍");
	}
}
