<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- navigation section -->
<section class="navbar navbar-fixed-top custom-navbar top-nav-collapse" role="navigation">
	<div class="container">
		<div class="navbar-header">
			<button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
				<span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
				<span class="icon icon-bar"></span>
			</button>
			<a href="${pageContext.request.contextPath}/" class="navbar-brand">Team. 햇병아리</a>
		</div>
		<div class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">

				
				
			<c:if test= "${null eq teacherId}"> <!-- teacherId값이 null 이라면 --> <!-- 모달 영역 밖 클릭 시 닫힘 방지 //data-backdrop="static" -->
				<li><a href="#" data-toggle="modal" data-target="#signIn" class="smoothScroll">로그인</a></li>
				<li><a href="${pageContext.request.contextPath}/Add" class="smoothScroll">회원가입</a></li>
			</c:if>

			<c:if test="${null ne teacherId}"> <!-- teacherId값이 null이 아니라면 -->
			<li><a href="${pageContext.request.contextPath}/calendarTest" class="smoothScroll">캘린더</a></li>
				<li><a href="${pageContext.request.contextPath}/educationProject" class="smoothScroll">계획안</a></li>
				<li><a href="${pageContext.request.contextPath}/ChildList" class="smoothScroll">유아</a></li>
				<li><a href="${pageContext.request.contextPath}/Equipment" class="smoothScroll">비품</a></li>
				<li><a href="${pageContext.request.contextPath}/kyo" class="smoothScroll">교원</a></li>
				<li><a href="${pageContext.request.contextPath}/Material" class="smoothScroll">자료실</a></li>
				<li><a href="#" data-toggle="modal" data-target="#signOut" class="smoothScroll">로그아웃</a></li>
			</c:if>

			</ul>
		</div>
	</div>
</section>

<body>

<!-- ★★★★★ 로그인 모달 시작★★★★★ -->
<c:import url="/WEB-INF/views/Teacher/modal/login.jsp"></c:import>
<!-- ★★★★★로그아웃 모달 시작★★★★★ -->
<c:import url="/WEB-INF/views/Teacher/modal/logout.jsp"></c:import>

</body>