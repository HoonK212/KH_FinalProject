<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="<%=request.getContextPath() %>/resources/css/myMain.css" />
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
        <li><a href="#">내 가 쓴글 조회</a></li>
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

<!-- progress -->

	 <div class="container">
      	
			<ul class="graphs stats-container centered biggie" style="padding-left:270; padding-bottom:0; padding-top:20;">
					 <li class="animated" data-provide="circular" data-fill-color="#db4dc2" data-percent="true" data-initial-value="25" data-max-value="100" data-label="Digital Copywriter"  style="width: 272px; height: 272px;"></li> 			
			         <li class="animated" data-provide="circular" data-fill-color="#db4dc2" data-percent="true" data-initial-value="30" data-max-value="100" data-label="Graduate Assistant"  style="width: 272px; height: 272px;"></li>                     
			</ul>
	</div>

	
	
<div class="wrapper">
	<!-- 목표카드 ---------------------- -->
	<div class="goal-card" style="padding-bottom:20;" >
	

<div class="note-wrapper" style="margin-left:330; float:left;">
<div class="note">
    <p class="g-ptag">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pulvinar rhoncus risus, vel ornare lacus sagittis sit amet. Duis vel sem magna. Proin pulvinar velit eleifend ligula ultrices vestibulum. Nunc posuere dolor eu mauris feugiat dignissim.</p>
    <p class="g-ptag">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pulvinar rhoncus risus, vel ornare lacus sagittis sit amet. Duis vel sem magna. Proin pulvinar velit eleifend ligula ultrices vestibulum. Nunc posuere dolor eu mauris feugiat dignissim.</p>
</div>
<div class="note blue">
    <p class="g-ptag">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pulvinar rhoncus risus, vel ornare lacus sagittis sit amet. Duis vel sem magna. Proin pulvinar velit eleifend ligula ultrices vestibulum. Nunc posuere dolor eu mauris feugiat dignissim.</p>
</div>
</div>
</div>


<!-- calendar -->

