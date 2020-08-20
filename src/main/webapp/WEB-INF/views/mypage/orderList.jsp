<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/resources/css/orderList.css" />
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
<section id="contents">
  <nav class="navbar navbar-default">
    <div class="container-fluid">
    	<!-- navar-header -->
     
      <div class="collapse navbar-collapse navbar-right" id="bs-example-navbar-collapse-1"></div>
    </div>
  </nav>
</section>

<div id="app" style="padding-left:150">
<!-- Header -->
  <header class="container">
    <h1>구매목록</h1>
    <ul class="breadcrumb">
      <li>마이페이지</li>
      <li>구매목록</li>
    </ul>
    <span class="count">{{ itemCount }} items in the bag</span>
  </header>
  <!-- End Header -->

  <!-- Product List -->
  <section class="container">
    <div v-if="products.length > 0">
      <ul class="products">
      <li class="row" v-for="(product, index) in products" style="width:70%; margin-left:160;">
        <div class="col left">
          <div class="thumbnail">
            <a href="#">
              <img src="<%=request.getContextPath() %>/resources/image/Plank.jpg" alt="product.name" />
            </a>
          </div>
          <div class="detail">
            <div class="name"><a href="#">product.name</a></div>
            <div class="description">product.date</div>
            <div class="price">product.price won</div>
          </div>
        </div>

        <div class="col right">
          <div class="quantity">
            <input type="number" class="quantity" step="1" value="1" @input="updateQuantity(index, $event)" @blur="checkQuantity(index, $event)" readonly />
          </div>
          
          <div class="remove">
          	<span style="line-height:4;">배송중</span>
          </div>
          </div>
          	
          	<!--버튼  -->
    		<div class="button raised green" style="width:10%; margin-left:115;">
			     <!--  <div class="center" fit id="modBtn" class="modal-btn">OK</div> -->
			      <div  fit id="modBtn" class="modal-btn">OK</div>
			      <paper-ripple fit></paper-ripple>
    		</div>
          	
          	
      </li>
    </ul>
    </div>
    <div v-else class="empty-product">
      <h3 style="padding:30;">There are products in your cart.</h3>
      <button>Shopping now</button>
    </div>
  </section>
  <!-- End Product List -->
  
  <!-- Summary -->
  <section class="container" v-if="products.length > 0">
    <div class="summary">
    <!--   <ul>
        <li><span>subTotal  currencyFormatted</span></li>
      </ul> -->
      <!-- <span>Total  currencyFormatted</span> -->
      Total  currencyFormatted
    </div>

    <div class="checkout">
      <button type="button">Check Out</button>
    </div>
  </section>
  <!-- End Summary -->
</div>


<!-- 모달 -->
<!-- Modal -->
<div id="modal" class="modal">
  <!-- Modal Content -->
  <div class="modal-content">
    <!-- Modal Header -->
    <div class="modal-header">
      <h3 class="header-title">Modal Header</h3>
      <div class="close fa fa-close">x</div>    
    </div>
    <!-- Modal Body -->
    <div class="modal-body">
      <h3>Hello</h3>
      <p>I'm the modal! do you see me?! Did you notice my width?</p>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus voluptatem amet voluptatum fuga temporibus.</p>
      <ul>
        <li>Phosfluorescently fashion ubiquitous schemas through.</li>
        <li>Rapidiously empower premier initiatives whereas.</li>
        <li>Credibly disintermediate economically sound.</li>
        <li>Efficiently grow prospective bandwidth.</li>
      </ul>
      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odit natus nemo et magni soluta voluptatibus quas quasi pariatur necessitatibus, totam, officia id at praesentium fuga molestias numquam ullam iure accusamus.</p>
    </div>
    <div class="modal-footer">
      <h3>Modal Footer</h3>
    </div>
  </div>
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
	
	
	
	//모달
		$(function() {
		  
		  // Vars
		  var modBtn  = $('#modBtn'),
		      modal   = $('#modal'),
		      close   = modal.find('.close'),
		      modContent = modal.find('.modal-content');
		  
		  // open modal when click on open modal button 
		  modBtn.on('click', function() {
		    modal.css('display', 'block');
		    modContent.removeClass('modal-animated-out').addClass('modal-animated-in');
		  });
		  
		  // close modal when click on close button or somewhere out the modal content 
		  $(document).on('click', function(e) {
		    var target = $(e.target);
		    if(target.is(modal) || target.is(close)) {
		      modContent.removeClass('modal-animated-in').addClass('modal-animated-out').delay(300).queue(function(next) {
		        modal.css('display', 'none');
		        next();
		      });
		    }
		  });
		  
		});	
	
	
	
	
	
</script>
</body>
</html>