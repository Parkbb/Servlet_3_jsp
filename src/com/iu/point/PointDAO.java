package com.iu.point;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PointDAO {
	
	//update
	public int update(Connection con, PointDTO pointDTO) throws Exception{
		int result = 0;
		
		String sql = "update point set name=?, kor=?, eng=?, math=?, total=?, aver=?"
				+ " where num = ? ";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		int total = pointDTO.getKor() + pointDTO.getEng() + pointDTO.getMath();
		double aver = total/3.0;
		
		st.setString(1, pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());
		st.setInt(5, total);
		st.setDouble(6, aver);
		st.setInt(7, pointDTO.getNum());
		
		result = st.executeUpdate();
		
		
		st.close();
		con.close();
		
		return result;
	}
	
	//insert
	public int insert(Connection con, PointDTO pointDTO) throws Exception{
		int result = 0;
		
		String sql = "insert into point values "
				+ "(point_seq.nextval, ? , ? , ? , ? , ? , ?)";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, pointDTO.getName());
		st.setInt(2, pointDTO.getKor());
		st.setInt(3, pointDTO.getEng());
		st.setInt(4, pointDTO.getMath());
		st.setInt(5, pointDTO.getTotal());
		st.setDouble(6, pointDTO.getAver());
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
		
		
	}
	//delete
	public int delete(Connection con, int num) throws Exception{
		int result = 0;
		
		String sql = "delete point where num = ? ";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		result = st.executeUpdate();
		
		st.close();
		
		return result;
	}
	//selectOne
	public PointDTO selectOne(Connection con, int num) throws Exception {
		
	
		PointDTO pointDTO = null;
		String sql = "select * from point where num = ?";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, num);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			pointDTO = new PointDTO();
			pointDTO.setNum(rs.getInt(1));
			pointDTO.setName(rs.getString(2));
			pointDTO.setKor(rs.getInt(3));
			pointDTO.setEng(rs.getInt(4));
			pointDTO.setMath(rs.getInt(5));
			pointDTO.setTotal(rs.getInt(6));
			pointDTO.setAver(rs.getDouble(7));
		}
		
		rs.close();
		st.close();
		
		return pointDTO;
	}
	
	public ArrayList<PointDTO> selectList(Connection con) throws Exception{
		ArrayList<PointDTO> ar = new ArrayList<PointDTO>();
		PointDTO pointDTO = null;
		String sql = "select * from point "
				+ "order by num desc";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		ResultSet rs = st.executeQuery();
		
		while(rs.next()) {
			pointDTO = new PointDTO();
			pointDTO.setNum(rs.getInt(1));
			pointDTO.setName(rs.getString(2));
			pointDTO.setKor(rs.getInt(3));
			pointDTO.setEng(rs.getInt(4));
			pointDTO.setMath(rs.getInt(5));
			pointDTO.setTotal(rs.getInt(6));
			pointDTO.setAver(rs.getDouble(7));
			ar.add(pointDTO);
		}
		rs.close();
		st.close();
		
		
		return ar;
	}
	
}
