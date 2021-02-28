package com.kkaekkt.view.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kkaekkt.bit.user.PersonVO;
import com.kkaekkt.bit.user.UserService;

@Controller
public class JoinController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String Join(PersonVO vo) {
		userService.insertUser(vo);		
		return "Join.html";
	}
}
