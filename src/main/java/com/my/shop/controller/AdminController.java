package com.my.shop.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.my.shop.service.AdminService;
import com.my.shop.utils.UploadFileUtils;
import com.my.shop.vo.CategoryVO;
import com.my.shop.vo.GoodsVO;
import com.my.shop.vo.GoodsViewVO;
import com.my.shop.vo.OrderListVO;
import com.my.shop.vo.OrderVO;
import com.my.shop.vo.ReplyListVO;
import com.my.shop.vo.ReplyVO;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Inject
	AdminService adminService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@GetMapping("/index")
	public void getIndex() throws Exception {
		logger.info("관리자 화면 진입");
	}
	
	@GetMapping("/goods/register")
	public void getGoodsRegister(Model model) throws Exception {
		logger.info("상품등록 페이지 진입");
		
		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	@PostMapping("/goods/register")
	public String postGoodsRegister(GoodsVO vo, MultipartFile file) throws Exception {
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		}else {
			fileName = File.separator + "images" + File.separator + "none.png";
			vo.setGdsImg(fileName);
			vo.setGdsThumbImg(fileName);
		}
		adminService.register(vo);
		return "redirect:/admin/index";
	}
	
	@GetMapping(value="/goods/list")
	public void getGoodsList(Model model) throws Exception {
		logger.info("상품 리스트 출력");
		List<GoodsViewVO>list = adminService.goodslist();
		model.addAttribute("list", list);
	}
	
	@GetMapping(value="/goods/view")
	public void getGoodsview(@RequestParam("n") int gdsNum, Model model) throws Exception {
		logger.info("상세페이지");
		GoodsViewVO goods = adminService.goodsView(gdsNum);
		model.addAttribute("goods", goods);
	}
	
	@PostMapping(value="/goods/ckUpload")
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
		logger.info("ck에디터에 첨부파일 등록");
		UUID uid = UUID.randomUUID();
		OutputStream out = null;
		PrintWriter printWriter = null;
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html, charset=utf-8");
		
		try {
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			//ckuploadpath
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); //out에 저장된 데이터 전송 후 초기화
			
			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/ckUpload" + uid + "_" + fileName; //작성화면
			
			//메세지 출력
			printWriter.println("<script>"
					+ "window.parent.CKEDITOR.tools.callFunction("
					+ callback +", '"+ fileUrl +"', '이미지를 업로드하였습니다.')"
					+ "</script>");
			printWriter.flush();
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null) {out.close();}
				if(printWriter != null) {printWriter.close();}
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
		return;
	}
	
	//상품수정
	@GetMapping(value="/goods/modify")
	public void getGoodsModify(@RequestParam("n") int gdsNum, Model model) throws Exception{
		logger.info("수정 페이지 진입");
		GoodsViewVO goods = adminService.goodsView(gdsNum);
		model.addAttribute("goods",goods);
		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}
	
	@PostMapping(value="/goods/modify")
	public String postGoodsModify(GoodsVO vo, MultipartFile file, HttpServletRequest req) throws Exception{
		logger.info("상품 수정");
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
			
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		}else {
			vo.setGdsImg(req.getParameter("gdsImg"));
			vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
		}
		adminService.goodsModify(vo);
		return "redirect:/admin/index";
	}
	
	//상품삭제
	@PostMapping(value="/goods/delete")
	public String postGoodsDelete(@RequestParam("n") int gdsNum) throws Exception {
		logger.info("상품 삭제");
		adminService.goodsDelete(gdsNum);
		return "redirect:/admin/index";
	}
	
	//주문목록
	@GetMapping(value="/shop/orderList")
	public void getOrderList(Model model) throws Exception {
		logger.info("관리자에서 확인하는 모든 소비자 주문목록 페이지");
		List<OrderVO> orderList = adminService.orderList();
		model.addAttribute("orderList", orderList);
	}
	
	@GetMapping(value="/shop/orderView")
	public void getOrderList(@RequestParam("n") String orderId, Model model, OrderVO order) throws Exception {
		logger.info("소비자 주문 상세 페이지");
		order.setOrderId(orderId);
		List<OrderListVO> orderView = adminService.orderView(order);
		model.addAttribute("orderView", orderView);
	}
	
	@PostMapping(value="/shop/orderView")
	public String delivery(OrderVO order) throws Exception {
		logger.info("배송 상태 설정 페이지");
		adminService.delivery(order);
		List<OrderListVO> orderView = adminService.orderView(order);
		GoodsVO goods = new GoodsVO();
		for(OrderListVO i : orderView) {
			goods.setGdsNum(i.getGdsNum());
			goods.setGdsStock(i.getCartStock());
			adminService.changeStock(goods);
		}
		return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
	}
	
	//댓글
	@GetMapping(value="shop/allReply")
	public void getAllReply(Model model) throws Exception {
		logger.info("소비자가 쓴 모든 댓글");
		List<ReplyListVO> reply = adminService.allReply();
		model.addAttribute("reply",reply);
	}
	
	@PostMapping(value="shop/allReply")
	public String postAllReply(ReplyVO reply) throws Exception {
		logger.info("소비자가 쓴 모든 댓글 삭제");
		adminService.deleteReply(reply.getRepNum());
		return "redirect:/admin/shop/allReply";
	}
}
