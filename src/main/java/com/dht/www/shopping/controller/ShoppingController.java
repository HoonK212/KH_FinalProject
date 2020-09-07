package com.dht.www.shopping.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.dht.www.shopping.model.vo.OrderProduct;
import com.dht.www.shopping.model.vo.Orders;

import com.dht.www.user.model.vo.Users;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import com.google.gson.reflect.TypeToken;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {

	@Autowired
	private ShoppingService shoppingService;

	// 쇼핑 홈
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public void shoppingHome(Model model) {

		model.addAttribute("list1", shoppingService.selectHome("A"));
		model.addAttribute("list2", shoppingService.selectHome("B"));
		model.addAttribute("list3", shoppingService.selectHome("C"));
	}

	// 게시판 목록
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String shoppingList(Model model, @RequestParam(required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false, defaultValue = "0") int listno) {

		int cntPerPage = 16;

		Map<String, Object> commandMap = shoppingService.selectList(listno, cPage, cntPerPage);

		model.addAttribute("list", commandMap.get("list"));
		model.addAttribute("paging", commandMap.get("paging"));
		model.addAttribute("listno", listno);

		return "/shopping/list";
	}

	// 제품 상세페이지
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void shoppingDetail(Model model, String code) {
		model.addAttribute("detail", shoppingService.selectItem(code));
		model.addAttribute("list", shoppingService.selectHome(code.substring(0, 1)));
		model.addAttribute("reviews", shoppingService.selectReview(code));
		model.addAttribute("avg", shoppingService.scoreAvg(code));
	}

	// 장바구니 모달창 AJAX
	@RequestMapping(value = "/modalload", method = RequestMethod.GET)
	public String modalLoad(Model model, String code) {
		model.addAttribute("detail", shoppingService.selectItem(code));
		return "/shopping/modalcontent";
	}

	@RequestMapping("/modalcontent")
	@ResponseBody
	public void modalContent() {
	}

	// 장바구니 조회
	@RequestMapping(value = "/basket", method = RequestMethod.GET)
	public void shoppingBasket(Model model, HttpSession session) {

		Users user = (Users) session.getAttribute("logInInfo");

		if (user != null) {
			// 로그인
			session.setAttribute("basket", shoppingService.selectBasket(user));
		} else {
			// 비로그인
			List<Map<String, Object>> sessionBasket = (List<Map<String, Object>>) session.getAttribute("sessionBasket");

			if (sessionBasket != null && session.getId().equals((String) sessionBasket.get(0).get("sessionId"))) {
				session.setAttribute("basket", sessionBasket.get(1).values());
			} else {
				session.setAttribute("basket", null);
			}
		}
	}

	// 장바구니 조회
	@RequestMapping(value = "/loadcart", method = RequestMethod.GET)
	public String loadCart(Model model, HttpSession session) {

		Users user = (Users) session.getAttribute("logInInfo");

		if (user != null) {
			// 로그인
			model.addAttribute("basket", shoppingService.selectBasket(user));
		} else {
			// 비로그인
			List<Map<String, Object>> sessionBasket = (List<Map<String, Object>>) session.getAttribute("sessionBasket");

			if (sessionBasket != null && session.getId().equals((String) sessionBasket.get(0).get("sessionId"))) {
				model.addAttribute("basket", sessionBasket.get(1).values());
			} else {
				model.addAttribute("basket", null);
			}
		}
		return "/shopping/cart";
	}
	
	@RequestMapping("/cart")
	@ResponseBody
	public void cart() { }

	// 장바구니 추가
	@RequestMapping(value = "/basket", method = RequestMethod.POST)
	@ResponseBody
	public void addBasket(Model model, HttpSession session,
			@RequestParam(required = false, defaultValue = "guest") String userId, String codes, int amount) {
		System.out.println(userId);
		System.out.println(codes);
		System.out.println(amount);

		Users user = (Users) session.getAttribute("logInInfo");

		// 장바구니에 추가할 item
		Basket insert = new Basket();
		insert.setCode(codes);
		insert.setId(userId); // 로그인 회원일 때는 userId, 비로그인 회원일 때는 guest
		insert.setAmount(amount);

		// ------------------------ 로그인 ------------------------
		if (user != null && userId.equals(user.getId())) {

			int res = shoppingService.checkBasket(insert);

			if (res > 0) {
				shoppingService.addAmount(insert);

			} else {
				shoppingService.insertBasket(insert);
			}
			// ----------------------------------------------------------

			// ------------------------ 비로그인 ------------------------
		} else {
			List<Map<String, Object>> sessionBasket = (List<Map<String, Object>>) session.getAttribute("sessionBasket");

			// 세션에 등록된 장바구니가 없을 때
			if (sessionBasket == null) {
				sessionBasket = new ArrayList<Map<String, Object>>();

				Map<String, Object> sessionId = new HashMap<String, Object>();
				Map<String, Object> items = new HashMap<String, Object>();

				sessionId.put("sessionId", session.getId());

				Map<String, Object> sessionItem = shoppingService.sessionBasket(insert.getCode());
				sessionItem.put("amount", insert.getAmount());

				items.put(insert.getCode(), sessionItem);

				sessionBasket.add(sessionId);
				sessionBasket.add(items);

				session.setAttribute("sessionBasket", sessionBasket);
				session.setAttribute("basket", sessionBasket.get(1).values());

				// 세션에 등록된 장바구니가 있을 경우
			} else {
				System.out.println("addBasket() - basket" + sessionBasket + "basket.get(1)" + sessionBasket.get(1));

				if (session.getId().equals((String) sessionBasket.get(0).get("sessionId"))) {

					// 장바구니 들어있는 map
					Map<String, Object> items = sessionBasket.get(1);

					// 해당 상품이 있을 경우
					if (items.get(insert.getCode()) != null) {
						Map<String, Object> sessionItem = (Map<String, Object>) items.get(insert.getCode());

						int updateAmount = (int) sessionItem.get("amount") + insert.getAmount();
						sessionItem.remove("amount");
						sessionItem.put("amount", updateAmount);

					} else { // 해당 상품이 없을 경우

						Map<String, Object> sessionItem = shoppingService.sessionBasket(insert.getCode());
						sessionItem.put("amount", insert.getAmount());

						items.put(insert.getCode(), sessionItem);
					}
				}
			}
		}
		// ----------------------------------------------------------

	}

	// 장바구니 수량 업데이트
	@RequestMapping(value = "/amount", method = RequestMethod.GET)
	@ResponseBody
	public int updateAmount(@RequestParam(required = false, defaultValue = "guest") String userId, int amount,
			String code, HttpSession session) {
		System.out.println(userId);
		Users user = (Users) session.getAttribute("logInInfo");
		if (user != null && user.getId().equals(userId)) {
			// 로그인
			Basket insert = new Basket();
			insert.setId(user.getId());
			insert.setCode(code);
			insert.setAmount(amount);

			System.out.println(insert);

			return shoppingService.updateAmount(insert);

		} else {
			// 비로그인 - 장바구니 O
			List<Map<String, Object>> sessionBasket = (List<Map<String, Object>>) session.getAttribute("sessionBasket");

			if (sessionBasket.get(0).get("sessionId").equals(session.getId())) {
				Map<String, Object> items = sessionBasket.get(1);

				Map<String, Object> item = (Map<String, Object>) items.get(code);
				item.put("amount", amount);

				return 0;

			} else {
				// 비로그인 - 장바구니 X
				return -1;
			}
		}
	}

	// 장바구니 삭제
	@RequestMapping(value = "/deletebasket", method = RequestMethod.POST)
	@ResponseBody
	public String deleteBasket(HttpSession session, int num, Basket basket) {

		Users user = (Users) session.getAttribute("logInInfo");

		if (user != null) {
			// 로그인
			int res = shoppingService.deleteBasket(basket);

			if (res > 0) {
				return "#b" + num;
			} else {
				return "fail";
			}
		} else {
			// 비로그인
			// basket - code, id
			List<Map<String, Object>> sessionBasket = (List<Map<String, Object>>) session.getAttribute("sessionBasket");

			if (sessionBasket.get(0).get("sessionId").equals(session.getId())) {
				Map<String, Object> items = sessionBasket.get(1);
				items.remove(basket.getCode());

				return "#b" + num;
			}
			return null;
		}
	}

	// 장바구니 선택 삭제
	@RequestMapping(value = "/deletelist", method = RequestMethod.POST)
	public String deleteList(HttpSession session, String userId, String codes) {

		System.out.println(codes);

		Users user = (Users) session.getAttribute("logInInfo");

		String[] array = codes.split(",");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("array", array);

		if (user != null) {
			// 로그인
			int res = shoppingService.deleteList(map);

		} else {
			// 비로그인
			List<Map<String, Object>> sessionBasket = (List<Map<String, Object>>) session.getAttribute("sessionBasket");

			if (sessionBasket.get(0).get("sessionId").equals(session.getId())) {
				Map<String, Object> items = sessionBasket.get(1);

				for (String code : array) {
					items.remove(code);
				}
			}
		}
		return "redirect:/shopping/basket";
	}

	// 결제페이지
	@RequestMapping(value = "/payment", method = RequestMethod.GET, produces = "application/text; charset=UTF-8")
	public String shoppingPayment(Model model, HttpSession session, @RequestParam String userId, String codes) {

		if (session.getAttribute("logInInfo") == null) {
			return "user/login";
		} else {

			System.out.println(userId);
			System.out.println(codes);

			String[] array = codes.split(",");

			for (int i = 0; i < array.length; i++) {
				System.out.println(array[i]);
			}

			Map<String, Object> map = new HashMap<String, Object>();
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
	   public void shoppingPaymentCheck(@RequestBody String uid, HttpSession session) {
	      
	      Gson gson = new GsonBuilder().create();
	      Map<String, String> another =gson.fromJson(uid, new TypeToken<Map<String, String>>(){}.getType());
	      List<Map<String,String>> result = gson.fromJson(another.get("product"), new TypeToken<List<Map<String,String>>>(){}.getType());

	         Orders order = new Orders();
	         
	         Users user = (Users)session.getAttribute("logInInfo");
	         System.out.println("사용자나와라"+user);
	         //------------------------------------------------------------
	         
	         order.setId(user.getId());
	         order.setmUid(another.get("imp_uid"));
	         
	         if(another.get("name") != null ) {
	            
	            order.setToName(another.get("name"));
	            order.setToTel(another.get("tel"));
	            order.setToAddr(another.get("addr"));
	            order.setToPost(another.get("post"));
	            
	         }else {
	            
	            order.setToName(user.getName());
	            order.setToTel(user.getTel());
	            order.setToAddr(user.getAddr());
	            order.setToPost(user.getPost());
	            
	         }
	         
	         int ordersNo = shoppingService.selectOrdersNo();
	         order.setNo(ordersNo);

	         shoppingService.insertOrders(order);
	         
	         Map userPoint = new HashMap();
	         List<OrderProduct> orderProductList = new ArrayList<OrderProduct>();
	         
	         int point=0;
	         int mount =0;
	         
	         if(another.get("point") != null && another.get("point") != "") {
	            point = Integer.parseInt(another.get("point"));
	         }
	         
	         userPoint.put("id", user.getId());
	         userPoint.put("point", point);
	         
	         shoppingService.insertPoint(userPoint);
	         
	         point = point / result.size();
	         
	         for(int i=0; i<result.size(); i++) {
	            
	            OrderProduct orderProduct = new OrderProduct();
	            if(result.get(i).get("amount") != null && result.get(i).get("amount") != "") {
	               mount = Integer.parseInt(result.get(i).get("amount"));
	            }
	            orderProduct.setAmount(mount);
	            orderProduct.setPoint(point);
	            orderProduct.setCode(result.get(i).get("code"));
	            orderProduct.setOrdersNo(ordersNo);
	            orderProductList.add(orderProduct);
	         }
	         shoppingService.insertOrderProduct(orderProductList);
	   }

	@RequestMapping(value = "/paymentComplete", method = RequestMethod.GET)
	public void shoppingPaymentComplete() {

	}

	// 배송지정보 ajax
	@RequestMapping(value = "/delivery", method = RequestMethod.GET)
	public String shoppingDelivery(@RequestParam int num) {

		if (num == 0) {
			return "shopping/delivery_basic";
		} else {
			return "shopping/delivery_new";
		}
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public void shoppingSearch(Model model, @RequestParam(required = false, defaultValue = "1") int cPage,
			@RequestParam(required = false, defaultValue = "") String search) {

		int cntPerPage = 16;

		Map<String, Object> commandMap = shoppingService.selectSearch(search, cPage, cntPerPage);

		model.addAttribute("list", commandMap.get("list"));
		model.addAttribute("paging", commandMap.get("paging"));
	}

}
