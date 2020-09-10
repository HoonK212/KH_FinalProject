package com.dht.www.admin.model.service;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dht.www.admin.model.dao.AdminDao;
import com.dht.www.mypage.model.vo.Files;
import com.dht.www.shopping.model.vo.Product;

import common.exception.FileException;
import common.util.FileUtil;
import common.util.Paging;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;

	@Override
	public Map<String, Object> selectProductList(int cPage, int cntPerPage, Map<String,Object> search) {
	
		Map<String, Object> commandMap = new HashMap<>();

		//검색어가 있는 경우
		if(search.get("data") != null && search.get("data") != "") {

			//상품코드로 검색한 경우
			if( Integer.valueOf((String) search.get("type")) == 1 ) {
				//페이징 객체
				Paging p = new Paging(adminDao.selectProductCntOfStockSearchType1(search), cPage, cntPerPage);
				//파라미터 만들기
				Map<String, Object> mp = new HashMap<>();
				mp.put("paging", p);
				mp.put("search", search);
				//조회 결과
				List<Map<String,Object>> plist = adminDao.selectProductListBySearchDataType1(mp);
				//맵 저장
				commandMap.put("plist", plist);
				commandMap.put("page", p);
			}else {
				//페이징 객체
				Paging p = new Paging(adminDao.selectProductCntOfStockSearchType2(search), cPage, cntPerPage);
				//파라미터 만들기
				Map<String, Object> mp = new HashMap<>();
				mp.put("paging", p);
				mp.put("search", search);
				//조회 결과
				List<Map<String,Object>> plist = adminDao.selectProductListBySearchDataType2(mp);
				//맵 저장
				commandMap.put("plist", plist);
				commandMap.put("page", p);
			}
		}else {
			//검색어가 없는 경우
			//페이징 객체
			Paging p = new Paging(adminDao.selectProductCnt(), cPage, cntPerPage);
			//결과 조회
			List<Map<String,Object>> plist = adminDao.selectProductList2(p);
			//맵 저장
			commandMap.put("plist", plist);
			commandMap.put("page", p);
		}
		
		return commandMap;
	}

	@Override
	public List<Object> selectStockDetail(String code) {
		
		return adminDao.selectStockDetail(code);
	}

	@Override
	public int modifyStockData(Map<String, Object> data) {

		return adminDao.modifyStockData(data);
	}

	@Override
	public Map<String, Object> selectReturnList(int cPage, int cntPerPage, Map<String, Object> search) {
		
		//최종반환
		Map<String, Object> commandMap = new HashMap<>();
		//조회결과
		List<Map<String,Object>> plist = null;
		
		//검색어가 있는 경우
		if( search.get("data")!=null && search.get("data") != "") {
			
			//페이징 객체 생성
			Paging p = null;
			//파라미터 객체 생성
			Map<String,Object> mp = new HashMap<>();
			
			//상품코드로 검색
			if( Integer.valueOf((String)search.get("type"))== 1  ) { 
				
				//페이징 객체
				p = new Paging(adminDao.selectReturnCntOfReturnSearchType1(search), cPage, cntPerPage);
				//파라미터 만들기
				mp.put("paging", p);
				mp.put("search", search);
				//조회결과
				plist = adminDao.selectReturnListBySearchDataType1(mp);
				//맵 저장
				commandMap.put("plist", plist);
				commandMap.put("page", p);
				
				//날짜조건이 있는 경우
				if( search.get("fromdate")!=null && search.get("fromdate")!= "" &&
						search.get("todate")!=null && search.get("todate")!= "" ) {
					
					System.out.println("??????????????????/ 들어왔냐?");
					
					//페이징 객체
					p = new Paging(adminDao.selectReturnCntOfReturnSearchType1WithDate(search), cPage, cntPerPage);
					//파라미터 만들기
					mp.put("paging", p);
					mp.put("search", search);
					//조회결과
					plist = adminDao.selectReturnListBySearchDataType1WithDate(mp);
					//맵 저장
					commandMap.put("plist", plist);
					commandMap.put("page", p);
				}
				
			//상품명으로 검색	
			}else if( Integer.valueOf((String)search.get("type"))== 2 ) { 
				
				//페이징 객체
				p = new Paging(adminDao.selectReturnCntOfReturnSearchType2(search), cPage, cntPerPage);
				//파라미터 만들기
				mp.put("paging", p);
				mp.put("search", search);
				//조회결과
				plist = adminDao.selectReturnListBySearchDataType2(mp);
				//맵 저장
				commandMap.put("plist", plist);
				commandMap.put("page", p);
				
				//날짜조건이 있는 경우
				if( search.get("fromdate")!=null && search.get("fromdate")!= "" &&
						search.get("todate")!=null && search.get("todate")!= "" ) {
					//페이징 객체
					p = new Paging(adminDao.selectReturnCntOfReturnSearchType2WithDate(search), cPage, cntPerPage);
					//파라미터 만들기
					mp.put("paging", p);
					mp.put("search", search);
					//조회결과
					plist = adminDao.selectReturnListBySearchDataType2WithDate(mp);
					//맵 저장
					commandMap.put("plist", plist);
					commandMap.put("page", p);
				}
			
			//수리여부로 검색	
			}else if( Integer.valueOf((String)search.get("type"))== 3 ) {
				
				//수리여부&반품완료 데이터처리
				if( ((String)search.get("data")).equals("N") || ((String)search.get("data")).equals("n") ) {
					search.put("data", 0);
				}else if( ((String)search.get("data")).equals("Y") || ((String)search.get("data")).equals("y") ) {
					search.put("data", 1);
				}else {
					search.put("data", 3);
				}
			
				//페이징 객체
				p = new Paging(adminDao.selectReturnCntOfReturnSearchType3(search), cPage, cntPerPage);
				//파라미터 만들기
				mp.put("paging", p);
				mp.put("search", search);
				//조회결과
				plist = adminDao.selectReturnListBySearchDataType3(mp);
				//맵 저장
				commandMap.put("plist", plist);
				commandMap.put("page", p);
				
				//날짜조건이 있는 경우
				if( search.get("fromdate")!=null && search.get("fromdate")!= "" &&
						search.get("todate")!=null && search.get("todate")!= "" ) {
					//페이징 객체
					p = new Paging(adminDao.selectReturnCntOfReturnSearchType3WithDate(search), cPage, cntPerPage);
					//파라미터 만들기
					mp.put("paging", p);
					mp.put("search", search);
					//조회결과
					plist = adminDao.selectReturnListBySearchDataType3WithDate(mp);
					//맵 저장
					commandMap.put("plist", plist);
					commandMap.put("page", p);
				}
				
			//반품여부로 검색	
			}else {
				
				//수리여부&반품완료 데이터처리
				if( ((String)search.get("data")).equals("N") || ((String)search.get("data")).equals("n") ) {
					search.put("data", 0);
				}else if( ((String)search.get("data")).equals("Y") || ((String)search.get("data")).equals("y") ) {
					search.put("data", 1);
				}else {
					search.put("data", 3);
				}
				
				//페이징 객체
				p = new Paging(adminDao.selectReturnCntOfReturnSearchType4(search), cPage, cntPerPage);
				//파라미터 만들기
				mp.put("paging", p);
				mp.put("search", search);
				//조회결과
				plist = adminDao.selectReturnListBySearchDataType4(mp);
				//맵 저장
				commandMap.put("plist", plist);
				commandMap.put("page", p);
				
				//날짜조건이 있는 경우
				if( search.get("fromdate")!=null && search.get("fromdate")!= "" &&
						search.get("todate")!=null && search.get("todate")!= "" ) {
					//페이징 객체
					p = new Paging(adminDao.selectReturnCntOfReturnSearchType4WithDate(search), cPage, cntPerPage);
					//파라미터 만들기
					mp.put("paging", p);
					mp.put("search", search);
					//조회결과
					plist = adminDao.selectReturnListBySearchDataType4WithDate(mp);
					//맵 저장
					commandMap.put("plist", plist);
					commandMap.put("page", p);
				}
			}
		}else if( search.get("fromdate")!=null && search.get("fromdate")!= "" &&
				search.get("todate")!=null && search.get("todate")!= ""){ //검색어 없이 날짜로만 조회
			
			//페이징 객체
			Paging p = new Paging(adminDao.selectReturnCntOfByDate(search), cPage, cntPerPage);
			//파라미터 만들기
			Map<String,Object> mp = new HashMap<>();
			mp.put("paging", p);
			mp.put("search", search);
			//조회결과
			plist = adminDao.selectReturnListByDate(mp);
			//맵 저장
			commandMap.put("plist", plist);
			commandMap.put("page", p);
			
		}else{	//검색어나 날짜조회 없이 일반 조회
			
			//페이징 객체
			Paging p = new Paging(adminDao.selectReturnCnt(), cPage, cntPerPage);
			//파라미터 만들기
			Map<String,Object> mp = new HashMap<>();
			mp.put("paging", p);
			mp.put("search", search);
			//조회결과
			plist = adminDao.selectReturnList(p);
			//맵 저장
			commandMap.put("plist", plist);
			commandMap.put("page", p);
			
		}
		
		return commandMap;
	}

	@Override
	public List<Object> selectReturnDetail(String op_no) {
		
		return adminDao.selectReturnDetail(op_no);
	}

	@Override
	public int modifyReturnData(Map<String, Object> data) {
		
		return adminDao.modifyReturnData(data);
	}
	
	//---------------------------------------------------------------------------------
	

		//code를 rename 하는 코드 	
		public String renameCode(Object code) {
			
			return  code+adminDao.renameCode();
					
		}

		

		//상품 정보를 등록하고 상품이미지를 업로드, 저장 
		public void insertProduct(List<MultipartFile> files, Map<String, Object> product, String path, List<String> thumbList){
			
			//전달받은 product를 db에 저장
			adminDao.insertProduct(product);
			
			int idx = -1;
			
			//상품 이미지를 업로드한 경우
			if(!(files.get(0).getOriginalFilename().equals(""))) { 
		        
			    List<Map<String, Object>> fileData = null;
			    
			    try {
			    	
			    	//실제로 이미지 업로드
			    	fileData = new FileUtil().fileUpload(files, path);
					
					for(Map<String, Object> f : fileData) {
						
						idx++;
						
						//이미지가 참조하는 상품의 코드 저장하기
						f.put("ref", product.get("code"));
						//썸네일 여부 저장
						if(thumbList.size() > idx) {
							f.put("thumbnail", thumbList.get(idx));
						}else {
							f.put("thumbnail", 0);
						}
						
						//DB에 상품이미지 정보 저장
						adminDao.insertProductImage(f);
					}
				} catch (FileException e) {
					e.printStackTrace();
				}
		      }else { //사용자가 상품 이미지를 업로드 하지 않을 때 기본 상품이미지가 존재하나?!
		    	  
		    	  System.out.println("!!");
		    	  
		      }
			
			
		}//insertProduct end 
		
		//상품 상세 정보
		@Override
		public Map<String, Object> selectProductDetail(String code) {

			return adminDao.selectProductDetail(code);
		}
		
		//상품 이미지 정보
		@Override
		public Map<String, Object> selectFilesOfProduct(String code) {
			
			return adminDao.selectFilesOfProduct(code);
		}
		
		//상품 이미지 삭제
		@Override
		public int deleteFile(String no, HttpSession session) {
			
			Map<String, Object> commandMap = adminDao.selectFileWifhFileNo(no);
			
			String path = session.getServletContext().getRealPath("/resources/upload_product") + "/" + commandMap.get("renamed") + "." + commandMap.get("ext");
			System.out.println("서비스임플" + path);
			
			new FileUtil().deleteFile(path);
			
			return adminDao.deleteFile(no);
		}

		//상품 정보 수정 및 추가 이미지 저장	
		@Override
		public void updateProductData(List<MultipartFile> files, Map<String, Object> product, String path,
				List<String> thumbList) {
			
			//상품 정보 수정
			adminDao.updateProductData(product);
			
			int idx = -1;
			
			//상품 이미지를 추가 업로드
			if(!(files.get(0).getOriginalFilename().equals(""))) { 
		        
			    List<Map<String, Object>> fileData = null;

			    try {
			    	
			    	//파일 두번째 인덱스가 빈 값일때 배열 삭제
			    	if(files.get(1).getOriginalFilename().equals("")) {
			    		files.remove(1);
			    	}
			    	
			    	//실제로 이미지 업로드
			    	fileData = new FileUtil().fileUpload(files, path);
					
					for(Map<String, Object> f : fileData) {
						
						idx++;
						
						//이미지가 참조하는 상품의 코드 저장하기
						f.put("ref", product.get("code"));
						//썸네일 여부 저장
						if(thumbList.size() > idx) {
							f.put("thumbnail", thumbList.get(idx));
						}else {
							f.put("thumbnail", 0);
						}
						
						//DB에 상품이미지 정보 저장
						adminDao.insertProductImage(f);
					}
				} catch (FileException e) {
					e.printStackTrace();
				}
		      }else { //추가로 상품 이미지 등록 하지 않았을 때
		    	  
		    	 // System.out.println("!!");
		    	  
		      }
			
		}

		//회원관리
		@Override
		public Map<String, Object> selectMemberList(int cPage, int cntPerPage, Map<String,Object> search) {
		
			Map<String, Object> commandMap = new HashMap<>();

			//검색어가 있는 경우
			if(search.get("data") != null && search.get("data") != "") {

				//회원아이디로 검색한 경우
				if( Integer.valueOf((String) search.get("type")) == 1 ) {
					//페이징 객체
					Paging p = new Paging(adminDao.selectMemberCntOfSearchType1(search), cPage, cntPerPage);
					//파라미터 만들기
					Map<String, Object> m = new HashMap<>();
					m.put("paging", p);
					m.put("search", search);
					//조회 결과
					List<Map<String,Object>> plist = adminDao.selectMemberListBySearchDataType1(m);
					//맵 저장
					commandMap.put("mlist", plist);
					commandMap.put("page", p);
				}else {
				//회원이름으로 검색한 경우
					//페이징 객체
					Paging p = new Paging(adminDao.selectMemberCntOfSearchType2(search), cPage, cntPerPage);
					//파라미터 만들기
					Map<String, Object> m = new HashMap<>();
					m.put("paging", p);
					m.put("search", search);
					//조회 결과
					List<Map<String,Object>> plist = adminDao.selectMemberListBySearchDataType2(m);
					//맵 저장
					commandMap.put("mlist", plist);
					commandMap.put("page", p);
				}
			}else {
				//검색어가 없는 경우
				//페이징 객체
				Paging p = new Paging(adminDao.selectMemberCnt(), cPage, cntPerPage);
				//결과 조회
				List<Map<String,Object>> plist = adminDao.selectMemberList(p);
				//맵 저장
				commandMap.put("mlist", plist);
				commandMap.put("page", p);
			}
			
			return commandMap;
		}
	
}
