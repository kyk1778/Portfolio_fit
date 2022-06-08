<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!-- my css -->
<link rel="stylesheet" href="../resources/css/regstyle.css">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" 
integrity="sha512-bnIvzh6FU75ZKxp0GXLH9bewza/OIw6dLVh9ICg0gogclmYGguQJWl8U30WpbsGTqbIiAwxTsbe76DErLq5EDQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
</head>
<body>

<h1>수정 페이지</h1>
<br><br><br><br>
<form id="modifyForm" action ="/board/foodMod" method="post">
	<div class="input_wrap" align=center>
	
	<br><br>
		<label>제목</label>
		 <br><br>
		<input name="fTitle" style="width: 550px, height: 20px;"  value='<c:out value="${pageInfo.fTitle}"/>' >
	</div>
	<br><br>
	 <div class="input_wrap" align=center>
		<label>작성자</label>
    <br><br>
		<input name="aId" style="height: 20px;">
		</div>
 	 <br><br>
		
	<div class="input_wrap" align=center>
		
		<textarea rows="30" cols="100" name="fContent" ><c:out value="${pageInfo.fContent}"/></textarea>
	</div>
	  <br><br><br>
<div class="btn_wrap" align=center>
		<button class="btn" id="modify_btn">수정</button>
		
	</div>
	</form>
	
	
	<form id="infoForm" action="/board/foodMdo" method="get">
		<input type="hidden" id="fBno" name="fBno" value='<c:out value="${pageInfo.fBno}"/>'>
	
</form>




<script>
	let form = $("#infoForm");
	let mForm = $("#modifyForm")
	
	$("#list_btn").on("click", function(e){
		form.find("#fBno").remove();
		form.attr("action", "/board/foodList");
		form.submit();
	});
	
	
	//수정하기
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/foodMod");
		mForm.submit();
	});	
	

</script>	
</body>
</html>