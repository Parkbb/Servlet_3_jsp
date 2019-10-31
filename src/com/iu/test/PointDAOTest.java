package com.iu.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Random;

import org.junit.Test;

import com.iu.notice.NoticeDAO;
import com.iu.notice.NoticeDTO;
import com.iu.point.PointDAO;
import com.iu.point.PointDTO;
import com.iu.util.DBConnector;

import javafx.scene.PointLight;

public class PointDAOTest {
	

	
	/* @Test */
	public void updateTest() throws Exception{
		PointDAO pointDAO = new PointDAO();
		PointDTO pointDTO = new PointDTO();
		
		pointDTO.setNum(37);
		pointDTO.setName("update2");
		pointDTO.setKor(99);
		pointDTO.setEng(99);
		pointDTO.setMath(99);
		pointDTO.setTotal(297);
		pointDTO.setAver(99.0);
		Connection con = DBConnector.getConnection();
		
		int result = pointDAO.update(con, pointDTO);
		assertNotEquals(0, result);
		
	}
	
	
	/* @Test */
	public void insertTest() throws Exception{
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		
		for (int i = 0; i < 10; i++) {
			Random rs = new Random();
			PointDTO pointDTO = new PointDTO();
			pointDTO.setName("name"+i);
			pointDTO.setKor(rs.nextInt(101));
			pointDTO.setEng(rs.nextInt(101));
			pointDTO.setMath(rs.nextInt(101));
			pointDTO.setTotal(pointDTO.getKor() + pointDTO.getEng() + pointDTO.getMath());
			pointDTO.setAver(pointDTO.getTotal()/3.0);
			pointDAO.insert(con, pointDTO);
		}
		
	}
	
	
	/* @Test */
	public void test4() throws Exception{
		PointDAO pointDAO = new PointDAO();
		ArrayList<PointDTO> ar = null;
		
		Connection con = DBConnector.getConnection();
		
		ar = pointDAO.selectList(con);
		
		/* assertNotNull(ar.get(0)); */
		assertNotEquals(0, ar.size());
		con.close();
	}
	
	/* @Test */
	public void test3() throws Exception{
		
		PointDAO pointDAO = new PointDAO();
		PointDTO pointDTO = null;
		
		Connection con = DBConnector.getConnection();
		
		pointDTO = pointDAO.selectOne(con, 25);
		
		assertNull(pointDTO);
		con.close();
	}
	
	/* @Test */
	public void test2() throws Exception{
		Connection con = DBConnector.getConnection();
		
		assertNotNull(con);
		con.close();
	}

	/* @Test */
	public void test() throws Exception{
		
		PointDAO pointDAO = new PointDAO();
		Connection con = DBConnector.getConnection();
		int result = pointDAO.delete(con, 123);
		
		
		//단정문
		assertEquals(1, result);
		con.close();
	}

}
