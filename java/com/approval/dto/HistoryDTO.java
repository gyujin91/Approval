package com.approval.dto;

import java.util.Date;

public class HistoryDTO {
	private int hno;	// �����丮 ��ȣ
	private Date sign_date;	// ������
	private String approver;	//������
	private String sign_status;	//�������
	
	public int getBno() {
		return hno;
	}
	public void setBno(int hno) {
		this.hno = hno;
	}
	public Date getSign_date() {
		return sign_date;
	}
	public void setSign_date(Date sign_date) {
		this.sign_date = sign_date;
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
