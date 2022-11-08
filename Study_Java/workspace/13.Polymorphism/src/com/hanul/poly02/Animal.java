package com.hanul.poly02;

public abstract class Animal {		//▶ 추상클래스
	public abstract void cry();		//▶ 추상메소드 	
}//class


/*
○ 추상메소드
	- abstract 키워드를 사용하고 body 블럭이 없는 메소드
		# public void 메소드명(매개변수) {코드구현} → public abstract void 메소드명(매개변수);
	- 메소드의 선언부(정의부)만 있고, 구현부(동작)가 없는 메소드
	- 상속받은 하위클래스에서 상위클래스가 정의한 메소드를 반드시 재정의 하기 위해 구현 

○ 추상클래스 : abstract 키워드를 사용 ▶ 다형성을 보장하기 위해서 등장
	- 추상메소드가 하나라도 있으면 추상클래스가 된다.
	- 부모의 역할을 수행하기 위해서 UpCasting 용도로 만들어지는 클래스
	- 추상클래스는 객체를 생성할 수 없다.
*/