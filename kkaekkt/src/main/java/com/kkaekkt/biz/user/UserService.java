package com.kkaekkt.biz.user;

import java.util.List;

import com.google.gson.JsonElement;
import com.kkaekkt.biz.comm.LaundryVO;

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
	public BusinessVO getComspec(BusinessVO vo);
<<<<<<< HEAD
	public void updateComspec(BusinessVO vo);
=======
	public AccountVO findId(AccountVO vo);
>>>>>>> 79f82998ae036ca2d6e400cb5330cc0ad65e3045
}
