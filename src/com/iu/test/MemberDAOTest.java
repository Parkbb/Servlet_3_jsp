package com.iu.test;

import static org.junit.Assert.*;

import java.sql.Connection;

import org.junit.Test;

import com.iu.member.MemberDAO;

import com.iu.util.DBConnector;import com.iu.member.MemberDTO;

public class MemberDAOTest {

	@Test
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
