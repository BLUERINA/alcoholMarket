package com.korea.market;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ProductDAO;
import util.Common;
import vo.ProductVO;
import vo.ShopVO;

@Controller
public class ProductController {

	@Autowired
	HttpServletRequest request;
	
	ProductDAO product_dao;
	
	public void setProduct_dao(ProductDAO product_dao) {
		this.product_dao = product_dao;
	}
	
	@RequestMapping("/product.do")
	public String product( Model model, int idx ) {
		//view.do?idx=10
		
		idx = Integer.parseInt( request.getParameter("idx"));
		
		ProductVO vo = product_dao.selectOne(idx); //상세보기 페이지를 위한 객체검색

		model.addAttribute("vo", vo);//바인딩
		return "/WEB-INF/views/detailPage/detailPage.jsp";
	}

}