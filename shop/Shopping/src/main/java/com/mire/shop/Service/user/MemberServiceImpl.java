package com.mire.shop.Service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mire.shop.model.MemberDTO;
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
	public MemberDTO getMember(MemberVO member) {
		MemberVO vo =  memberDAO.getMember(member);
		
		MemberDTO dto = new MemberDTO();
		
		dto.setId(vo.getId());
		dto.setName(vo.getName());
		dto.setPhone(vo.getPhone());
		dto.setRegDate(vo.getRegDate());
		
		return dto; 
	}
	@Override
	public MemberDTO getMember(String id) {
		MemberVO vo =  memberDAO.getMember(id);
		MemberDTO dto = new MemberDTO();
		dto.setId(vo.getId());
		dto.setName(vo.getName());
		dto.setPhone(vo.getPhone());
		dto.setRegDate(vo.getRegDate());
		
		return dto; 
	}

}
