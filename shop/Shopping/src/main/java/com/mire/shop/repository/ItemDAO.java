package com.mire.shop.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mire.shop.commons.JDBCUtil;
import com.mire.shop.model.ItemVO;

@Repository
public class ItemDAO {
	
		
		
		private Connection conn = null;
		private PreparedStatement stmt = null;
		private ResultSet rs = null;
		private final String ITEM_GET_PAGE = "SELECT *"
			    + " FROM ("
			    + "     SELECT "
			    + "         outer_query.*, "
			    + "         ROWNUM AS rnum"
			    + "     FROM ("
			    + "         SELECT "
			    + "             ITEM.*"
			    + "         FROM ITEM"
			    + "         ORDER BY ITEM_NO DESC"
			    + "     ) outer_query"
			    + "     WHERE ROWNUM <= ?"
			    + ")"
			    + " WHERE rnum >= ?";

		private final String ITEM_GET_ALL = "select * from ITEM order by ITEM_REGDATE desc";
		private final String ITEM_GET = "select  * from ITEM where ITEM_NO = ?";
		private final String ITEM_GET_MEMBER = "select  * from ITEM where Member_id = ? order by ITEM_REGDATE desc";
		private final String ITEM_INSERT = "INSERT INTO ITEM (ITEM_NO, MEMBER_ID, ITEM_NAME, ITEM_PRICE, ITEM_TYPE, ITEM_DETAIL, ITEM_IMGNAME)"
				+ "VALUES ((select nvl(max(ITEM_NO), 0)+1 from item),?,?,?,?,?,?)";
		
		private final String ITEM_UPDATE = "UPDATE MEMBER SET MEMBER_PASSWD = ?,MEMBER_NAME = ?, MEMBER_PHONE = ? WHERE MEMBER_ID = ? ";
		private final String ITEM_DELETE = "DELETE FROM ITEM where ITEM_NO  = ?";
		
		
		
		
		
		public ItemVO getItem(ItemVO vo) {
			ItemVO item = null;
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(ITEM_GET);
				stmt.setInt(1, vo.getNo());
				rs = stmt.executeQuery();
				if (rs.next()) {
					item = new ItemVO();
					item.setNo(Integer.parseInt(rs.getString("ITEM_NO")));
					item.setMemberId(rs.getString("Member_ID"));
					item.setName(rs.getString("ITEM_NAME"));
					item.setPrice(Integer.parseInt(rs.getString("ITEM_PRICE")));
					item.setType(rs.getString("ITEM_TYPE"));
					item.setDetail(rs.getString("ITEM_DETAIL"));
					item.setImgName(rs.getString("ITEM_IMGNAME"));
					item.setRegdate(rs.getString("ITEM_REGDATE"));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(rs, stmt, conn);
			}
			return item;
		}
		
		public List<ItemVO> getItemList() {
			System.out.println("아이템리스트조회");
			List<ItemVO> itemlist = new ArrayList();
			
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(ITEM_GET_ALL);
				rs = stmt.executeQuery();
				while(rs.next()) {
					ItemVO item = new ItemVO();
					item.setNo(Integer.parseInt(rs.getString("ITEM_NO")));
					item.setMemberId(rs.getString("Member_ID"));
					item.setName(rs.getString("ITEM_NAME"));
					item.setPrice(Integer.parseInt(rs.getString("ITEM_PRICE")));
					item.setType(rs.getString("ITEM_TYPE"));
					item.setDetail(rs.getString("ITEM_DETAIL"));
					item.setImgName(rs.getString("ITEM_IMGNAME"));
					item.setRegdate(rs.getString("ITEM_REGDATE"));
					
					itemlist.add(item);					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(rs, stmt, conn);
			}
			return itemlist;
		
		}
		
