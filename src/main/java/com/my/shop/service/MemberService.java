package com.my.shop.service;

import javax.servlet.http.HttpSession;

import com.my.shop.vo.MemberVO;

public interface MemberService {
	
	public void signup(MemberVO vo) throws Exception;

	public MemberVO signin(MemberVO vo) throws Exception;
	
	public void signout(HttpSession session) throws Exception;

}
