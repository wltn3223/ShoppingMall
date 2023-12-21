package com.mire.shop.Service.user;

import org.springframework.stereotype.Service;

import com.mire.shop.model.MemberVO;

@Service
public interface MemberService {
	public void insertMember(MemberVO member);
	public void updateMember(MemberVO member);
	public void deleteMember(MemberVO member);
	public MemberVO getMember(MemberVO member);
	public MemberVO getMember(String id);

}
