package spms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import spms.annotation.Component;
import spms.vo.Member;

@Component("memberDao")
public class MySqlMemberDao implements MemberDao{

	DataSource ds = null;
	
	public void setDataSource(DataSource ds) {
		this.ds = ds;
	}
	public int insert(Member member) throws Exception {
		Connection connection = null;
		PreparedStatement stmt = null;
		final String sqlInsert = "INSERT INTO members(mname,id,pwd,rrn,phone,address,nname,cre_date) "
				+ "VALUES (?,?,?,?,?,?,?,NOW())";
		try {
			// 커넥션풀에서 Connection객체를 빌려온다
			connection = ds.getConnection();

			stmt = connection.prepareStatement(sqlInsert);
			stmt.setString(1, member.getMname());
			stmt.setString(2, member.getId());
			stmt.setString(3, member.getPwd());
			stmt.setString(4, member.getRrn());
			stmt.setString(5, member.getPhone());
			stmt.setString(6, member.getAddress());
			stmt.setString(7, member.getNname());
			return stmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
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

	public int delete(int no) throws Exception {
		Connection connection = null;
		Statement stmt = null;
		final String sqlDelete = "DELETE FROM members WHERE mno="+no;
		try {
			// 커넥션풀에서 Connection객체를 빌려온다
			connection = ds.getConnection();
			stmt = connection.createStatement();
			return stmt.executeUpdate(sqlDelete);
		} catch (Exception e) {
			throw e;
		} finally {
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

	public Member selectOne(int no) throws Exception {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;

		final String sqlSelectOne = "SELECT * FROM MEMBERS WHERE mno="+no;

		try {
			// 커넥션풀에서 Connection객체를 빌려온다
			connection = ds.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelectOne);
			if (rs.next()) {
			return new Member()
						.setMno(rs.getInt("mno"))
						.setMname(rs.getString("mname"))
						.setId(rs.getString("id"))
						.setPwd(rs.getString("pwd"))
						.setRrn(rs.getString("rrn"))
						.setPhone(rs.getString("phone"))
						.setAddress(rs.getString("nname"))
						.setCreatedDate(rs.getDate("cre_date"));
			} else {
				throw new Exception("해당 번호의 회원을 찾을 수 없습니다.");
			}
			
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}

			// 다 썼으면 반납하자
			try {
				if(connection != null)
					connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public int update(Member member) throws Exception {
		Connection connection = null;
		PreparedStatement stmt = null;
		final String sqlUpdate = "UPDATE MEMBERS SET mname=?,id=?,pwd=?,rrn=?,phone=?,address=?,nname=? "
				+ "WHERE MNO=?";
		try {
			// 커넥션풀에서 Connection객체를 빌려온다
			connection = ds.getConnection();
			stmt = connection.prepareStatement(sqlUpdate);
			stmt.setString(1, member.getMname());
			stmt.setString(2, member.getId());
			stmt.setString(3, member.getPwd());
			stmt.setString(4, member.getRrn());
			stmt.setString(5, member.getPhone());
			stmt.setString(6, member.getAddress());
			stmt.setString(7, member.getNname());
			stmt.setInt(8, member.getMno());
			return stmt.executeUpdate();
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}

			// 다 썼으면 반납하자
			try {
				if(connection != null)
					connection.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public Member check(String id, String pwd) throws Exception {
		Connection connection = null;
		Member member = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		final String sqlExist = "SELECT mno,nname FROM MEMBERS WHERE id=? AND pwd=?";
		try {
			// 커넥션풀에서 Connection객체를 빌려온다
			connection = ds.getConnection();
			
			stmt = connection.prepareStatement(sqlExist);
			stmt.setString(1, id);
			stmt.setString(2, pwd);
			rs = stmt.executeQuery();
			if (rs.next()) {
				return new Member().setMno(rs.getInt("mno")).setMname(rs.getString("mname"));
			} else {
				throw new Exception("ID 혹은 Password 가 일치하지 않습니다.");
			}
		} catch (Exception e) {
			throw e;
		} finally {
			try {
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
			}
			try {
				if(connection != null)
					connection.close();// 다 썼으면 반납하자
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}