		public List<ItemVO> getItemList(int page, int amount) {
		    System.out.println("특정 아이템리스트조회");
		    List<ItemVO> itemlist = new ArrayList();

		    try {
		        conn = JDBCUtil.getConnection();
		        stmt = conn.prepareStatement(ITEM_GET_PAGE);
		        int startRow = (page - 1) * amount + 1;
		        int endRow = page * amount;
		        stmt.setInt(1, endRow);
		        stmt.setInt(2, startRow);
		        rs = stmt.executeQuery();
		        while (rs.next()) {
		            ItemVO item = new ItemVO();
		            item.setNo(Integer.parseInt(rs.getString("ITEM_NO")));
		            item.setMemberId(rs.getString("Member_ID"));
		            item.setName(rs.getString("ITEM_NAME"));
		            item.setPrice(Integer.parseInt(rs.getString("ITEM_PRICE")));
		            item.setType(rs.getString("ITEM_TYPE"));
		            item.setDetail(rs.getString("ITEM_DETAIL"));
		            item.setImgName(rs.getString("ITEM_IMGNAME"));
		            item.setRegdate(rs.getString("ITEM_REGDATE"));

		            itemlist.add(item);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    } finally {
		        JDBCUtil.close(rs, stmt, conn);
		    }
		    return itemlist;
		}
		
		public List<ItemVO> getItemList(String Member_id) {
			List<ItemVO> itemlist = new ArrayList();
			
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(ITEM_GET_MEMBER);
				stmt.setString(1, Member_id);
				rs = stmt.executeQuery();
				while(rs.next()) {
					ItemVO item = new ItemVO();
					item.setNo(Integer.parseInt(rs.getString("ITEM_NO")));
					item.setMemberId(rs.getString("Member_ID"));
					item.setName(rs.getString("ITEM_NAME"));
					item.setPrice(Integer.parseInt(rs.getString("ITEM_PRICE")));
					item.setType(rs.getString("ITEM_TYPE"));
					item.setDetail(rs.getString("ITEM_DETAIL"));
					item.setImgName(rs.getString("ITEM_IMGNAME"));
					item.setRegdate(rs.getString("ITEM_REGDATE"));
					
					itemlist.add(item);					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(rs, stmt, conn);
			}
			return itemlist;
		}
		
		public ItemVO getItem(int no) {
			System.out.println("Select Member");
			ItemVO item = null;
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(ITEM_GET);
				stmt.setInt(1, no);
				rs = stmt.executeQuery();
				if (rs.next()) {
					item = new ItemVO();
					item.setNo(Integer.parseInt(rs.getString("ITEM_NO")));
					item.setMemberId(rs.getString("Member_ID"));
					item.setName(rs.getString("ITEM_NAME"));
					item.setPrice(Integer.parseInt(rs.getString("ITEM_PRICE")));
					item.setType(rs.getString("ITEM_TYPE"));
					item.setDetail(rs.getString("ITEM_DETAIL"));
					item.setImgName(rs.getString("ITEM_IMGNAME"));
					item.setRegdate(rs.getString("ITEM_REGDATE"));
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				JDBCUtil.close(rs, stmt, conn);
			}
			return item;
		}
		
		public void insertItem(ItemVO  vo) {
			System.out.println("insert Member");
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(ITEM_INSERT);
				stmt.setString(1, vo.getMemberId());
				stmt.setString(2, vo.getName());
				stmt.setInt(3, vo.getPrice());
				stmt.setString(4, vo.getType());
				stmt.setString(5, vo.getDetail());
				stmt.setString(6, vo.getImgName());
				stmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(rs, stmt, conn);
			}
			
		}
		
//		public void updateMember(MemberVO  vo) {
//			System.out.println("update Member");
//			try {
//				conn = JDBCUtil.getConnection();
//				stmt = conn.prepareStatement(MEMBER_UPDATE);
//				stmt.setString(1, vo.getPasswd());
//				stmt.setString(2, vo.getName());
//				stmt.setString(3, vo.getPhone());
//				stmt.setString(4, vo.getId());
//				stmt.executeUpdate();
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				JDBCUtil.close(rs, stmt, conn);
//			}
//			
//		}
		public void deleteItem(int no) {
			System.out.println("delete Member");
			try {
				conn = JDBCUtil.getConnection();
				stmt = conn.prepareStatement(ITEM_DELETE);
				stmt.setInt(1, no);
				stmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				JDBCUtil.close(rs, stmt, conn);
			}
			
		}

		

	

	
}
