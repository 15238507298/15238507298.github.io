package com.zzxky_edu.beans;

import java.util.Date;
import java.util.Set;

public class lessons {
	//�γ�Id
	private Integer	lessons_id;
	//�γ���
	private	String lessons_name;
	//�γ�ͼƬ
	private	String lessons_image;
	//�γ���Ƶ
	private	String Lessons_video;
	//�γ̽���
	private	String lessons_introduce;
	//�γ̹���
	private	String lessons_advert;
	//֪ʶ��
	private	String lessons_library;
	//������ʦ
	private	String lessons_teacher;
	//����ʱ��
	private	Date lessons_updateTime;
	//ѧԱ(�û���)
	private	Set<user> lessons_student;
	//ѧϰ����
	private	Integer lessons_money;
	//ѧϰĿ��
	private	String lessons_target;
	//��ע����
	private	Integer lessons_concerns;
	//�γ�����
	private lessonType lessontype;
	
	
	public Integer getLessons_id() {
		return lessons_id;
	}
	public void setLessons_id(Integer lessons_id) {
		this.lessons_id = lessons_id;
	}
	public String getLessons_name() {
		return lessons_name;
	}
	public void setLessons_name(String lessons_name) {
		this.lessons_name = lessons_name;
	}
	public String getLessons_image() {
		return lessons_image;
	}
	public void setLessons_image(String lessons_image) {
		this.lessons_image = lessons_image;
	}
	public String getLessons_video() {
		return Lessons_video;
	}
	public void setLessons_video(String lessons_video) {
		Lessons_video = lessons_video;
	}
	public String getLessons_introduce() {
		return lessons_introduce;
	}
	public void setLessons_introduce(String lessons_introduce) {
		this.lessons_introduce = lessons_introduce;
	}
	public String getLessons_advert() {
		return lessons_advert;
	}
	public void setLessons_advert(String lessons_advert) {
		this.lessons_advert = lessons_advert;
	}
	public String getLessons_library() {
		return lessons_library;
	}
	public void setLessons_library(String lessons_library) {
		this.lessons_library = lessons_library;
	}
	public String getLessons_teacher() {
		return lessons_teacher;
	}
	public void setLessons_teacher(String lessons_teacher) {
		this.lessons_teacher = lessons_teacher;
	}
	public Date getLessons_updateTime() {
		return lessons_updateTime;
	}
	public void setLessons_updateTime(Date lessons_updateTime) {
		this.lessons_updateTime = lessons_updateTime;
	}

	public Set<user> getLessons_student() {
		return lessons_student;
	}
	public void setLessons_student(Set<user> lessons_student) {
		this.lessons_student = lessons_student;
	}
	public Integer getLessons_money() {
		return lessons_money;
	}
	public void setLessons_money(Integer lessons_money) {
		this.lessons_money = lessons_money;
	}
	public String getLessons_target() {
		return lessons_target;
	}
	public void setLessons_target(String lessons_target) {
		this.lessons_target = lessons_target;
	}
	public Integer getLessons_concerns() {
		return lessons_concerns;
	}
	public void setLessons_concerns(Integer lessons_concerns) {
		this.lessons_concerns = lessons_concerns;
	}
	public lessonType getLessontype() {
		return lessontype;
	}
	public void setLessontype(lessonType lessontype) {
		this.lessontype = lessontype;
	}
	
	
	
	
}
