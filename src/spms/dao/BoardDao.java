package spms.dao;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import spms.annotation.Component;
import spms.vo.Page;
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
		String sqlSelect = "SELECT * FROM board "
				+ "WHERE pin=-1 ORDER BY bno DESC";

		try {
			connection = ds.getConnection();

			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelect);

			ArrayList<Post> posts = new ArrayList<Post>();

			while (rs.next()) {//공지 먼저
				posts.add(new Post()
						.setBno(rs.getInt("bno"))
						.setHeader(rs.getString("header"))
						.setTitle(rs.getString("title"))
						.setCreatedDate(rs.getDate("cre_date"))
						.setNname(rs.getString("nname"))
						.setPin(rs.getInt("pin"))
						.setVw(rs.getInt("vw"))
						.setRecommend(rs.getInt("recommend"))
						.setComm(rs.getInt("comm")));
			}
			
			sqlSelect = "SELECT * FROM board WHERE pin=0 "
					+ "ORDER BY bno DESC limit 10";
			rs = stmt.executeQuery(sqlSelect);
			while (rs.next()) {// 포스트는 10개만 
				posts.add(new Post()
						.setBno(rs.getInt("bno"))
						.setHeader(rs.getString("header"))
						.setTitle(rs.getString("title"))
						.setCreatedDate(rs.getDate("cre_date"))
						.setNname(rs.getString("nname"))
						.setPin(rs.getInt("pin"))
						.setVw(rs.getInt("vw"))
						.setRecommend(rs.getInt("recommend"))
						.setComm(rs.getInt("comm")));
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
	
	public List<Post> searchedList(Post post) throws Exception{
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sqlSelect=null;
		ArrayList<Post> posts = new ArrayList<Post>();
		try {
			connection = ds.getConnection();
			stmt = connection.createStatement();
			sqlSelect = "SELECT * FROM board "
					+ "WHERE pin=-1 ORDER BY bno DESC"; //공지글 먼저 출력 (공지글은 검색조건에 영향을 받지 않아야 한다)
			rs = stmt.executeQuery(sqlSelect);
			while (rs.next()) {
				posts.add(new Post()
						.setBno(rs.getInt("bno"))
						.setHeader(rs.getString("header"))
						.setTitle(rs.getString("title"))
						.setCreatedDate(rs.getDate("cre_date"))
						.setNname(rs.getString("nname"))
						.setPin(rs.getInt("pin"))
						.setVw(rs.getInt("vw"))
						.setRecommend(rs.getInt("recommend"))
						.setComm(rs.getInt("comm")));
			}
			if(post.getOption().equals("all")) {//제목+내용 검색이라면
				sqlSelect = "SELECT * FROM board "
						+ "WHERE (title like '%"+ post.getSearch() +"%' OR content like '%"+post.getSearch()+"%') "
								+ "AND header like '"+post.getHeader()+"' AND pin=0 "
						+ "ORDER BY bno DESC";
			} else {//제목 검색 아니면 작성자 검색
				sqlSelect = "SELECT * FROM board "
						+ "WHERE "+post.getOption()+" like '%"+post.getSearch()+"%' "
								+ "AND header like '"+post.getHeader()+"' AND pin=0 "
						+ "ORDER BY bno DESC";
			}
			rs = stmt.executeQuery(sqlSelect);//이렇게 재활용해도 되는지 잘 모르겠다. rs와 stmt의 내부상황을 알아야 한다.
			while (rs.next()) {
				posts.add(new Post()
						.setBno(rs.getInt("bno"))
						.setHeader(rs.getString("header"))
						.setTitle(rs.getString("title"))
						.setCreatedDate(rs.getDate("cre_date"))
						.setNname(rs.getString("nname"))
						.setPin(rs.getInt("pin"))
						.setVw(rs.getInt("vw"))
						.setRecommend(rs.getInt("recommend"))
						.setComm(rs.getInt("comm")));
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
	public int insert(Post post) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Post selectOne(int no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Post post) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(int no) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	public Page initPage() throws Exception {
		Page page = new Page(); 
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sqlSelect=null;
		try {
		connection = ds.getConnection();
		stmt = connection.createStatement();
		sqlSelect = "SELECT @rnum:=@rnum+1 AS no, b.* FROM board b, (SELECT @rnum:=0) AS r ORDER BY no desc limit 1";
		rs = stmt.executeQuery(sqlSelect);
		rs.next();
		int rowMax=rs.getInt("no");
		if(rowMax%10==0) {//최대 페이지
			page.setMaxPage(rowMax/10);
		} else {
			page.setMaxPage(rowMax/10+1);
		}
		page.setCurPage(1);//첫 페이지는 1페이지
		page.setStartNum(1);//페이지 목록 시작 넘버도 1
		if((rowMax/101)>=1) {
			page.setEndNum(10);
		} else {
			page.setEndNum(page.getMaxPage());
		}
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
		return page;
	}

}
