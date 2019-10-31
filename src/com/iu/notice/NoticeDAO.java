package com.iu.notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoticeDAO {
	//nextselect
	public int selectnext(Connection con, int num) throws Exception{
		
		int num2 = 99999999;
		String sql = "select * from notice "
				+ "where num = (select min(num) from notice where num > ?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			num2 = rs.getInt(1);
		} 
		
		return num2;
	}
	//preselect
	public int selectpre(Connection con, int num) throws Exception{
		int num1 = 0;
		String sql = "select * from notice "
				+ "where num = (select max(num) from notice where num < ?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			num1 = rs.getInt(1);
		} 
		
		return num1;
	}
	//selectList
	
	public ArrayList<NoticeDTO> selectList(Connection con) throws Exception{
		ArrayList<NoticeDTO> ar = new ArrayList<NoticeDTO>();
		NoticeDTO noticeDTO = null;
		
		String sql = "select * from notice "
				+ "order by num desc";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt(1));
			noticeDTO.setTitle(rs.getString(2));
			noticeDTO.setWriter(rs.getString(3));
			noticeDTO.setcontents(rs.getString(4));
			noticeDTO.setReg_date(rs.getDate(5));
			noticeDTO.setHit(rs.getInt(6));
			
			ar.add(noticeDTO);
			
		}
		rs.close();
		st.close();
		
		
		return ar;
	}
	
	//selectOne
	public NoticeDTO selectOne(Connection con, int num) throws Exception{
		
		NoticeDTO noticeDTO = null;
		
		String sql = "select * from notice where num = ? ";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			noticeDTO = new NoticeDTO();
			noticeDTO.setNum(rs.getInt(1));
			noticeDTO.setTitle(rs.getString(2));
			noticeDTO.setWriter(rs.getString(3));
			noticeDTO.setcontents(rs.getString(4));
			noticeDTO.setReg_date(rs.getDate(5));
			noticeDTO.setHit(rs.getInt(6));
					
		}
		rs.close();
		st.close();
		
		return noticeDTO;
	}
	//insert
	public int insert(Connection con, NoticeDTO noticeDTO) throws Exception{
		int result = 0;
		
		String sql="insert into notice values "
				+ "(board_seq.nextval, ?, ?, ?, sysdate, 0)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getWriter());
		st.setString(3, noticeDTO.getcontents());
		
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
		
	}
	//Update
	public int Update(Connection con, NoticeDTO noticeDTO) throws Exception{
		int result = 0;
		
		String sql = "update notice set title=? , writer=? , contents = ? "
				+ "where num= ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, noticeDTO.getTitle());
		st.setString(2, noticeDTO.getWriter());
		st.setString(3, noticeDTO.getcontents());
		st.setInt(4, noticeDTO.getNum());
		
		result=st.executeUpdate();
		
		return result;
	}
	//delete
	public int Delete(Connection con, int num) throws Exception{
		int result = 0;
		
		String sql = "delete notice where num = ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		result=st.executeUpdate();
		
		return result;
		
	}
	
	public int Hitup(Connection con, NoticeDTO noticeDTO) throws Exception{
		int result = 0;
		
		String sql = "update notice set hit = ? "
				+ "where num = ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		int hit = noticeDTO.getHit();
		hit+=1;
		st.setInt(1, hit);
		st.setInt(2, noticeDTO.getNum());
		
		result = st.executeUpdate();
		
		
		
		return result;
	}
}
