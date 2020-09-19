<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
  font-family: 'Droid Sans', sans-serif;
  outline: none;
}
::-webkit-scrollbar {
  background: transparent;
  width: 5px;
  height: 5px;
}

::-webkit-scrollbar-thumb {
  background-color: #888;
}

::-webkit-scrollbar-thumb:hover {
  background-color: rgba(0, 0, 0, 0.3);
}

/*body {background-color:#eee}*/
#contents {
  position: relative;
  transition: .3s;
  margin-left: 290px;
  background-color: #2a2b3d;
}
.margin {
  margin-left: 0 !important;
}
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
<!--이 부분이 nav에 나오는 이미지 부분인거 같은데 -->
side-nav .categories > li > a:after {
  content: "\f053";
  font-family: fontAwesome;
  font-size: 11px;
  line-height: 1.8;
  float: right;
  color: #AAA;
  -webkit-transition: all .3s ease-in-out;
  -moz-transition: all .3s ease-in-out;
  transition: all .3s ease-in-out;
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


/* End side navigation bar  */
/* Start welcome */

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
.statistics {
  margin-top: 25px;
  color: #CCC;
}
.statistics .box {
  background-color: #313348;
  padding: 15px;
  overflow: hidden;
}
.statistics .box > i {
  float: left;
  color: #FFF;
  border-radius: 50%;
  width: 60px;
  height: 60px;
  line-height: 60px;
  font-size: 22px;
}
.statistics .box .info {
  float: left;
  width: auto;
  margin-left: 10px;
}
.statistics .box .info h3 {
  margin: 5px 0 5px;
  display: inline-block;
}
.statistics .box .info p {color:#BBB}

/* End statistics */
/* Start charts */
.charts {
  margin-top: 25px;
  color: #BBB
}
.charts .chart-container {
  background-color: #313348;
  padding: 15px;
}
.charts .chart-container h3 {
  margin: 0 0 10px;
  font-size: 17px;
}

/* Start users */

.admins {
  margin-top: 25px;
}
.admins .box {

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


/* --- HEADER --- */
.breadcrumb {
  padding: 0;
  margin: 0;
  list-style-type: none;
}

header.container {
  margin-bottom: 1.5rem;
}

header .breadcrumb {
  color: #7d7d7d;
}

header .breadcrumb li {
  float: left;
  padding: 0 6px;
  height: 20px;
  line-height: 20px;
}

header .breadcrumb li:first-child {
  padding-left: 2px;
}

header .breadcrumb li:not(:last-child)::after {
  content: " \276f";
  padding-left: 8px;
}

header .count {
  float: right;
  color: #333333;
  height: 20px;
  line-height: 20px;
}


/* point전환 */
   .cal-wrapper {
         display: table;
         width: 100%;
         height: 100%;
         /* background: #dee9ff; */
   }
   
   .cal-inner {
         display: table-cell;
         vertical-align: middle;
   }
   
   .cal-content {
         max-width: 960px;
         margin: auto;
   }
   
   .cal-h1 {
         margin-bottom: 1em;
   }
   
   .cal-p {
         margin-bottom: 1em;
   }
   
   .margin-top {
         margin-top: 2em;
   }
   
   .padding-left-0 {
         padding-left: 0;
   }
   
   input[type=number] {
         width: 150px;
         margin-right: 1em;
   }
   
   .pull-left larger-text {
         display: inline-block;
         margin: -0.1em 0.5em 0 0;
   }
   
   .larger-text {
         font-size: 175%;
   }



</style>
</head>
<body>

<!-- 사이드 네비 메뉴 -->
<%@include file="/WEB-INF/views/mypage/navi.jsp" %>



<!-- HEADER -->
<div style="padding-left:300px; padding-bottom:20px; padding-top:20px;">
<header class="container">
    <h1>포인트</h1>
    <ul class="breadcrumb">
      <li>마이페이지</li>
      <li>포인트</li>
    </ul>
</header>
</div>

<hr>
<div class="section" style="height:70%;">
<!-- point 전환  -->
<div class="cal-wrapper" style="margin-left:100px;">
      <div class="cal-inner">
            <div class="cal-content">
                  <h1 class="cal-h1">현재 Point : <div id="calculation" class="col-md-6 larger-text" style="display:inline-block;">${point}</div>  Point </h1>
                  <p class="cal-p">-포인트는 50,000 point 이상일 경우에만 현금으로 전환이 가능합니다.</p>
                  <p class="cal-p">-10,000 point 미만은 현금으로 전환할 수 없습니다.</p>
                  <p class="cal-p">-포인트를 현금으로 전환시 전환 point의 90%가 현금으로 전환됩니다. 10%는 환급수수료입니다.</p>
                  <div class="margin-top">
                        <div class="pull-left text-large col-md-6 padding-left-0">
                              <form>
                                    <input  type="number" value="${point}" id="width" readonly>
<!--                                     <input id="width" type="number" maxlength="5" placeholder="Width" class="form-control pull-left"> -->
                                    <span class="pull-left larger-text">-&nbsp;</span>
                                    <input id="height" type="number" maxlength="5" placeholder="전환할 point입력" class="form-control pull-left">
                                    <!-- point가 50000점이 넘어갈 때만 현금으로 전환하도록 하난다  -->
                                    <c:if test="${point >= 50000 }">
                                    <input id="btn" type="submit" value="전환하기" class="btn btn-primary">
                                    </c:if>
                              </form>
                        </div>
                  </div>
                  <br>
                  <br>
                  
                  <!-- 현재코인 보여주는 부분  -->
                  <h1 class="cal-h1">현재 Coin :${coin} coin</h1>
                  <p class="cal-p">-코인은 이벤트를 통해 획득할 수 있습니다.</p>
                  <p class="cal-p">-코인은 현금 전환이 가능하지 않습니다.</p>
            </div>
      </div>
</div>

<!-- 코인 -->



</div>
<hr>

<script>

   $(function () {

     'use strict';

     var aside = $('.side-nav'),
         showAsideBtn = $('.show-side-btn'),
         contents = $('#contents'),
         _window = $(window)

     showAsideBtn.on("click", function () {
       $("#" + $(this).data('show')).toggleClass('show-side-nav');
       contents.toggleClass('margin');
     });

     if (_window.width() <= 767) {
       aside.addClass('show-side-nav');
     }

     _window.on('resize', function () {
       if ($(window).width() > 767) {
         aside.removeClass('show-side-nav');
       }
     });

     // dropdown menu in the side nav
     var slideNavDropdown = $('.side-nav-dropdown');

     $('.side-nav .categories li').on('click', function () {

       var $this = $(this)

       $this.toggleClass('opend').siblings().removeClass('opend');

       if ($this.hasClass('opend')) {
         $this.find('.side-nav-dropdown').slideToggle('fast');
         $this.siblings().find('.side-nav-dropdown').slideUp('fast');
       } else {
         $this.find('.side-nav-dropdown').slideUp('fast');
       }
     });

     $('.side-nav .close-aside').on('click', function () {
       $('#' + $(this).data('close')).addClass('show-side-nav');
       contents.removeClass('margin');
     });

   });
   
   //point 전환 
   
   var calcuation = function() {
      "use strict";
      var btn = document.getElementById("btn"),
            w = document.getElementById("width"),
            h = document.getElementById("height"),
            ans = document.getElementById("calculation"),
            output = "";
      
    
      btn.addEventListener("click", function(e) {
          //현금으로 전환한 값
            var subPoint = h.value;
            e.preventDefault();
            output = ((Math.round(w.value) - Math.round(h.value)) ).toFixed(2);
            if (output > 0 && subPoint > 10000) {
/*                   ans.innerHTML = "잔여 point: " + output.replace(".00", "") +" " + "Point"; */
                   ans.innerHTML = output.replace(".00", ""); 
                    
                 
                   //현금화한 point를 넘기는 메소드 
                     var xhr = new XMLHttpRequest();
                   xhr.open('POST', '<%=request.getContextPath()%>/mypage/subPoint');
                   xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                   xhr.send('subPoint='+subPoint);
                   xhr.addEventListener('load', function(){
                      var data = xhr.response; 
                      if( data == '0' ){
                         location.href='<%= request.getContextPath()%>/mypage/myPoint'
                      }else{
                         cosole,log('실패?')
                      }
                   })
                   
            } else {
                  alert('보유한 포인트보다 큰 값으로는 현금 전환이 안되며, 만 포인트 이상만 현금전환이 가능합니다');
            }
      });
}();   
   
   






</script>
</body>
</html>