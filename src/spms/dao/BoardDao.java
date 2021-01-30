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

	public Page initPage() throws Exception {
		Page page = new Page();
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sqlSelect=null;
		try {
		connection = ds.getConnection();
		stmt = connection.createStatement();
		sqlSelect = "SELECT @rnum:=@rnum+1 AS no, b.* FROM board b, (SELECT @rnum:=0) AS r ORDER BY no DESC LIMIT 1";
		rs = stmt.executeQuery(sqlSelect);
		rs.next();
		page.setTotalCount(rs.getInt("no"))//출력 데이터 최대갯수
			.setLastPage((int)(Math.ceil(page.getTotalCount()/page.getCriteria())))
		    .setStartRow(page.getTotalCount())//데이터 출력 시작 행 번호
		    .setCurPage(1)//현재 페이지
		    .setStartNum(1);//첫 페이지 번호
		if(page.getLastPage()>10) {//마지막 페이지가 10을 넘는다면,
			page.setEndNum(10);
		} else {
			page.setEndNum(page.getLastPage());
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
	public Page searchedPage(Page page) throws Exception {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sqlSelect=null;
		try {
		connection = ds.getConnection();
		stmt = connection.createStatement();
		if(page.getFilter().equals("all")) {
			page.setFilter("%");
		}
		if(page.getOption().equals("all")) {//제목+내용 검색이라면
			sqlSelect = "SELECT @rnum:=@rnum+1 AS no, b.* FROM board b, (SELECT @rnum:=0) AS r "
					+ "WHERE (title like '%"+ page.getSearch() +"%' OR content like '%"+page.getSearch()+"%') "
							+ "AND header like '"+page.getFilter()+"' "
						    + "AND pin=0 "
					+ "ORDER BY no DESC LIMIT 1";
		} else {//제목 검색 아니면 작성자 검색
			sqlSelect = "SELECT @rnum:=@rnum+1 AS no, b.* FROM board b, (SELECT @rnum:=0) AS r "
					+ "WHERE "+page.getOption()+" like '%"+page.getSearch()+"%' "
							+ "AND header like '"+page.getFilter()+"' "
							+ "AND pin=0 "
					+ "ORDER BY no DESC LIMIT 1";
		}
		rs = stmt.executeQuery(sqlSelect);
		rs.next();
		page.setTotalCount(rs.getInt("no"))//출력 데이터 최대갯수
			.setLastPage((int)(Math.ceil(page.getTotalCount()/page.getCriteria())))
		    .setStartRow(page.getTotalCount())//데이터 출력 시작 행 번호
		    .setCurPage(1)//현재 페이지
		    .setStartNum(1);//첫 페이지 번호
		if(page.getLastPage()>10) {//마지막 페이지가 10을 넘는다면,
			page.setEndNum(10);
		} else {
			page.setEndNum(page.getLastPage());
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

	public List<Post> searchedList(Post post, Page page) throws Exception{
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
						.setVw(rs.getInt("vw"))
						.setRecommend(rs.getInt("recommend"))
						.setComm(rs.getInt("comm")));
			}
			if(page.getOption().equals("all")) {//제목+내용 검색이라면
				sqlSelect = "SELECT * FROM board WHERE (title like '%"+ page.getSearch() +"%' OR content like '%"+page.getSearch()+"%') "
								+ "AND header like '"+page.getFilter()+"' AND pin=0 "
						+ "ORDER BY "+page.getOrder()+" DESC,bno DESC limit 10";
			} else {//제목 검색 아니면 작성자 검색
				sqlSelect = "SELECT * FROM board WHERE "+page.getOption()+" like '%"+page.getSearch()+"%' "
								+ "AND header like '"+page.getFilter()+"' AND pin=0 "
						+ "ORDER BY "+page.getOrder()+" DESC,bno DESC limit 10";
			}
			rs = stmt.executeQuery(sqlSelect);//이렇게 재활용해도 되는지 잘 모르겠다. rs와 stmt의 내부상황을 알아야 한다.
			if(page.getFilter().equals("%")) {
				page.setFilter("all");
			}
			while (rs.next()) {
				posts.add(new Post()
						.setBno(rs.getInt("bno"))
						.setHeader(rs.getString("header"))
						.setTitle(rs.getString("title"))
						.setCreatedDate(rs.getDate("cre_date"))
						.setNname(rs.getString("nname"))
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
	public Page movedPage(Page page) throws Exception {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sqlSelect=null;
		try {
		connection = ds.getConnection();
		stmt = connection.createStatement();
		if(page.getFilter().equals("all")) {
			page.setFilter("%");
		}
		if(page.getOption().equals("all")) {//제목+내용 검색이라면
			sqlSelect = "SELECT @rnum:=@rnum+1 AS no, b.* FROM board b, (SELECT @rnum:=0) AS r "
					+ "WHERE (title like '%"+ page.getSearch() +"%' OR content like '%"+page.getSearch()+"%') "
							+ "AND header like '"+page.getFilter()+"' "
						    + "AND pin=0 "
					+ "ORDER BY no DESC LIMIT 1";
		} else {//제목 검색 아니면 작성자 검색
			sqlSelect = "SELECT @rnum:=@rnum+1 AS no, b.* FROM board b, (SELECT @rnum:=0) AS r "
					+ "WHERE "+page.getOption()+" like '%"+page.getSearch()+"%' "
							+ "AND header like '"+page.getFilter()+"' "
							+ "AND pin=0 "
					+ "ORDER BY no DESC LIMIT 1";
		}
		rs = stmt.executeQuery(sqlSelect);
		rs.next();
		page.setTotalCount(rs.getInt("no"))//출력 데이터 최대갯수
			.setLastPage((int)(Math.ceil(page.getTotalCount()/page.getCriteria())))//마지막 페이지 추출
			.setStartRow((page.getCurPage()-1)*10)//출력 시작 행
			.setEndNum((int)(Math.ceil(page.getCurPage()/10.0)*10))//페이지 nav 끝 번호
			.setStartNum(page.getEndNum()-9);//페이지 nav 시작번호
		if(page.getEndNum()>page.getLastPage()) {//만약 EndNum이 LastPage보다 클 경우 EndNum=LastPage
			page.setEndNum(page.getLastPage());
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

	@Override
	public List<Post> movedList(Post post, Page page) throws Exception {
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
						.setVw(rs.getInt("vw"))
						.setRecommend(rs.getInt("recommend"))
						.setComm(rs.getInt("comm")));
			}
			if(page.getFilter().equals("all")) {
				page.setFilter("%");
			}
			if(page.getOption().equals("all")) {//제목+내용 검색이라면
				sqlSelect = "SELECT * FROM board WHERE (title like '%"+ page.getSearch() +"%' OR content like '%"+page.getSearch()+"%') "
								+ "AND header like '"+page.getFilter()+"' AND pin=0 "
						+ "ORDER BY "+page.getOrder()+" DESC,bno DESC limit "+page.getStartRow()+",10";
			} else {//제목 검색 아니면 작성자 검색
				sqlSelect = "SELECT * FROM board WHERE "+page.getOption()+" like '%"+page.getSearch()+"%' "
								+ "AND header like '"+page.getFilter()+"' AND pin=0 "
						+ "ORDER BY "+page.getOrder()+" DESC,bno DESC limit "+page.getStartRow()+",10";
			}
			if(page.getFilter().equals("%")) {
				page.setFilter("all");
			}
			rs = stmt.executeQuery(sqlSelect);//이렇게 재활용해도 되는지 잘 모르겠다. rs와 stmt의 내부상황을 알아야 한다.
			while (rs.next()) {
				posts.add(new Post()
						.setBno(rs.getInt("bno"))
						.setHeader(rs.getString("header"))
						.setTitle(rs.getString("title"))
						.setCreatedDate(rs.getDate("cre_date"))
						.setNname(rs.getString("nname"))
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

}
