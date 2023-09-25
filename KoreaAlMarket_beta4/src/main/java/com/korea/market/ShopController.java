package com.korea.market;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ProductDAO;
import dao.ShopDAO;
import util.Common;
import vo.ProductVO;
import vo.ShopVO;

@Controller
public class ShopController {
	
	@Autowired
	HttpServletRequest request;
	
	ShopDAO shop_dao;
	
	public void setShop_dao(ShopDAO shop_dao) {
		this.shop_dao = shop_dao;
//		this.product_dao = product_dao;
	}
	
	@RequestMapping(value= {"/shop.do"})
	public String list( ShopVO vo ) {
		
		List<ShopVO> list = shop_dao.selectList(vo);
		
		request.setAttribute("list", list);
		
		return Common.S_PATH+"shop_list.jsp";
	}
	
	@RequestMapping("/delete.do")
	@ResponseBody
	public String delete( int idx ) {
	
		//삭제 업데이트
		int res = shop_dao.delete(idx);
		
		String result = "no";
		if( res == 1 ) {
			result = "yes";
		}
		
		return result;//no 또는 yes를 콜백메서드로 전달
	}

	
	@RequestMapping("/modify.do")
	@ResponseBody
	public String modify(ShopVO vo) {
		
		int res = shop_dao.update(vo);
		
		String result = "no";
		if(res != 0) {
			result = "yes";
		}
		return result;
		
		
	}
	
	@RequestMapping("insert_shop.do")
	public String insert(ShopVO vo) {
			
		shop_dao.insert(vo);
			
		return "redirect:shop.do";		
	}
	
}
