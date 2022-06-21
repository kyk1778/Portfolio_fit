
package com.fit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fit.mapper.MemberMapper;
import com.fit.model.MemberVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper membermapper;

	
	/* 회원가입 */
	@Override
	public void memberJoin(MemberVO member) throws Exception {
		
		membermapper.memberJoin(member);
		
	}
	
	/*아이디 중복체크 */
	@Override
	public int idCheck(String userId) throws Exception {
		
		return membermapper.idCheck(userId);
	}
	
	/* 비밀번호 확인*/
	@Override
	public int passCheck(String userPass) throws Exception {
		
		return membermapper.passCheck(userPass);
	}
	
	
	
	
	/*로그인 */
	@Override
	public MemberVO memberLogin(MemberVO member) throws Exception {
		return membermapper.memberLogin(member);
	}
	
	
	/*회원정보 수정*/
	@Override
	public void memberUpdate(MemberVO member) {
		membermapper.memberUpdate(member);
	}
	
	
	/*회원 탈퇴*/
	@Override
	public void memberDelete(MemberVO member) {
		membermapper.memberDelete(member);
	}
	
	

	
}