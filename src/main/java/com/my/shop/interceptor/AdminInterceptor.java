package com.my.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.my.shop.vo.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		if(member == null) {
			res.sendRedirect("/member/signin");
			return false;
			
			/*자바스크립트에서는 기본적인 이벤트 전파를 방지
		      1)조건에 따른 실패 또는 부정적인 결과 = 메소드가 조건을 만족하지 못했거나 실패 했을때 호출자에게 알리기 위해
		      2)boolean을 리턴하는 메소드에서 특정 조건이 만족되지 않으면  false
		      3)반복문에서 종료 신호 = 더이상 처리가 필요없다는 신호이다.
		      4)유효성 검사 = 입력값이 유효하지 않거나 잘못된 경우 = 검사 실패를 나타낼때
		       실패,잘못된 상태,또는 조건 불만족 일때를 나타낸다      
		      */
			
		}
		if(member.getVerify() != 9) {
			res.sendRedirect("/");
			return false;	
		}
		return true;
	}
}
