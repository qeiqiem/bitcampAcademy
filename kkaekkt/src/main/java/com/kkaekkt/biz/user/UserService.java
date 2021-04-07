package com.kkaekkt.biz.user;

import java.util.List;

import com.google.gson.JsonElement;
import com.kkaekkt.biz.comm.LaundryVO;

public interface UserService {
<<<<<<< HEAD
	public void insertUser(PersonVO vo);
	public void insertUser(BusinessVO vo);
	public void updateUser(PersonVO vo);
	public void updateUser(BusinessVO vo);
	public String deleteUser(AccountVO vo);
	public void deleteUser(BusinessVO vo);
	public void likeOn(BusinessVO vo);
	public void likeOff(BusinessVO vo);
	public AccountVO getUser(AccountVO vo);
	public List<BusinessVO> getLikedBs(int mno);
	public BusinessVO getComspec(BusinessVO vo);
	public BusinessVO getCoinspec(BusinessVO vo);
	public void updateSpec(BusinessVO vo);
	public AccountVO findId(AccountVO vo);
	public AccountVO findPw(AccountVO vo);
	public int idchk(PersonVO vo);
	public int emailchk(String email);
	public AccountVO method(AccountVO vo);
	public AccountVO joinCfm(AccountVO vo);
	public double avgGradeBs(BusinessVO vo);
	public int countLikeBs(BusinessVO vo);	
//	public int idchkBs(BusinessVO vo);
	public PersonVO getPerson(int mno);
	public BusinessVO getBusiness(BusinessVO vo);
	public List<LaundryVO> getLaundryList(int bno);
    public void updatePw(AccountVO vo);
	public int bnoChk(int bno);
   
}
=======
   public void insertUser(PersonVO vo);
   public void insertUser(BusinessVO vo);
   public void updateUser(PersonVO vo);
   public void updateUser(BusinessVO vo);
   public String deleteUser(AccountVO vo);
   public void deleteUser(BusinessVO vo);
   public void likeOn(BusinessVO vo);
   public void likeOff(BusinessVO vo);
   public AccountVO getUser(AccountVO vo);
   public List<BusinessVO> getLikedBs(int mno);
   public BusinessVO getComspec(BusinessVO vo);
   public BusinessVO getCoinspec(BusinessVO vo);
   public void updateSpec(BusinessVO vo);
   public AccountVO findId(AccountVO vo);
   public AccountVO findPw(AccountVO vo);
   public int idchk(PersonVO vo);
   public int emailchk(String email);
   public AccountVO method(AccountVO vo);
   public AccountVO joinCfm(AccountVO vo);
   public double avgGradeBs(BusinessVO vo);
   public int countLikeBs(BusinessVO vo);   

   public PersonVO getPerson(int mno);
   public BusinessVO getBusiness(BusinessVO vo);
   public List<LaundryVO> getLaundryList(int bno);
   public void updatePw(AccountVO vo);
   public int bnoChk(int bno);
   
}
>>>>>>> e68e62054d82b0c92b97f725a4895de401f69ef9
