package com.dht.www.shopping.model.service;

import java.util.List;
import java.util.Map;

import com.dht.www.mypage.model.vo.Files;
import com.dht.www.shopping.model.vo.Basket;
import com.dht.www.shopping.model.vo.OrderProduct;
import com.dht.www.shopping.model.vo.Orders;
import com.dht.www.user.model.vo.Users;

import common.util.Paging;

public interface ShoppingService {
	
	//쇼핑 홈 출력 리스트
	public List<Map<String, Object>> selectHome(String cate);
	
	//게시판 서브 목록
	public Map<String, Object> selectList(int listno, int curPage, int cntPerPage);

	//쇼핑 헤더 - 검색 결과
	public Map<String, Object> selectSearch(String search, int curPage, int cntPerPage);
	
	//제품 상세 정보
	public Map<String, Object> selectItem(String code);
	
	//사용자 장바구니 정보
	public List<Map<String, Object>> selectBasket(Users user);

	//세션 장바구니 상품 정보
	public Map<String, Object> sessionBasket(String code);
	
	//장바구니 내 상품 존재 여부
	public int checkBasket(Basket basket);
	
	//장바구니 삽입
	public int insertBasket(Basket basket);
	
	//이미 있는 상품 장바구니에 넣을 경우 - 장바구니 수량추가
	public int addAmount(Basket basket);
	
	//장바구니 페이지에서 상품 수량 변경할 경우 - 장바구니 수량 업데이트
	public int updateAmount(Basket basket);
	
	//장바구니 개별 삭제
	public int deleteBasket(Basket basket);
	
	//장바구니 리스트 삭제
	public int deleteList(Map<String,Object> map);
	
	public List<Map<String, Object>> selectProuct(Basket basket);
	
	public List<Map<String, Object>> selectProuct(Map map);
	
	public int selectPoint(String id);
	
	public int insertOrders(Orders order);
	
	public int insertOrderProduct(List<OrderProduct> orderProduct);
	
	public int selectOrdersNo();
	
	public void insertPoint(Map userPoint);

	//상세페이지 - 리뷰 정보
	public List<Map<String, Object>> selectReview(String code);
	
	//상세페이지 - 상품 별점
	public int scoreAvg(String code);
	
	//상세페이지 - 상품 파일
	public List<Map<String, Object>> selectFiles(String code);

}
