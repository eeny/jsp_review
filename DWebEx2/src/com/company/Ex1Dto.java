package com.company;

public class Ex1Dto {
	private String id;
	private String pw;
	private String name;
	private String email;
	private int age;
	// 넘길 jsp페이지의 name과 변수 이름을 반드시 똑같이 맞춰야 한다!

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
}
