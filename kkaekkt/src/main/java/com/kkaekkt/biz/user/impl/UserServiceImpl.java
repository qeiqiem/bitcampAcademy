package com.kkaekkt.biz.user.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.kkaekkt.biz.comm.EquipmentVO;
import com.kkaekkt.biz.comm.EtcVO;
import com.kkaekkt.biz.comm.LaundryVO;
import com.kkaekkt.biz.comm.ScheduleVO;
import com.kkaekkt.biz.user.AccountVO;
import com.kkaekkt.biz.user.BusinessVO;
import com.kkaekkt.biz.user.PersonVO;
import com.kkaekkt.biz.user.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO userDao;

	@Override
	public void insertUser(PersonVO vo) {
		userDao.insertUser(vo);
	}
	@Override
	public void likeOff(BusinessVO vo) {
		userDao.likeOff(vo);
	}
	@Override
	public void likeOn(BusinessVO vo) {
		userDao.likeOn(vo);
	}
	@Override
	public List<BusinessVO> getLikedBs(int mno) {
		return userDao.getLikedBs(mno);
	}
	@Override
	public int countLikeBs(BusinessVO vo) {
		return userDao.countLikeBs(vo);
	}
	@Override
	public double avgGradeBs(BusinessVO vo) {
		return userDao.avgGradeBs(vo);
	}

	@Override
	public void insertUser(BusinessVO vo) {
		System.out.println("서비스진입");
		vo.setScheduleList(convertToObj(vo.getSchedule(), ScheduleVO.class));
		System.out.println(vo.getScheduleList());
		if (vo.getBizType() == 1) { // 일반 세탁소라면
			vo.setLaundryList(convertToObj(vo.getLaundry(), LaundryVO.class));
		} else {
			vo.setEquipmentList(convertToObj(vo.getEquipment(), EquipmentVO.class));
			vo.setEtcList(convertToObj(vo.getEtc(), EtcVO.class));
		}
		userDao.insertUser(vo);
	}

	@Override
	public void updateUser(PersonVO vo) {
		userDao.updateUser(vo);

	}

	@Override
	public void updateUser(BusinessVO vo) {
		userDao.updateUser(vo);

	}

	@Override
	public void deleteUser(AccountVO vo) {
		System.out.println("회원탈퇴 서비스 옴");
		userDao.deleteUser(vo);

	}
	
	// 로그인 들
	
//	@Override
//	public int idchkBs(BusinessVO vo) {
//		System.out.println("아이디 찾는 서비스 옴 -- 업체");
//		return userDao.idchkBs(vo);
//	}

	@Override
	public AccountVO getUser(AccountVO vo) {
		return userDao.getUser(vo);
	}
	
	public AccountVO method(AccountVO vo) {
		System.out.println("소셜유저로그인 servie옴");		
		return userDao.getUserSNS(vo);
	}

	public <T> List<T> convertToObj(String json, Class<T> type) {
		String temp = json.substring(1, json.length() - 1); // 양 끝의 [ ] 제거
		String[] temp2 = temp.split("},"); // {~},{~} 을 split하여 배열로 나눔
		List<T> list = new ArrayList<T>();
		Gson gson = new Gson();
		for (int i = 0; i < temp2.length; i++) {
			if (i != temp2.length - 1) {// 만약 마지막 { ~ }이 아니라면,
				temp2[i] += "}";// split 과정에서 떨어졌던 '}'를 붙여준다.
			}
			list.add(gson.fromJson(temp2[i], type));
		}
		System.out.println(list + json);
		return list;
	}

	@Override
	public BusinessVO getComspec(BusinessVO vo) {
		// System.out.println("servie옴");
		vo.setLaundryList(userDao.getLaundry(vo.getBno()));
		vo.setScheduleList(userDao.getSchedule(vo.getBno()));
		return vo;
	}

	@Override
	public BusinessVO getCoinspec(BusinessVO vo) {
		// System.out.println("servie옴");
		vo.setEquipmentList(userDao.getEquipment(vo.getBno()));
		vo.setEtcList(userDao.getEtc(vo.getBno()));
		vo.setScheduleList(userDao.getSchedule(vo.getBno()));
		return vo;
	}

	public void updateSpec(BusinessVO vo) {
		System.out.println("서비스진입");
		vo.setScheduleList(convertToObj(vo.getSchedule(), ScheduleVO.class));
		System.out.println(vo.getScheduleList());

		if (vo.getBizType() == 1) { // 일반 세탁소라면
			vo.setLaundryList(convertToObj(vo.getLaundry(), LaundryVO.class));
		} else {
			vo.setEquipmentList(convertToObj(vo.getEquipment(), EquipmentVO.class));
			vo.setEtcList(convertToObj(vo.getEtc(), EtcVO.class));
		}

		userDao.updateSpec(vo);
	}

	@Override
	public AccountVO findId(AccountVO vo) {
		System.out.println("findId 서비스");
		return userDao.findId(vo);
	}

	@Override
	public AccountVO findPw(AccountVO vo) {
		System.out.println("findPw 서비스옴");
		return userDao.findPw(vo);
	}

	@Override
	public int idchk(PersonVO vo) {
		System.out.println("idchk 서비스옴");
		return userDao.idchk(vo);
	}
	@Override
	public int emailchk(AccountVO vo) {
		System.out.println("email 찾는 서비스 옴");
		return userDao.emailchk(vo);
	}

	@Override
	public AccountVO joinCfm(AccountVO vo) {
		System.out.println("가입완료 서비스옴");
		return userDao.joinCfm(vo);
	}
    // PW 변경
    @Override
    public void updatePw(AccountVO vo) {
        System.out.println("pw변경 서비스옴");
        userDao.updatePw(vo);
    }
	@Override
	public PersonVO getPerson(int mno) {
		return userDao.getPerson(mno);
	}
	@Override
	public BusinessVO getBusiness(BusinessVO vo) {
		return userDao.getBusiness(vo);
	}
	@Override
	public List<LaundryVO> getLaundryList(int bno) {
		return userDao.getLaundry(bno);
	}
	@Override
	public void deleteUser(BusinessVO vo) {
		// TODO Auto-generated method stub
		
	}


}
