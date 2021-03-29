package com.kkaekkt.biz.user;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	public BusinessVO getCoinspec(BusinessVO vo);
	public void updateSpec(BusinessVO vo);
	public AccountVO findId(AccountVO vo);
	public AccountVO findPw(AccountVO vo);
	public int idchk(PersonVO vo);
	public PersonVO method(PersonVO vo);
	public String email(PersonVO vo);
	public AccountVO joinCfm(AccountVO vo);
	public int getLikedBs(BusinessVO vo);


	public int getLikedBs(BusinessVO vo);
	
	public int loginchk(AccountVO vo);


}
