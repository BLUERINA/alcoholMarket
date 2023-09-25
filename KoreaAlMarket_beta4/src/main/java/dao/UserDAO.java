package dao;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;

public class UserDAO {
	SqlSession sqlSession;
	
	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//id 중복확인
	public String checkID(String id) {
		String res = sqlSession.selectOne("u.user_checkID", id);
		return res;
	}
	//email 중복확인
	public String checkEmail(String email) {
		String res = sqlSession.selectOne("u.user_checkEmail", email);
		return res;
	}
	//signup; UserVO insert
	public int insert(UserVO vo) {
		int res = sqlSession.insert("u.user_signup", vo);
		return res;
	}
	//id로 게정이 있는지 확인하고 VO를 넘겨준다
	public UserVO selectOne(String id) {
		UserVO vo = sqlSession.selectOne("u.user_selectOne", id);
		return vo;
	}
	//이름과 휴대폰 번호가 일차하는 레코드 조회
	public UserVO findUser(UserVO vo) {
		UserVO res = sqlSession.selectOne("u.user_findUser", vo);
		return res;
	}
	//아이디와 휴대폰 번호가 일치하는 레코드 조회
	public UserVO findPw(UserVO vo) {
		UserVO res = sqlSession.selectOne("u.user_findPw", vo);
		return res;
	}
	//비밀번호 변경
	public int changePw(UserVO vo) {
		int res = sqlSession.update("u.user_changePw", vo);
		return res;
	}
}
