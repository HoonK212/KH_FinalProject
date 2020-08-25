package com.dht.www.shopping.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dht.www.shopping.model.service.ShoppingService;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Autowired
	private ShoppingService shoppingService;
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public void shoppingHome(Model model) {
		
		model.addAttribute("list1", shoppingService.selectHome("A"));
		model.addAttribute("list2", shoppingService.selectHome("B"));
		model.addAttribute("list3", shoppingService.selectHome("C"));
		
		System.out.println(shoppingService.selectHome("A"));
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String shoppingList(Model model, @RequestParam(required=false, defaultValue="1") int curPage
								, @RequestParam(required=false, defaultValue="0") int listno) {
		
		int cntPerPage = 16;
		System.out.println(listno);
		
		model.addAttribute("list", shoppingService.selectList(listno, curPage, cntPerPage));
		
		return "/shopping/content";
		
	}
	
	@RequestMapping("/content")
	@ResponseBody
	public void loadContent() {}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public void shoppingDetail(Model model) {
		
	}
	
	
}
