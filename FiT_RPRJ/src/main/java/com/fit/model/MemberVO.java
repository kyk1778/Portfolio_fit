package com.fit.model;
import java.sql.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class MemberVO {
	

	//회원 이름
	private String userName;
	
	//회원 아이디
	private String userId;
	
	//회원 비밀번호
	private String userPass;
	
	//회원 우편번호
	private String address1;
	
	//회원 기본주소
	private String address2;
	
	//회원 이메일
	private String userMail;
	
	//회원 가입일
	private Date regDate;
	
	//회원 넘버
	private int mNum;

}

