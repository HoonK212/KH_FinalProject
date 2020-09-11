<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!DOCTYPE html>
<html>
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
/* body {background-color: #2a2b3d} */
body {background-color:#eee}

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


/*progress --------------------------------------------------------- */ 


 #progress-wrapper{
    position: relative; 
   top: 35px;
   /* width: 404px; */
}
.progress-center {
   left: 50%;
   -webkit-transform: translate( -50% );
   -ms-transform: translate( -50% );
   transform: translate( -50% );
} 

/*===== The CSS =====*/
.progress{
   width: 200px;
   height: 280px;
}
.progress .track, .progress .fill{
   fill: rgba(0, 0, 0, 0);
   stroke-width: 3;
   transform: rotate(90deg)translate(0px, -80px);
}
.progress .track{
   stroke: rgb(56, 71, 83);
}
.progress .fill {
   stroke: rgb(255, 255, 255);
   stroke-dasharray: 219.99078369140625;
   stroke-dashoffset: -219.99078369140625;
   transition: stroke-dashoffset 1s;
}
.progress.blue .fill {
   stroke: rgb(104, 214, 198);
}
.progress.green .fill {
   stroke: rgb(186, 223, 172);
}
.progress .value, .progress .text {
   font-family: 'Open Sans';
   /* fill: rgb(255, 255, 255); */
   text-anchor: middle;
}
.progress .text {
   font-size: 12px;
}
.noselect {
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
      cursor: default;
}






/*calendar */
body{
  margin: 0;
  padding: 0;
  font-family: 'HelveticaNeue-Light', Helvetica Neue, Helvetica;
 /*  display: flex; */
  align-items:center;
  height: 100%;
  height: 100vh;
  min-height: 500px;
  /* background: rgba(76,76,76,1); */
  background-color:#eee;
/* background: -moz-radial-gradient(center, ellipse cover, rgba(76,76,76,1) 0%, rgba(43,43,43,1) 0%, rgba(23,23,23,1) 91%, rgba(23,23,23,1) 100%);
background: -webkit-gradient(radial, center center, 0px, center center, 100%, color-stop(0%, rgba(76,76,76,1)), color-stop(0%, rgba(43,43,43,1)), color-stop(91%, rgba(23,23,23,1)), color-stop(100%, rgba(23,23,23,1)));
background: -webkit-radial-gradient(center, ellipse cover, rgba(76,76,76,1) 0%, rgba(43,43,43,1) 0%, rgba(23,23,23,1) 91%, rgba(23,23,23,1) 100%);
background: -o-radial-gradient(center, ellipse cover, rgba(76,76,76,1) 0%, rgba(43,43,43,1) 0%, rgba(23,23,23,1) 91%, rgba(23,23,23,1) 100%);
background: -ms-radial-gradient(center, ellipse cover, rgba(76,76,76,1) 0%, rgba(43,43,43,1) 0%, rgba(23,23,23,1) 91%, rgba(23,23,23,1) 100%);
background: radial-gradient(ellipse at center, rgba(76,76,76,1) 0%, rgba(43,43,43,1) 0%, rgba(23,23,23,1) 91%, rgba(23,23,23,1) 100%); */
}
.calendar{
  color: #fff;
  margin: 10px auto;
  background: #04b6e2;
  padding: 60px 40px 80px 40px;
  width: 95%;
  max-width: 600px;
  height: 325px;
  border-radius: 5px;
  box-shadow: 0px 2px 6px rgba(2,2,2,0.2);
  position: relative;
}
.calendar__title{
  text-align: center;
}
.calendar--day-view{
  position: absolute;
  border-radius: 3px;
  top: -2.5%;
  left: -2.5%;
  width: 100%;
  height: 100%;
  background: rgba(255,255,255,1);
 box-shadow: 3px 12px 5px rgba(2,2,2,0.16);
  z-index: 2;
  overflow: hidden;
  transform: scale(0.9) translate(30px,30px);
  opacity: 0;
  visibility: hidden;
/*   border-radius: 5px; */
  display: none;
  align-items: flex-start;
  flex-wrap: wrap;
}
.day-view-content{
  color: #222;
  width: 100%;
  padding-top: 55px;
}
.day-highlight, .day-add-event{
  padding: 8px 10px;
  margin: 12px 15px;
  border-radius: 4px;
  background: #e7e8e8;
  color: #222;
  font-size: 14px;
  font-weight: 600;
  font-family: "Avenir", sans-serif;
}
.row{
  width: 100%;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
}
.row .qtr{
  width: 40%;
}
.row .half{
  width: 100%;
}
/* @media (min-width: 800px){
  .row{
    flex-wrap: nowrap;
  }
  .row .half{
    width: 35%;
  }
  .row .qtr{
    width: 25%;
  }
} */

