package dao;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVO;
import vo.ShopVO;

public class ProductDAO {

	SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//상품 전체 조회
	public ProductVO selectOne(int idx) {
		ProductVO vo = sqlSession.selectOne("p.product_one", idx);
		return vo;
	}

	
}
