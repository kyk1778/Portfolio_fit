<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
 <%@ include file="../header.jsp"%>  
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!-- my css -->
<link rel="stylesheet" href="../resources/css/style3.css">    
<!DOCTYPE html>
<html>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" 
integrity="sha512-bnIvzh6FU75ZKxp0GXLH9bewza/OIw6dLVh9ICg0gogclmYGguQJWl8U30WpbsGTqbIiAwxTsbe76DErLq5EDQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<head>
<meta charset="UTF-8">
<title>${pageInfo.fTitle} : 푸드스토리</title>
</head>
<body>
	<div id="wrap" align="center">
    <br>
		<h1>&nbsp;${pageInfo.fBno}</h1>
		<table>
			<tr>
			<th colspan="3">${pageInfo.fTitle}</th>
			</tr>
			<tr>
				<td style="border-bottom: #111111 solid 1px;
	padding: 5px 5px 25px;">${pageInfo.fReg} &nbsp; 조회수 ${pageInfo.fHit} &nbsp; 작성자 ${pageInfo.fWrt}</td>
			</tr>
			<tr>
				<td colspan="3" style="border-bottom: #333333 solid 1px;
					padding: 35px 5px 25px;"><pre>${pageInfo.fContent}</pre></td>
			</tr>
		</table>
		<br><br>
    <div class="modify-button_wrap">
				<a class="modify-button" id="modify_btn">수정</a> &nbsp; &nbsp;
				<a class="modify-button" id="delete_btn">삭제</a> &nbsp; &nbsp;
				<a class="modify-button" id="list_btn">목록 페이지</a>
    </div>
	  <form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="fBno" name="fBno" value='<c:out value="${pageInfo.fBno}"/>'>
	  </form>
	</div>

<script>
	let form = $("#infoForm");
	
	$("#list_btn").on("click", function(e){
		form.find("#fBno").remove();
		form.attr("action", "/board/foodStoryList");
		form.submit();
	});
	
	$("#modify_btn").on("click", function(e){
		form.attr("action", "/board/fsMod");
		form.submit();
	});	
	
	$("#delete_btn").on("click", function(e){
		form.attr("action", "/board/deleteF");
		form.attr("method", "post");
		form.submit();
	});
</script>
</body>
</html>