.day-add-event{
  background: #04b6e2;
  color: #fff;
  padding: 16px;
  display: none;
  transform: translateY(-15px);
  opacity: 0;
}
.day-add-event[data-active="true"]{
  display: block;
  animation: popIn 250ms 1 forwards;
}
.add-event-label{
  padding: 10px 0;
  font-size: 18px;
  font-family: 'Avenir', sans-serif;
  color: #fff;
  font-weight: 400;
  font-size: 12px;
  color: rgba(255,255,255,0.8);
}
.add-event-edit{
  display: block;
  margin: 4px 0;
  max-width: 70%;
  border-bottom: 2px solid #fff;
  font-size: 18px;
  font-weight: 800;
  color: #fff;
}
.add-event-edit--long{
  max-width: 90%;
}

input.add-event-edit{
  border: none;
  border-bottom: 2px solid #fff;
  background: transparent;
  outline: none;
  font: inherit;
  color: #fff;
  font-size: 18px;
  font-weight: 800;
}
.add-event-edit--error, input.add-event-edit--error{
  border-color: #ff5151;
  animation: shake 300ms 1 forwards;
}
@keyframes shake {
  20%, 60%{
    transform: translateX(4px);
  }
  40%, 80%{
    transform: translateX(-4px);
  }
}
input.add-event-edit::-webkit-input-placeholder {
   color: #fff;
}

input.add-event-edit:-moz-placeholder { /* Firefox 18- */
   color: #fff;  
}

input.add-event-edit::-moz-placeholder {  /* Firefox 19+ */
   color: #fff;  
}

input.add-event-edit:-ms-input-placeholder {  
   color: #fff;  
}
.event-btn{
  padding: 3px 8px;
  border: 3px solid #fff;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  width: 65px;
  margin: 5px 0;
  text-align: center;
}

.event-btn--save{
  border-color: #fff;
   background: #74c500;
  color: #fff;
  border-color: transparent;
}
.event-btn--save:hover{
  box-shadow: 0px 2px 4px rgba(2,2,2,0.2);
}
.event-btn--cancel{
  background: #ff5151;
  color: #fff;
  border-color: transparent;
}
.event-btn--cancel:hover{
  box-shadow: 0px 2px 4px rgba(2,2,2,0.2);
}
/* .add-event-btn:hover, .add.event-btn:focus{
  background: #00258e;
  box-shadow: 0px -1px 2px rgba(3,2,2,0.2);
} */
.day-highlight .day-events-link{
  border-bottom: 2px solid #222;
  padding: 0;
  cursor: pointer;
}
#add-event{
  color: #04b6e2;
  border-color: #04b6e2;
}
.day-view-exit{
  position: absolute;
  top: 24px;
  line-height: 1em;
  left: 22px;
  font-size: 22px;
  color: #252525;
  font-family: 'Avenir', sans-serif;
  font-weight: 800;
  cursor: pointer;
  opacity: 0;
  animation: popIn 200ms 1 forwards;
  text-transform: uppercase;
}
.day-view-date{
  position: absolute;
  top: 19px;
  right: 22px;
  text-align: right;
  font-size: 22px;
  font-family: 'Avenir', sans-serif;
  font-weight: 800;
  color: #393939;
  border-bottom: 2px solid #222;
  cursor: pointer;
}
.day-inspiration-quote{
  position: absolute;
/*   top: 90px; */
  margin-top: -40px;
  left: 10%;
  width: 80%;
  height: calc(100% - 110px);
  display: flex;
  flex-wrap: nowrap;
  align-items: center;
  font-size: 32px;
  font-weight: 800;
  letter-spacing: -1px;
  color: #ddd;
  line-height: 1.1em;
  font-family: 'Avenir', sans-serif;
  z-index: -1;
}
.day-event-list-ul{
  list-style: none;
  margin: auto;
  width: 95%;
  padding: 0;
  max-height: 300px;
  overflow: auto;
}
.day-event-list-ul li {
  padding: 10px;
  margin: 10px 0;
/*   background: #04b6e2; */
/*   box-shadow: 0px 1px 1px  rgba(2,2,2,0.5); */
  position: relative;
}
.event-dates small{
  font-size: 0.65em;
  color: #444;
}
.event-dates{
  font-weight: 800;
  font-family: 'Avenir', sans-serif;
  color: #04b6e2;
  font-size: 18px;
  text-transform: lowercase;
/*   position: relative; */
}
.event-delete{
  position: absolute;
  right: 10px;
  top: 0px;
  font-size: 12px;
  color: #f25656;
  cursor: pointer;
}
.event-name{
  font-size: 19px;
  font-family: 'Avenir', sans-serif;
  color: #222;
  padding:10px;
  background: #f7f7f7;
  margin: 2px 0;
  display: block;
  text-transform: initial;
}
.calendar--day-view-active{
  animation: popIn 200ms 1 forwards;
  visibility: visible;
  display: flex;
  transition: visibility 0ms;

}
.calendar--view{
  display: flex;
  flex-wrap: wrap;
  align-content: center;
  justify-content: flex-start;
  width: 100%;
}
.cview__month{
  width: 100%;
  text-align: center;
  font-weight: 800;
  font-size: 22px;
  font-family: 'Avenir', sans-serif;
  padding-bottom: 20px;
  color: #222;
  text-transform: uppercase;
  display: flex;
  flex-wrap: nowrap;
  align-items: baseline;
  justify-content: space-around;
}
.cview__month-last,.cview__month-next,.cview__month-current{
  width: 33.33333%;
  text-align: center;
  font-size: 16px;
  cursor: pointer;
  color: #222;
}
.cview__month-last:hover,.cview__month-next:hover{
  color: #fff;
}

