package com.my.shop.service;

import java.util.List;

import com.my.shop.vo.CartListVO;
import com.my.shop.vo.CartVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderDetailVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

public interface ShopService {

	//상품리스트
    public List<GoodsViewVO> list(int cateCode, int level) throws Exception;

    //상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;

	//댓글쓰기
	public void registReply(ReplyVO reply) throws Exception;
	
	//댓글리스트
	public List<ReplyListVO> replyList(int gdsNum) throws Exception;
	
	//댓글삭제
	public void deleteReply(ReplyVO reply) throws Exception;
	
	//아이디체크
	public String idCheck(int repNum) throws Exception;
	
	//댓글수정
	public void modifyReply(ReplyVO reply) throws Exception;

	//카트담기
	public void addCart(CartVO cart) throws Exception;
	
	//카트리스트
	public List<CartListVO> cartList(String userId) throws Exception;
	
	//카트삭제
	public void deleteCart(CartVO cart) throws Exception;
	
	//전체주문리스트
	public void orderInfo(OrderVO order) throws Exception;
			
	//전체주문조회
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;
			
	//전체주문삭제
	public void cartAllDelete(String userId) throws Exception;
	
	//특정주문리스트
	public List<OrderVO> orderList(OrderVO order) throws Exception;

	//특정주문조회
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
}