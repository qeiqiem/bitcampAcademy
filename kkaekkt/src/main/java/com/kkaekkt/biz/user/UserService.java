package com.kkaekkt.biz.user;

import java.util.List;

public interface UserService {
	public void insertUser(PersonVO vo);
	public void insertUser(BusinessVO vo);
	public void updateUser(PersonVO vo);
	public void updateUser(BusinessVO vo);
	public void deleteUser(PersonVO vo);
	public void deleteUser(BusinessVO vo);
	public void likeOn(BusinessVO vo);
	public void likeOff(BusinessVO vo);
	public AccountVO getUser(AccountVO vo);
	public BusinessVO getUser(BusinessVO vo);
	public List<BusinessVO> getLikedBs(int mno);
	public BusinessVO getComspec(BusinessVO vo);
	public BusinessVO getCoinspec(BusinessVO vo);
	public void updateSpec(BusinessVO vo);
	public AccountVO findId(AccountVO vo);
	public AccountVO findPw(AccountVO vo);
	public int idchk(PersonVO vo);
	public int emailchk(AccountVO vo);
	public AccountVO method(AccountVO vo);
	public AccountVO joinCfm(AccountVO vo);
	public double avgGradeBs(BusinessVO vo);
	public int countLikeBs(BusinessVO vo);	
	public int idchkBs(BusinessVO vo);

}
