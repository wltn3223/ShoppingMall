package com.mire.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mire.shop.Service.item.ItemService;
import com.mire.shop.Service.user.MemberService;
import com.mire.shop.model.MemberVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
		
	private final MemberService memberService;
	private final ItemService itemService;
	
	@Autowired
	public MemberController(MemberService memberService, ItemService itemService) {
		this.memberService = memberService;
		this.itemService = itemService; 
	}
	
	@PostMapping(value = "/login.do") // 로그인
	public String CheckMember(@ModelAttribute MemberVO memberVO,Model model, HttpSession session) {
		MemberVO vo = memberService.getMember(memberVO);
		
		if(vo != null) {
			session.setAttribute("memberId", memberVO.getId());
			session.setMaxInactiveInterval(25);
			model.addAttribute("itemList", itemService.getItemList());
			return "logon";
		}
		
		return "redirect:/error.jsp";
	}
	@RequestMapping("/logout.do") // 로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/member/getMain.do";
		
	}
	@GetMapping(value = "/login-check.do") // 아이디 중복확인
	@ResponseBody
	public String idCheck(@RequestParam String memberId) {
		MemberVO  vo =  memberService.getMember(memberId);
		return (vo != null)? "1": "0";
		
		
	}
	@GetMapping("/getMain.do") // 메인화면
	public String getList(Model model) {
		
		model.addAttribute("itemList", itemService.getItemList());
		return "logon";
	}
	
	@GetMapping("/getinfo.do")
	public String getMember(@RequestParam String id,Model model) {
		MemberVO member = memberService.getMember(id);
		model.addAttribute("memberVO", member);
		return "info";
	}
	
	@PostMapping(value = "/update.do")
	public String updateMember(@ModelAttribute MemberVO memberVO ,Model model, HttpSession session) {
		memberService.updateMember(memberVO);
		model.addAttribute("memberVO",memberService.getMember(memberVO.getId()));
		return "redirect: /WEB-INF/views/logon/jsp";
	}
	
	@PostMapping(value = "/delete.do")
	public String deleteMember(@ModelAttribute MemberVO memberVO, HttpSession session) {
		System.out.println(memberVO);
		memberService.deleteMember(memberVO);
		session.invalidate();
		
		return "redirect:/index.jsp";
	}
	@PostMapping(value = "/insert.do")
	@ResponseBody
	public String insertMember(@RequestBody MemberVO memberVO) {
		boolean result = memberService.insertMember(memberVO);
		return (result)?"1":"0";
	}
	
}
