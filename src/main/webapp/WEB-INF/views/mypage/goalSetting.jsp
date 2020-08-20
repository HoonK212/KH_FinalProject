<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/resources/css/goalSetting.css" />

</head>
<body style="padding-top:20;">

<!--header  -->
<div style="padding-left:270; padding-bottom:20; padding-top:14">
<header class="container">
    <h1 style="color:black;">목표설정</h1>
    <ul class="breadcrumb" style="padding-top:14;">
      <li>마이페이지</li>
      <li>목표설정</li>
    </ul>
</header>
</div> 



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

<!-- 이미지 -->

<!--  <h2 style="margin-left:600;" >css Portfolio Gallery</h2>-->
<input type="radio" id="select-all" name="button">
  <label for="select-all" class="label-all" style="margin-left:586;">
    All
  </label>
<input type="radio" id="select-animals" name="button" class="image-input">
  <label for="select-animals" class="label-animals">
    전신운동
  </label>
<input type="radio" id="select-lightning" name="button"  class="image-input">
  <label for="select-lightning" class="label-lightning">
    하체운동
  </label>
<input type="radio" id="select-desert" name="button"  class="image-input">
  <label for="select-desert" class="label-desert">
    상체운동
  </label>

<ul class="gallery" style="padding-left:600; padding-top:10">
  <li class="animals-item">
   <!--  <img src="resources/upload/Crunch.png" style="width:200"  class="open_button"  id="modBtn" class="modal-btn"/> -->
    <img src="<%=request.getContextPath() %>/resources/image/Plank.jpg" style="width:200"   id="modBtn" class="modal-btn"/>
  </li>
  <li class="desert-item">
    <img src="<%=request.getContextPath() %>/resources/image/Jumping-Jack.jpg"  style="width:200"  />
  </li>
  <li class="lightning-item">
    <img src="<%=request.getContextPath() %>/resources/image/Burpee(1).png"  style="width:200"  />
  </li>
  <li class="desert-item">
    <img src="<%=request.getContextPath() %>/resources/image/Leg-Raise.png"style="width:200"  />
  </li>
  <li class="animals-item">
    <img src="<%=request.getContextPath() %>/resources/image/Crunch.png" style="width:200" />
  </li>
  <li class="desert-item">
    <img src="<%=request.getContextPath() %>/resources/image/Push-Up.png"  style="width:200"  />
  </li>
  <li class="lightning-item">
    <img src="<%=request.getContextPath() %>/resources/image/Jumping-Squat.png" style="width:200" />
  </li>
  <li class="animals-item">
    <img src="<%=request.getContextPath() %>/resources/image/Squat.png" style="width:200"   />
  </li>
  <li class="lightning-item">
    <img src="<%=request.getContextPath() %>/resources/image/Lunge.jpg"  style="width:200"  onclick="document.getElementById('myModal').showModal()"/>
  </li>
</ul>

<!-- 다중선택 추가 -->
<!-- 새로운  멀티  -->
 <dl class="dropdown2" style="margin-left:260;">
  <dt>
    <a href="#" class="a2" style="width:302;">
      <span class="hida2">운동선택</span>    
      <p class="multiSel2"></p>  
    </a>
    </dt>
  
    <dd>
        <div class="mutliSelect2">
            <ul>
                <li>
                    <input type="checkbox" value="Apple" />Apple</li>
                <li>
                    <input type="checkbox" value="Blackberry" />Blackberry</li>
                <li>
                    <input type="checkbox" value="HTC" />HTC</li>
                <li>
                    <input type="checkbox" value="Sony Ericson" />Sony Ericson</li>
                <li>
                    <input type="checkbox" value="Motorola" />Motorola</li>
                <li>
                    <input type="checkbox" value="Nokia" />Nokia</li>
            </ul>
        </div>
    </dd>
  <button class="multi-button">선택</button> 
  
 </dl>
  

<!--다중선택  -->

<dl class="dropdown" style="margin-left:260;"> 
  
    <dt>
    <a href="#" style="width:302;">
      <span class="hida">요일선택</span>    
      <p class="multiSel"></p>  
    </a>
    </dt>
  
    <dd>
        <div class="mutliSelect">
            <ul>
                <li>
                    <input type="checkbox" value="JAVA" />JAVA</li>
                <li>
                    <input type="checkbox" value="HTML" />HTML</li>
                <li>
                    <input type="checkbox" value="CSS" />CSS</li>
                <li>
                    <input type="checkbox" value="SERVLET" />SERVLET </li>
                <li>
                    <input type="checkbox" value="JSP" />JSP</li>
                <li>
                    <input type="checkbox" value="SPRING" />SPRING</li>
            </ul>
        </div>
    </dd>
  <button class="multi-button">선택</button>
</dl>


<!--단계선텍  -->

