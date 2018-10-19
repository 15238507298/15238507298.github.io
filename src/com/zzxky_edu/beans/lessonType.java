package com.zzxky_edu.beans;

import java.util.Set;

public class lessonType {
	//课程类型id
	private Integer lessonType_id;
	//课程类型名
	private String lessonType_name;
	//课程
	private Set<lessons> lessonMany;
	
	
	public Integer getLessonType_id() {
		return lessonType_id;
	}
	public String getLessonType_name() {
		return lessonType_name;
	}
	public void setLessonType_name(String lessonType_name) {
		this.lessonType_name = lessonType_name;
	}
	public Set<lessons> getLessonMany() {
		return lessonMany;
	}
	public void setLessonMany(Set<lessons> lessonMany) {
		this.lessonMany = lessonMany;
	}
	public void setLessonType_id(Integer lessonType_id) {
		this.lessonType_id = lessonType_id;
	}

	
}
