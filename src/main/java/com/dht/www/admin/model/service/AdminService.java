package com.dht.www.admin.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.dht.www.board.model.vo.Board;
import com.dht.www.mypage.model.vo.Files;
import com.dht.www.shopping.model.vo.Product;

public interface AdminService {

	public Map<String, Object> selectProductList(int cPage, int cntPerPage, Map<String,Object> search);

	public List<Object> selectStockDetail(String code);

	public int modifyStockData(Map<String, Object> data);

	public Map<String, Object> selectReturnList(int cPage, int cntPerPage, Map<String, Object> search);

	public List<Object> selectReturnDetail(String op_no);

	public int modifyReturnData(Map<String, Object> data);
	
	//--------------------------------------------------------------
	
	
	//code를 rename하는 코드 
	public String renameCode(Object object);

	//상품 정보를 등록하고 상품이미지를 업로드, 저장 
	public void insertProduct(List<MultipartFile> files, Map<String, Object> product, String path, List<String> thumbList);
	
	//상품 상세 정보
	public Map<String, Object> selectProductDetail(String code);
	
	//상품 이미지 정보
	public Map<String, Object> selectFilesOfProduct(String code);
	
	//썸네일 이미지 삭제
	public int deleteFile(String no, HttpSession session);

	//상품 정보 수정
	public void updateProductData(List<MultipartFile> files, Map<String, Object> product, String path,
			List<String> thumbList);




}