.cview__month-current{
  font-size: 22px;
  cursor: default;
  animation: popIn 200ms 1 forwards;
  transform: translateY(20px);
  opacity: 0;
  position: relative;
}
.cview__month-reset{
  animation: none;
}
.cview__month-activate{
  animation: popIn 100ms 1 forwards;
}
.cview--spacer, .cview__header, .cview--date{
  width: 14.28571428571429%;
  max-width: 14.28571428571429%;
  padding: 10px;
  box-sizing: border-box;
  position: relative;
  text-align: center;
  overflow: hidden;
  text-overflow: clip;
  font-size: 14px;
  font-weight: 900;
}
.cview--date{
  font-size: 16px;
  font-weight: 400;
  cursor: pointer;
}
.has-events::after{
  border-radius:100%;
  animation: popIn 200ms 1 forwards;
  background: rgba(255,255,255,0.95);
  transform: scale(0);
  content: '';
  display: block;
  position: absolute;
  width: 8px;
  height: 8px;
  top: 8px;
  left: 12px;
  
}
.cview--date:hover::before{
  background: rgba(255,255,255,0.2);
}
.cview--date.today{
  color: #111;  
}
.cview--date.today::before{
  animation: popIn 200ms 1 forwards;
  background: rgba(255,255,255,0.2);
  transform: scale(0);
}
@keyframes popIn{

  100%{
    transform: scale(1);
    opacity: 1;
  }
}
.cview--date::before{
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  content: '';
  transform: scale(0.8);
  z-index: 0;
}
.footer{
  width: 100%;
  bottom: 50px;
  left: 0;
  position: absolute;
  font-size: 14px;
  text-align: center;
}
.footer__link{
  cursor: pointer;
  padding: 2px 5px;
  border-bottom: 1px solid #fff;
}



/* goal card------------------------------------- */
    /*   html, body                             {padding:0; margin:0; font:1em/1.4 Cambria, Georgia, sans-serif; color:#333; }
      .g-header                              {display:block;} 

    hgroup {display:block;} 
    

      .container-header-card                          {width:540px; padding:0 0 10px; margin:0 auto 30px;} 

      .g-h                                     {margin:1em 0 0; font-size:2.5em; font-weight:normal; line-height:1.2; text-align:center;}
      .g-ptag                                      {margin:1em 0; line-height:1.4em;}

       pre                                    {margin:1.4em 0; font-size:12px; line-height:1.4em; white-space:pre-wrap; word-wrap:break-word;}

      .follow                                {clear:both; margin-top:2em; font-size:1.125em;}
      .follow span                           {font-weight:bold;}



      .note {
          position:relative;
          width:480px;
          padding:1em 1.5em;
          margin:2em auto;
          color:#fff;
          background:#97C02F;
          overflow:hidden;
      }

      .note:before {
          content:"";
          position:absolute;
          top:0;
          right:0;
          border-width:0 16px 16px 0;
          border-style:solid;
          border-color:#fff #fff #658E15 #658E15; 
          background:#658E15; 
          display:block; width:0; 
          -webkit-box-shadow:0 1px 1px rgba(0,0,0,0.3), -1px 1px 1px rgba(0,0,0,0.2);
          -moz-box-shadow:0 1px 1px rgba(0,0,0,0.3), -1px 1px 1px rgba(0,0,0,0.2);
          box-shadow:0 1px 1px rgba(0,0,0,0.3), -1px 1px 1px rgba(0,0,0,0.2);
      }

      .note.red {background:#C93213;}
      .note.red:before {border-color:#fff #fff #97010A #97010A; background:#97010A;}

      .note.blue {background:#53A3B4;}
      .note.blue:before {border-color:#fff #fff transparent transparent; background:transparent;}

      .note.taupe {background:#999868;}
      .note.taupe:before {border-color:#fff #fff #BDBB8B #BDBB8B; background:#BDBB8B;}

     

      .note.rounded {
          -webkit-border-radius:5px 0 5px 5px;
          -moz-border-radius:5px 0 5px 5px;
          border-radius:5px 0 5px 5px;
      }

      .note.rounded:before {
          border-width:8px; 
          border-color:#fff #fff transparent transparent; 
          -webkit-border-bottom-left-radius:5px;
          -moz-border-radius:0 0 0 5px;
          border-radius:0 0 0 5px;
      }

      .note p {margin:0;}
      .note p + p {margin:1.5em 0 0;}
 */
 
 /*notification  */
