package com.mire.shop.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mire.shop.Service.item.ItemService;
import com.mire.shop.Service.user.MemberService;
import com.mire.shop.model.MemberDTO;
import com.mire.shop.model.MemberVO;

@RestController
@RequestMapping(value = "/member")
public class MemberRestController {
		
	private final MemberService memberService;
	private final ItemService itemService;
	
	
	@Autowired
	public MemberRestController(MemberService memberService, ItemService itemService) {
		this.memberService = memberService;
		this.itemService = itemService; 
	}
	
	@PostMapping(value = "/login") // 로그인
	public String CheckMember(@RequestBody MemberVO memberVO, HttpSession session) {
		MemberDTO  dto = memberService.getMember(memberVO);
		
		if(dto != null) {
			session.setAttribute("memberId", dto.getId());
			session.setMaxInactiveInterval(1800);
			return "1";
		}
		
		return "0";
	}
	
	@PostMapping(value = "/join") // 회원가입
	public String insertMember(@RequestBody MemberVO memberVO) {
		memberService.insertMember(memberVO);
		return "1";
	}
	@GetMapping(value = "/login-check") // 아이디 중복확인
	public String idCheck(@RequestParam String memberId) {
		MemberDTO  dto =  memberService.getMember(memberId);
		System.out.println(dto);
		return (dto != null)? "1": "0";
		
		
	}
	@PostMapping("/logout") // 로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "1";
		
	}
	
	@GetMapping("/{id}") // 정보조회
	public ModelAndView getMember(@PathVariable String id) {
		MemberDTO member = memberService.getMember(id);
		ModelAndView mv = new ModelAndView();
		mv.addObject("member", member);
		mv.setViewName("info");
		return mv;
	}
	
	
	@PutMapping  //회원수정
	public String updateMember(@ModelAttribute MemberVO memberVO) {
		memberService.updateMember(memberVO);
		
		return "1";
	}
	
	@DeleteMapping // 회원 탈퇴
	public String deleteMember(@RequestBody MemberVO memberVO,  HttpSession session) {
		System.out.println(memberVO);
		memberService.deleteMember(memberVO);
		session.invalidate();
		
		return "1";
	}
}
