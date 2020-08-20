<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/resources/css/myPoint.css" />
</head>
<body>
<aside class="side-nav" id="show-side-navigation1">
  <i class="fa fa-bars close-aside hidden-sm hidden-md hidden-lg" data-close="show-side-navigation1"></i>
  <div class="heading">
    <img src="https://uniim1.shutterfly.com/ng/services/mediarender/THISLIFE/021036514417/media/23148907008/medium/1501685726/enhance" alt="">
    <div class="info">
      <h3><a href="#">Mostafa Omar</a></h3>
      <p>Lorem ipsum dolor sit amet consectetur.</p>
    </div>
  </div>
  <div class="search">
    <input type="text" placeholder="Type here"><i class="fa fa-search"></i>
  </div>
  <ul class="categories">
    <li><i class="fa fa-home fa-fw"></i><a href="#">회원정보</a>
      <ul class="side-nav-dropdown">
        <li><a href="#">내 회원정보</a></li>
        <li><a href="#">포인트&코인 관리</a></li>
        <li><a href="#">내가 쓴 글 조회</a></li>
      </ul>
    </li>
    <li><i class="fa fa-support fa-fw"></i><a href="#">운동관리</a>
      <ul class="side-nav-dropdown">
        <li><a href="#">내 목표설정</a></li>
        <li><a href="#">내 운동관리</a></li>
      </ul>
    </li>
    <li><i class="fa fa-envelope fa-fw"></i><a href="#">구매내역</a>
      <ul class="side-nav-dropdown">
        <li><a href="#">주문내역 조회</a></li>
      </ul>
    </li>
  </ul>
</aside>



<!-- HEADER -->
<div style="padding-left:300; padding-bottom:20; padding-top:20;">
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
<div class="cal-wrapper" style="margin-left:100;">
		<div class="cal-inner">
				<div class="cal-content">
						<h1 class="cal-h1">현재 Point : 5000 Point</h1>
						<p class="cal-p">-포인트는 50,000 point 이상일 경우에만 현금으로 전환이 가능합니다.</p>
						<p class="cal-p">-포인트를 현금으로 전환시 전환 point의 90%가 현금으로 전환됩니다. 10%는 환급수수료입니다.</p>
						<div class="margin-top">
								<div class="pull-left text-large col-md-6 padding-left-0">
										<form>
												<input  type="number" value="5000" id="width" readonly>
<!-- 												<input id="width" type="number" maxlength="5" placeholder="Width" class="form-control pull-left"> -->
												<span class="pull-left larger-text">-&nbsp;</span>
												<input id="height" type="number" maxlength="5" placeholder="전환할 point입력" class="form-control pull-left">
												<input id="btn" type="submit" value="전환하기" class="btn btn-primary">
										</form>
								</div>
								<div id="calculation" class="col-md-6 larger-text"></div>
						</div>
						<br>
						<br>
						
						<!-- 현재코인 보여주는 부분  -->
						<h1 class="cal-h1">현재 Coin : 5000 coin</h1>
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
				e.preventDefault();
				output = ((Math.round(w.value) - Math.round(h.value)) ).toFixed(2);
				if (output > 0) {
						ans.innerHTML = "잔여 point: " + output.replace(".00", "") +" " + "Point";
				} else {
						ans.innerHTML = "Invalid calcuration";
				}
		});
}();	
	
	

</script>
</body>
</html>