<dl class="dropdown3" style="margin-left:260;"> 
  
    <dt>
    <a href="#" style="width:302;" class="a3">
      <span class="hida3">단계선택</span>    
      <p class="multiSel3"></p>  
    </a>
    </dt>
  
    <dd>
        <div class="mutliSelect3">
            <ul>
                <li>
                    <input type="checkbox" value="LEVEL-1" />1단계</li>
                <li>
                    <input type="checkbox" value="LEVEL-2" />2단계</li>
                <li>
                    <input type="checkbox" value="LEVEL-3" />3단계</li>
                <li>
                    <input type="checkbox" value="SERVLET" />왕초보</li>
                <li>
                    <input type="checkbox" value="JSP" />JSP</li>
                <li>
                    <input type="checkbox" value="SPRING" />SPRING</li>
            </ul>
        </div>
    </dd>
  <button class="multi-button">선택</button>
</dl>


<!-- 모달------------- -->
 
  
  


<!-- Modal -->
<div id="modal" class="modal">
  <!-- Modal Content -->
  <div class="modal-content">
    <!-- Modal Header -->
    <div class="modal-header">
      <h3 class="header-title">Lunge</h3>
      <div class="close fa fa-close">x</div>    
    </div>
    <!-- Modal Body -->
    <div class="modal-body">
      <h3>Hello</h3>
      <p>가치를 영원히 것은 그들은 것이다.보라, 것이다. 그들의 우리 속에서 커다란 옷을 인생에 청춘의 힘있다. 
      	가치를 꽃 피는 황금시대다. 이상 두손을 보이는 인간이 얼음에 꽃이 심장은 것은 것이다. 
      	열락의 인간이 그들은 그림자는 위하여 청춘의 구하기 바이며, 이 사막이다. 두기 그들의 군영과 못하다 청춘의 얼음 용감하고 힘차게 것이다. 
      	이 피에 무엇을 보라. 힘차게 얼음 일월과 이상은 과실이 불어 얼마나 찬미를 그들을 칼이다. 그림자는 뜨고, 과실이 두기 오직 끝까지 끓는다. 원대하고, 찬미를 노년에게서 꽃 청춘 그러므로 피다. 과실이 얼마나 청춘에서만 이상의 그들의 기쁘며, 더운지라 놀이 부패뿐이다.</p>
    </div>
    <div class="modal-footer">
      <h3>Lunge</h3>
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
	
	
	/* 다중선택 */
  $(".dropdown dt a").on('click', function() {
  $(".dropdown dd ul").slideToggle('fast');
});

$(".dropdown dd ul li a").on('click', function() {
  $(".dropdown dd ul").hide();
});

function getSelectedValue(id) {
  return $("#" + id).find("dt a span.value").html();
}

$(document).bind('click', function(e) {
  var $clicked = $(e.target);
  if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
});

$('.mutliSelect input[type="checkbox"]').on('click', function() {

  var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
    title = $(this).val() + ",";

  if ($(this).is(':checked')) {
    var html = '<span title="' + title + '">' + title + '</span>';
    $('.multiSel').append(html);
    $(".hida").hide();
  } else {
    $('span[title="' + title + '"]').remove();
    var ret = $(".hida");
    $('.dropdown dt a').append(ret);

  }
});	
	
	/*다중선택 2*/
		$(".dropdown2 dt a").on('click', function() {
		  $(".dropdown2 dd ul").slideToggle('fast');
		});

		$(".dropdown2 dd ul li a").on('click', function() {
		  $(".dropdown2 dd ul").hide();
		});

		function getSelectedValue(id) {
		  return $("#" + id).find("dt a span.value").html();
		}

		$(document).bind('click', function(e) {
		  var $clicked = $(e.target);
		  if (!$clicked.parents().hasClass("dropdown2")) $(".dropdown2 dd ul").hide();
		});

		$('.mutliSelect2 input[type="checkbox"]').on('click', function() {

		  var title = $(this).closest('.mutliSelect2').find('input[type="checkbox"]').val(),
		    title = $(this).val() + ",";

		  if ($(this).is(':checked')) {
		    var html = '<span title="' + title + '">' + title + '</span>';
		    $('.multiSel2').append(html);
		    $(".hida2").hide();
		  } else {
		    $('span[title="' + title + '"]').remove();
		    var ret = $(".hida2");
		    $('.dropdown2 dt a').append(ret);

		  }
		});	
		
	/*단계선택*/	
	
	$(".dropdown3 dt a").on('click', function() {
		  $(".dropdown3 dd ul").slideToggle('fast');
		});

		$(".dropdown3 dd ul li a").on('click', function() {
		  $(".dropdown3 dd ul").hide();
		});

		function getSelectedValue(id) {
		  return $("#" + id).find("dt a span.value").html();
		}

		$(document).bind('click', function(e) {
		  var $clicked = $(e.target);
		  if (!$clicked.parents().hasClass("dropdown3")) $(".dropdown3 dd ul").hide();
		});

		$('.mutliSelect3 input[type="checkbox"]').on('click', function() {

		  var title = $(this).closest('.mutliSelect3').find('input[type="checkbox"]').val(),
		    title = $(this).val() ;

		  if ($(this).is(':checked')) {
		    var html = '<span title="' + title + '">' + title + '</span>';
		    $('.multiSel3').append(html);
		    $(".hida3").hide();
		  } else {
		    $('span[title="' + title + '"]').remove();
		    var ret = $(".hida3");
		    $('.dropdown3 dt a').append(ret);

		  }
		});	
		
		
		/* 모달 */
		
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