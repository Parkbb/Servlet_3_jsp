package com.iu.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Random;

import org.junit.Test;

import com.iu.notice.NoticeDAO;
import com.iu.notice.NoticeDTO;
import com.iu.util.DBConnector;
	
	


	public class NoticeDAOTest {
		
		
	//Hitup
	@Test
	public void hitupTest() throws Exception{
		
		NoticeDAO noticeDAO = new NoticeDAO();
		
		NoticeDTO noticeDTO = new NoticeDTO();
		Connection con = DBConnector.getConnection();
		
		noticeDTO.setNum(2);
		noticeDTO.setHit(1);
		
		int result = noticeDAO.Hitup(con, noticeDTO);
		
		assertEquals(1, result);
	}
	
	//update
	/* @Test */
	public void updateTest() throws Exception{
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnector.getConnection();
		
		NoticeDTO noticeDTO = new NoticeDTO();
		
		noticeDTO.setTitle("junitTest1");
		noticeDTO.setWriter("junitTest2");
		noticeDTO.setcontents("junitTest1");
		noticeDTO.setNum(1);
		
		int result = noticeDAO.Update(con, noticeDTO);
		
		assertEquals(1, result);
	}
	//delete
	/* @Test */
	public void deleteTest() throws Exception{
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnector.getConnection();
		
		int result = noticeDAO.Delete(con, 5);
		
		assertEquals(1, result);
	}
	//insert
	/* @Test */
	public void insertTest() throws Exception{
		NoticeDAO noticeDAO = new NoticeDAO();
		Connection con = DBConnector.getConnection();

		for (int i = 0; i < 10; i++) {

			NoticeDTO noticeDTO = new NoticeDTO();
			noticeDTO.setTitle("title"+i);
			noticeDTO.setWriter("writer"+i);
			noticeDTO.setcontents("contents"+i);


			noticeDAO.insert(con, noticeDTO);

		}
	}
	
	//list
	/* @Test */
	public void selectListTest() throws Exception{
		NoticeDAO noticeDAO = new NoticeDAO();
		ArrayList<NoticeDTO> ar = null;
		
		Connection con =DBConnector.getConnection();
		
		ar = noticeDAO.selectList(con);
		
		assertNotEquals(10, ar.size());
		con.close();
	}
}