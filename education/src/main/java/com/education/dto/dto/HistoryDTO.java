package com.education.dto.dto;

public class HistoryDTO {
	private int seq;	// 번호
	private String sign_date;	// 결재일
	private String approver;	// 결재자
	private String sign_status;	// 결재 상태
	private int appr_seq;	// 메인 게시글 번호
	
	public int getAppr_seq() {
		return appr_seq;
	}
	public void setAppr_seq(int appr_seq) {
		this.appr_seq = appr_seq;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getSign_date() {
		return sign_date;
	}
	public void setSign_date(String sign_date) {
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
