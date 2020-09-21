package com.dht.www.shopping.model.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dht.www.mypage.model.vo.Files;
import com.dht.www.shopping.model.dao.ShoppingDao;
import com.dht.www.shopping.model.vo.Basket;
import com.dht.www.shopping.model.vo.OrderProduct;
import com.dht.www.shopping.model.vo.Orders;
import com.dht.www.user.model.vo.Users;

import common.util.Paging;

@Service
public class ShoppingServiceImpl implements ShoppingService {
	
	@Autowired
	private ShoppingDao shoppingDao;

	//쇼핑 홈 출력 리스트
	@Override
	public List<Map<String, Object>> selectHome(String cate) {
		return shoppingDao.selectHome(cate);
	}

	//게시판 서브 목록
	@Override
	public Map<String, Object> selectList(int listno, int curPage, int cntPerPage) {
	
		Map<String, Object> commandMap = new HashMap<String, Object>();

		Paging paging = new Paging(shoppingDao.selectCntList(listno), curPage, cntPerPage);
		paging.setListno(listno);
		
		 List<Map<String, Object>> list = shoppingDao.selectList(paging);
		
		 commandMap.put("paging", paging);
		 commandMap.put("list", list);
		
		return commandMap;
	}
	
	//제품 상세 정보
	@Override
	public Map<String, Object> selectItem(String code) {
		return shoppingDao.selectItem(code);
	}

	//사용자 장바구니 정보
	@Override
	public List<Map<String, Object>> selectBasket(Users user) {
		return shoppingDao.selectBasket(user);
	}
	
	//세션 장바구니 상품 정보
	@Override
	public Map<String, Object> sessionBasket(String code) {
		return shoppingDao.sessionBasket(code);
	}
	
	//장바구니 내 상품 존재 여부
	@Override
	public int checkBasket(Basket basket) {
		return shoppingDao.checkBasket(basket);
	}

	//장바구니 삽입
	@Override
	public int insertBasket(Basket basket) {
		return shoppingDao.insertBasket(basket);
	}
	
	//이미 있는 상품 장바구니에 넣을 경우 - 장바구니 수량추가
	@Override
	public int addAmount(Basket basket) {
		return shoppingDao.addAmount(basket);
	}
	
	//장바구니 페이지에서 상품 수량 변경할 경우 - 장바구니 수량 업데이트
	@Override
	public int updateAmount(Basket basket) {
		return shoppingDao.updateAmount(basket);
	}
	
	//장바구니 개별 삭제
	@Override
	public int deleteBasket(Basket basket) {
		return shoppingDao.deleteBasket(basket);
	}
	
	//장바구니 리스트 삭제
	@Override
	public int deleteList(Map<String,Object> map) {
		return shoppingDao.deleteList(map);
	}

	// 상품 목록 조회
	@Override
	public List<Map<String, Object>> selectProuct(Map map) {
		return shoppingDao.selectProduct(map);
	}

	// 해당 계정의 포인트 조회
	@Override
	public int selectPoint(String id) {
		return shoppingDao.selectPoint(id);
	}

	// 해당 계정의 포인트 조회
	@Override
	public List<Map<String, Object>> selectProuct(Basket basket) {
		return null;
	}

	// 주문 내역 삽입
	@Override
	public int insertOrders(Orders order) {
		return shoppingDao.insertOrders(order);
	}
	
	// 주문 내역 당 상품 삽입
	public int insertOrderProduct(List<OrderProduct> orderProduct) {
		return shoppingDao.insertOrderProduct(orderProduct);
	}
	
	// 주문내역의 상품 삽입을 위한 주문내역 번호 조회
	@Override
	public int selectOrdersNo() {
		return shoppingDao.selectOrdersNo();
	}

	// 주문 시 사용한 포인트 삽입
	@Override
	public void insertPoint(Map userPoint) {
		shoppingDao.insertPoint(userPoint);
	}

	//상세페이지 - 리뷰 정보
	public List<Map<String, Object>> selectReview(String code) {
		return shoppingDao.selectReview(code);
	}

	//상세페이지 - 상품 별점
	@Override
	public int scoreAvg(String code) {
		return shoppingDao.scoreAvg(code);
	}

	//쇼핑 헤더 - 검색 결과
	@Override
	public Map<String, Object> selectSearch(String search, int curPage, int cntPerPage) {
		Map<String, Object> commandMap = new HashMap<String, Object>();

		Paging paging = new Paging(shoppingDao.selectCntSearch(search), curPage, cntPerPage);
		paging.setSearch(search);

		System.out.println(paging);

		List<Map<String, Object>> list = shoppingDao.selectSearch(paging);

		commandMap.put("paging", paging);
		commandMap.put("list", list);

		return commandMap;
	}

	//상세페이지 - 상품 파일
	@Override
	public List<Map<String, Object>> selectFiles(String code) {
		return shoppingDao.selectFiles(code);
	}

}
