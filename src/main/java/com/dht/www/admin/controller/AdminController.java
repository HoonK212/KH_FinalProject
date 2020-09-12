package com.dht.www.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import com.dht.www.admin.model.service.AdminService;
import com.google.gson.Gson;


@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//재고 목록 조회
	@RequestMapping("/stocklist")
	public String selectStockList(
			@RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="10") int cntPerPage,
			@RequestParam Map<String, Object> search,
			Model model) {
		
		System.out.println("컨트롤러 서치 객체 : " + search);
		
		Map<String,Object> result = adminService.selectProductList(cPage, cntPerPage, search);
		
		System.out.println(result);
		
		model.addAttribute("plist", result.get("plist"));
		model.addAttribute("page", result.get("page"));
		//검색한 경우 검색정보를 담기
		if(search.get("data") != null && search.get("data") != "") {
			model.addAttribute("search", search);
		}
		
		return "admin/stock_list";
	}
	
	//재고 상세 조회
	@RequestMapping("/stockdetail")
	@ResponseBody
	public Object selectStockDetail(@RequestParam String code, Model model) {
		
		List<Object> result = adminService.selectStockDetail(code);
		
		System.out.println(result);
		
		return result;
	}
	
	//재고 수정
	@RequestMapping(value = "/stockmodify", method = RequestMethod.POST)
	public String modifyStockData(@RequestParam Map<String,Object> data) {
		
		System.out.println(data);
		int res = adminService.modifyStockData(data);
		
		return "redirect:stocklist";
	}
	
	//배송상태 조회
	@RequestMapping(value = "/statuslist")
	public String selectStatusList(
			@RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="10") int cntPerPage,
			@RequestParam Map<String, Object> search,
			Model model) {
		
		System.out.println("컨트롤러 서치 객체 : " + search);
		
		Map<String,Object> result = adminService.selectStatusList(cPage, cntPerPage, search);
		
		System.out.println(result);
		
		model.addAttribute("slist", result.get("slist"));
		model.addAttribute("page", result.get("page"));
		//검색한 경우 검색정보를 담기
		if( (search.get("data") != null && search.get("data") != "") || 
			(search.get("fromdate")!=null && search.get("fromdate")!= "" && search.get("todate")!=null && search.get("todate")!= "") ) {
			model.addAttribute("search", search);
		}
		
		return "admin/status_list";
	}
	
	//반품 상세
	@RequestMapping(value = "/ordersdetail", method = RequestMethod.GET)
	@ResponseBody
	public Object selectOrdersDetail(@RequestParam String o_no, Model model) {
		
		System.out.println(o_no);
		
		List<Object> result = adminService.selectOrdersDetail(o_no);
		
		System.out.println(result);
		
		return result;
	}
	

	//-------------------------------------------------------------------------------------------------------------
	


	//상품등록 view로 이동하는 메소드
	@RequestMapping(value="/productregister", method=RequestMethod.GET)
	public String productRegister() {
		
		return "admin/product_register";
	}
	
	//상품등록
	@RequestMapping(value="/productregister", method=RequestMethod.POST)
	public String productRegister(@RequestParam List <MultipartFile> files, 
			@RequestParam Map<String, Object> product, HttpSession session, String thumbArr){
		
		System.out.println("product-Register : " + product);
		System.out.println("files-productRegister :" + files);
		
		//썸네일정보 파싱
		Gson gson = new Gson();
        List<String> thumbList = gson.fromJson(thumbArr, List.class);
        System.out.println(thumbList);
        
        
		//product의 code를 renaname 하는 코드 
		String code = adminService.renameCode(product.get("code"));
		
		//rename한 코드를 product에 저장 
		product.put("code", code);
		
		//상품 이미지 저장 경로 
		String path = session.getServletContext().getRealPath("/resources/upload_product");
		
		//상품 이미지 업로드, 저장 & 상품정보  DB에 저장
		adminService.insertProduct(files, product, path, thumbList);
		
		//상품리스트로 리턴 
	//	return "";
		return "redirect:productlist";
				
	}
	
	//상품목록
	@RequestMapping(value="/productlist", method=RequestMethod.GET)
	public String productList(@RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="10") int cntPerPage,
			@RequestParam Map<String, Object> search,
			Model model) {
	
		System.out.println("컨트롤러 서치 객체 : " + search);
		
		Map<String,Object> result = adminService.selectProductList(cPage, cntPerPage, search);
		
		System.out.println(result);
		
		model.addAttribute("plist", result.get("plist"));
		model.addAttribute("page", result.get("page"));
		
		//검색한 경우 검색정보를 담기
		if(search.get("data") != null && search.get("data") != "") {
			model.addAttribute("search", search);
		}
		
		return "admin/product_list";
	}
	
	//상세상세 및 수정 페이지로 이동
	@RequestMapping(value="/productdetail" , method=RequestMethod.GET)
	public String productDetail(@RequestParam String code , Model model) {
		
		//code에 해당하는 상품의 정보를 가져오는 메소드 
		Map<String,Object> product = adminService.selectProductDetail(code);
		
		//코드에 해당하는 상품의 파일을 가져오는 메소드 
		Map<String, Object> files = adminService.selectFilesOfProduct(code);
		
		model.addAttribute("product", product);
		model.addAttribute("filelist", files.get("filelist"));
		model.addAttribute("thumblist", files.get("thumblist"));
		
		return "admin/product_update";
	}
	
	//상품이미지 삭제
	@RequestMapping(value = "/deletefile" , method = RequestMethod.GET)
	@ResponseBody
	public String deleteThumb(String no, HttpSession session) {
		
		System.out.println(no);
		
		int res = adminService.deleteFile(no, session);
		System.out.println(res);
		
		return no;
	}
	
	//상품정보 수정
	@RequestMapping(value = "/productupdate", method = RequestMethod.POST)
	public String updateProductData(@RequestParam List <MultipartFile> files, 
			@RequestParam Map<String, Object> product, HttpSession session, String thumbArr) {
		
		System.out.println("product-Register : " + product);
		System.out.println("files-productRegister :" + files);
		
		//썸네일정보 파싱
		Gson gson = new Gson();
        List<String> thumbList = gson.fromJson(thumbArr, List.class);
        System.out.println(thumbList);
        
		//상품 이미지 저장 경로 
		String path = session.getServletContext().getRealPath("/resources/upload_product");
		
		//상품 이미지 업로드, 저장 & 상품정보  DB에 저장
		adminService.updateProductData(files, product, path, thumbList);
		
		
		return "redirect:productlist";
	}
	
	//매출목록 view로 이동하는 메소드 
	@RequestMapping(value="/salesList",method=RequestMethod.GET)
	public String salesList(@RequestParam(required = false, defaultValue="1")int cPage, Model model) {
			
		//페이징 처리 
		//매출목록 정보를 가져오는 메소드 
		int cntPerPage = 10 ;
		
	//	Map<String, Object> commandMap = adminService.selectSalesList(cPage, cntPerPage);
		
	//	System.out.println("commandMap : " + commandMap);
		
	//	model.addAttribute("paging",commandMap.get("paging"));
	//	model.addAttribute("salesData", commandMap);
		
		return "admin/sales_list";
		
	}
	
	//회원 관리
	@RequestMapping(value="/memberlist", method=RequestMethod.GET)
	public String memberList(@RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="10") int cntPerPage,
			@RequestParam Map<String, Object> search,
			Model model) {
	
		Map<String,Object> result = adminService.selectMemberList(cPage, cntPerPage, search);
		
		model.addAttribute("mlist", result.get("mlist"));
		model.addAttribute("page", result.get("page"));
		
		//검색한 경우 검색정보를 담기
		if(search.get("data") != null && search.get("data") != "") {
			model.addAttribute("search", search);
		}
		
		return "admin/member_list";
	}
	
	//신고 관리
	@RequestMapping(value = "/reportlist")
	public String selectReportList(
			@RequestParam(required=false, defaultValue="1") int cPage,
			@RequestParam(required=false, defaultValue="15") int cntPerPage,
			@RequestParam Map<String, Object> search,
			Model model) {
		
		Map<String,Object> result = adminService.selectReturnList(cPage, cntPerPage, search);
		
		model.addAttribute("rlist", result.get("plist"));
		model.addAttribute("page", result.get("page"));
		
		//검색한 경우 검색정보를 담기
		if( (search.get("data") != null && search.get("data") != "") || 
			(search.get("fromdate")!=null && search.get("fromdate")!= "" && search.get("todate")!=null && search.get("todate")!= "") ) {
			model.addAttribute("search", search);
		}
		
		return "admin/report_list";
	}
	
	//신고 내용
	@RequestMapping(value = "/reportdetail", method = RequestMethod.GET)
	@ResponseBody
	public Object selectReportDetail(@RequestParam String op_no, Model model) {
		
		List<Object> result = adminService.selectReturnDetail(op_no);
		
		return result;
	}
	
	//신고 처리
	@RequestMapping(value = "/reportmodify", method = RequestMethod.POST)
	public String modifyReportData(@RequestParam Map<String, Object> data) {
		
		System.out.println(data);
		
		int res = adminService.modifyReturnData(data);
		
		return "redirect:reportlist";
	}

	
}
