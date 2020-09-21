package com.dht.www.shopping.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.mypage.model.vo.Files;
import com.dht.www.shopping.model.vo.Basket;
import com.dht.www.shopping.model.vo.OrderProduct;
import com.dht.www.shopping.model.vo.Orders;
import com.dht.www.user.model.vo.Users;

import common.util.Paging;

@Repository
public class ShoppingDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//쇼핑 홈 출력 리스트
	public List<Map<String, Object>> selectHome(String cate) {
		return sqlSession.selectList("Shopping.selectHome", cate);
	}
	
	//게시판 서브 목록 카운트
	public int selectCntList(int listno) {
		return sqlSession.selectOne("Shopping.selectCnt", listno);
	}
	
	//게시판 서브 목록
	public List<Map<String, Object>> selectList(Paging paging){
		return sqlSession.selectList("Shopping.selectList", paging);
	}
	
	//제품 상세 정보
	public Map<String, Object> selectItem(String code) {
		return sqlSession.selectOne("Shopping.selectItem", code);
	}
	
	//사용자 장바구니 정보
	public List<Map<String, Object>> selectBasket(Users user) {
		return sqlSession.selectList("Shopping.selectBasket", user);
	}
	
	//세션 장바구니 상품 정보
	public Map<String, Object> sessionBasket(String code) {
		return sqlSession.selectOne("Shopping.sessionBasket", code);
	}
	
	//장바구니 내 상품 존재 여부
	public int checkBasket(Basket basket) {
		return sqlSession.selectOne("Shopping.checkBasket", basket);
	}
	
	//장바구니 삽입
	public int insertBasket(Basket basket) {
		return sqlSession.insert("Shopping.insertBasket", basket);
	}
	
	//이미 있는 상품 장바구니에 넣을 경우 - 장바구니 수량추가
	public int addAmount(Basket basket) {
		return sqlSession.update("Shopping.addAmount", basket);
	}
	
	//장바구니 페이지에서 상품 수량 변경할 경우 - 장바구니 수량 업데이트
	public int updateAmount(Basket basket) {
		return sqlSession.update("Shopping.updateAmount", basket);
	}
	
	//장바구니 개별 삭제
	public int deleteBasket(Basket basket) {
		return sqlSession.delete("Shopping.deleteBasket", basket);
	}
	
	//장바구니 리스트 삭제
	public int deleteList(Map<String,Object> map) {
		return sqlSession.delete("Shopping.deleteList", map);
	}

	// 상품 목록 조회
	public List<Map<String, Object>> selectProduct(Map map){
		return sqlSession.selectList("Shopping.selectProduct", map);
	}
	
	// 해당 계정의 포인트 조회
	public int selectPoint(String id) {
		return sqlSession.selectOne("Shopping.selectPoint", id);
	}
	
	// 주문 내역 삽입
	public int insertOrders(Orders order) {
		return sqlSession.insert("Shopping.insertOrders", order);
	}
	
	// 주문 내역 당 상품 삽입
	public int insertOrderProduct(List<OrderProduct> orderProduct) {
		
		int no=0;
		
		// 한건의 주문내역에 여러개의 상품
		for(int i=0; i<orderProduct.size(); i++) {
			sqlSession.insert("Shopping.insertOrderProduct", orderProduct.get(i));
			no+=1;
		}
		
		return no;
	}
	
	// 주문내역의 상품 삽입을 위한 주문내역 번호 조회
	public int selectOrdersNo() {
		return sqlSession.selectOne("Shopping.selectOrdersNo");
	}
	
	// 주문 시 사용한 포인트 삽입
	public void insertPoint(Map userPoint) {
		sqlSession.insert("Shopping.insertPoint",userPoint);
	}

	//상세페이지 - 리뷰 정보
	public List<Map<String, Object>> selectReview(String code) {
		return sqlSession.selectList("Shopping.selectReview", code);
	}
	
	//상세페이지 - 상품 별점
	public int scoreAvg(String code) {
		return sqlSession.selectOne("Shopping.scoreAvg", code);
	}
	
	//쇼핑 헤더 - 검색 결과 카우트
	public int selectCntSearch(String search) {
		return sqlSession.selectOne("Shopping.selectCntSearch", search);
	}
	
	//쇼핑 헤더 - 검색 결과
	public List<Map<String, Object>> selectSearch(Paging paging){
		return sqlSession.selectList("Shopping.selectSearch", paging);
	}
	
	//상세페이지 - 상품 파일
	public List<Map<String, Object>> selectFiles(String code) {
		return sqlSession.selectList("Shopping.selectFiles", code);
	}

}
