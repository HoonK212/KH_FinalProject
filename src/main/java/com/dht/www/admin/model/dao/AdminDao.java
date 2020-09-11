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

	public int selectProductCnt() {

		return sqlSession.selectOne("ADMIN.selectProductCnt");
	}

	public List<Map<String, Object>> selectProductList2(Paging paging) {
		
		System.out.println(paging.getStart());
		System.out.println(paging.getEnd());
		
		return sqlSession.selectList("ADMIN.selectProductList2", paging);
	}

	public List<Object> selectStockDetail(String code) {

		return sqlSession.selectList("ADMIN.selectStockDetail", code);
	}

	public int modifyStockData(Map<String, Object> data) {

		return sqlSession.update("ADMIN.modifyStockData", data);
	}

	public List<Map<String, Object>> selectProductListBySearchDataType1(Map<String, Object> mp) {

		return sqlSession.selectList("ADMIN.selectProductListBySearchDataType1", mp);
	}

	public List<Map<String, Object>> selectProductListBySearchDataType2(Map<String, Object> mp) {

		return sqlSession.selectList("ADMIN.selectProductListBySearchDataType2", mp);
	}

	public int selectProductCntOfStockSearchType1(Map<String, Object> search) {

		return sqlSession.selectOne("ADMIN.selectProductCntOfStockSearchType1", search);
	}

	public int selectProductCntOfStockSearchType2(Map<String, Object> search) {

		return sqlSession.selectOne("ADMIN.selectProductCntOfStockSearchType2", search);
	}

	public int selectReturnCntOfReturnSearchType1(Map<String, Object> search) {

		return sqlSession.selectOne("ADMIN.selectReturnCntOfReturnSearchType1", search);
	}

	public List<Map<String, Object>> selectReturnListBySearchDataType1(Map<String, Object> mp) {
		
		return sqlSession.selectList("ADMIN.selectReturnListBySearchDataType1", mp);
	}

	public int selectReturnCntOfReturnSearchType1WithDate(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectReturnCntOfReturnSearchType1WithDate", search);
	}

	public List<Map<String, Object>> selectReturnListBySearchDataType1WithDate(Map<String, Object> mp) {
	
		return sqlSession.selectList("ADMIN.selectReturnListBySearchDataType1WithDate", mp);
	}

	public int selectReturnCntOfReturnSearchType2(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectReturnCntOfReturnSearchType2", search);
	}

	public List<Map<String, Object>> selectReturnListBySearchDataType2(Map<String, Object> mp) {
		
		return sqlSession.selectList("ADMIN.selectReturnListBySearchDataType2", mp);
	}

	public int selectReturnCntOfReturnSearchType2WithDate(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectReturnCntOfReturnSearchType2WithDate", search);
	}

	public List<Map<String, Object>> selectReturnListBySearchDataType2WithDate(Map<String, Object> mp) {

		return sqlSession.selectList("ADMIN.selectReturnListBySearchDataType2WithDate", mp);
	}

	public int selectReturnCntOfReturnSearchType3(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectReturnCntOfReturnSearchType3", search);
	}

	public List<Map<String, Object>> selectReturnListBySearchDataType3(Map<String, Object> mp) {
		
		return sqlSession.selectList("ADMIN.selectReturnListBySearchDataType3", mp);
	}

	public int selectReturnCntOfReturnSearchType3WithDate(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectReturnCntOfReturnSearchType3WithDate", search);
	}

	public List<Map<String, Object>> selectReturnListBySearchDataType3WithDate(Map<String, Object> mp) {
		
		return sqlSession.selectList("ADMIN.selectReturnListBySearchDataType3WithDate", mp);
	}

	public int selectReturnCntOfReturnSearchType4(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectReturnCntOfReturnSearchType4", search);
	}

	public List<Map<String, Object>> selectReturnListBySearchDataType4(Map<String, Object> mp) {
		
		return sqlSession.selectList("ADMIN.selectReturnListBySearchDataType4", mp);
	}

	public int selectReturnCntOfReturnSearchType4WithDate(Map<String, Object> search) {
	
		return sqlSession.selectOne("ADMIN.selectReturnCntOfReturnSearchType4WithDate", search);
	}

	public List<Map<String, Object>> selectReturnListBySearchDataType4WithDate(Map<String, Object> mp) {
		
		return sqlSession.selectList("ADMIN.selectReturnListBySearchDataType4WithDate", mp);
	}

	public int selectReturnCnt() {
		
		return sqlSession.selectOne("ADMIN.selectReturnCnt");
	}

	public List<Map<String, Object>> selectReturnList(Paging p) {
		
		return sqlSession.selectList("ADMIN.selectReturnList", p);
	}

	public int selectReturnCntOfByDate(Map<String, Object> search) {
		
		return sqlSession.selectOne("ADMIN.selectReturnCntOfByDate", search);
	}

	public List<Map<String, Object>> selectReturnListByDate(Map<String, Object> mp) {
		
		return sqlSession.selectList("ADMIN.selectReturnListByDate", mp);
	}

	public List<Object> selectReturnDetail(String op_no) {
		
		return sqlSession.selectList("ADMIN.selectReturnDetail", op_no);
	}

	public int modifyReturnData(Map<String, Object> data) {
	
		return sqlSession.update("ADMIN.modifyReturnData", data);
	}

	
	// -------------------------------------------------------------------------------------------
	
		
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
