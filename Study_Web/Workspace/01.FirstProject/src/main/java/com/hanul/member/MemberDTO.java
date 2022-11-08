package com.hanul.member;

public class MemberDTO {
	
	private String name, id, pw;
	private int age;
	private String addr;
	
	public MemberDTO() {}

	public MemberDTO(String name, String id, String pw, int age, String addr) {
		super();
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.age = age;
		this.addr = addr;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	};
	
	
}
