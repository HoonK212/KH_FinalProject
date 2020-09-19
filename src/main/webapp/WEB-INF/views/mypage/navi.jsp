<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style type="text/css">

/* Start side navigation bar  */

.side-nav {
  float: left;
  height: 100%;
  width: 290px;
  background-color: #252636;
  color: #CCC;
  -webkit-transform: translateX(0);
  -moz-transform: translateX(0);
  transform: translateX(0);
  -webkit-transition: all .3s ease-in-out;
  -moz-transition: all .3s ease-in-out;
  transition: .3s;
  position: fixed;
  top: 0;
  left: 0;
  overflow: auto;
  z-index: 9999999
}
.side-nav .close-aside {
  position: absolute;
  top: 7px;
  right: 7px;
  cursor: pointer;
  color: #EEE;
}
.side-nav .heading {
  background-color: #252636;
  padding: 15px 15px 15px 30px;
  overflow: hidden;
  border-bottom: 1px solid #2a2b3c
}
.side-nav .heading > img {
  border-radius: 50%;
  float: left;
  width: 28%;
}
.side-nav .info {
  float: left;
  width: 69%;
  margin-left: 3%;
}
.side-nav .heading .info > h3 {margin: 0 0 5px}
.side-nav .heading .info > h3 > a {
  color: #EEE;
  font-weight: 100;
  margin-top: 4px;
  display: block;
  text-decoration: none;
  font-size: 18px;
}
.side-nav .heading .info > h3 > a:hover {
  color: #FFF;
}
.side-nav .heading .info > p {
  color: #BBB;
  font-size: 13px;
}
/* End heading */
/* Start search */
.side-nav .search {
  text-align: center;
  padding: 15px 30px;
  margin: 15px 0;
  position: relative;
}
.side-nav .search > input {
  width: 100%;
  background-color: transparent;
  border: none;
  border-bottom: 1px solid #23262d;
  padding: 7px 0 7px;
  color: #DDD
}
.side-nav .search > input ~ i {
  position: absolute;
  top: 22px;
  right: 40px;
  display: block;
  color: #2b2f3a;
  font-size: 19px;
}
/* End search */

