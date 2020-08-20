<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/resources/css/myWritten.css" />
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
        <li><a href="#">내 구매내역</a></li>
      </ul>
    </li>
  </ul>
</aside>



<!-- HEADER -->
<div style="padding-left:300; padding-bottom:20; padding-top:20;">
<header class="container">
    <h1>내가 쓴 글</h1>
    <ul class="breadcrumb">
      <li>마이페이지</li>
      <li>내가 쓴 글</li>
    </ul>
</header>
</div>


<span style="padding-left:400;">게시글 | 댓글</span>
<div class="my-table" style="width:90%; padding-left:400;">
<table class="table table-action">
  
  <thead>
    <tr>
      <th class="t-small"><input type="checkbox"></th>
      <th class="t-small">번호</th>
      <th class="t-medium">제목</th>
      <th>작성일</th>
      <th class="t-medium">조회</th>
    </tr>
  </thead>
  
  <tbody>
    <tr>
      <td><label><input type="checkbox"></label></td>
      <td style="width:7%; text-align:center;">1</td>
      <td style="width:40%;">27/09/2013</td>
      <td>One little text</td>
      <td class="t-status t-active">Active</td>
    </tr>
    <tr>
      <td><label><input type="checkbox"></label></td>
      <td style="text-align:center;">1</td>
      <td>27/09/2013</td>
      <td>One little text</td>
      <td class="t-status t-inactive">Inactive</td>
    </tr>
    <tr>
      <td><label><input type="checkbox"></label></td>
      <td style="text-align:center;">1</td>
      <td>27/09/2013</td>
      <td>One little text</td>
      <td class="t-status t-draft">Draft</td>
    </tr>
    <tr>
      <td><label><input type="checkbox"></label></td>
      <td style="text-align:center;">1</td>
      <td>27/09/2013</td>
      <td>One little text</td>
      <td class="t-status t-scheduled">Scheduled</td>
    </tr>
  </tbody>
</table>
</div>

<!-- delete button -->

    		<div class="button raised green" style="width:5%; margin-left:1180;">
			      <div class="center" fit>삭제</div>
			      <!-- <paper-ripple fit></paper-ripple> -->
    		</div>



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
	
	
	/* stage-select------------------- */
		button = document.querySelector('button');
	datalist = document.querySelector('datalist');
	select = document.querySelector('select');
	options = select.options;

	/* on arrow button click, show/hide the DDL*/
	button.addEventListener('click', toggle_ddl);

	function toggle_ddl() {
	  if (datalist.style.display === '') {
	    datalist.style.display = 'block';
	    this.textContent = "▲";
	    /* If input already has a value, select that option from DDL */
	    var val = input.value;
	    for (var i = 0; i < options.length; i++) {
	      if (options[i].text === val) {
	        select.selectedIndex = i;
	        break;
	      }
	    }
	  } else hide_select();
	}

	/* when user selects an option from DDL, write it to text field */
	select.addEventListener('change', fill_input);

	function fill_input() {
	  input.value = options[this.selectedIndex].value;
	  hide_select();
	}

	/* when user wants to type in text field, hide DDL */
	input = document.querySelector('input');
	input.addEventListener('focus', hide_select);

	function hide_select() {
	  datalist.style.display = '';
	  button.textContent = "▼";
	}

</script>
</body>
</html>