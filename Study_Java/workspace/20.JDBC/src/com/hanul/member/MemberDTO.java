package com.hanul.member;

import java.io.Serializable;

public class MemberDTO implements Serializable{		//직렬화
	//멤버변수 선언 : 변수명은 반드시 DB Table에서 부여한 컬럼명과 일치
	private int num;
	private String name;
	private int age;
	private String addr;
	private String tel;
	
	//디폴트 생성자 메소드
	public MemberDTO() {}

	//생성자 메소드 초기화 : 멤버변수의 나열된 순서는 DB Table에서 설정한 컬럼순서와 일치
	public MemberDTO(int num, String name, int age, String addr, String tel) {
		super();
		this.num = num;
		this.name = name;
		this.age = age;
		this.addr = addr;
		this.tel = tel;
	}

	//Getters & Setters 메소드
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	

}
