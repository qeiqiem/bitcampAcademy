package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import spms.annotation.Component;
import spms.vo.Booking;

@Component("bookingDao")
public class MySqlBookingDao implements BookingDao {
	
	DataSource ds = null;//추후에 넘어올 데이터 디비연결
	
	public void setDataSource(DataSource ds) {//데이터 연결
		this.ds = ds;
	}

	@Override
	public List<Booking> selectList() throws Exception {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		final String sqlSelect = "SELECT bno,mno,header,title,nname,cre_date,nop,rdate,content,mark,comm,loc,picture FROM booking ORDER BY bno desc";
		
		List<Booking> bookings = new ArrayList<Booking>();
		try {
			connection = ds.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelect);
			
			while(rs.next()) {
				//vo로 담아서 가져온다
				bookings.add(new Booking().setBno(rs.getInt("bno"))
										.setMno(rs.getInt("mno"))
										.setHeader(rs.getString("header"))
										.setTitle(rs.getString("title"))
										.setNname(rs.getString("nname"))
										.setCre_date(rs.getDate("cre_date"))
										.setNop(rs.getInt("nop"))
										.setRdate(rs.getDate("rdate"))
										.setContent(rs.getString("content"))
										.setMark(rs.getInt("mark"))
										.setComm(rs.getInt("comm"))
										.setLoc(rs.getString("loc"))
										.setPicture(rs.getByte("picture")));
			}
			
			return bookings;
			
		}catch(Exception e) {
			throw e;
		}finally {
			try {if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
			try {if(stmt != null) stmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(connection != null) connection.close();}catch(Exception e) {e.printStackTrace();}
		}
	}



	@Override
	public int insert(Booking booking) throws Exception {
		Connection connection = null;
		PreparedStatement stmt = null;
		final String sqlInsert = "INSERT INTO booking(mno,header,title,nname,cre_date,nop,rdate,content,loc,picture) VALUES (?,?,?,?,NOW(),?,?,?,?,?)";
		int result = 0;
		
		try {
			connection = ds.getConnection();
			stmt = connection.prepareStatement(sqlInsert);
			
			stmt.setInt(1, booking.getMno());
			stmt.setString(2, booking.getHeader());
			stmt.setString(3, booking.getTitle());
			stmt.setString(4, booking.getNname());
			stmt.setInt(5, booking.getNop());
			stmt.setDate(6, booking.getRdate());
			stmt.setString(7, booking.getContent());
			stmt.setString(8, booking.getLoc());
			stmt.setByte(9, booking.getPicture());
			
			result = stmt.executeUpdate();
		}catch(Exception e) {
			throw e;
		}finally {
			try {if(stmt != null) stmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(connection != null) connection.close();}catch(Exception e) {e.printStackTrace();}
		}
		return result;
	}

}
