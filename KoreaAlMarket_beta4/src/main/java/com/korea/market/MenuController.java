package com.korea.market;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MenuDAO;
import util.Common;
import vo.MenuVO;

@Controller
public class MenuController {

	MenuDAO menu_dao;
	
	public void setMenu_dao(MenuDAO menu_dao) {
		this.menu_dao = menu_dao;
	}

	@RequestMapping("/mypage.do")
	public String mypage() {
		return "/WEB-INF/views/market/mypage.jsp";
	}
	@RequestMapping("/order.do")
	public String order() {
		return "/WEB-INF/views/order/order.jsp";
	}
	
	@RequestMapping("/search.do")
	public String search(String search) {
		return "/WEB-INF/views/market/search.jsp";
	}
	@RequestMapping(value = { "/search1.do" })
	public String list(Model model, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		List<MenuVO> list = menu_dao.search(map);
		model.addAttribute("list", list);
		return "/WEB-INF/views/market/search.jsp";
	}
	
	@RequestMapping(value= {"/", "menu.do"})
	public String list ( Model model ) {
		
		//DAO를 통해서 조회된 목록을 요청
		List<MenuVO> list = menu_dao.recolist();
		
		model.addAttribute("r_list",list);
		
		return Common.PATH + "menu.jsp";
	}
	
	// 양조주화면 Fermented Liquor
		@RequestMapping("/FermentedLiquor_page.do")
		public String FermentedLiquor_page( Model model, Integer value ) {
			
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			int startValue = 0;
			
			/*
			 * System.out.println("양조주메뉴"); //DAO를 통해서 조회된 목록을 요청 List<MenuVO> list =
			 * menu_dao.selectlist(map);
			 * 
			 * model.addAttribute("m_list",list); //vo.setPrice(price);
			 */		
			
			// 가격선택
			if(value == null ) {
				
				startValue = 0;
				value = 1000000;
				
				map.put("s", startValue);
				map.put("e", value);
				//DAO를 통해서 조회된 목록을 요청
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
					
			}else if(value == 10000) {
				startValue = 0;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 30000 ) {
				startValue = 10000;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
				
			}else if ( value == 50000 ) {
				startValue = 30000;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
				
			}else if ( value == 50001) {
				startValue = 50001;
				value = 1000000;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
			}
			
			//도수선택
			if(value == 5) {
				startValue = 0;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistDegree(map);
				model.addAttribute("m_list",list);
				
				
			}else if( value == 10 ) {
				startValue = 5;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistDegree(map);
				model.addAttribute("m_list",list);
				
			}else if ( value == 11 ) {
				startValue = 11;
				value = 50;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistDegree(map);
				model.addAttribute("m_list",list);
				
			}
			
			//용량선택
			if(value == 300) {
				startValue = 0;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistvolume(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 500 ) {
				startValue = 301;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistvolume(map);
				model.addAttribute("m_list",list);
				
			}else if ( value == 501 ) {
				startValue = 501;
				value = 1000;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistvolume(map);
				model.addAttribute("m_list",list);	
			}

			//별점선택
			if(value == 6) {
				value = 5;
				startValue = 4;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				//System.out.println("list:"+list.size());
				model.addAttribute("m_list",list);
				
			}else if( value == 4 ) {
				startValue = 3;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 3 ) {
				startValue = 2;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 2 ) {
				startValue = 1;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 1 ) {
				startValue = 0;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}
			
			return Common.PATH + "FermentedLiquor.jsp";
			
		}
		

		// 증류주화면 Distilled Liquor
		@RequestMapping("/DistilledLiquor_page.do")
		public String DistilledLiquor_page( Model model, Integer value ) {
			
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			int startValue = 0;
			
			// 가격선택
			if(value == null ) {
				
				startValue = 0;
				value = 1000000;
				
				map.put("s", startValue);
				map.put("e", value);
				//DAO를 통해서 조회된 목록을 요청
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
					
			}else if(value == 10000) {
				startValue = 0;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 30000 ) {
				startValue = 10000;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
				
			}else if ( value == 50000 ) {
				startValue = 30000;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
				
			}else if ( value == 50001) {
				startValue = 50001;
				value = 1000000;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
			}
			
			//도수선택
			if(value == 5) {
				startValue = 0;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistDegree(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 10 ) {
				startValue = 5;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistDegree(map);
				model.addAttribute("m_list",list);
				
			}else if ( value == 11 ) {
				startValue = 11;
				value = 50;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistDegree(map);
				model.addAttribute("m_list",list);
				
			}
			
			//용량선택
			if(value == 300) {
				startValue = 0;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistvolume(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 500 ) {
				startValue = 301;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistvolume(map);
				model.addAttribute("m_list",list);
				
			}else if ( value == 501 ) {
				startValue = 501;
				value = 1000;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistvolume(map);
				model.addAttribute("m_list",list);	
			}
			
			//별점선택
			if(value == 6) {
				value = 5;
				startValue = 4;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 4 ) {
				startValue = 3;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 3 ) {
				startValue = 2;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 2 ) {
				startValue = (int) 1;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 1 ) {
				startValue = 0;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}
			
			return Common.PATH + "DistilledLiquor.jsp";
		}
		
		// 혼성주화면 Compounded Liquor
		@RequestMapping("/CompoundedLiquor_page.do")
		//public String alchol3( Model model, HttpServletRequest request ) {
		// request.getParameter("value");
		public String CompoundedLiquor_page( Model model, Integer value ) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			int startValue = 0;
			
			// 가격선택
			if(value == null ) {
				
				startValue = 0;
				value = 1000000;
				
				map.put("s", startValue);
				map.put("e", value);
				//DAO를 통해서 조회된 목록을 요청
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
					
			}else if(value == 10000) {
				startValue = 0;
					
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 30000 ) {
				startValue = 10000;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
				
			}else if ( value == 50000 ) {
				startValue = 30000;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
				
			}else if ( value == 50001) {
				startValue = 50001;
				value = 1000000;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlist(map);
				model.addAttribute("m_list",list);
			}
			
			//도수선택
			if(value == 5) {
				startValue = 0;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistDegree(map);
				model.addAttribute("m_list",list);
				// @TODO: if문으로 degree 체크할때 공통되는 소스로 뺴놓기
				model.addAttribute("degree", value);
				
			}else if( value == 10 ) {
				startValue = 5;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistDegree(map);
				model.addAttribute("m_list",list);
				
				model.addAttribute("degree", value);
				
			}else if ( value == 11 ) {
				startValue = 11;
				value = 50;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistDegree(map);
				model.addAttribute("m_list",list);
				
				model.addAttribute("degree", value);
				
			}
			
			//용량선택
			if(value == 300) {
				startValue = 0;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistvolume(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 500 ) {
				startValue = 301;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistvolume(map);
				model.addAttribute("m_list",list);
				
			}else if ( value == 501 ) {
				startValue = 501;
				value = 1000;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectlistvolume(map);
				model.addAttribute("m_list",list);	
			}
			
			//별점선택
			if(value == 6) {
				value = 5;
				startValue = 4;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 4 ) {
				startValue = 3;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 3 ) {
				startValue = 2;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 2 ) {
				startValue = (int) 1;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}else if( value == 1 ) {
				startValue = 0;
				
				map.put("s", startValue);
				map.put("e", value);
				
				List<MenuVO> list = menu_dao.selectliststar(map);
				model.addAttribute("m_list",list);
				
			}
			return Common.PATH + "CompoundedLiquor.jsp";
		}
	
}
