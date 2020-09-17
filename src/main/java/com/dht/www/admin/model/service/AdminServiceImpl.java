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
				Paging p = new Paging(adminDao.selectProductCntOfSearchType1(search), cPage, cntPerPage);
				//파라미터 만들기
				Map<String, Object> mp = new HashMap<>();
				mp.put("paging", p);
				mp.put("search", search);
				//조회 결과
				List<Map<String,Object>> plist = adminDao.selectProductListOfSearchType1(mp);
				//맵 저장
				commandMap.put("plist", plist);
				commandMap.put("page", p);
			}else {
				//페이징 객체
				Paging p = new Paging(adminDao.selectProductCntOfSearchType2(search), cPage, cntPerPage);
				//파라미터 만들기
				Map<String, Object> mp = new HashMap<>();
				mp.put("paging", p);
				mp.put("search", search);
				//조회 결과
				List<Map<String,Object>> plist = adminDao.selectProductListOfSearchType2(mp);
				//맵 저장
				commandMap.put("plist", plist);
				commandMap.put("page", p);
			}
		}else {
			//검색어가 없는 경우
			//페이징 객체
			Paging p = new Paging(adminDao.selectProductCnt(), cPage, cntPerPage);
			//결과 조회
			List<Map<String,Object>> plist = adminDao.selectProductList(p);
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
	public Map<String, Object> selectStatusList(int cPage, int cntPerPage, Map<String, Object> search) {
		
		//최종반환
		Map<String, Object> commandMap = new HashMap<>();
		//조회결과
		List<Map<String,Object>> slist = null;
		
		//검색어가 있는 경우
		if( search.get("data")!=null && search.get("data") != "") {
			
			//페이징 객체 생성
			Paging p = null;
			//파라미터 객체 생성
			Map<String,Object> mp = new HashMap<>();
			
			//상품코드로 검색
			if( Integer.valueOf((String)search.get("type"))== 1  ) { 
				
				//페이징 객체
				p = new Paging(adminDao.selectStatusCntOfSearchType1(search), cPage, cntPerPage);
				//파라미터 만들기
				mp.put("paging", p);
				mp.put("search", search);
				//조회결과
				slist = adminDao.selectStatusListOfSearchType1(mp);
				//맵 저장
				commandMap.put("slist", slist);
				commandMap.put("page", p);
				
				//날짜조건이 있는 경우
				if( search.get("fromdate")!=null && search.get("fromdate")!= "" &&
						search.get("todate")!=null && search.get("todate")!= "" ) {
					
					System.out.println("??????????????????/ 들어왔냐?");
					
					//페이징 객체
					p = new Paging(adminDao.selectStatusCntOfSearchType1WithDate(search), cPage, cntPerPage);
					//파라미터 만들기
					mp.put("paging", p);
					mp.put("search", search);
					//조회결과
					slist = adminDao.selectStatusListOfSearchType1WithDate(mp);
					//맵 저장
					commandMap.put("slist", slist);
					commandMap.put("page", p);
				}
				
			//상품명으로 검색	
			}else if( Integer.valueOf((String)search.get("type"))== 2 ) { 
				
				//페이징 객체
				p = new Paging(adminDao.selectStatusCntOfSearchType2(search), cPage, cntPerPage);
				//파라미터 만들기
				mp.put("paging", p);
				mp.put("search", search);
				//조회결과
				slist = adminDao.selectStatusListOfSearchType2(mp);
				//맵 저장
				commandMap.put("slist", slist);
				commandMap.put("page", p);
				
				//날짜조건이 있는 경우
				if( search.get("fromdate")!=null && search.get("fromdate")!= "" &&
						search.get("todate")!=null && search.get("todate")!= "" ) {
					//페이징 객체
					p = new Paging(adminDao.selectStatusCntOfSearchType2WithDate(search), cPage, cntPerPage);
					//파라미터 만들기
					mp.put("paging", p);
					mp.put("search", search);
					//조회결과
					slist = adminDao.selectStatusListOfSearchType2WithDate(mp);
					//맵 저장
					commandMap.put("slist", slist);
					commandMap.put("page", p);
				}
			
			//배송상태로 검색	
			}else{
				
				String param = (String)search.get("data");
				
				//수리여부&반품완료 데이터처리
				if( param.equals("상품준비") ) {
					search.put("data", 1);
				}else if( param.equals("출고") ) {
					search.put("data", 2);
				}else if( param.equals("배송완료") ) {
					search.put("data", 3);
				}else if( param.equals("주문취소") ) {
					search.put("data", 4);
				}else if( param.equals("반품접수") ) {
					search.put("data", 5);
				}else {
					search.put("data", 6);
				};
			
				//페이징 객체
				p = new Paging(adminDao.selectStatusCntOfSearchType3(search), cPage, cntPerPage);
				//파라미터 만들기
				mp.put("paging", p);
				mp.put("search", search);
				//조회결과
				slist = adminDao.selectStatusListOfSearchType3(mp);
				//맵 저장
				commandMap.put("slist", slist);
				commandMap.put("page", p);
				
				//날짜조건이 있는 경우
				if( search.get("fromdate")!=null && search.get("fromdate")!= "" &&
						search.get("todate")!=null && search.get("todate")!= "" ) {
					//페이징 객체
					p = new Paging(adminDao.selectStatusCntOfSearchType3WithDate(search), cPage, cntPerPage);
					//파라미터 만들기
					mp.put("paging", p);
					mp.put("search", search);
					//조회결과
					slist = adminDao.selectStatusListOfSearchType3WithDate(mp);
					//맵 저장
					commandMap.put("slist", slist);
					commandMap.put("page", p);
				}
				
			}
		//검색어 없이 날짜로만 조회	
		}else if( search.get("fromdate")!=null && search.get("fromdate")!= "" &&
				search.get("todate")!=null && search.get("todate")!= ""){ 
			
			//페이징 객체
			Paging p = new Paging(adminDao.selectStatusCntWithDate(search), cPage, cntPerPage);
			//파라미터 만들기
			Map<String,Object> mp = new HashMap<>();
			mp.put("paging", p);
			mp.put("search", search);
			//조회결과
			slist = adminDao.selectStatusListWithDate(mp);
			//맵 저장
			commandMap.put("slist", slist);
			commandMap.put("page", p);
			
		}
		//검색어나 날짜조회 없이 일반 조회
		else{
			
			//페이징 객체
			Paging p = new Paging(adminDao.selectStatusCnt(), cPage, cntPerPage);
			//조회결과
			slist = adminDao.selectStatusList(p);
			//맵 저장
			commandMap.put("slist", slist);
			commandMap.put("page", p);
			
		}
		
		return commandMap;
	}

	@Override
	public List<Object> selectOrdersDetail(String o_no) {
		
		return adminDao.selectOrdersDetail(o_no);
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
			if(!(files.get(0).getOriginalFilename().equals("")) ) { 
		        
				System.out.println("이미지 들어왔나 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
				
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
		      }else if( !(files.get(1).getOriginalFilename().equals("")) ) {
		    	  
		    	  System.out.println("썸네일 없이 상세만 등록했을때");
		    	  
		    	  List<Map<String, Object>> fileData = null;
		    	  
		    	  try {
		    		  
				    	//파일 첫번째 인덱스가 빈 값일때 배열 삭제
				    	if(files.get(0).getOriginalFilename().equals("")) {
				    		files.remove(0);
				    	}
		    		  
		    		  //실제로 이미지 업로드
		    		  fileData = new FileUtil().fileUpload(files, path);
		    		  
						for(Map<String, Object> f : fileData) {
							
							//이미지가 참조하는 상품의 코드 저장하기
							f.put("ref", product.get("code"));
							//썸네일 '0' 저장
							f.put("thumbnail", 0);
							
							//DB에 상품이미지 정보 저장
							adminDao.insertProductImage(f);
							
						}
					
				} catch (FileException e) {

					e.printStackTrace();
				}
		    	  
		    	  
		      }else { //추가로 상품 이미지 등록 하지 않았을 때
		    	  
		    	  System.out.println("이미지  안들어옴 ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ");
		    	  
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
		
		//매출목록
		@Override
		public Map<String, Object> selectSalesList(int cPage, int cntPerPage, Map<String, Object> search) {
						
			//최종반환
			Map<String, Object> commandMap = new HashMap<>();
			//조회결과
			List<Map<String,Object>> slist = null;
			//매출합산계산결과
			Map<String,Object> total = null;
			
			//검색어가 있는 경우
			if( search.get("data")!=null && search.get("data") != "") {
				
				//페이징 객체 생성
				Paging p = null;
				//파라미터 객체 생성
				Map<String,Object> mp = new HashMap<>();
				
				//상품코드로 검색
				if( Integer.valueOf((String)search.get("type"))== 1  ) { 
					
					//페이징 객체
					p = new Paging(adminDao.selectSalesCntOfSearchType1(search), cPage, cntPerPage);
					//파라미터 만들기
					mp.put("paging", p);
					mp.put("search", search);
					//조회결과
					slist = adminDao.selectSalesListOfSearchType1(mp);
					//매출합산
					total = adminDao.selectSalesTotal_SearchType1(mp);
					
					//맵 저장
					commandMap.put("slist", slist);
					commandMap.put("page", p);
					commandMap.put("total", total);
					
					//날짜조건이 있는 경우
					if( search.get("fromdate")!=null && search.get("fromdate")!= "" &&
							search.get("todate")!=null && search.get("todate")!= "" ) {
						
						//페이징 객체
						p = new Paging(adminDao.selectSalesCntOfSearchType1WithDate(search), cPage, cntPerPage);
						//파라미터 만들기
						mp.put("paging", p);
						mp.put("search", search);
						//조회결과
						slist = adminDao.selectSalesListOfSearchType1WithDate(mp);
						//매출합산
						total = adminDao.selectSalesTotal_SearchType1WithDate(mp);
						
						//맵 저장
						commandMap.put("slist", slist);
						commandMap.put("page", p);
						commandMap.put("total", total);
					}
					
				//상품명으로 검색	
				}else{ 
					
					//페이징 객체
					p = new Paging(adminDao.selectSalesCntOfSearchType2(search), cPage, cntPerPage);
					//파라미터 만들기
					mp.put("paging", p);
					mp.put("search", search);
					//조회결과
					slist = adminDao.selectSalesListOfSearchType2(mp);
					//매출합산
					total = adminDao.selectSalesTotal_SearchType2(mp);
					
					//맵 저장
					commandMap.put("slist", slist);
					commandMap.put("page", p);
					commandMap.put("total", total);
					
					//날짜조건이 있는 경우
					if( search.get("fromdate")!=null && search.get("fromdate")!= "" &&
							search.get("todate")!=null && search.get("todate")!= "" ) {
						//페이징 객체
						p = new Paging(adminDao.selectSalesCntOfSearchType2WithDate(search), cPage, cntPerPage);
						//파라미터 만들기
						mp.put("paging", p);
						mp.put("search", search);
						//조회결과
						slist = adminDao.selectSalesListOfSearchType2WithDate(mp);
						//매출합산
						total = adminDao.selectSalesTotal_SearchType2WithDate(mp);
						
						//맵 저장
						commandMap.put("slist", slist);
						commandMap.put("page", p);
						commandMap.put("total", total);
					}
				
				//배송상태로 검색	
				}
			//검색어 없이 날짜로만 조회	
			}else if( search.get("fromdate")!=null && search.get("fromdate")!= "" &&
					search.get("todate")!=null && search.get("todate")!= ""){ 
				
				//페이징 객체
				Paging p = new Paging(adminDao.selectSalesCntWithDate(search), cPage, cntPerPage);
				//파라미터 만들기
				Map<String,Object> mp = new HashMap<>();
				mp.put("paging", p);
				mp.put("search", search);
				//조회결과
				slist = adminDao.selectSalesListWithDate(mp);
				//매출합산
				total = adminDao.selectSalesTotal_WithDate(mp);
				
				//맵 저장
				commandMap.put("slist", slist);
				commandMap.put("page", p);
				commandMap.put("total", total);
				
			}
			//검색어나 날짜조회 없이 일반 조회
			else{
				
				//페이징 객체
				Paging p = new Paging(adminDao.selectSalesCnt(), cPage, cntPerPage);
				//조회결과
				slist = adminDao.selectSalesList(p);
				//매출합산
				total = adminDao.selectSalesTotal(p);
				
				//맵 저장
				commandMap.put("slist", slist);
				commandMap.put("page", p);
				commandMap.put("total", total);
				
			}
			
			return commandMap;
			
		}

		@Override
		public int modifyStatus(int op_no, String status) {
			
			Map<String,Object> mp = new HashMap<>();
			mp.put("op_no", op_no);
			mp.put("status", status);
			
			return adminDao.modifyStatus(mp);
		}
	
}
