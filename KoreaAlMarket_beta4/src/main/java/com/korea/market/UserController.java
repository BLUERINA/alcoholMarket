package com.korea.market;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDAO;
import util.Comm;
import util.Common;
import vo.UserVO;


@Controller
public class UserController {
	private UserDAO user_dao;
	private BCryptPasswordEncoder passwordEncoder;

	@Autowired
	HttpServletRequest request;

	@Autowired
	HttpSession session;

	public UserController(UserDAO user_dao) {
		this.user_dao = user_dao;
		passwordEncoder = new BCryptPasswordEncoder();
	}

	//로그인 페이지
	@RequestMapping(value = "login.do")
	public String login() {
		return Comm.U_PATH + "login.jsp";
	}

	//로그인 
	@RequestMapping("verify_login.do")
	public String verify_login(String id, String pw) {
		session = request.getSession();
		UserVO vo = user_dao.selectOne(id);
		String result = "iv_id";
		if(vo != null) {
			if(passwordEncoder.matches(pw, vo.getPw())) {
				session.removeAttribute("input_id");
				session.removeAttribute("input_pw");
				session.removeAttribute("login_result");
				session.setAttribute("vo", vo);
				return "redirect:menu.do";
			} else {
				result = "iv_pw";
			}
		}
		session.setAttribute("input_id", id);
		session.setAttribute("input_pw", pw);
		session.setAttribute("login_result", result);
		return "redirect:login.do";
	}

	//로그아웃?
	@RequestMapping(value = "logout.do")
	public String logout() {
		session.removeAttribute("vo");
		return "redirect:menu.do";
	}

	//signup 폼으로 
	@RequestMapping("signup_form.do")
	public String signup_form() {
		return Comm.U_PATH + "signup.jsp";
	}

	//signup
	@RequestMapping("signup.do")
	public String signup(UserVO vo) {
		vo.setPw(passwordEncoder.encode(vo.getPw()));
		int res = user_dao.insert(vo);
		return "redirect:menu.do";
	}

	//id 중복확인
	@RequestMapping("checkID.do") 
	@ResponseBody
	public String checkID(String id) {
		String res = user_dao.checkID(id);
		String result = "exists";
		if(res == null) {
			result = "d_exists";
		}
		return result;
	}

	//email 중복확인
	@RequestMapping("checkEmail.do")
	@ResponseBody
	public String checkEmail(String email) {
		String res = user_dao.checkEmail(email);
		String result = "exists";
		if(res == null) {
			result = "d_exists";
		}
		return result;
	}

	//아이디 찾기
	@RequestMapping("find/id.do")
	public String find_id() {
		return Comm.U_PATH + "findID.jsp";
	}
	//이름과 휴대폰 번호가 일치하는 아이디가 있는지
	@RequestMapping("find/id/namePhone.do")
	@ResponseBody
	public String find_user(UserVO vo) {
		UserVO res = user_dao.findUser(vo);
		String result = "iv";

		if(res != null) {
			result = "v";
		}

		return result;
	}

	//비밀번호 찾기
	@RequestMapping("find/password.do")
	public String find_pw() {
		return Comm.U_PATH + "findPW.jsp";
	}

	//아이디 보여주는 페이지로 이동
	@RequestMapping("find/id/success.do")
	public String show_id(UserVO vo) {

		UserVO res = user_dao.findUser(vo);

		session = request.getSession();
		session.setAttribute("id", res.getId());
		session.setAttribute("regdate", res.getRegdate());

		return Comm.U_PATH + "showID.jsp";	
	}

	//아이디와 휴대폰 번호가 일치하는 계정이 있는지
	@RequestMapping("find/password/idPhone.do")
	@ResponseBody
	public String find_pw(UserVO vo) {
		UserVO res = user_dao.findPw(vo);

		session = request.getSession();
		String result = "iv";

		if(res != null) {
			result = "v";
			session.setAttribute("id", res.getId());
		}

		return result;
	}

	//비밀번호 리셋 폼으로
	@RequestMapping("find/password/reset.do")
	public String reset_pw() {
		return Comm.U_PATH + "resetPW.jsp";
	}

	//비밀번호 변경
	@RequestMapping("find/password/success.do")
	@ResponseBody
	public String change_pw(UserVO vo) {

		vo.setPw(passwordEncoder.encode(vo.getPw()));

		session = request.getSession();
		session.removeAttribute("id");

		int res = user_dao.changePw(vo);
		String data = "fail";

		if(res != 0) {
			data = "success";
		}
		return data;
	}

}