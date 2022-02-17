package spms.dao;

import java.util.List;

import spms.vo.Booking;
import spms.vo.Comm;

public interface BookingDao {
	public List<Booking> selectList() throws Exception;
	public int insert(Booking booking) throws Exception;
	public Booking selectOne(int bno) throws Exception;
	public int update(Booking booking) throws Exception;
	public int allUpdate(Booking booking) throws Exception;
	public boolean joinBook(int bno) throws Exception;
	public int delete(int bno) throws Exception;
	public List<Booking> selectLoc(String loc) throws Exception;
	List<Comm> readComms(int no) throws Exception;
}
