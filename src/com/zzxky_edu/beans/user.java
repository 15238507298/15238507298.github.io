package com.zzxky_edu.beans;

import java.util.Date;

public class user {
	//�û�id
	private Integer user_id;
	//�ֻ���
	private String user_telephone;
	//�û�����
	private String user_password;
	//ѧԱ����
	private String user_name;
	//�û�����
	private String user_email;
	//ע��ʱ��
	private Date user_registTime;
	//�����¼ʱ��
	private Date user_loginTime;

	
	
	public Date getUser_loginTime() {
		return user_loginTime;
	}

	public void setUser_loginTime(Date user_loginTime) {
		this.user_loginTime = user_loginTime;
	}

	public Integer getUser_id() {
		return user_id;
	}

	public void setUser_id(Integer user_id) {
		this.user_id = user_id;
	}

	public String getUser_telephone() {
		return user_telephone;
	}

	public void setUser_telephone(String user_telephone) {
		this.user_telephone = user_telephone;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public Date getUser_registTime() {
		return user_registTime;
	}

	public void setUser_registTime(Date user_registTime) {
		this.user_registTime = user_registTime;
	}

}
