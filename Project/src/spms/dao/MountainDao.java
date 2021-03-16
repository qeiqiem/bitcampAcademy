package spms.dao;

import java.util.List;

import spms.vo.Mountain;

public interface MountainDao {
	public List<Mountain> selectList() throws Exception;
	public Mountain selectOne(int mtno) throws Exception;
}
