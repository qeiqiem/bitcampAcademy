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
import spms.vo.Comm;
import spms.vo.Mountain;

@Component("bookingDao")
public class MySqlBookingDao implements BookingDao {
	
	@Override
	public List<Comm> readComms(int no) throws Exception {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sqlSelect = "SELECT * FROM comm " 
				+ "WHERE bname='booking' "
				+ "AND bno="+no+" "
				+ "ORDER BY cre_date";
		try {
			connection = ds.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelect);

			ArrayList<Comm> comms = new ArrayList<Comm>();

			while (rs.next()) {
				comms.add(new Comm()
						.setBno(rs.getInt("bno"))
						.setMno(rs.getInt("mno"))
						.setNname(rs.getString("nname"))
						.setContent(rs.getString("content"))
						.setCreatedDate(rs.getDate("cre_date"))
						.setNname(rs.getString("nname")));
			}
			return comms;
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				if(connection != null)
					connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	DataSource ds = null;//추후에 넘어올 데이터 디비연결
	
	public void setDataSource(DataSource ds) {//데이터 연결
		this.ds = ds;
	}

	@Override
	public List<Booking> selectList() throws Exception {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
	final String sqlSelect = "SELECT bno,header,title,nname,cre_date,rdate,min_nop,nop,mark,loc FROM booking ORDER BY bno desc";
		
		List<Booking> bookings = new ArrayList<Booking>();
		try {
			connection = ds.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelect);
			
			while(rs.next()) {
				//vo로 담아서 가져온다
				bookings.add(new Booking().setBno(rs.getInt("bno"))
										.setHeader(rs.getString("header"))
										.setTitle(rs.getString("title"))
										.setNname(rs.getString("nname"))
										.setCre_date(rs.getDate("cre_date"))
										.setRdate(rs.getDate("rdate"))
										.setMin_nop(rs.getInt("min_nop"))
										.setNop(rs.getInt("nop"))
										.setMark(rs.getInt("mark"))
										.setLoc(rs.getString("loc")));
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
		final String sqlInsert = "INSERT INTO booking(mno,header,title,nname,cre_date,min_nop,nop,rdate,content,mark,book,comm,loc) VALUES (?,?,?,?,NOW(),0,?,?,?,0,0,0,?)";
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
			
			result = stmt.executeUpdate();
		}catch(Exception e) {
			throw e;
		}finally {
			try {if(stmt != null) stmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(connection != null) connection.close();}catch(Exception e) {e.printStackTrace();}
		}
		return result;
	}

	@Override
	public Booking selectOne(int bno) throws Exception {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		Booking booking = null;
		final String sqlSelectOne = "SELECT bno,mno,header,title,nname,cre_date,min_nop,nop,rdate,content,mark,book,comm,loc FROM booking WHERE bno=";
		
		try {
			
			connection = ds.getConnection();
			stmt = connection.prepareStatement(sqlSelectOne);
			rs = stmt.executeQuery(sqlSelectOne + bno);
			
			if(rs.next()) {
				booking = new Booking().setBno(rs.getInt("bno"))
							.setMno(rs.getInt("mno"))
							.setHeader(rs.getString("header"))
							.setTitle(rs.getString("title"))
							.setNname(rs.getString("nname"))
							.setCre_date(rs.getDate("cre_date"))
							.setMin_nop(rs.getInt("min_nop"))
							.setNop(rs.getInt("nop"))
							.setRdate(rs.getDate("rdate"))
							.setContent(rs.getString("content"))
							.setMark(rs.getInt("mark"))
							.setBook(rs.getInt("book"))
							.setComm(rs.getInt("comm"))
							.setLoc(rs.getString("loc"));
			}
		}catch (Exception e) {
			throw e;
		}finally {
			try {if(stmt != null) stmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(connection != null) connection.close();}catch(Exception e) {e.printStackTrace();}
		}
		return booking;
	}

	@Override
	public int update(Booking booking) throws Exception {
		Connection connection = null;
		int result = 0;
		PreparedStatement stmt = null;
		final String sqlUpdate = "UPDATE booking SET mark = mark+1 WHERE bno=?";
		try {
			connection = ds.getConnection();
			stmt = connection.prepareStatement(sqlUpdate);
			stmt.setInt(1, booking.getBno());
			result = stmt.executeUpdate();

		} catch (Exception e) {
			throw e;
		} finally {
			try {if(stmt != null) stmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(connection != null) connection.close();}catch(Exception e) {e.printStackTrace();}
		}

		return result;
	}

	@Override
	public int allUpdate(Booking booking) throws Exception {
		Connection connection = null;
		PreparedStatement stmt = null;
		int result = 0;
		final String sqlUpdate = "UPDATE booking SET header=?,title=?,nname=?,nop=?,rdate=?,content=?,loc=? WHERE bno=?";
		try {
			connection = ds.getConnection();
			stmt = connection.prepareStatement(sqlUpdate);
			
			stmt.setString(1, booking.getHeader());
			stmt.setString(2, booking.getTitle());
			stmt.setString(3, booking.getNname());
			stmt.setInt(4, booking.getNop());
			stmt.setDate(5, booking.getRdate());
			stmt.setString(6, booking.getContent());
			stmt.setString(7, booking.getLoc());
			stmt.setInt(8, booking.getBno());
			
			result = stmt.executeUpdate();
			return result;
			
		}catch(Exception e) {
			throw e;
		} finally {
			try {if(stmt != null) stmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(connection != null) connection.close();}catch(Exception e) {e.printStackTrace();}
		}
	}

	@Override
	public boolean joinBook(int bno) throws Exception {
		Connection connection = null;
		PreparedStatement stmt = null;
		int result = 0;
		final String sqlUpdate = "UPDATE booking SET min_nop = min_nop+1 WHERE bno=?";
		try {
			connection = ds.getConnection();
			stmt = connection.prepareStatement(sqlUpdate);
			stmt.setInt(1, bno);
			result = stmt.executeUpdate();

		} catch (Exception e) {
			throw e;
		} finally {
			try {if(stmt != null) stmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(connection != null) connection.close();}catch(Exception e) {e.printStackTrace();}
		}

		return true;
	}
	//삭제
	@Override
	public int delete(int bno) throws Exception {
			Connection connection = null;
			Statement stmt = null;
			String sqlDelete = "DELETE FROM" + "\r\n" +
							   "booking WHERE bno=" + bno;
			try {
				connection = ds.getConnection();
				stmt = connection.createStatement();
				return stmt.executeUpdate(sqlDelete);
				
			}catch(Exception e) {
				throw e;
			}finally {
				try {if(stmt!=null) stmt.close();}
				catch(Exception e) {throw e;}
				try {if(connection!=null) connection.close();}
				catch(Exception e) {throw e;}
			}
	}

	@Override
	public List<Booking> selectLoc(String loc) throws Exception {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Booking> bookings = new ArrayList<Booking>();
	final String sqlSelect = "SELECT bno,header,title,nname,loc,min_nop,nop FROM booking WHERE loc like '%";
		
		try {
			connection = ds.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelect + loc + "%'");
			
			while(rs.next()) {
				bookings.add(new Booking().setBno(rs.getInt("bno"))
										.setHeader(rs.getString("header"))
										.setTitle(rs.getString("title"))
										.setNname(rs.getString("nname"))
										.setNop(rs.getInt("nop"))
										.setMin_nop(rs.getInt("min_nop"))
										.setLoc(rs.getString("loc")));
										
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
}
