package com.dht.www.shopping.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dht.www.shopping.model.service.ShoppingService;
import com.dht.www.shopping.model.vo.Basket;
import com.dht.www.user.model.vo.Users;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Autowired
	private ShoppingService shoppingService;

	
	//쇼핑 홈
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void shoppingHome(Model model) {
		
		model.addAttribute("list1", shoppingService.selectHome("A"));
		model.addAttribute("list2", shoppingService.selectHome("B"));
		model.addAttribute("list3", shoppingService.selectHome("C"));
		
		System.out.println(shoppingService.selectHome("A"));
	}
	
	//게시판 목록
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String shoppingList(Model model, @RequestParam(required=false, defaultValue="1") int curPage
								, @RequestParam(required=false, defaultValue="0") int listno) {
		
		int cntPerPage = 16;
		
		model.addAttribute("list", shoppingService.selectList(listno, curPage, cntPerPage));
		model.addAttribute("listno", listno);
		
		return "/shopping/content";
		
	}
	
	@RequestMapping("/content")
	@ResponseBody
	public void loadContent() {}
	
	//제품 상세페이지
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void shoppingDetail(Model model, String code) {
		System.out.println(code);
	}
	
	@RequestMapping(value="/modalload", method=RequestMethod.GET)
	public String modalLoad(Model model, String code) {
		model.addAttribute("detail", shoppingService.selectItem(code));
		return "/shopping/modalcontent";
	}
	
	@RequestMapping("/modalcontent")
	@ResponseBody
	public void modalContent() { }
	
	//장바구니 조회
	@RequestMapping(value="/basket", method=RequestMethod.GET)
	public void shoppingBasket(Model model, HttpSession session) {
		
		Users user = (Users)session.getAttribute("logInInfo");
		
		if(user != null) {
			//로그인
			model.addAttribute("basket", shoppingService.selectBasket(user));
		} else {
			//비로그인
			model.addAttribute("basket", session.getAttribute("basket"));
		}
	}

	//장바구니 추가
	@RequestMapping(value="/basket", method=RequestMethod.POST)
	@ResponseBody
	public void addBasket(Model model, HttpSession session, 
			@RequestParam(required=false, defaultValue="guest") String userId, String codes, int amount) {
		System.out.println(userId);
		System.out.println(codes);
		System.out.println(amount);
		
		Users user = (Users)session.getAttribute("logInInfo");
		
		if(user != null && userId.equals(user.getId())) {
			//로그인
			Basket basket = new Basket();
			basket.setCode(codes);
			basket.setId(userId);
			basket.setAmount(amount);
			
			int res = shoppingService.checkBasket(basket);
			System.out.println(res);
			
			if(res > 0) {
				shoppingService.addAmount(basket);
				
			} else {
				shoppingService.insertBasket(basket);
			}
			
		} else {
			//비로그인
		}
	}
	
	//장바구니 수량 업데이트
	@RequestMapping(value="/amount", method=RequestMethod.GET)
	@ResponseBody
	public int updateAmount(int amount, String code, HttpSession session) {
		
		Users user = (Users) session.getAttribute("logInInfo");

		if (user != null) {
			//로그인
			Basket basket = new Basket();
			basket.setId(user.getId());
			basket.setCode(code);
			basket.setAmount(amount);
			
			return shoppingService.updateAmount(basket);
			
		} else {
			//비로그인 - 장바구니 O
			List<Map<String, Object>> basket = (List<Map<String, Object>>) session.getAttribute("basket");
			
			if (basket.get(0).get("sessionId").equals(session.getId())) {
				Map<String, Object> items = basket.get(1);
				
				Basket item = (Basket) items.get(code);
				item.setAmount(amount);

				return 0;

			} else {
				//비로그인 - 장바구니 X
				return -1;
			}
		}
	}
	
	//장바구니 삭제
	@RequestMapping(value="/deletebasket", method=RequestMethod.POST)
	@ResponseBody
	public String deleteBasket(HttpSession session, int num, Basket basket) {
		
		Users user = (Users)session.getAttribute("logInInfo");
		
		if(user != null) {
			//로그인
			int res = shoppingService.deleteBasket(basket);
			
			if (res > 0) {
				return "#b" + num;
			} else {
				return "fail";
			}
		} else {
			//비로그인
			
			return null;
		}
		
	}
	
	//장바구니 선택 삭제
	@RequestMapping(value="/deletelist", method=RequestMethod.POST)
	public String deleteList(HttpSession session, String userId, String codes) {
		
		System.out.println(codes);
		
		Users user = (Users)session.getAttribute("logInInfo");
		
		String[] array = codes.split(",");
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("array", array);
		
		if(user != null) {
			//로그인
			int res = shoppingService.deleteList(map);
			
		} else {
			//비로그인
			
		}
		
		return "redirect:/shopping/basket";
		
	}
	
	//결제페이지
	@RequestMapping(value="/payment", method=RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public String shoppingPayment(Model model, HttpSession session ,@RequestParam String userId, String codes) {
		
		if(session.getAttribute("logInInfo") == null) {
			return "user/login";
		}else{
			
			System.out.println(userId);
			System.out.println(codes);
			
			String[] array = codes.split(",");
			
			for(int i=0;i<array.length;i++) {
				System.out.println(array[i]);
			}
			
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("userId", userId);
			map.put("array", array);
			
			model.addAttribute("product", shoppingService.selectProuct(map));
			model.addAttribute("point", shoppingService.selectPoint(userId));
			
			return "shopping/payment";
		}
	}

	//결제 완료
	@RequestMapping(value="/paymentCheck", method = RequestMethod.POST)
	@ResponseBody
	public void shoppingPaymentCheck(@RequestBody String uid) {
		
		System.out.println("결제" + uid);
		
		ObjectMapper mapper = new ObjectMapper(); 
		Map<String, Object> map = new HashMap<String, Object>(); 
		try {
			map = mapper.readValue(uid, new TypeReference<Map<String, Object>>(){});
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} 
		System.out.println("1 값이 나오나 " + map.get("product"));
		System.out.println("2 값이 나오나 " + map.get("poin"));
		System.out.println("3 값이 나오나 " + map.get("logName"));
		System.out.println("4 값이 나오나 " + map.get("logPost"));
		System.out.println("5 값이 나오나 " + map.get("logAddr"));

		
	}
	
	@RequestMapping(value="/paymentComplete", method = RequestMethod.GET)
	public void shoppingPaymentComplete() {
		
	}
	
	//배송지정보 ajax
	@RequestMapping(value="/delivery", method=RequestMethod.GET)
	public String shoppingDelivery(@RequestParam int num) {
		
		if(num == 0) {
			return "shopping/delivery_basic";
		}else{
			return "shopping/delivery_new";
		}
	}
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	public void testGet() {
		
	}
	
	@RequestMapping(value="/test", method=RequestMethod.POST)
	public void testPost(@RequestParam(required=false, defaultValue="guest") String userId, String codes, int amount) {
		System.out.println(userId);
		System.out.println(codes);
		System.out.println(amount);
	}
	
}
