package com.kkaekkt.biz.user;

import java.util.List;

public interface UserService {
	public void insertUser(PersonVO vo);
	public void insertUser(BusinessVO vo);
	public void updateUser(PersonVO vo);
	public void updateUser(BusinessVO vo);
	public void deleteUser(PersonVO vo);
	public void deleteUser(BusinessVO vo);
	public void likeOff(BusinessVO vo);
	public PersonVO getUser(PersonVO vo);
	public BusinessVO getUser(BusinessVO vo);
	public BusinessListVO getLikedBs(BusinessListVO vo);
}