body {
  font: 12px/20px 'Lucida Grande', Verdana, sans-serif;
  color: #404040;
  background-color:#eee
}

.container {
  margin: 20px auto;
  width: 380px;
}

.container .notif {
  margin: 10px 0;
}

.notif {
  position: relative;
  padding: 25px 30px 25px 100px;
  min-height: 50px;
  line-height: 22px;
  background: white;
  border-radius: 2px;
}

.notif:before {
  content: '';
  position: absolute;
  top: 25px;
  left: 30px;
  width: 40px;
  height: 40px;
  border: 5px solid;
  border-radius: 25px;
}

.notif p {
  font-size: 11px;
  color: #666;
}

.notif-title {
  margin: 0 0 5px;
  font-size: 14px;
  font-weight: bold;
  color: #333;
}

.notif-title:before, .notif-title:after {
  content: '';
  position: absolute;
  background: white;
  border-radius: 2px;
}

.notif-notice:before {
  background: #a7d155;
  border-color: #8fb14f;
}

.notif-notice .notif-title:before, .notif-notice .notif-title:after {
  top: 44px;
  left: 55px;
  width: 4px;
  height: 12px;
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  -o-transform: rotate(45deg);
  transform: rotate(45deg);
}

.notif-notice .notif-title:after {
  top: 50px;
  left: 48px;
  width: 8px;
  height: 4px;
}

.notif-alert:before {
  background: #e34f4f;
  border-color: #c14343;
}

.notif-alert .notif-title:before, .notif-alert .notif-title:after {
  top: 43px;
  left: 53px;
  width: 4px;
  height: 14px;
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  -o-transform: rotate(45deg);
  transform: rotate(45deg);
}

.notif-alert .notif-title:after {
  top: 48px;
  left: 48px;
  width: 14px;
  height: 4px;
}

.notif-warn:before {
  background: #f1e472;
  border-color: #cec260;
}

.notif-warn .notif-title:before, .notif-warn .notif-title:after {
  top: 42px;
  left: 53px;
  width: 4px;
  height: 11px;
  background: #5c562b;
}

.notif-warn .notif-title:after {
  top: 54px;
  height: 4px;
}

.notif-controls {
  position: absolute;
  top: 0;
  right: 0;
  height: 16px;
  padding: 4px 3px 5px;
  background: #f0f0f0;
  border: solid #dcdcdc;
  border-width: 0 0 1px 1px;
  border-radius: 0 2px;
}

.notif-controls > a {
  position: relative;
  float: left;
  margin: 0 1px;
  width: 16px;
  height: 16px;
  font: 0/0 serif;
  text-shadow: none;
  color: transparent;
}


/* IE 8 doesn't support CSS transforms; use Unicode instead. */

.lt-ie9 .notif-notice .notif-title:before {
  content: '\2714';
  display: block;
  top: 25px;
  left: 30px;
  width: 50px;
  font: bold 18px/50px "Arial Unicode MS";
  color: white;
  text-align: center;
  background: none;
}

.lt-ie9 .notif-notice .notif-title:after {
  display: none;
}

.lt-ie9 .notif-alert .notif-title:before {
  content: '\2716';
  display: block;
  top: 25px;
  left: 30px;
  width: 50px;
  font: bold 17px/50px "Arial Unicode MS";
  color: white;
  text-align: center;
  background: none;
}

.lt-ie9 .notif-alert .notif-title:after {
  display: none;
}

