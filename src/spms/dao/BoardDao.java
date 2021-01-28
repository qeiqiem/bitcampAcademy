package spms.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import spms.annotation.Component;
import spms.vo.Post;
@Component("boardDao")
public class BoardDao implements ProjectDao {

	DataSource ds = null;
	
	public void setDataSource(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public List<Post> selectList() throws Exception {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		final String sqlSelect = "SELECT bno,header,title,nname,cre_date,vw,recommend,comm,pin FROM board "
				+ "ORDER BY pin,bno DESC";

		try {
			connection = ds.getConnection();

			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelect);

			ArrayList<Post> posts = new ArrayList<Post>();

			while (rs.next()) {
				posts.add(new Post()
						.setBno(rs.getInt("bno"))
						.setHeader(rs.getString("header"))
						.setTitle(rs.getString("title"))
						.setCreatedDate(rs.getDate("cre_date"))
						.setNname(rs.getString("nname"))
						.setPin(rs.getInt("pin")));
			}

			return posts;

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
	

	public List<Post> searchedList(String title) throws Exception{
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		final String sqlSelect = "SELECT bno,header,title,nname,cre_date FROM board "
				+ "WHERE title like '%"+title+"%' "
				+ "ORDER BY bno DESC ";

		try {
			connection = ds.getConnection();

			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelect);

			ArrayList<Post> posts = new ArrayList<Post>();

			while (rs.next()) {
				posts.add(new Post().setBno(rs.getInt("bno")).setHeader(rs.getString("header"))
						.setTitle(rs.getString("title")).setCreatedDate(rs.getDate("cre_date")).setNname(rs.getString("nname")));
			}
			
			return posts;

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

	@Override
	public int insert(Post board) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Post selectOne(int no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Post board) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
