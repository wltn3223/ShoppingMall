package com.mire.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mire.shop.Service.user.MemberService;
import com.mire.shop.model.MemberVO;

@Controller
@RequestMapping(value = "/member")
//@SessionAttributes("memberVO")
public class MemberController {
		
	private final MemberService memberService;
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/getinfo.do")
	public String getMember(@RequestParam String id,Model model) {
		MemberVO member = memberService.getMember(id);
		model.addAttribute("memberVO", member);
		return "info";
	}
//	@GetMapping(value = "/login.do")
//	public String checkSession(HttpSession session) {
//		MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
//		if(memberVO != null) {
//			return "logon";
//		}
//		return "redirect:/index.jsp";
//	}
	
	@PostMapping(value = "/login.do")
	public String CheckMember(@ModelAttribute MemberVO memberVO,Model model) {
		MemberVO vo = memberService.getMember(memberVO);
		
		
		if(vo != null) {
			model.addAttribute("memberVO", vo);
			System.out.println(model.getAttribute("memberVO"));
			return "logon";
		}
		
		
		return "redirect:/error.jsp";
	}
	@PostMapping(value = "/update.do")
	public String updateMember(@RequestParam int price,  @ModelAttribute MemberVO memberVO,Model model) {
		memberService.updateMember(memberVO);
		model.addAttribute("memberVO",memberService.getMember(memberVO.getId()));
		
		return "logon";
	}
	@GetMapping(value = "/delete.do")
	public String deleteMember(@ModelAttribute MemberVO memberVO) {
		System.out.println(memberVO);
		memberService.deleteMember(memberVO);
		return "redirect:/index.jsp";
	}
	@PostMapping(value = "/insert.do")
	public String insertMember(@ModelAttribute MemberVO memberVO) {
		memberService.insertMember(memberVO);
		return "redirect:/login.jsp";
	}
}
