package spms.dao;

import java.util.List;

import spms.vo.Page;
import spms.vo.Post;

public interface ProjectDao {
	List<Post> selectList() throws Exception;
	List<Post> searchedList(Post post, Page page) throws Exception;
	Page searchedPage(Page page) throws Exception;
	int insert(Post post) throws Exception;
	Post selectOne(int no) throws Exception;
	int update(Post post) throws Exception;
	int delete(int no) throws Exception;
}
