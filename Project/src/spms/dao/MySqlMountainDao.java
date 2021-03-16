package spms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import spms.annotation.Component;
import spms.vo.Mountain;

@Component("mountainDao")
public class MySqlMountainDao  implements MountainDao {

	DataSource ds = null;
	
	public void setDataSource(DataSource ds) {
		this.ds = ds;
	}

	@Override
	public List<Mountain> selectList() throws Exception {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
	final String sqlSelect = "SELECT mtno,loc,mtname,trans,exp FROM mountain";
		
		List<Mountain> mountain = new ArrayList<Mountain>();
		try {
			connection = ds.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelect);
			
			while(rs.next()) {
				mountain.add(new Mountain().setMtno(rs.getInt("mtno"))
											.setLoc(rs.getString("loc"))
											.setMtname(rs.getString("mtname"))
											.setTrans(rs.getString("trans"))
											.setExp(rs.getString("exp")));
			}
			return mountain;
			
		}catch(Exception e) {
			throw e;
		}finally {
			try {if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
			try {if(stmt != null) stmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(connection != null) connection.close();}catch(Exception e) {e.printStackTrace();}
		}
	}

	@Override
	public Mountain selectOne(int mtno) throws Exception {
		Connection connection = null;
		Statement stmt = null;
		ResultSet rs = null;
		Mountain mountain = null;
	final String sqlSelect = "SELECT mtno,loc,mtname,trans,exp,locimg,loclink FROM mountain WHERE mtno=" + mtno;
		
		try {
			connection = ds.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery(sqlSelect);
			
			while(rs.next()) {
				mountain = new Mountain().setMtno(rs.getInt("mtno"))
						.setLoc(rs.getString("loc"))
						.setMtname(rs.getString("mtname"))
						.setTrans(rs.getString("trans"))
						.setExp(rs.getString("exp"))
						.setLocimg(rs.getString("locimg"))
						.setLoclink(rs.getString("loclink"))
						;
				
			}
			return mountain;
			
		}catch(Exception e) {
			throw e;
		}finally {
			try {if(rs != null) rs.close();}catch(Exception e) {e.printStackTrace();}
			try {if(stmt != null) stmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(connection != null) connection.close();}catch(Exception e) {e.printStackTrace();}
		}
	}
	
}
