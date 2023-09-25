package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vo.MenuVO;

public class MenuDAO {

	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//추천 조회
	public List<MenuVO> recolist(){
		List<MenuVO> list = sqlSession.selectList("m.reco_list");
		return list;
	}
	
	//메뉴 전체 조회 ( 전체 + 가격 )
		public List<MenuVO> selectlist(HashMap<String, Integer> map){
			List<MenuVO> list = sqlSession.selectList("m.menu_list", map);
			return list;
		}
		
		//메뉴 전체 조회 ( 도수 )
		public List<MenuVO> selectlistDegree(HashMap<String, Integer> map){
			List<MenuVO> list = sqlSession.selectList("m.degree_list", map);
			return list;
		}
		
		//메뉴 전체 조회 ( 용량 )
		public List<MenuVO> selectlistvolume(HashMap<String, Integer> map){
			List<MenuVO> list = sqlSession.selectList("m.volume_list", map);
			return list;
		}
		
		//메뉴 전체 조회 ( 별점 )
		public List<MenuVO> selectliststar(HashMap<String, Integer> map){
			List<MenuVO> list = sqlSession.selectList("m.star_list", map);
			return list;
		}
	// 검색어 입력조회
	public List<MenuVO> search(Map<String, Object> map) {
		List<MenuVO> list = sqlSession.selectList("m.search", map);
		return list;
	}
}
