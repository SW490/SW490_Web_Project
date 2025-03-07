package com.my.shop.vo;

import java.util.Date;

public class MemberVO {
	
	private String userId;
	private String userPass;
	private String userPassRe;
	private String userName;
	private String userPhone;
	private String userEmail;
	private String userGender;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private Date regidate;
	private int verify;
	
	public String getUserId() {return userId;}
	public String getUserPass() {return userPass;}
	public String getUserPassRe() {return userPassRe;}
	public String getUserName() {return userName;}
	public String getUserPhone() {return userPhone;}
	public String getUserEmail() {return userEmail;}
	public String getUserGender() {return userGender;}
	public String getUserAddr1() {return userAddr1;}
	public String getUserAddr2() {return userAddr2;}
	public String getUserAddr3() {return userAddr3;}
	public Date getRegidate() {return regidate;}
	public int getVerify() {return verify;}
	
	public void setUserId(String userId) {this.userId = userId;}
	public void setUserPass(String userPass) {this.userPass = userPass;}
	public void setUserPassRe(String userPassRe) {this.userPassRe = userPassRe;}
	public void setUserName(String userName) {this.userName = userName;}
	public void setUserPhone(String userPhone) {this.userPhone = userPhone;}
	public void setUserEmail(String userEmail) {this.userEmail = userEmail;}
	public void setUserGender(String userGender) {this.userGender = userGender;}
	public void setUserAddr1(String userAddr1) {this.userAddr1 = userAddr1;}
	public void setUserAddr2(String userAddr2) {this.userAddr2 = userAddr2;}
	public void setUserAddr3(String userAddr3) {this.userAddr3 = userAddr3;}
	public void setRegidate(Date regidate) {this.regidate = regidate;}
	public void setVerify(int verify) {this.verify = verify;}
}
