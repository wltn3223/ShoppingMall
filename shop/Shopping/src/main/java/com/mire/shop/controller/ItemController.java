package com.mire.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mire.shop.Service.item.ItemService;
import com.mire.shop.model.ItemVO;

@Controller
@RequestMapping("/item")
public class ItemController {
	private final ItemService itemService;
	
	@Autowired
	public ItemController(ItemService itemService) {
		this.itemService = itemService;
	}
	
	@PostMapping("/insert.do")
	public String insertItem(@ModelAttribute ItemVO vo, HttpServletRequest request, Model model) {
		itemService.insertItem(vo, request);
		model.addAttribute("itemList", itemService.getItemList());
		System.out.println(itemService.getItemList().size());
		return "itemList";
	}
	
	@GetMapping("/getList.do")
	public String getItemList(Model model) {
		model.addAttribute("itemList", itemService.getItemList());
		System.out.println(itemService.getItemList().size());
		return "itemList";
	}
	
	
}