.lt-ie9 .notif-close:before {
  content: '\2716';
  display: block;
  top: 0;
  left: 0;
  width: 16px;
  font: 11px/19px 'Arial Unicode MS';
  color: #bbb;
  text-align: center;
  background: none;
}

.lt-ie9 .notif-close:after {
  display: none;
}

.lt-ie9 .notif-close:hover:before {
  color: #999;
}
 
 
 
 
 
 
 
 


</style>
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

   <!--  <div class="container">
         <ul class="graphs stats-container centered biggie" style="padding-left:270; padding-bottom:0; padding-top:20;">
                <li class="animated" data-provide="circular" data-fill-color="#db4dc2" data-percent="true" data-initial-value="25" data-max-value="100" data-label="Digital Copywriter"  style="width: 272px; height: 272px;"></li>          
                  <li class="animated" data-provide="circular" data-fill-color="#db4dc2" data-percent="true" data-initial-value="30" data-max-value="100" data-label="Graduate Assistant"  style="width: 272px; height: 272px;"></li>                     
         </ul>
    </div> -->
    
    
    
    <div id="progress-wrapper" class="progress-center" style="padding-bottom:70; width:30%; margin-left:400;">
      <svg class="progress blue noselect" data-progress="30" x="0px" y="0px" viewBox="0 0 80 80">
         <path class="track" d="M5,40a35,35 0 1,0 70,0a35,35 0 1,0 -70,0" />
         <path class="fill" d="M5,40a35,35 0 1,0 70,0a35,35 0 1,0 -70,0" />
         <text class="value" x="50%" y="55%">0%</text>
         <text class="text" x="50%" y="115%">목표달성률</text>
      </svg>
      <svg class="progress green noselect" data-progress="33" x="0px" y="0px" viewBox="0 0 80 80">
         <path class="track" d="M5,40a35,35 0 1,0 70,0a35,35 0 1,0 -70,0" />
         <path class="fill" d="M5,40a35,35 0 1,0 70,0a35,35 0 1,0 -70,0" />
         <text class="value" x="50%" y="55%">0%</text>
         <text class="text" x="50%" y="115%">감량 칼로리</text>
      </svg>
   </div>
    
    
    
    

   
   
<div class="wrapper" style="padding-left:370px;">
   <!-- 목표카드 ---------------------- -->
<!--    <div class="goal-card" style="padding-bottom:20;" >
         <div class="note-wrapper" style="margin-left:330; float:left;">
         <div class="note">
             <p class="g-ptag">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pulvinar rhoncus risus, vel ornare lacus sagittis sit amet. Duis vel sem magna. Proin pulvinar velit eleifend ligula ultrices vestibulum. Nunc posuere dolor eu mauris feugiat dignissim.</p>
             <p class="g-ptag">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pulvinar rhoncus risus, vel ornare lacus sagittis sit amet. Duis vel sem magna. Proin pulvinar velit eleifend ligula ultrices vestibulum. Nunc posuere dolor eu mauris feugiat dignissim.</p>
         </div>
         </div>
   </div> -->
   
   <!--목표카드  -->
      <div class="container" style="float:left;">
        <section class="notif notif-notice">
          <h6 class="notif-title">운동단계</h6>
          <p>**님은 운동**단계를 선택하셨습니다.</p>
        </section>
        <section class="notif notif-notice">
          <h6 class="notif-title">선택한 운동</h6>
          <p>**님은 ***, ***, ***, *** 운동을 선택하셨습니다</p>
        </section>
        <section class="notif notif-warn">
          <h6 class="notif-title">Warning!</h6>
          <p>**님의 몸무게는** kg입니다. 현재 목표 감량 칼로리는 **입니다.</p>
        </section>
   </div>
   
   
   
   
   
   
   
   
   
   


<!-- calendar -->

<div class="calendar" id="calendar-app" style="height:57%; float:left; margin-left:100; width:43%; ">
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
//           _errors = true;
//           this.dayEventAddForm.startTime.classList.add("add-event-edit--error");
      //   } else {
//            this.dayEventAddForm.startTime.classList.remove("add-event-edit--error");
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
      
      
      /* progress */
      
   var forEach = function (array, callback, scope) {
      for (var i = 0; i < array.length; i++) {
         callback.call(scope, i, array[i]);
      }
   };
   
      var max = -219.99078369140625;
      forEach(document.querySelectorAll('.progress'), function (index, value) {
      percent = value.getAttribute('data-progress');
         value.querySelector('.fill').setAttribute('style', 'stroke-dashoffset: ' + ((100 - percent) / 100) * max);
         value.querySelector('.value').innerHTML = percent + '%';
      });
   


      
</script>
</body>
</html>