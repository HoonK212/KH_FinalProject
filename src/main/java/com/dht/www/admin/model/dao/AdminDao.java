package com.dht.www.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dht.www.board.model.vo.Board;
import com.dht.www.mypage.model.vo.Files;

import common.util.Paging;

@Repository
public class AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//-------------- 상품 목록 조회 ---------------------
	
	public int selectProductCntOfSearchType1(Map<String, Object> search) {

		return sqlSession.selectOne("ADMIN.selectProductCntOfSearchType1", search);
	}
	
	public List<Map<String, Object>> selectProductListOfSearchType1(Map<String, Object> mp) {

		return sqlSession.selectList("ADMIN.selectProductListOfSearchType1", mp);
	}
	
	public int selectProductCntOfSearchType2(Map<String, Object> search) {

		return sqlSession.selectOne("ADMIN.selectProductCntOfSearchType2", search);
	}

	public List<Map<String, Object>> selectProductListOfSearchType2(Map<String, Object> mp) {

		return sqlSession.selectList("ADMIN.selectProductListOfSearchType2", mp);
	}
	
	public int selectProductCnt() {

		return sqlSession.selectOne("ADMIN.selectProductCnt");
	}

	public List<Map<String, Object>> selectProductList(Paging p) {
		
		return sqlSession.selectList("ADMIN.selectProductList", p);
	}

	//---------상품 목록 조회 끝 ---------------
	
	
	// 상품 재고 상세
	public List<Object> selectStockDetail(String code) {

		return sqlSession.selectList("ADMIN.selectStockDetail", code);
	}
	
	// 상품 재고 업데이트
	public int modifyStockData(Map<String, Object> data) {

		return sqlSession.update("ADMIN.modifyStockData", data);
	}



	
	//-------------- 배송 STATUS 관련 조회 --------------------------
	

	public int selectStatusCntOfSearchType1(Map<String, Object> search) {

		return sqlSession.selectOne("ADMIN.selectStatusCntOfSearchType1", search);
	}

	public List<Map<String, Object>> selectStatusListOfSearchType1(Map<String, Object> mp) {
		
		return sqlSession.selectList("ADMIN.selectStatusListOfSearchType1", mp);
	}

	public int selectStatusCntOfSearchType1WithDate(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectStatusCntOfSearchType1WithDate", search);
	}

	public List<Map<String, Object>> selectStatusListOfSearchType1WithDate(Map<String, Object> mp) {
	
		return sqlSession.selectList("ADMIN.selectStatusListOfSearchType1WithDate", mp);
	}

	public int selectStatusCntOfSearchType2(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectStatusCntOfSearchType2", search);
	}

	public List<Map<String, Object>> selectStatusListOfSearchType2(Map<String, Object> mp) {
		
		return sqlSession.selectList("ADMIN.selectStatusListOfSearchType2", mp);
	}

	public int selectStatusCntOfSearchType2WithDate(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectStatusCntOfSearchType2WithDate", search);
	}

	public List<Map<String, Object>> selectStatusListOfSearchType2WithDate(Map<String, Object> mp) {

		return sqlSession.selectList("ADMIN.selectStatusListOfSearchType2WithDate", mp);
	}

	public int selectStatusCntOfSearchType3(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectStatusCntOfSearchType3", search);
	}

	public List<Map<String, Object>> selectStatusListOfSearchType3(Map<String, Object> mp) {
		
		return sqlSession.selectList("ADMIN.selectStatusListOfSearchType3", mp);
	}

	public int selectStatusCntOfSearchType3WithDate(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectStatusCntOfSearchType3WithDate", search);
	}

	public List<Map<String, Object>> selectStatusListOfSearchType3WithDate(Map<String, Object> mp) {
		
		return sqlSession.selectList("ADMIN.selectStatusListOfSearchType3WithDate", mp);
	}


	public int selectStatusCntWithDate(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectStatusCntWithDate", search);
	}

	public List<Map<String, Object>> selectStatusListWithDate(Map<String, Object> mp) {
		
		return sqlSession.selectList("ADMIN.selectStatusListWithDate", mp);
	}

	public int selectStatusCnt() {
		
		return sqlSession.selectOne("ADMIN.selectStatusCnt");
	}
	
	public List<Map<String, Object>> selectStatusList(Paging p) {
		
		return sqlSession.selectList("ADMIN.selectStatusList", p);
	}
	
	// -----------배송 STATUS 관련 조회 끝---------------------------------------
	
	
	
	// 주문 내역 상세
	public List<Object> selectOrdersDetail(String o_no) {
		
		return sqlSession.selectList("ADMIN.selectOrdersDetail", o_no);
	}
	
	
		
		//상품코드를 rename하는 코드 
		public String renameCode() {
		
			return sqlSession.selectOne("ADMIN.renameCode");
			
		}
		

		//상품등록을 하는 메소드
		public void insertProduct(Map<String, Object> product) {
			
			sqlSession.insert("ADMIN.insertProduct",  product);
		}
		
		
		//상품이미지를 db에 저장하는 메소드 
		public void insertProductImage(Map<String, Object> f) {
			sqlSession.insert("ADMIN.insertProductImage" , f);
		}
		
		//상품 상세 정보
		public Map<String, Object> selectProductDetail(String code) {
			
			return sqlSession.selectOne("ADMIN.selectProductDetail", code);
		}
		
		//상품 이미지 정보
		public Map<String, Object> selectFilesOfProduct(String code) {
			
			Map<String, Object> result = new HashMap<>();
			
			List<Map<String, Object>> filelist = sqlSession.selectList("ADMIN.selectFilesOfProduct", code);
			List<Map<String, Object>> thumblist = sqlSession.selectList("ADMIN.selectThumbFilesOfProduct", code);
			
			result.put("filelist", filelist);
			result.put("thumblist", thumblist);
			
			return result;
		}
		
		//썸네일 이미지 삭제
		public int deleteFile(String no) {

			return sqlSession.delete("ADMIN.deleteFile", no);
		}
		
		//상품 정보 수정
		public int updateProductData(Map<String, Object> product) {

			return sqlSession.update("ADMIN.updateProductData", product);
		}
		
		//상품 이미지 삭제를 위한 정보 호출
		public Map<String, Object> selectFileWifhFileNo(String no) {
			
			return sqlSession.selectOne("ADMIN.selectFileWifhFileNo", no);
		}

		//회원관리
		public int selectMemberCnt() {
			return sqlSession.selectOne("ADMIN.selectMemberCnt");
		}

		public List<Map<String, Object>> selectMemberList(Paging paging) {
			return sqlSession.selectList("ADMIN.selectMemberList", paging);
		}
		
		public int selectMemberCntOfSearchType1(Map<String, Object> search) {
			return sqlSession.selectOne("ADMIN.selectMemberCntOfSearchType1", search);
		}

		public int selectMemberCntOfSearchType2(Map<String, Object> search) {
			return sqlSession.selectOne("ADMIN.selectMemberCntOfSearchType2", search);
		}

		public List<Map<String, Object>> selectMemberListBySearchDataType1(Map<String, Object> m) {
			return sqlSession.selectList("ADMIN.selectMemberListBySearchDataType1", m);
		}

		public List<Map<String, Object>> selectMemberListBySearchDataType2(Map<String, Object> m) {
			return sqlSession.selectList("ADMIN.selectMemberListBySearchDataType2", m);
		}
		
}