.side-nav .categories > li {
  padding: 17px 40px 17px 30px;
  overflow: hidden;
  border-bottom: 1px solid rgba(255, 255, 255, 0.02);
  cursor: pointer;
}
.side-nav .categories > li > a {
  color: #AAA;
  text-decoration: none;
}
/* Start num: there are three options primary, danger and success like Bootstrap */
.side-nav .categories > li > a > .num {
  line-height: 0;
  border-radius: 3px;
  font-size: 14px;
  color: #FFF;
  padding: 0px 5px
}
.dang {background-color: #f35959}
.prim {background-color: #0275d8}
.succ {background-color: #5cb85c}
/* End num */
.side-nav .categories > li > a:hover {
  color: #FFF
}
.side-nav .categories > li > i {
  font-size: 18px;
  margin-right: 5px
}

.side-nav .categories .opend > a:after {
  -webkit-transform: rotate(-90deg);
  -moz-transform: rotate(-90deg);
  transform: rotate(-90deg);
}
/* End categories */
/* Start dropdown menu */
.side-nav .categories .side-nav-dropdown {
  padding-top: 10px;
  padding-left: 30px;
  list-style: none;
  display: none;
}
.side-nav .categories .side-nav-dropdown > li > a {
  color: #AAA;
  text-decoration: none;
  padding: 7px 0;
  display: block;
}
.side-nav .categories p {
  margin-left: 30px;
  color: #535465;
  margin-top: 10px;
}

/* End dropdown menu */

.show-side-nav {
  -webkit-transform: translateX(-290px);
  -moz-transform: translateX(-290px);
  transform: translateX(-290px);
}




.welcome {
  color: #CCC;
}
.welcome .content {
  background-color: #313348;
  padding: 15px;
  margin-top: 25px;
}
.welcome h2 {
  font-family: Calibri;
  font-weight: 100;
  margin-top: 0
}
.welcome p {
  color: #999;
}


/* Start statistics */


/* Start users */

.admins {
  margin-top: 25px;
}
.admins .box {w

}
.admins .box > h3 {
  color: #ccc;
  font-family: Calibri;
  font-weight: 300;
  margin-top: 0;
}
.admins .box .admin {
  margin-bottom: 20px;
  overflow: hidden;
  background-color: #313348;
  padding: 10px;
}
.admins .box .admin .img {
  width: 20%;
  margin-right: 5%;
  float: left;
}
.admins .box .admin .img img {
  border-radius: 50%;
}
.admins .box .info {
  width: 75%;
  color: #EEE;
  float: left;
}
.admins .box .info h3 {font-size: 19px}
.admins .box .info p {color: #BBB}

/* End users */
/* Start statis */

.statis {
  color: #EEE;
  margin-top: 15px;
}
.statis .box {
  position: relative;
  padding: 15px;
  overflow: hidden;
  border-radius: 3px;
  margin-bottom: 25px;
}
.statis .box h3:after {
  content: "";
  height: 2px;
  width: 70%;
  margin: auto;
  background-color: rgba(255, 255, 255, 0.12);
  display: block;
  margin-top: 10px;
}
.statis .box i {
  position: absolute;
  height: 70px;
  width: 70px;
  font-size: 22px;
  padding: 15px;
  top: -25px;
  left: -25px;
  background-color: rgba(255, 255, 255, 0.15);
  line-height: 60px;
  text-align: right;
  border-radius: 50%;
}



.main-color {
  color: #ffc107
}
.warning {background-color: #f0ad4e}
.danger {background-color: #d9534f}
.success {background-color: #5cb85c}
.inf {background-color: #5bc0de}

/* Start bootstrap */
.navbar-right .dropdown-menu {
  right: auto !important;
  left: 0 !important;
}
.navbar-default {
  background-color: #6f6486 !important;
  border: none !important;
  border-radius: 0 !important;
  margin: 0 !important
}
.navbar-default .navbar-nav>li>a {
  color: #EEE !important;
  line-height: 55px !important;
  padding: 0 10px !important;
}
.navbar-default .navbar-brand {color:#FFF !important}
.navbar-default .navbar-nav>li>a:focus,
.navbar-default .navbar-nav>li>a:hover {color: #EEE !important}

.navbar-default .navbar-nav>.open>a,
.navbar-default .navbar-nav>.open>a:focus,
.navbar-default .navbar-nav>.open>a:hover {background-color: transparent !important; color: #FFF !important}

.navbar-default .navbar-brand {line-height: 55px !important; padding: 0 !important}
.navbar-default .navbar-brand:focus,
.navbar-default .navbar-brand:hover {color: #FFF !important}
.navbar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {margin: 0 !important}


.navbar-default .navbar-nav>li>a {
  float: left !important;
}
.navbar-default .navbar-nav>li>a>span:not(.caret) {
  background-color: #e74c3c !important;
  border-radius: 50% !important;
  height: 25px !important;
  width: 25px !important;
  padding: 2px !important;
  font-size: 11px !important;
  position: relative !important;
  top: -10px !important;
  right: 5px !important
}
.dropdown-menu>li>a {
  padding-top: 5px !important;
  padding-right: 5px !important;
}
.navbar-default .navbar-nav>li>a>i {
  font-size: 18px !important;
}

</style>

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
        <li><a href="<%=request.getContextPath()%>/mypage/myInformation">내 회원정보</a></li>
        <li><a href="<%=request.getContextPath()%>/mypage/myPoint">포인트&코인 관리</a></li>
        <li><a href="<%=request.getContextPath()%>/mypage/myWritten">내가 쓴 글 조회</a></li>
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
