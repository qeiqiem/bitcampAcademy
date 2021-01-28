package spms.dao;

import java.util.List;

import spms.vo.Post;

public interface ProjectDao {
	List<Post> selectList() throws Exception;
	List<Post> searchedList(String title) throws Exception;
	int insert(Post board) throws Exception;
	Post selectOne(int no) throws Exception;
	int update(Post board) throws Exception;
	int delete(int no) throws Exception;
}
