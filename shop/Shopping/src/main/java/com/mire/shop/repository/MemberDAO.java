package com.mire.shop.repository;

import java.sql.Connection;	
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mire.shop.commons.JDBCUtil;
import com.mire.shop.model.MemberVO;

@Repository
public class MemberDAO {
	
	
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String MEMBER_GET = "select  * from Member where member_ID = ? and MEMBER_PASSWD = ?";
	private final String MEMBER_GET_ID = "select  * from Member where member_ID = ?";
	private final String MEMBER_INSERT = "INSERT INTO MEMBER (MEMBER_NO, member_ID, MEMBER_PASSWD, MEMBER_NAME, MEMBER_PHONE)"
			+ "VALUES ((select nvl(max(MEMBER_NO), 0)+1 from MEMBER), ?, ?, ?, ?)";
	private final String MEMBER_UPDATE = "UPDATE MEMBER SET MEMBER_PASSWD = ?,MEMBER_NAME = ?, MEMBER_PHONE = ? WHERE MEMBER_ID = ? ";
	private final String MEMBER_DELETE = "DELETE FROM MEMBER where member_ID  = ?";
	
	
	
	
	
	public MemberVO getMember(MemberVO vo) {
		System.out.println("Select Member");
		MemberVO member = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPasswd());
			rs = stmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setNo(Integer.parseInt(rs.getString("MEMBER_NO")));
				member.setId(rs.getString("member_ID"));
				member.setPasswd(rs.getString("MEMBER_PASSWD"));
				member.setName(rs.getString("MEMBER_NAME"));
				member.setPhone(rs.getString("MEMBER_PHONE"));
				member.setRegDate(rs.getString("MEMBER_REGDATE"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return member;
	}
	
	public MemberVO getMember(String id) {
		System.out.println("Select Member");
		MemberVO member = null;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GET_ID);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setNo(Integer.parseInt(rs.getString("MEMBER_NO")));
				member.setId(rs.getString("member_ID"));
				member.setPasswd(rs.getString("MEMBER_PASSWD"));
				member.setName(rs.getString("MEMBER_NAME"));
				member.setPhone(rs.getString("MEMBER_PHONE"));
				member.setRegDate(rs.getString("MEMBER_REGDATE"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return member;
	}
	
	public void insertMember(MemberVO  vo) {
		System.out.println("insert Member");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_INSERT);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPasswd());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getPhone());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
	}
	
	public void updateMember(MemberVO  vo) {
		System.out.println("update Member");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_UPDATE);
			stmt.setString(1, vo.getPasswd());
			stmt.setString(2, vo.getName());
			stmt.setString(3, vo.getPhone());
			stmt.setString(4, vo.getId());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
	}
	public void deleteMember(MemberVO  vo) {
		System.out.println("delete Member");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_DELETE);
			stmt.setString(1, vo.getId());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
	}

	

}
