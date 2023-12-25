package com.mire.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.mire.shop.Service.user.MemberService;
import com.mire.shop.model.MemberDTO;
import com.mire.shop.model.MemberVO;

@RestController
@RequestMapping(value = "/member")
public class MemberRestController {
		
	private final MemberService memberService;
	
	
	@Autowired
	public MemberRestController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@PostMapping(value = "/login") // 로그인
	public String CheckMember(@RequestBody MemberVO memberVO, HttpSession session) {
		MemberDTO  dto = memberService.getMember(memberVO);
		
		
		session.setAttribute("memberId", dto.getId());
		session.setMaxInactiveInterval(1800);
		
		
		return "1";
	}
	
	@PostMapping(value = "/join") // 회원가입
	public String insertMember(@RequestBody MemberVO memberVO) {
		System.out.println(memberVO);
		memberService.insertMember(memberVO);
		
		return "1";
	}
	
	@GetMapping(value = "/login-check") // 아이디 중복확인
	public String idCheck(@RequestParam String memberId) {
		memberService.checkMember(memberId);
		
		return "1";
		
		
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
	@GetMapping("/updateForm")
	public ModelAndView getUpdateForm() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("memberUpdateForm");
		return mv;
	}
	
	
	@PutMapping  //회원수정
	public String updateMember(@RequestBody MemberVO memberVO) {
		memberService.updateMember(memberVO);
		
		return "1";
	}
	
	@DeleteMapping // 회원 탈퇴
	public ResponseEntity<Object> deleteMember(@RequestBody MemberVO memberVO,  HttpSession session) {
		System.out.println(memberVO);
		memberService.deleteMember(memberVO);
		session.invalidate();
		
		return ResponseEntity.ok().build();
	}
}
