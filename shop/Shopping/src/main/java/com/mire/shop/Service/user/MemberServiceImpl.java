package com.mire.shop.Service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mire.shop.exception.ApiException;
import com.mire.shop.exception.ExceptionCode;
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
		MemberVO vo = memberDAO.getMember(member.getId());
		
		
		if (vo != null) {
			throw new ApiException(ExceptionCode.MEMBER_ID_DUPLICATE);
			
		}
		
		memberDAO.insertMember(member);

	}

	@Override
	public void updateMember(MemberVO member) {
		MemberVO vo = memberDAO.getMember(member);
		if(vo == null) {
			throw new ApiException(ExceptionCode.MEMBER_PASSWD_NOT_FOUND);
		}
		if (member.getName() == null || member.getName().trim().equals("")) {
			member.setName(vo.getName());
		}
		else if (member.getPhone() == null || member.getPhone().trim().equals("")) {
			member.setPhone(vo.getPhone());
		}
		System.out.println(member);
		memberDAO.updateMember(member);

	}

	@Override
	public void deleteMember(MemberVO member) {
		MemberVO vo = memberDAO.getMember(member);
		if (vo == null) {
			throw new ApiException(ExceptionCode.MEMBER_PASSWD_NOT_FOUND);
			
		}
		memberDAO.deleteMember(vo);
		
	}

	@Override
	public MemberDTO getMember(MemberVO member) {
		MemberVO vo =  memberDAO.getMember(member);
		if (vo == null) {
			throw new ApiException(ExceptionCode.MEMBER_NOT_FOUND);
		}
		
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
		if (vo == null) {
			throw new ApiException(ExceptionCode.MEMBER_NOT_FOUND);
		}
		MemberDTO dto = new MemberDTO();
		dto.setId(vo.getId());
		dto.setName(vo.getName());
		dto.setPhone(vo.getPhone());
		dto.setRegDate(vo.getRegDate());
		
		return dto; 
	}
	
	@Override
	public void checkMember(String id) {
		MemberVO vo =  memberDAO.getMember(id);
		System.out.println(vo);
		if (vo != null) {
			throw new ApiException(ExceptionCode.MEMBER_ID_DUPLICATE);
		}
		
		
		
	}

}