<div class="calendar" id="calendar-app" style="height:65%; float:left; margin-left:100; width:30%; ">
  <div class="calendar--day-view" id="day-view">
    <span class="day-view-exit" id="day-view-exit">&times;</span>
    <span class="day-view-date" id="day-view-date">MAY 29 2016</span>
    <div class="day-view-content">
      <div class="day-highlight">
        You <span class="day-events" id="day-events">had no events for today</span>. &nbsp; <span tabindex="0" onkeyup="if(event.keyCode != 13) return; this.click();" class="day-events-link" id="add-event" data-date>Add a new event?</span>
      </div>
      <div class="day-add-event" id="add-day-event-box" data-active="false">
        <div class="row">
          <div class="half">
            <label class="add-event-label">
               Name of event
              <input type="text" class="add-event-edit add-event-edit--long" placeholder="New event" id="input-add-event-name">
             
            </label>
          </div>
          <div class="qtr">
            <label class="add-event-label">
          Start Time
              <input type="text" class="add-event-edit" placeholder="8:15" id="input-add-event-start-time" data-options="1,2,3,4,5,6,7,8,9,10,11,12" data-format="datetime">
              <input type="text" class="add-event-edit" placeholder="am" id="input-add-event-start-ampm" data-options="a,p,am,pm">
            </label>
          </div>
          <div class="qtr">
            <label class="add-event-label">
          End Time
              <input type="text" class="add-event-edit" placeholder="9" id="input-add-event-end-time" data-options="1,2,3,4,5,6,7,8,9,10,11,12" data-format="datetime">
              <input type="text" class="add-event-edit" placeholder="am" id="input-add-event-end-ampm" data-options="a,p,am,pm">
            </label>
          </div>
          <div class="half">
            <a onkeyup="if(event.keyCode != 13) return; this.click();" tabindex="0" id="add-event-save" class="event-btn--save event-btn">save</a>
            <a tabindex="0" id="add-event-cancel" class="event-btn--cancel event-btn">cancel</a>
          </div>
        </div>
        
      </div>
      <div id="day-events-list" class="day-events-list">
        
      </div>
      <div class="day-inspiration-quote" id="inspirational-quote">
        Every child is an artist.  The problem is how to remain an artist once he grows up. –Pablo Picasso
      </div>
    </div>
  </div>
  <div class="calendar--view" id="calendar-view" >
    <div class="cview__month">
      <span class="cview__month-last" id="calendar-month-last">Apr</span>
      <span class="cview__month-current" id="calendar-month">May</span>
      <span class="cview__month-next" id="calendar-month-next">Jun</span>
    </div>
    <div class="cview__header">Sun</div>
    <div class="cview__header">Mon</div>
    <div class="cview__header">Tue</div>
    <div class="cview__header">Wed</div>
    <div class="cview__header">Thu</div>
    <div class="cview__header">Fri</div>
    <div class="cview__header">Sat</div>
    <div class="calendar--view" id="dates">
    </div>
  </div>
  <div class="footer">
    <span><span id="footer-date" class="footer__link">Today is May 30</span></span>    
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
	
	
	
	//progress
	(function(c, e, l, j) {
	    var d = function(a, b) {
	        arguments.length && this.init(a, b);
	    };
	    d.CANVAS_NAMES = [ "back", "fill", "front" ];
	    var i = d, f;
	    f = l.createElement("canvas");
	    f.getContext ? (f = f.getContext("2d"), f = (e.devicePixelRatio || 1) / (f.webkitBackingStorePixelRatio || f.mozBackingStorePixelRatio || f.msBackingStorePixelRatio || f.oBackingStorePixelRatio || f.backingStorePixelRatio || 1)) : f = 1;
	    i.PIXEL_RATIO = f;
	    i = [ "ms", "moz", "webkit", "o" ];
	    for (f = 0; f < i.length && !e.requestAnimationFrame; f++) e.requestAnimationFrame = e[i[f] + "RequestAnimationFrame"], e.cancelAnimationFrame = e[i[f] + "CancelAnimationFrame"] || e[i[f] + "CancelRequestAnimationFrame"];
	    e.requestAnimationFrame || (e.requestAnimationFrame = function(a) {
	        return e.setTimeout(function() {
	            a();
	        }, 16);
	    });
	    e.cancelAnimationFrame || (e.cancelAnimationFrame = function(a) {
	        clearTimeout(a);
	    });
	    var q = function(a) {
	        arguments.length && this.init(a);
	    };
	    q.prototype = {
	        attributes: {
	            onLoop: null,
	            afterStop: null,
	            afterStopRequest: null,
	            params: {},
	            owner: null
	        },
	        init: function(a) {
	            this.options = c.extend({}, this.attributes, a);
	            this.animationHandle = null;
	            this.loops = 0;
	            this.stopRequested = !1;
	        },
	        start: function() {
	            var a = this;
	            this.animationHandle = e.requestAnimationFrame(function() {
	                a.options.onLoop.apply(a.options.owner, [ a._getThreadInfo() ]) && a._loop();
	            });
	        },
	        _getThreadInfo: function() {
	            return {
	                loops: ++this.loops,
	                params: this.options.params,
	                stopRequested: this.stopped
	            };
	        },
	        _kill: function() {
	            this.animationHandle && e.cancelAnimationFrame(this.animationHandle);
	            c.isFunction(this.options.afterStop) && this.options.afterStop.call(this.options.owner);
	            c.isFunction(this.options.afterStopRequest) && this.options.afterStopRequest.call(this.options.owner);
	        },
	        _loop: function() {
	            var a = this;
	            this.animationHandle = e.requestAnimationFrame(function() {
	                a.options.onLoop.apply(a.options.owner, [ a._getThreadInfo() ]) ? a._loop() : a._kill();
	            });
	        },
	        stop: function(a) {
	            this.stopped = !0;
	            this.options.afterStopRequest = a;
	        }
	    };
	    d.prototype = {
	        defaults: {
	            initialValue: 0,
	            maxValue: 100,
	            label: "",

	            labelClassName: "text-label",
	            title: "",
	            
	            titleClassName: "text-title",
	            dates: "",
	            datesClassName: "text-dates",
	            
	            percent: !1,
	            decimals: 0,
	            digitClassName: "digit-label",
	            format: null,
	            duration: 4e3,
	            fillColor: "#eeeeee",
	            wrapperClassName: "circular-stat",
	            outerThickness: 8,
	            fillThickness: 10
	        },
	        init: function(a, b) {
	            this.element = c(a);
	            this.options = c.extend({}, this.defaults, b, this.element.data());
	            this.attributes = {};
	            this.labels = {};
	            this.canvases = {};
	            this.activeAnimationThread = null;
	            this._parseOptions();
	            if (this.canvases = this._build()) this._drawBackside(this.canvases.back), this._drawFrontside(this.canvases.front), this.labels = this._attachLabels(), this._updateVal(0), this.animate(this.options.initialValue, !1);
	            return this;
	        },
	        _parseOptions: function() {
	            var a = Math.max(this.element.width(), this.element.height()) / 2, b = this.options.outerThickness;
	            this.attributes = c.extend({}, this.attributes, {
	                currentValue: 0,
	                radius: {
	                    back: a,
	                    fill: a - b,
	                    front: a - b - this.options.fillThickness
	                }
	            });
	        },
	        _createCanvas: function(a, b) {
	            if (0 === a || 0 === b) return console.log("Invalid canvas dimensions"), !1;
	            var g = l.createElement("canvas");
	            g.width = a * d.PIXEL_RATIO;
	            g.height = b * d.PIXEL_RATIO;
	            1 < d.PIXEL_RATIO && (g.style.width = a + "px", g.style.height = b + "px");
	            if (!g.getContext) if ("undefined" !== typeof G_vmlCanvasManager) G_vmlCanvasManager.initElement(g); else return console.log("Your browser does not support HTML5 Canvas, or excanvas is missing on IE"), !1;
	            return g;
	        },
	        _attachLabels: function() {
	            var a = c("<span></span>").addClass(this.options.digitClassName), b = c("<span></span>").addClass(this.options.labelClassName).text(this.options.label),  z = c("<span></span>").addClass(this.options.titleClassName).text(this.options.title), y = c("<span></span>").addClass(this.options.datesClassName).text(this.options.dates);;
	            
	            this.element.append([ a, b, z, y ]);
	            return {
	                digit: a,
	                text: b,
	                text: z,
	                text: y
	            };
	        },
	        _build: function() {
	            for (var a = {}, b, g = 2 * this.attributes.radius.back, m = 0; m < d.CANVAS_NAMES.length; ++m) {
	                if (!(b = this._createCanvas(g, g))) return !1;
	                b.style.position = "absolute";
	                b.style.top = 0;
	                b.style.left = 0;
	                b.className = d.CANVAS_NAMES[m];
	                a[d.CANVAS_NAMES[m]] = b;
	            }
	            this.element.addClass(this.options.wrapperClassName).append(c.map(a, function(a) {
	                return a;
	            }));
	            return a;
	        },
	        _drawBackside: function(a) {
	            var b = this.attributes.radius.back, g = this.attributes.radius.fill, a = a.getContext("2d"), c = a.createLinearGradient(0, 0, 0, 2 * b);
	            c.addColorStop(0, "#d5d5d5");
	            c.addColorStop(1, "#ffffff");
	            1 < d.PIXEL_RATIO && a.scale(d.PIXEL_RATIO, d.PIXEL_RATIO);
	            this._drawCircle(a, b, b, b);
	            a.fillStyle = c;
	            a.fill();
	            this._drawCircle(a, b, b, g);
	            a.fillStyle = "#eeeeee";
	            a.fill();
	        },
	        _drawFrontside: function(a) {
	            var b = this.attributes.radius.back, c = this.attributes.radius.front, a = a.getContext("2d");
	            1 < d.PIXEL_RATIO && a.scale(d.PIXEL_RATIO, d.PIXEL_RATIO);
	            this._drawCircle(a, b, b, c);
	            a.shadowColor = "rgba(0, 0, 0, 0.3)";
	            a.shadowBlur = 3;
	            a.shadowOffsetY = 1;
	            a.fillStyle = "#ffffff";
	            a.fill();
	        },
	        _drawCircle: function(a, b, c, d) {
	            a.beginPath();
	            a.arc(b, c, d, 0, 2 * Math.PI, !1);
	            a.closePath();
	        },
	        _updateVal: function(a, b, d) {
	            c.isNumeric(a) && c.isNumeric(b) && c.isNumeric(d) ? (d = (d - b) * a, a = Math.max(0, Math.min(b + 100 * d / this.options.maxValue, 100)), b = Math.max(0, Math.min(b + d, this.options.maxValue))) : (a = Math.min(this.attributes.currentValue / this.options.maxValue, 100), b = Math.min(this.attributes.currentValue, this.options.maxValue));
	            this.labels.digit[0].innerHTML = (c.isFunction(this.options.format) ? this.options.format : function(a, b, c) {
	                return this.options.percent ? a.toFixed(this.options.decimals) + "%" : b.toFixed(this.options.decimals) + "/" + c.toFixed(this.options.decimals);
	            }).apply(this, [ a, b, this.options.maxValue ]);
	        },
	        _redraw: function() {
	            var a = this.canvases.fill, b = a.getContext("2d"), c = this.attributes.radius.back, f = this.attributes.radius.fill, e = 2 * (this.attributes.currentValue / this.options.maxValue) * Math.PI;
	            b.fillStyle = this.options.fillColor;
	            b.clearRect(0, 0, a.width, a.height);
	            0 !== e && (b.save(), 1 < d.PIXEL_RATIO && b.scale(d.PIXEL_RATIO, d.PIXEL_RATIO), b.translate(c, c), b.rotate(-Math.PI / 2), b.beginPath(), b.arc(0, 0, f, 0, e, !1), b.lineTo(0, 0), b.closePath(), b.fill(), b.restore());
	            this._updateVal();
	        },
	        animate: function(a, b) {
	            function f(b) {
	                1 === b.loops && (j = (new Date).getTime(), r = 2 * (a / this.options.maxValue) * Math.PI, p = 2 * (this.attributes.currentValue / this.options.maxValue) * Math.PI);
	                var c = Math.min(((new Date).getTime() - j) / this.options.duration, 1), e = p + (r - p) * c;
	                h.clearRect(0, 0, n.width, n.height);
	                0 !== e && (h.save(), 1 < d.PIXEL_RATIO && h.scale(d.PIXEL_RATIO, d.PIXEL_RATIO), h.translate(i, i), h.rotate(-Math.PI / 2), h.beginPath(), h.arc(0, 0, l, 0, e, !1), h.lineTo(0, 0), h.closePath(), h.fill(), h.restore());
	                k._updateVal(c, k.attributes.currentValue, a);
	                return b.stopRequested || 1 <= c ? (k.attributes.currentValue += (a - k.attributes.currentValue) * c, !1) : !0;
	            }
	            function e(a) {
	                c(this).queue("circular", function(a) {
	                    (this.activeAnimationThread = new q({
	                        onLoop: function() {
	                            return f.apply(this, arguments);
	                        },
	                        afterStop: function() {
	                            a();
	                            0 === c(this).queue("circular").length && (this.activeAnimationThread = null);
	                        },
	                        owner: this
	                    })).start();
	                });
	                a && c(this).dequeue("circular");
	            }
	            if (c.isNumeric(a) && !(0 > a || a > this.options.maxValue)) {
	                var k = this, n = this.canvases.fill, h = n.getContext("2d"), i = this.attributes.radius.back, l = this.attributes.radius.fill, j, r, p;
	                h.fillStyle = this.options.fillColor;
	                !b && this.activeAnimationThread ? (c(this).clearQueue("circular"), this.activeAnimationThread.stop(function() {
	                    e.apply(this, [ !0 ]);
	                })) : e.apply(this, [ !this.activeAnimationThread ]);
	            }
	        },
	        option: function(a, b) {
	            if (0 === arguments.length) return c.extend({}, this.options);
	            if ("string" === typeof a) {
	                if (b === j) return this.options[a];
	                switch (a) {
	                  case "label":
	                    this.options[a] = b;
	                    this.labels.text.html(b);
	                    break;
	                  case "maxValue":
	                    this.options.percent || (this.attributes.currentValue = Math.max(Math.min(this.attributes.currentValue, b), 0), this.options[a] = b, this._redraw());
	                    break;
	                  case "percent":
	                    b && (this.options.maxValue = 100, this.attributes.currentValue = Math.max(Math.min(this.attributes.currentValue, 100), 0));
	                  case "format":
	                  case "decimals":
	                  case "fillColor":
	                  case "duration":
	                    this.options[a] = b, this._redraw();
	                }
	            }
	            return this;
	        }
	    };
	    d.defaults = d.prototype.defaults;
	    c.fn.CircularStat = function(a) {
	        var b = "string" === typeof a, e = Array.prototype.slice.call(arguments, 1), f = this;
	        if (b && "_" === a.charAt(0)) return f;
	        b ? this.each(function() {
	            var b = c.data(this, "circular-stat"), d = b && c.isFunction(b[a]) ? b[a].apply(b, e) : b;
	            if (d !== b && d !== j) return f = d, !1;
	        }) : this.each(function() {
	            c.data(this, "circular-stat") || c.data(this, "circular-stat", new d(this, a));
	        });
	        return f;
	    };
	    c(function() {
	        c('[data-provide="circular"]').each(function() {
	            var a = c(this);
	            a.CircularStat(a.data());
	        });
	    });
	})(jQuery, window, document);
	
	////////////////////////////////////////////////////////
	//calendar
	/////////////////////////////////////////////////////////	
	function CalendarApp(date) {
		  
		  if (!(date instanceof Date)) {
		    date = new Date();
		  }
		  
		  this.days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
		  this.months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
		  this.quotes = ['Whatever the mind of man can conceive and believe, it can achieve. –Napoleon Hill', 'Strive not to be a success, but rather to be of value. –Albert Einstein', 'Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference.  –Robert Frost', 'I attribute my success to this: I never gave or took any excuse. –Florence Nightingale', 'You miss 100% of the shots you don’t take. –Wayne Gretzky', 'The most difficult thing is the decision to act, the rest is merely tenacity. –Amelia Earhart', 'Every strike brings me closer to the next home run. –Babe Ruth', 'Definiteness of purpose is the starting point of all achievement. –W. Clement Stone', 'Life isn’t about getting and having, it’s about giving and being. –Kevin Kruse', 'Life is what happens to you while you’re busy making other plans. –John Lennon', 'We become what we think about. –Earl Nightingale', 'Life is 10% what happens to me and 90% of how I react to it. –Charles Swindoll', 'The most common way people give up their power is by thinking they don’t have any. –Alice Walker', 'The mind is everything. What you think you become.  –Buddha', 'Winning isn’t everything, but wanting to win is. –Vince Lombardi', 'Every child is an artist.  The problem is how to remain an artist once he grows up. –Pablo Picasso', ' You can never cross the ocean until you have the courage to lose sight of the shore. –Christopher Columbus', 'I’ve learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel. –Maya Angelou', 'Either you run the day, or the day runs you. –Jim Rohn', 'Whether you think you can or you think you can’t, you’re right. –Henry Ford', 'The two most important days in your life are the day you are born and the day you find out why. –Mark Twain', 'Whatever you can do, or dream you can, begin it.  Boldness has genius, power and magic in it. –Johann Wolfgang von Goethe', 'The best revenge is massive success. –Frank Sinatra', 'People often say that motivation doesn’t last. Well, neither does bathing.  That’s why we recommend it daily. –Zig Ziglar', 'Life shrinks or expands in proportion to one’s courage. –Anais Nin', 'If you hear a voice within you say “you cannot paint,” then by all means paint and that voice will be silenced. –Vincent Van Gogh', 'There is only one way to avoid criticism: do nothing, say nothing, and be nothing. –Aristotle', 'Ask and it will be given to you; search, and you will find; knock and the door will be opened for you. –Jesus', 'The only person you are destined to become is the person you decide to be. –Ralph Waldo Emerson', 'Go confidently in the direction of your dreams.  Live the life you have imagined. –Henry David Thoreau',  'Few things can help an individual more than to place responsibility on him, and to let him know that you trust him.  –Booker T. Washington'];
		  this.apts = [
		    {
		      name: 'Finish this web app',
		      endTime: new Date(2016, 4, 30, 23),
		      startTime: new Date(2016, 4, 30, 21),
		      day: new Date(2016, 4, 30).toString()
		    },
		     {
		      name: 'My Birthday!',
		      endTime: new Date(2016, 4, 1, 23, 59),
		      startTime: new Date(2016, 4, 1, 0),
		      day: new Date(2016, 4, 1).toString()
		    },
		    
		  ];
		  
		  this.aptDates = [new Date(2016, 4, 30).toString(),new Date(2016, 4, 1).toString()];
		  this.eles = {
		  };
		  this.calDaySelected = null;
		  
		  this.calendar = document.getElementById("calendar-app");
		  
		  this.calendarView = document.getElementById("dates");
		  
		  this.calendarMonthDiv = document.getElementById("calendar-month");
		  this.calendarMonthLastDiv = document.getElementById("calendar-month-last");
		  this.calendarMonthNextDiv = document.getElementById("calendar-month-next");
		  
		  this.dayInspirationalQuote = document.getElementById("inspirational-quote");
		   
		  this.todayIsSpan = document.getElementById("footer-date");
		  // this.eventsCountSpan = document.getElementById("footer-events");
		  this.dayViewEle = document.getElementById("day-view");
		  this.dayViewExitEle = document.getElementById("day-view-exit");
		  this.dayViewDateEle = document.getElementById("day-view-date");
		  this.addDayEventEle = document.getElementById("add-event");
		  this.dayEventsEle = document.getElementById("day-events");
		  
		  this.dayEventAddForm = {
		    cancelBtn: document.getElementById("add-event-cancel"),
		    addBtn: document.getElementById("add-event-save"),
		    nameEvent:  document.getElementById("input-add-event-name"),
		    startTime:  document.getElementById("input-add-event-start-time"),
		    endTime:  document.getElementById("input-add-event-end-time"),
		    startAMPM:  document.getElementById("input-add-event-start-ampm"),
		    endAMPM:  document.getElementById("input-add-event-end-ampm")
		  };
		  this.dayEventsList = document.getElementById("day-events-list");
		  this.dayEventBoxEle = document.getElementById("add-day-event-box");
		  
		  /* Start the app */
		  this.showView(date);
		  this.addEventListeners();
		  this.todayIsSpan.textContent = "Today is " + this.months[date.getMonth()] + " " + date.getDate();  
		}

		CalendarApp.prototype.addEventListeners = function(){
		  
		  this.calendar.addEventListener("click", this.mainCalendarClickClose.bind(this));
		  this.todayIsSpan.addEventListener("click", this.showView.bind(this));
		  this.calendarMonthLastDiv.addEventListener("click", this.showNewMonth.bind(this));
		  this.calendarMonthNextDiv.addEventListener("click", this.showNewMonth.bind(this));
		  this.dayViewExitEle.addEventListener("click", this.closeDayWindow.bind(this));
		  this.dayViewDateEle.addEventListener("click", this.showNewMonth.bind(this));
		  this.addDayEventEle.addEventListener("click", this.addNewEventBox.bind(this));
		  this.dayEventAddForm.cancelBtn.addEventListener("click", this.closeNewEventBox.bind(this));
		  this.dayEventAddForm.cancelBtn.addEventListener("keyup", this.closeNewEventBox.bind(this));
		  
		  this.dayEventAddForm.startTime.addEventListener("keyup",this.inputChangeLimiter.bind(this));
		  this.dayEventAddForm.startAMPM.addEventListener("keyup",this.inputChangeLimiter.bind(this));
		  this.dayEventAddForm.endTime.addEventListener("keyup",this.inputChangeLimiter.bind(this));
		  this.dayEventAddForm.endAMPM.addEventListener("keyup",this.inputChangeLimiter.bind(this));
		  this.dayEventAddForm.addBtn.addEventListener("click",this.saveAddNewEvent.bind(this));

		};
		CalendarApp.prototype.showView = function(date){
		  if ( !date || (!(date instanceof Date)) ) date = new Date();
		  var now = new Date(date),
		      y = now.getFullYear(),
		      m = now.getMonth();
		  var today = new Date();
		  
		  var lastDayOfM = new Date(y, m + 1, 0).getDate();
		  var startingD = new Date(y, m, 1).getDay();
		  var lastM = new Date(y, now.getMonth()-1, 1);
		  var nextM = new Date(y, now.getMonth()+1, 1);
		 
		  this.calendarMonthDiv.classList.remove("cview__month-activate");
		  this.calendarMonthDiv.classList.add("cview__month-reset");
		  
		  while(this.calendarView.firstChild) {
		    this.calendarView.removeChild(this.calendarView.firstChild);
		  }
		  
		  // build up spacers
		  for ( var x = 0; x < startingD; x++ ) {
		    var spacer = document.createElement("div");
		    spacer.className = "cview--spacer";
		    this.calendarView.appendChild(spacer);
		  }
		  
		  for ( var z = 1; z <= lastDayOfM; z++ ) {
		   
		    var _date = new Date(y, m ,z);
		    var day = document.createElement("div");
		    day.className = "cview--date";
		    day.textContent = z;
		    day.setAttribute("data-date", _date);
		    day.onclick = this.showDay.bind(this);
		    
		    // check if todays date
		    if ( z == today.getDate() && y == today.getFullYear() && m == today.getMonth() ) {
		      day.classList.add("today");
		    }
		    
		     // check if has events to show
		    if ( this.aptDates.indexOf(_date.toString()) !== -1 ) {
		      day.classList.add("has-events");
		    }
		    
		    this.calendarView.appendChild(day);
		  }
		  
		  var _that = this;
		  setTimeout(function(){
		    _that.calendarMonthDiv.classList.add("cview__month-activate");
		  }, 50);
		  
		  this.calendarMonthDiv.textContent = this.months[now.getMonth()] + " " + now.getFullYear();
		  this.calendarMonthDiv.setAttribute("data-date", now);

		  
		  this.calendarMonthLastDiv.textContent = "← " + this.months[lastM.getMonth()];
		  this.calendarMonthLastDiv.setAttribute("data-date", lastM);
		  
		  this.calendarMonthNextDiv.textContent = this.months[nextM.getMonth()] + " →";
		  this.calendarMonthNextDiv.setAttribute("data-date", nextM);
		  
		}
		CalendarApp.prototype.showDay = function(e, dayEle) {
		  e.stopPropagation();
		  if ( !dayEle ) {
		    dayEle = e.currentTarget;
		  }
		  var dayDate = new Date(dayEle.getAttribute('data-date'));
		  
		  this.calDaySelected = dayEle;
		  
		  this.openDayWindow(dayDate);
		  

		  
		};
		CalendarApp.prototype.openDayWindow = function(date){
		  
		  var now = new Date();
		  var day = new Date(date);
		  this.dayViewDateEle.textContent = this.days[day.getDay()] + ", " + this.months[day.getMonth()] + " " + day.getDate() + ", " + day.getFullYear();
		  this.dayViewDateEle.setAttribute('data-date', day);
		  this.dayViewEle.classList.add("calendar--day-view-active");
		  
		  /* Contextual lang changes based on tense. Also show btn for scheduling future events */
		  var _dayTopbarText = '';
		  if ( day < new Date(now.getFullYear(), now.getMonth(), now.getDate())) {
		    _dayTopbarText = "had ";
		    this.addDayEventEle.style.display = "none";
		  } else {
		     _dayTopbarText = "have ";
		     this.addDayEventEle.style.display = "inline";
		  }
		  this.addDayEventEle.setAttribute("data-date", day);
		  
		  var eventsToday = this.showEventsByDay(day);
		  if ( !eventsToday ) {
		    _dayTopbarText += "no ";
		    var _rand = Math.round(Math.random() * ((this.quotes.length - 1 ) - 0) + 0);
		    this.dayInspirationalQuote.textContent = this.quotes[_rand];
		  } else {
		    _dayTopbarText += eventsToday.length + " ";
		    this.dayInspirationalQuote.textContent = null;
		  }
		  //this.dayEventsList.innerHTML = this.showEventsCreateHTMLView(eventsToday);
		  while(this.dayEventsList.firstChild) {
		    this.dayEventsList.removeChild(this.dayEventsList.firstChild);
		  }
		  
		  this.dayEventsList.appendChild(this.showEventsCreateElesView(eventsToday));
		  
		  
		  this.dayEventsEle.textContent = _dayTopbarText + "events on " + this.months[day.getMonth()] + " " + day.getDate() + ", " + day.getFullYear();
		  
		  
		};

		CalendarApp.prototype.showEventsCreateElesView = function(events) {
		  var ul = document.createElement("ul");
		  ul.className = 'day-event-list-ul';
		  events = this.sortEventsByTime(events);
		  var _this = this;
		  events.forEach(function(event){
		    var _start = new Date(event.startTime);
		    var _end = new Date(event.endTime);
		    var idx = event.index;
		    var li = document.createElement("li");
		    li.className = "event-dates";
		    // li.innerHtml
		    var html = "<span class='start-time'>" + _start.toLocaleTimeString(navigator.language,{hour: '2-digit', minute:'2-digit'}) + "</span> <small>through</small> ";
		    html += "<span class='end-time'>" + _end.toLocaleTimeString(navigator.language,{hour: '2-digit', minute:'2-digit'}) + ( (_end.getDate() != _start.getDate()) ? ' <small>on ' + _end.toLocaleDateString() + "</small>" : '') +"</span>";
		    

		    html += "<span class='event-name'>" + event.name + "</span>";
		    
		    var div = document.createElement("div");
		    div.className = "event-dates";
		    div.innerHTML = html;
		    
		    var deleteBtn = document.createElement("span");
		    var deleteText = document.createTextNode("delete");
		    deleteBtn.className = "event-delete";
		    deleteBtn.setAttribute("data-idx", idx);
		    deleteBtn.appendChild(deleteText);
		    deleteBtn.onclick = _this.deleteEvent.bind(_this);
		    
		    div.appendChild(deleteBtn);
		    
		    li.appendChild(div);
		    ul.appendChild(li);
		  });
		  return ul;
		};
		CalendarApp.prototype.deleteEvent = function(e) {
		  var deleted = this.apts.splice(e.currentTarget.getAttribute("data-idx"),1);
		  var deletedDate = new Date(deleted[0].day);
		  var anyDatesLeft = this.showEventsByDay(deletedDate);
		  if ( anyDatesLeft === false ) {
		    // safe to remove from array
		    var idx = this.aptDates.indexOf(deletedDate.toString());
		    if (idx >= 0) {
		       this.aptDates.splice(idx,1);
		      // remove dot from calendar view
		      var ele = document.querySelector('.cview--date[data-date="'+ deletedDate.toString() +'"]');
		      if ( ele ) {
		        ele.classList.remove("has-events");
		      }
		    }
		  }
		  this.openDayWindow(deletedDate);;
		};
		CalendarApp.prototype.sortEventsByTime = function(events) {
		  if (!events) return [];
		  return events.sort(function compare(a, b) {
		    if (new Date(a.startTime) < new Date(b.startTime)) {
		      return -1;
		    }
		    if (new Date(a.startTime) > new Date(b.startTime)) {
		      return 1;
		    }
		    // a must be equal to b
		    return 0;
		  });
		};
		CalendarApp.prototype.showEventsByDay = function(day) {
		  var _events = [];
		  this.apts.forEach(function(apt, idx){
		    if ( day.toString() == apt.day.toString() ) {
		      apt.index = idx;
		      _events.push(apt);
		    }
		  });
		  return (_events.length) ? _events : false;
		};
		CalendarApp.prototype.closeDayWindow = function(){
		  this.dayViewEle.classList.remove("calendar--day-view-active");
		  this.closeNewEventBox();
		};
		CalendarApp.prototype.mainCalendarClickClose = function(e){
		  if ( e.currentTarget != e.target ) {
		    return;
		  }
		  
		  this.dayViewEle.classList.remove("calendar--day-view-active");
		  this.closeNewEventBox();
		};
		CalendarApp.prototype.addNewEventBox = function(e){
		  var target = e.currentTarget;
		  this.dayEventBoxEle.setAttribute("data-active", "true"); 
		  this.dayEventBoxEle.setAttribute("data-date", target.getAttribute("data-date"));
		  
		};
		CalendarApp.prototype.closeNewEventBox = function(e){
		  
		  if (e && e.keyCode && e.keyCode != 13) return false;
		  
		  this.dayEventBoxEle.setAttribute("data-active", "false");
		  // reset values
		  this.resetAddEventBox();
		  
		};
		CalendarApp.prototype.saveAddNewEvent = function() {
		  var saveErrors = this.validateAddEventInput();
		  if ( !saveErrors ) {
		    this.addEvent();
		  }
		};

		CalendarApp.prototype.addEvent = function() {
		  
		  var name = this.dayEventAddForm.nameEvent.value.trim();
		  var dayOfDate = this.dayEventBoxEle.getAttribute("data-date");
		  var dateObjectDay =  new Date(dayOfDate);
		  var cleanDates = this.cleanEventTimeStampDates();
		  
		  this.apts.push({
		    name: name,
		    day: dateObjectDay,
		    startTime: cleanDates[0],
		    endTime: cleanDates[1]
		  });
		  this.closeNewEventBox();
		  this.openDayWindow(dayOfDate);
		  this.calDaySelected.classList.add("has-events");
		  // add to dates
		  if ( this.aptDates.indexOf(dateObjectDay.toString()) === -1 ) {
		    this.aptDates.push(dateObjectDay.toString());
		  }
		  
		};
		CalendarApp.prototype.convertTo23HourTime = function(stringOfTime, AMPM) {
		  // convert to 0 - 23 hour time
		  var mins = stringOfTime.split(":");
		  var hours = stringOfTime.trim();
		  if ( mins[1] && mins[1].trim() ) {
		    hours = parseInt(mins[0].trim());
		    mins = parseInt(mins[1].trim());
		  } else {
		    hours = parseInt(hours);
		    mins = 0;
		  }
		  hours = ( AMPM == 'am' ) ? ( (hours == 12) ? 0 : hours ) : (hours <= 11) ? parseInt(hours) + 12 : hours;
		  return [hours, mins];
		};
		CalendarApp.prototype.cleanEventTimeStampDates = function() {
		  
		  var startTime = this.dayEventAddForm.startTime.value.trim() || this.dayEventAddForm.startTime.getAttribute("placeholder") || '8';
		  var startAMPM = this.dayEventAddForm.startAMPM.value.trim() || this.dayEventAddForm.startAMPM.getAttribute("placeholder") || 'am';
		  startAMPM = (startAMPM == 'a') ? startAMPM + 'm' : startAMPM;
		  var endTime = this.dayEventAddForm.endTime.value.trim() || this.dayEventAddForm.endTime.getAttribute("placeholder") || '9';
		  var endAMPM = this.dayEventAddForm.endAMPM.value.trim() || this.dayEventAddForm.endAMPM.getAttribute("placeholder") || 'pm';
		  endAMPM = (endAMPM == 'p') ? endAMPM + 'm' : endAMPM;
		  var date = this.dayEventBoxEle.getAttribute("data-date");
		  
		  var startingTimeStamps = this.convertTo23HourTime(startTime, startAMPM);
		  var endingTimeStamps = this.convertTo23HourTime(endTime, endAMPM);
		  
		  var dateOfEvent = new Date(date);
		  var startDate = new Date(dateOfEvent.getFullYear(), dateOfEvent.getMonth(), dateOfEvent.getDate(), startingTimeStamps[0], startingTimeStamps[1]);
		  var endDate = new Date(dateOfEvent.getFullYear(), dateOfEvent.getMonth(), dateOfEvent.getDate(), endingTimeStamps[0], endingTimeStamps[1]);
		  
		  // if end date is less than start date - set end date back another day
		  if ( startDate > endDate ) endDate.setDate(endDate.getDate() + 1);
		  
		  return [startDate, endDate];
		  
		};
		CalendarApp.prototype.validateAddEventInput = function() {

		  var _errors = false;
		  var name = this.dayEventAddForm.nameEvent.value.trim();
		  var startTime = this.dayEventAddForm.startTime.value.trim();
		  var startAMPM = this.dayEventAddForm.startAMPM.value.trim();
		  var endTime = this.dayEventAddForm.endTime.value.trim();
		  var endAMPM = this.dayEventAddForm.endAMPM.value.trim();
		  
		  if (!name || name == null) {
		    _errors = true;
		    this.dayEventAddForm.nameEvent.classList.add("add-event-edit--error");
		    this.dayEventAddForm.nameEvent.focus();
		  } else {
		     this.dayEventAddForm.nameEvent.classList.remove("add-event-edit--error");
		  }
		  
		//   if (!startTime || startTime == null) {
//		     _errors = true;
//		     this.dayEventAddForm.startTime.classList.add("add-event-edit--error");
		//   } else {
//		      this.dayEventAddForm.startTime.classList.remove("add-event-edit--error");
		//   }
		  
		  return _errors;
		  
		  
		};
		var timeOut = null;
		var activeEle = null;
		CalendarApp.prototype.inputChangeLimiter = function(ele) {
		  
		  if ( ele.currentTarget ) {
		    ele = ele.currentTarget;
		  }
		  if (timeOut && ele == activeEle){
		    clearTimeout(timeOut);
		  }
		  
		  var limiter = CalendarApp.prototype.textOptionLimiter;

		  var _options = ele.getAttribute("data-options").split(",");
		  var _format = ele.getAttribute("data-format") || 'text';
		  timeOut = setTimeout(function(){
		    ele.value = limiter(_options, ele.value, _format);
		  }, 600);
		  activeEle = ele;
		  
		};
		CalendarApp.prototype.textOptionLimiter = function(options, input, format){
		  if ( !input ) return '';
		  
		  if ( input.indexOf(":") !== -1 && format == 'datetime' ) {
		 
		    var _splitTime = input.split(':', 2);
		    if (_splitTime.length == 2 && !_splitTime[1].trim()) return input;
		    var _trailingTime = parseInt(_splitTime[1]);
		    /* Probably could be coded better -- a block to clean up trailing data */
		    if (options.indexOf(_splitTime[0]) === -1) {
		      return options[0];
		    }
		    else if (_splitTime[1] == "0" ) {
		      return input;
		    }
		    else if (_splitTime[1] == "00" ) {
		      return _splitTime[0] +  ":00";
		    }
		    else if (_trailingTime < 10 ) {
		      return _splitTime[0] + ":" + "0" + _trailingTime;
		    }
		    else if ( !Number.isInteger(_trailingTime) || _trailingTime < 0 || _trailingTime > 59 )  {
		      return _splitTime[0];
		    } 
		    return _splitTime[0] + ":" + _trailingTime;
		  }
		  if ((input.toString().length >= 3) ) {
		    var pad = (input.toString().length - 4) * -1;
		    var _hour, _min;
		    if (pad == 1) {
		      _hour = input[0];
		      _min = input[1] + input[2];
		    } else {
		      _hour = input[0] + input[1];
		      _min = input[2] + input[3];
		    }
		    
		    _hour = Math.max(1,Math.min(12,(_hour)));
		    _min = Math.min(59,(_min));
		    if ( _min < 10 ) { 
		      _min = "0" + _min;
		    }
		    _min = (isNaN(_min)) ? '00' : _min;
		    _hour = (isNaN(_hour)) ? '9' : _hour ;

		    return _hour + ":" + _min;
		    
		  }

		  if (options.indexOf(input) === -1) {
		    return options[0];
		  }
		  
		  return input;
		};
		CalendarApp.prototype.resetAddEventBox = function(){
		  this.dayEventAddForm.nameEvent.value = '';
		  this.dayEventAddForm.nameEvent.classList.remove("add-event-edit--error");
		  this.dayEventAddForm.endTime.value = '';
		  this.dayEventAddForm.startTime.value = '';
		  this.dayEventAddForm.endAMPM.value = '';
		  this.dayEventAddForm.startAMPM.value = '';
		};
		CalendarApp.prototype.showNewMonth = function(e){
		  var date = e.currentTarget.dataset.date;
		  var newMonthDate = new Date(date);
		  this.showView(newMonthDate);
		  this.closeDayWindow();
		  return true;
		};

		var calendar = new CalendarApp();
		console.log(calendar);

		
</script>
</body>
</html>