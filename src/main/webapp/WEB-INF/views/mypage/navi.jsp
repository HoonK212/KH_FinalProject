<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<aside class="side-nav" id="show-side-navigation1">
  <i class="fa fa-bars close-aside hidden-sm hidden-md hidden-lg" data-close="show-side-navigation1"></i>
  <div class="heading">
    <img src="<%=request.getContextPath()%>/resources/upload_user/${pic.renamed }.${pic.ext}" >
    <div class="info">
      <h3><a href="<%=request.getContextPath()%>/mypage/mymain">${user.name }</a></h3>
      <p>${user.mail }</p>
    </div>
  </div>

  <ul class="categories">
    <li><i class="fa fa-home fa-fw"></i>회원정보
      <ul class="side-nav-dropdown">
        <li><a href="#">내 회원정보</a></li>
        <li><a href="#">포인트&코인 관리</a></li>
        <li><a href="#">내가 쓴 글 조회</a></li>
      </ul>
    </li>
    <li><i class="fa fa-support fa-fw"></i>운동관리
      <ul class="side-nav-dropdown">
        <li><a href="<%=request.getContextPath()%>/mypage/goalsetting">내 목표설정</a></li>
        <li><a href="<%=request.getContextPath()%>/mypage/mymain">내 운동관리</a></li>
      </ul>
    </li>
    <li><i class="fa fa-envelope fa-fw"></i>구매내역
      <ul class="side-nav-dropdown">
        <li><a href="<%=request.getContextPath()%>/mypage/orderlist">내 구매내역</a></li>
      </ul>
    </li>
  </ul>
</aside>
