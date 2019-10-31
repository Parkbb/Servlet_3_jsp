package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class MemberDAO {

	public int memberJoin(Connection con, MemberDTO memberDTO) throws Exception{
		
		String sql = "insert into member "
				+ "values(?,?,?,?,?,?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getPhone());
		st.setInt(6, memberDTO.getGrade());
		
		int result = st.executeUpdate();
		
		return result;
	}
}
