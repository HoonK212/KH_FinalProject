<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<link href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css" rel="stylesheet">
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
<header class="container" >
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
                                    <input  type="number" value="${point}" id="width" readonly style="border:1px solid  #00ff00;">
<!--                                     <input id="width" type="number" maxlength="5" placeholder="Width" class="form-control pull-left"> -->
                                    <span class="pull-left larger-text">-&nbsp;</span>
                                    <input id="height" type="number" maxlength="5" placeholder="전환할 point입력" class="form-control pull-left" style="border:1px solid  #00ff00;">
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