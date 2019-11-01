package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import oracle.jdbc.proxy.annotation.Pre;

public class MemberDAO {
	
	public int memberDelete(Connection con, MemberDTO memberDTO) throws Exception{
		int result = 0;
		
		String sql = "delete member where id = ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		
		result = st.executeUpdate();
		
		return result;
	}
	
	public int memberUpdate(Connection con, MemberDTO memberDTO) throws Exception{
		int result = 0;
		
		String sql = "Update member set pw = ?, email = ? , phone = ? "
				+ "where id = ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getPw());
		st.setString(2, memberDTO.getEmail());
		st.setString(3, memberDTO.getPhone());
		st.setString(4, memberDTO.getId());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	
	public int memberJoin(Connection con, MemberDTO memberDTO) throws Exception{
		
		String sql = "insert into member "
				+ "values(?,?,?,?,?,1)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getPhone());
		
		
		int result = st.executeUpdate();
		
		return result;
	}
	
	public MemberDTO memberLogin(Connection con, MemberDTO memberDTO) throws Exception{
		
		String sql = "select * from member where id = ? and pw = ? ";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		
		ResultSet rs = st.executeQuery();
		
		if(rs.next()) {
			memberDTO.setId(rs.getString(1));
			memberDTO.setPw(rs.getString(2));
			memberDTO.setName(rs.getString(3));
			memberDTO.setEmail(rs.getString(4));
			memberDTO.setPhone(rs.getString(5));
			memberDTO.setGrade(rs.getInt(6));	
		} else {
			
			memberDTO = null;
			
		}
		rs.close();
		con.close();
		
		return memberDTO;
	}
}
