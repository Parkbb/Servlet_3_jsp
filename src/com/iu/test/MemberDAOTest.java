package com.iu.test;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.iu.member.MemberDAO;

import com.iu.util.DBConnector;import com.iu.member.MemberDTO;

public class MemberDAOTest {
	@Test
	public void deleteTest() throws Exception{
		
		MemberDTO memberDTO = new MemberDTO();
		MemberDAO memberDAO = new MemberDAO();
		
		memberDTO.setId("1111");
		Connection con = DBConnector.getConnection();
		
		int result = memberDAO.memberDelete(con, memberDTO);
		
		assertEquals(1, result);
	}
	
	
	/* @Test */
	public void updateTest() throws Exception{
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setId("test");
		memberDTO.setPw("11");
		memberDTO.setEmail("11");
		memberDTO.setPhone("11");
		Connection con = DBConnector.getConnection();
		
		int result = memberDAO.memberUpdate(con, memberDTO);
		
		con.close();
		
		assertEquals(1, result);
	}
	
	
	/* @Test */
	public void loginTest() throws Exception{
		
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setId("test");
		memberDTO.setPw("tst");
		
		Connection con = DBConnector.getConnection();
		
		memberDTO = memberDAO.memberLogin(con, memberDTO);
		
		assertNotNull(memberDTO);
		con.close();
	}
	
	
	/* @Test */
	public void joinTest() throws Exception{
		
		MemberDAO memberDAO = new MemberDAO();
		
		MemberDTO memberDTO = new MemberDTO();
		Connection con = DBConnector.getConnection();
		
		memberDTO.setId("test");
		memberDTO.setPw("tdst");
		memberDTO.setName("iu");
		memberDTO.setEmail("iu@iu");
		memberDTO.setPhone("010-1234-5678");
		memberDTO.setGrade(1);
		
		int result = memberDAO.memberJoin(con, memberDTO);
		
		assertEquals(1, result);
	}

}
