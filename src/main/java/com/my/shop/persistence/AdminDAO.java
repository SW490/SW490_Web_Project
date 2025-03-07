package com.my.shop.persistence;

import java.util.List;

import com.my.shop.vo.CategoryVO;
import com.my.shop.vo.GoodsVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;

public interface AdminDAO {

	public List<CategoryVO> category() throws Exception;//category

	public void register(GoodsVO vo) throws Exception;//goods register
	
	public List<GoodsViewVO> goodslist() throws Exception;//goods list
	
	public GoodsViewVO goodsView(int gdsNum) throws Exception;//goods view

	public void goodsModify(GoodsVO vo) throws Exception;//goods up date
	
	public void goodsDelete(int gdsNum) throws Exception;//goods delete
	
	//orderList
	public List<OrderVO> orderList() throws Exception;
	
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
	
	public void delivery(OrderVO order) throws Exception;

	public void changeStock(GoodsVO goods) throws Exception;
	
	public List<ReplyListVO> allReply() throws Exception;
	
	public void deleteReply(int repNum) throws Exception; 
	
}
