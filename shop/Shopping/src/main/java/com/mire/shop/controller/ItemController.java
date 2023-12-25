package com.mire.shop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mire.shop.Service.item.ItemService;
import com.mire.shop.model.ItemVO;
import com.mire.shop.model.PagingCriteria;
import com.mire.shop.model.PageMaker;

@Controller
@RequestMapping("/item")
public class ItemController {
	private final ItemService itemService;
	
	@Autowired
	public ItemController(ItemService itemService) {
		this.itemService = itemService;
	}
	
	@PostMapping("/insert.do")
	public String insertItem(@ModelAttribute ItemVO vo, HttpServletRequest request) {
		itemService.insertItem(vo, request);
		return "ItemInsert";
	}
	
	@GetMapping("/insert.do")
	public String insertItemForm() {
		return "ItemInsert";
	}
	
	@GetMapping("/getList.do")
	public String getItemList(Model model, PagingCriteria cri) {
		List<ItemVO> itemList =  itemService.getItemList(cri.getPageNum(), cri.getAmount());
	     int  total = itemService.getItemList().size();
		  model.addAttribute("itemList", itemList);
	      model.addAttribute("paging", new PageMaker(cri, total));
		 return "itemList"; // °á°ú
	}
	
	@GetMapping("/items")
	@ResponseBody
	public List<ItemVO> MainItemList(Model model) {
		return itemService.getItemList();
	}
	@GetMapping("/getInfo.do")
	public String getItemInfo(Model model, @RequestParam int no, @ModelAttribute ItemVO itemVO) {
		ItemVO vo = itemService.getItem(itemVO);
		model.addAttribute("itemVO", vo);
		return "getItemInfo";
	}
	
	
	@GetMapping("/getMyItemList.do")
	public String getMyList(@RequestParam String memberId, Model model) {
		model.addAttribute("itemList", itemService.getItemList(memberId));
		return "getMyItemList";
	}
	
	@GetMapping("/deleteItem.do")
	public String deleteItem(@RequestParam int no, Model model,HttpServletRequest request,
			@RequestParam String memberId, @RequestParam String imgName, @ModelAttribute ItemVO itemvo) {
		itemService.deleteItem(itemvo, request);
		return "redirect:/item/getMyItemList.do?memberId=" + memberId;
	}
	
	
}
