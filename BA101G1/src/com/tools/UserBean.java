package com.tools;

import java.io.Serializable;

public class UserBean implements Serializable {
   private String name="";
   private String age="";
   private String height="";
   
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getHeight() {
		return height;
	}
	public void setHeight(String height) {
		this.height = height;
	}
   
   
}
