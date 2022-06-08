<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
<!-- my css -->
<link rel="stylesheet" href="../resources/css/style.css">
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록 페이지</title>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" 
integrity="sha512-bnIvzh6FU75ZKxp0GXLH9bewza/OIw6dLVh9ICg0gogclmYGguQJWl8U30WpbsGTqbIiAwxTsbe76DErLq5EDQ==" crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
</head>
<body>

	<div id="wrap" align="center">
		<h6>공지사항</h6>
		<table class="list">
		<c:set var="paging" value="${listModel.paging}" />
		<c:if test="${paging.numberOfRecords > 0}">
		</c:if>
			<tr>
				<td colspan="5" style="border: white; text-align: right">
				<a href="/board/noticeReg"><b class="modify-button" >게시글 등록</b></a></td>
			</tr>
		
			<tr>
				<th>&nbsp;번호</th>
				<th>&nbsp;제목</th>
				<th>&nbsp;작성자</th>
				<th>&nbsp;작성일</th>
				<th>&nbsp;조회수</th>
				
			</tr>

	
		<c:forEach items="${list}" var="list">	
			<tr>
				<td><c:out value="${list.nBno}"/></td>
				<td>
					<a class="move" href='/board/notice?nBno=<c:out value="${list.nBno}"/>'>
						<c:out value="${list.nTitle}"/>
					</a>
				</td>
				<td><c:out value="${list.aId}"/></td> 
				<td><c:out value="${list.nReg}"/></td>	
				<td><c:out value="${list.nReg }"/></td>		
				<td><c:out value="${list.nHit }"/></td>		
			</tr>
		</c:forEach>
			</form>
	<c:choose>
		<c:when test="${paging.numberOfRecords == 0}">
			<tr>
				<td colspan="5">
					게시글이 없습니다.
				</td>
			</tr>
		</c:when>
		<c:otherwise>
		<c:forEach var="board" items="${listModel.boardList}">
			<tr class="record">
				<td>${board.num}</td>
				<td><a href="view.do?num=${list.num}">${list.nTitle}</a></td>
				<td>${board.name}</td>
				<td><fmt:formatDate value="${board.writeDate}" /></td>
				<td>${board.readCount}</td>
			</tr>
		</c:forEach>
		
			<tr>
				<td colspan="5" style="text-align: center">
					<c:if test="${paging.startPageNo > paging.sizeOfPage}">
						<c class="page-button" href="<c:url value="/board/notice.do?&p=${paging.prevPageNo}"/>">이전</c>
					</c:if>
					<c:forEach var="pno" begin="${paging.startPageNo}" end="${paging.endPageNo}">
						<c class="page-button" href="<c:url value="/board/notice.do?&p=${pno}" />">[${pno}]</c>
					</c:forEach>
					<c:if test="${paging.endPageNo < paging.finalPageNo}">
						<c class="page-button" href="<c:url value="/board/notice.do?&p=${paging.nextPageNo}"/>">다음</c>
					</c:if>
				</td>
			</tr>
		</c:otherwise>
	</c:choose>
		</table>
		
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
				
				
				</ul>
			</div>
		</div>
		
		<form id="moveForm" method="get">
		  <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
        <input type="hidden" name="amount" value="${pageMaker.cri.amount }">    
		</form>
	</div>
<script>

	$(document).ready(function(){
		let result = '<c:out value="${result}"/>';
		
		checkAlert(result);
		
		function checkAlert(result){
			
			if(result === ''){
				return;
				
			}
			
			if(result === "register success"){
				alert("등록 완료");
			}
			
			
			if(result === "modify success"){
				alert("수정 완료")
			}
			
			if(result === "delete success"){
				alert("삭제 완료")
			}
			
			
		}
		
	});
	
	
	/*
	
	let moveForm = $("#moveForm");
	 
    $(".move").on("click", function(e){
        e.preventDefault();
        
        moveForm.append("<input type='hidden' name='nBno' value='"+ $(this).attr("href")+ "'>");
        moveForm.attr("action", "/board/notice");
        moveForm.submit();
    });
	
*/
</script>	
</body>
</html>