package com.dht.www.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dht.www.shopping.model.service.ShoppingService;

@Controller
@RequestMapping("/shopping")
public class ShoppingController {
	
	@Autowired
	private ShoppingService shoppingService;
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String shoppingHome(Model model) {
		
		return null;
	}
	
	
}
