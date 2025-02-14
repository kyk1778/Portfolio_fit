<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
	<title>회원가입 페이지</title>
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
		<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
		<link rel='stylesheet' href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'><link rel="stylesheet" href="../resources/css/style2.css">
	<style>
		body{
		font-family: 'Gowun Dodum', sans-serif;
		}
	</style>
</head>
<body>
<!-- partial:index.partial.html -->
<a href="https://front.codes/" class="logo" target="_blank"></a>
	<div class="section">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">			
						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<form id ="login_form" method="post" onsubmit="return finalCheck();" action= "/member/joinForm">
											<div class="section text-center">
												<h4 class="mb-4 pb-3">회원가입</h4>
													<div class="name_wrap">
														<input type="text" class="form-style" name="userName" placeholder="이름" id="name" autocomplete="off">
														<i class="input-icon uil uil-user"></i>
													</div>	
														<br>
													<div class="id_wrap">
														<input type="text" class="form-style" name="userId" placeholder="아이디" id="id" autocomplete="off">
														<i class="input-icon uil uil-user-circle"></i>
													</div>	
														<input type="button" id="idCk_button" class="btn mt-4" value="중복검사">
														<br><br>
													<div class="pw_wrap">
														<input class="form-style" type="password" name="userPass" placeholder="비밀번호" id="pw" autocomplete="off">
														<i class="input-icon uil uil-lock-alt"></i>
													</div>
														<br>
													<div class="pwck_wrap">
														<input type="password" class="form-style" placeholder="비밀번호 확인" id="pwc" autocomplete="off">
														<i class="input-icon uil uil-lock-alt"></i>
													</div>
														<br>
													<div class="address_wrap">
														<div class="form-group">
															<input class="form-style" placeholder="우편번호" name="address1"  type="text" readonly="readonly" autocomplete="off">
															<i class="input-icon uil uil-envelope"></i>
														</div>
													<button type="button" class="btn mt-4" onclick="execPostCode();"><i class="add-search"></i>우편번호 찾기</button>
															<br><br>
														<div class="form-group">
															<input class="form-style" placeholder="도로명주소" name="address2" type="text"  readonly="readonly" autocomplete="off">
															<i class="input-icon uil uil-home"></i>
														</div>
															<br>
			                                            <div class="form-group">
															<input type="text" name="address3" class="form-style" placeholder="상세주소" id="logaddressdet" autocomplete="off">
															<i class="input-icon uil uil-house-user"></i>
														</div>
															<br>
													</div>
													<div class="usermail_wrap">
														<input class="form-style" type=email name="userMail" placeholder="이메일" id="mail" autocomplete="off">
														<i class="input-icon uil uil-at"></i>
													</div>
														<input type="submit" class="btn mt-4" id="j_button" value="회원가입" />
						      				</div>
					      				</form>
			      					</div>
			      			  	</div>
			      			</div>
			      		</div>
			      	</div>
			   </div>
			</div>
		</div>	
    </div>
<br><br><br><br>
	
<!-- partial -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" 
integrity="sha512-bnIvzh6FU75ZKxp0GXLH9bewza/OIw6dLVh9ICg0gogclmYGguQJWl8U30WpbsGTqbIiAwxTsbe76DErLq5EDQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>			
<script>
	function finalCheck() {
	    var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
	    var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	    var getName= RegExp(/^[가-힣]+$/);
	    var fmt = RegExp(/^\d{6}[1234]\d{6}$/); //형식 설정
	  
	    //아이디 공백 확인
	    if($("#id").val() == ""){
	      alert("아이디를 입력해주세요");
	      $("#id").focus();
	      return false;
	    }
	         
	    //아이디 유효성검사
	    if(!getCheck.test($("#id").val())){
	      alert("형식에 맞게 입력해주세요");
	      $("#id").val("");
	      $("#id").focus();
	      return false;
	    }
	    //비밀번호 공백 확인
	    if($("#pw").val() == ""){
	      alert("비밀번호를 입력해주세요");
	      $("#pw").focus();
	      return false;
	    }
	         
	    //아이디 비밀번호 같음 확인
	    if($("#id").val() == $("#pw").val()){
	      alert("아이디와 비밀번호가 같습니다");
	      $("#pw").val("");
	      $("#pw").focus();
	      return false;
	    }
	    
	    //비밀번호 유효성검사
	    if(!getCheck.test($("#pw").val())){
	      alert("형식에 맞게 입력해주세요");
	      $("#pw").val("");
	      $("#pw").focus();
	      return false;
	    }
	         
	    //비밀번호 확인란 공백 확인
	    if($("#pwc").val() == ""){
	      alert("비밀번호 확인란을 입력해주세요");
	      $("pwc").focus();
	      return false;
	    }
	         
	    //비밀번호 서로확인
	    if($("#pw").val() != $("#pwc").val()){
	        alert("비밀번호가 상이합니다");
	        $("#pw").val("");
	        $("#pwc").val("");
	        $("#pwc").focus();
	        return false;
	    }
	        
	    //이메일 공백 확인
	    if($("#mail").val() == ""){
	      alert("이메일을 입력해주세요");
	      $("#mail").focus();
	      return false;
	    }
	         
	    //이메일 유효성 검사
	    if(!getMail.test($("#mail").val())){
	      alert("이메일형식에 맞게 입력해주세요")
	      $("#mail").val("");
	      $("#mail").focus();
	      return false;
	    }
	         
	    //이름 공백 검사
	    if($("#name").val() == ""){
	      alert("이름을 입력해주세요");
	      $("#name").focus();
	      return false;
	    }
	    //이름 유효성 검사
	    if(!getName.test($("#name").val())){
	      alert("이름형식에 맞게 입력해주세요")
	      $("#name").val("");
	      $("#name").focus();
	      return false;
	    }
	}
	    
	  //아이디 중복검사
		$('#idCk_button').click(function(){
			
			//console.log("keyup 테스트");
			
		var userId = $('#id').val();
		var data = {userId : userId}
		var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
		
		if($("#id").val() == ""){
		      alert("아이디를 입력해주세요");
		      $("#id").focus();
		      return false;
		    }
		//아이디 유효성검사
	    if(!getCheck.test($("#id").val())){
	      alert("형식에 맞게 입력해주세요");
	      $("#id").val("");
	      $("#id").focus();
	      return false;
	    }
		
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success : function(result){
				/*console.log("성공 여부" + result);*/
			if(result != 'fail'){
				alert("사용가능한 아이디입니다.")
			} else {
				alert("중복된 아이디입니다.")
			}	
		
				
			}	//success 종료
			}); //ajax 종료
		});	//function 종료
	    
	    
	    
	    
	    /* 다음 주소 연동 */
		function execPostCode() {
	         new daum.Postcode({
	             oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	 
	                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	 
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	                if(fullRoadAddr !== ''){
	                    fullRoadAddr += extraRoadAddr;
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                console.log(data.zonecode);
	                console.log(fullRoadAddr);
	                
	                
	                $("[name=address1]").val(data.zonecode);
	                $("[name=address2]").val(fullRoadAddr);
	                
	                document.getElementById('address1').value = data.zonecode; //5자리 새우편번호 사용
	                document.getElementById('address2').value = fullRoadAddr;
	                document.getElementById('address3').value = data.jibunAddress; 
	            }
	         }).open();
	     }
	    
	    
 
</script>
</body>
</html>