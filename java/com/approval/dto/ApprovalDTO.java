package com.approval.dto;

import java.util.Date;

public class ApprovalDTO {

	private int bno;    // �۹�ȣ
	private String userId;   // �ۼ���
	private String title;    // ����
	private String content;  // ����
	private Date reg_date;  // �����
	private Date sign_date;   // ������
	private Date update_date;   // ������
	private String approver;    // ������
	private String sign_status; // �������
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public Date getSign_date() {
		return sign_date;
	}
	public void setSign_date(Date sign_date) {
		this.sign_date = sign_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public String getApprover() {
		return approver;
	}
	public void setApprover(String approver) {
		this.approver = approver;
	}
	public String getSign_status() {
		return sign_status;
	}
	public void setSign_status(String sign_status) {
		this.sign_status = sign_status;
	}
	
	
	   
	   
	   
}
