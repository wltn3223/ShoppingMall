package com.mire.shop.Service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mire.shop.model.MemberVO;
import com.mire.shop.repository.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	private final MemberDAO memberDAO;
	
	@Autowired
	public MemberServiceImpl(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	

	@Override
	public void insertMember(MemberVO member) {
		memberDAO.insertMember(member);

	}

	@Override
	public void updateMember(MemberVO member) {
		memberDAO.updateMember(member);

	}

	@Override
	public void deleteMember(MemberVO member) {
		memberDAO.deleteMember(member);
		
	}

	@Override
	public MemberVO getMember(MemberVO member) {
		
		return memberDAO.getMember(member);
	}
	@Override
	public MemberVO getMember(String id) {
		
		return memberDAO.getMember(id);
	}

}
