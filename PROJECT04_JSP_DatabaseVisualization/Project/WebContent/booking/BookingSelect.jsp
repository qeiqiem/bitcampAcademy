<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="spms.vo.Member"%>
<%
	Member loginAc = (Member) session.getAttribute("loginAc");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="../board/css/booksel.css">
<title>리스트보기</title>
</head>
<body>
	<jsp:include page="/Sidebar.jsp" />
	<div id="wrap">

		<div id="conWrap">
			<div id="titleWrap" class="clearfix">
				글번호 ${booking.bno}
				<div id="header">
					<p>${booking.header}</p>
					<h1>${booking.min_nop}/${booking.nop}</h1>
				</div>
				<h1>${booking.title}</h1>
				<p>조회수 ${booking.mark}</p>
				<span>작성일자 ${booking.cre_date}</span>
				<div id="right">
					<div id="profile">
						<span><i class="far fa-user"></i></span><a href="">${booking.nname}
							no.${booking.mno}</a>
					</div>
				</div>
			</div>
			<div id="context">
				<i class="far fa-calendar-alt"></i> 예약설정 : ${booking.rdate} <i
					class="fas fa-map-marker-alt"></i> 위치 : ${booking.loc}
				<p>내용</p>
				${booking.content}
			</div>
			<button type="button" class="btn btn-outline-secondary" value="수정"
				onclick='location.href="allUpdate.do?bno=${booking.bno}&isUpdate=0"'>수정하기</button>
			<button type="button" class="btn btn-outline-secondary" value="삭제"
				onclick='location.href="delete.do?bno=${booking.bno}"'>삭제하기</button>
			<div id="textWrap">
				<p>Comment</p>
				<c:forEach var="comm" items="${comms}">
					<ul>
						<li><i class="fas fa-user"></i>${comm.nname}</li>
						<li class="commtext">${comm.content}</li>
						<li style="color: rgb(156, 156, 156);" class="commtext">${comm.createdDate}</li>
					</ul>
				</c:forEach>
				<form class="box_textarea" action="/comm/add.do" method="post">
					<input type="hidden" name="table" value="booking"> <input
						type="hidden" id="bno" name="bno" value="${booking.bno}" /> <input
						type="hidden" id="cno" name="cno" value="${booking.mno}" /> <input
						type="hidden" name="nname" value='<%=loginAc.getNname()%>'>
					<textarea name="content"
						placeholder="댓글 작성 시 타인에 대한 배려와 책임을 담아주세요." maxlength="600">
                    </textarea>
					<div id="inputWrap">
						<input type="submit" value="등록"></input>
					</div>
				</form>
			</div>
			<div id="joinWrap">
				<div id="btnWrap">
					<button id="testBtn" class="btn" type="submit" value="참여하기"
						onclick="">참여하기</button>
				</div>
			</div>
		</div>
	</div>




	<div class="modal fade" id="testModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close"></button>
					<h3 class="modal-title" id="exampleModalLabel">참가하기</h3>
				</div>
				<div class="modal-body">일정에 참여하시겠습니까?</div>
				<div class="modal-footer">
					<a class="btn yes" id="modalY"
						href="joinBook.do?bno=${booking.bno}&nop=${booking.nop}&min_nop=${booking.min_nop}">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#testBtn').click(function(e){
			e.preventDefault();
			$('#testModal').modal("show");
			joinboo();
		});
		$('.yes').click(function(e){
			if(${booking.nop} <= ${booking.min_nop}){
				alert("정원이 초과되었습니다.")
			}else {
				alert("참여하셨습니다.")
			}
		});
  </script>
</body>
</html>