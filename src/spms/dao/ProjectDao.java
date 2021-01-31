package spms.dao;

import java.util.List;

import javax.sql.DataSource;

import spms.vo.Comm;
import spms.vo.Page;
import spms.vo.Post;

public interface ProjectDao {
	void setDataSource(DataSource ds);
	List<Post> selectList() throws Exception;
	List<Post> searchedList(Post post, Page page) throws Exception;
	List<Post> movedList(Post post, Page page) throws Exception;
	List<Comm> readComms(int no) throws Exception;
	Page initPage() throws Exception;
	Page searchedPage(Page page) throws Exception;
	Page movedPage(Page page) throws Exception;	
	Post selectOne(int no) throws Exception;
	int insert(Post post) throws Exception;
	int update(Post post) throws Exception;
	int delete(int no) throws Exception;
}
