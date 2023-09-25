package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVO;
import vo.ShopVO;

public class ShopDAO {
	
	SqlSession sqlSession;
	
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<ShopVO> selectList(ShopVO vo){
		List<ShopVO> list = sqlSession.selectList("s.shop_list");
		return list;
	}
	
	//삭제
	
	public int delete( int idx) {
		int res = sqlSession.delete( "s.shop_delete", idx );
		return res;
	}
	public ShopVO selectOne(int idx) {
		ShopVO vo = sqlSession.selectOne("s.select_one", idx);
		return vo;
	}
	
	//수자변경
	public int update(ShopVO vo) {
		int res = sqlSession.update("s.updateCnt",vo);
		return res;
	}

	public int insert(ShopVO vo) {
		int res = sqlSession.insert("s.shop_insert",vo);
		return res;
	}

	
}
