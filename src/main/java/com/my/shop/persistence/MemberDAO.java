package com.my.shop.persistence;

import com.my.shop.vo.MemberVO;

public interface MemberDAO {

	public void signup(MemberVO vo) throws Exception;
	
	public MemberVO signin(MemberVO vo) throws Exception;
}
