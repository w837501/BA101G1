package com.tools;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ClassBean  implements Serializable {
	private String classId="";
    private String className="";
    private String grade="";
	   
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	   
	   	
	   
	}
