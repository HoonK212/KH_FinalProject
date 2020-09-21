<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<!-- TAILWIND -->
<link  rel="stylesheet" href="https://unpkg.com/tailwindcss@1.5.2/dist/tailwind.min.css">
<link rel="stylesheet" href="https://unpkg.com/tailwindcss@^1.0/dist/tailwind.min.css">

<!--모달  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Daily Home Training</title>
<link rel="shortcut icon" href="<%=request.getContextPath() %>/resources/image/logo.png">

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
/* body {background-color:#eee} */
#contents {
  position: relative;
  transition: .3s;
  margin-left: 290px;
  background-color: #2a2b3d;
}
.margin {
  margin-left: 0 !important;
}





/* Start media query */

<!--shopping cart -->
* {
  box-sizing: border-box;
}

html {
  font-size: 12px;
}

body {
  /* margin: 20px 0;
  padding: 0; */
  font-family: arial, sans-serif;
  overflow: scroll;
}

img {
  max-width: 100%;
  vertical-align: middle;
  border-radius: 4px;
}

a {
  text-decoration: none;
  color: #333333;
}

a:hover {
  color: #f58551;
}

button {
  background-color: #16cc9b;
  border: 2px solid #16cc9b;
  color: #ffffff;
  transition: all 0.25s linear;
  cursor: pointer;
}

button::after {
  position: relative;
  right: 0;
  content: " \276f";
  transition: all 0.15s linear;
}

button:hover {
  background-color: #f58551;
  border-color: #f58551;
}

button:hover::after {
  right: -5px;
}

button:focus {
  outline: none;
}

ul {
  padding: 0;
  margin: 0;
  list-style-type: none;
}

input {
  transition: all 0.25s linear;
}

input[type="number"]::-webkit-inner-spin-button,
input[type="number"]::-webkit-outer-spin-button {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  margin: 0;
}

input {
  outline: none;
}

.container {
  width: 100%;
  margin: 0 auto;
  overflow: auto;
}

/* --- HEADER --- */
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

/* --- PRODUCT LIST --- */
.products {
   border-top: 1px solid #ddd; 
   border-bottom: 1px solid #ddd; 
}

.products > li {
  padding: 1rem 0;
  border-bottom: 1px solid #ddd;
}

.prod_row {
  position: relative;
  overflow: auto;
  width: 100%;
}

.col,
.quantity,
.remove {
  float: left;
}

.col.left {
  width: 70%;
}

.col.right {
  width: 30%;
  position: absolute;
  right: 0;
  top: calc(50% - 30px);
}

.detail {
  padding: 0 0.5rem;
  line-height: 2.2rem;
}

.detail .name {
  font-size: 1.3rem;
  font-weight: bold;
}

.detail .description {
  color: #7d7d7d;
  font-size: 1rem;
}
.detail .o_no{
  color: #7d7d7d;
  font-size: 1rem;
}

.detail .price {
  font-size: 1.5rem;
  font-weight: bold;
}

.quantity,
.remove {
  width: 40%;
  text-align: center;
}

.remove svg {
  width: 60px;
  height: 60px;
}

.quantity > input {
  display: inline-block;
  width: 60px;
  height: 60px;
  position: relative;
  left: calc(50% - 30px);
  background: #fff;
  border: 2px solid #ddd;
  color: #7f7f7f;
  text-align: center;
  font: 600 1.5rem Helvetica, Arial, sans-serif;
}

.quantity > input:hover,
.quantity > input:focus {
  border-color: #f58551;
}

.close {
  fill: #7d7d7d;
  transition: color 150ms linear, background-color 150ms linear,
    fill 150ms linear, 150ms opacity linear;
  cursor: pointer;
}

.close:hover {
  fill: #f58551;
}

/* --- SUMMARY --- */
.promotion,
.summary,
.checkout {
  float: left;
  width: 100%;
  margin-top: 1.5rem;
}

.promotion > label {
  float: left;
  width: 100%;
  margin-bottom: 1rem;
}

.promotion > input {
  float: left;
  width: 80%;
  font-size: 1rem;
  padding: 0.5rem 0 0.5rem 1.8rem;
  border: 2px solid #16cc9b;
  border-radius: 2rem 0 0 2rem;
}

.promotion:hover > input {
  border-color: #f58551;
}

.promotion > button {
  float: left;
  width: 20%;
  height: 2.4rem;
  border-radius: 0 2rem 2rem 0;
}

.promotion:hover > button {
  border-color: #f58551;
  background-color: #f58551;
}

.promotion > button::after {
  content: "\276f";
  font-size: 1rem;
}

.summary {
  font-size: 1.2rem;
  /* text-align: right; */
}

.summary ul li {
  padding: 0.5rem 0;
}

.summary ul li span {
  /* display: inline-block; */
  width: 30%;
}

.summary ul li.total {
  font-weight: bold;
}

.checkout {
  text-align: right;
}

.checkout > button {
  font-size: 1.2rem;
  padding: 0.8rem 2.8rem;
  border-radius: 1.5rem;
}

/* .empty-product {
  text-align: center;
}

.empty-product > button {
  font-size: 1.3rem;
  padding: 10px 30px;
  border-radius: 5px;
}
 */

/* /* --- MEDIUM & LARGE SCREEN --- */
@media all and (min-width: 600px) {
  html {
    font-size: 14px;
  }

  .container {
    width: 75%;
   /*  max-width: 960px; */
  }

  .thumbnail,
  .detail {
    float: left;
  }

 .detail > div {
	margin-top: 5;
	margin-bottom: 5;
 }


  .thumbnail {
/*     width: 35%; */
  }

  .detail {
    width: 65%;
  }

  .promotion,
  .summary {
    width: 50%;
  }

  .checkout {
    width: 100%;
  }

  .checkout,
  .summary {
    text-align: right;
  }
  
  .summary{
     padding-left: 760px;
  }
}

/* --- LARGE SCREEN --- */
/* @media all and (min-width: 992px) {
  html {
    font-size: 16px;
  }
} */
 

/* button  */
/* Button */
    .button {
      display: inline-block;
      position: relative;
      width: 120px;
      height: 32px;
      line-height: 32px;
      border-radius: 2px;
      font-size: 0.9em;
      background-color: #fff;
      color: #646464;
    }
    
    .button > paper-ripple {
      border-radius: 2px;
      overflow: hidden;
    }
    
  
   .button.green {
      background-color: #0f9d58;
      color: #fff;
    }
    
    .button.raised {
      transition: box-shadow 0.2s cubic-bezier(0.4, 0, 0.2, 1);
      transition-delay: 0.2s;
      box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
    }
    
    .button.raised:active {
      box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2);
      transition-delay: 0s;
    }
    
  
     /* Misc */
    .modal-btn {
      text-align: center;
    }
    
    
/*modal  */   
 
body {
/*   padding: 30px; */
}
#leftSide {
  background-color: #dbe3ff;
  height: 600px;
}
#mainContent {
  background-color: #fff5d4;
  height: 600px;
  padding-top: 20px;
}
.rsButtons {
  padding-top: 30px;
}
/* custom style for  validation method required. See ditails and classes name in developers tool */
.error {
  color: red;
  font-size: 0.8em;
}










.star-box {
	/* 별과 별 사이 공백 제거 */
    font-size: 0;
}

.star {
	/* width,height 적용가능하도록 변경 */
	display: inline-block;

	/* 별이 표현되는 영역 크기 */
	width: 25px;
    height: 55px;

	/* 투명한 별 표현 */
	background-image: url("/resources/image/mypage/star33.gif");
	background-repeat: no-repeat;
}

.star_left {
	/* 왼쪽 별 */
	background-position: 0 0;
	background-size: 200%;
}

.star_right {
	/* 오른쪽 별 */
	background-position: 100% 0;
	background-size: 200%;
}

.on {
	/* 채워진 별로 이미지 변경 */
	background-image: url("/resources/image/mypage/star44.gif");
}

</style>
</head>


<body>

<!-- 사이드 네비 메뉴 -->
<%@include file="/WEB-INF/views/mypage/navi.jsp" %>


<div id="app" style="padding-left:150">
<!-- Header -->
  <header class="container">
    <h1 style="font-weight: bold;">구매목록</h1>
    <ul class="breadcrumb" style="padding: 0px 0px;">
      <li>마이페이지</li>
      <li>구매목록</li>
    </ul>
    <span class="count" style="background-color:rgb(284, 130, 127); color: white; font-weight: bold;"> 총 ${totalamount }EA 구매 </span>
  </header>
  <!-- End Header -->
  
  
  
  <!-- Product List -->
  <section class="container">
    
    <div v-if="products.length > 0">
      <ul class="products">
      	
	    <c:forEach items="${olist }" var="order">
      	<li class="prod_row" v-for="(product, index) in products" >
        
        <div class="col left">
          
          <div class="thumbnail" style="margin-right: 15">
              <img src="<%=request.getContextPath()%>/resources/upload_product/${order.renamed }.${order.ext}" style="width: 210px; height: 140px;"/>
          </div>
          
          <div class="detail" >
			<div class="o_no">주문번호 : ${order.o_no }</div>
            <div class="description">주문일자 : <fmt:formatDate value="${order.dates }" pattern="yyyy-MM-dd"/></div>
            <div class="name">${order.name }</div>
            <div class="price"><fmt:formatNumber pattern="#,###" value="${order.price * order.amount }" />원</div>
            
            <!-- ### 숨겨놓은 데이터 ### -->
            <!-- 상품코드  -->
            <div class="code" style="display:none">${order.code }</div>
            <!-- 상품주문 번호 -->
            <div class="op_no" style="display:none">${order.op_no }</div>
            <!-- 주문 번호 -->
            <div class="o_no"  style="display:none">${order.o_no }</div>
			
			<!-- 후기 작성 모달 -->
			<c:if test="${order.status eq 3 }">
				<c:choose>
					<c:when test="${empty order.review }">
						<div  class="button raised btnModal1" data-toggle="modal" style="width:32%;  margin-top:10px; color: white; background-color: #48bb78;">
			               <div class="modal-btn bg-indigo-800" style="cursor: pointer;" >후기</div>
						</div> 
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</c:if>
          </div>

        </div>

        <div class="col right" style="display:flex; justify-content: end; align-items: center;">
          <div class="quantity">
            <input type="number" class="quantity" step="1" value="${order.amount }" @input="updateQuantity(index, $event)" @blur="checkQuantity(index, $event)" readonly />
          </div>
          
          <div class="remove">
			 <c:if test="${order.status eq 1 }">
             <span style="line-height:4; color: #00BFFF;">상품준비중</span>
          	 </c:if>
			 <c:if test="${order.status eq 2 }">
             <span style="line-height:4; color: #FF69B4;">배송중</span>
          	 </c:if>
			 <c:if test="${order.status eq 3 }">
             <span style="line-height:4; color: #B22222;">배송완료</span>
          	 </c:if>
			 <c:if test="${order.status eq 4 }">
             <span style="line-height:4; color: red;">주문취소</span>
          	 </c:if>
			 <c:if test="${order.status eq 5 }">
             <span style="line-height:4; color: red;">반품접수</span>
          	 </c:if>
			 <c:if test="${order.status eq 6 }">
             <span style="line-height:4; color: #DC143C;">반품완료</span>
          	 </c:if>
          </div>
          
          <c:choose>
          <c:when test="${order.status eq 1 }">
          	<div id="info" class=" info btnModal2 button raised" data-toggle="modal" style="width:34%; margin-left: 20; color: white;  background-color: #48bb78;" >
             <div fit class="modal-btn bg-indigo-800" style="cursor:pointer;">주문취소</div>
          	</div>
          </c:when>
          <c:when test="${order.status eq 3 }">
          	 <div id="info" class=" info btnModal3 button raised" data-toggle="modal" style="width:34%; margin-left: 20; color: white; background-color: #48bb78;" >
             <div fit class="modal-btn bg-red-500" style="cursor:pointer;">반품</div>
          	 </div>
          </c:when>
          <c:otherwise>
          	 <div style="width:34%; margin-left: 20" >
             <div></div>
          	 </div>
          </c:otherwise>
          </c:choose> 
        </div>
             
		</li>
	  	</c:forEach>
	
	</ul>
	</div>
    

  </section>
  <!-- End Product List -->
  	
			<!-- section pagination -->
			<div class="px-5 py-5 border-t flex flex-col xs:flex-row items-center xs:justify-between" >
			<div class="inline-flex mt-2 xs:mt-0">
			<div class="flex flex-col items-center">	
			<div class="flex text-gray-700">	
		        
		        <c:choose>
		        	<c:when test="${page.blockStart > 1 }">
		         		<a href="<%= request.getContextPath() %>/mypage/orderlist?cPage=${page.blockStart-1}" class="nav prev">
		         			<div class="h-8 w-8 mr-1 flex justify-center items-center  cursor-pointer">
					            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" 
					            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" 
					            class="feather feather-chevron-left w-4 h-4">
					                <polyline points="15 18 9 12 15 6"></polyline>
					            </svg>
							</div>
		         		</a>
		        	</c:when>
		        	<c:otherwise>
		         		<a href="<%= request.getContextPath() %>/mypage/orderlist?cPage=${page.blockStart}" class="nav prev">
							<div class="h-8 w-8 mr-1 flex justify-center items-center  cursor-pointer">
					            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" 
					            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" 
					            class="feather feather-chevron-left w-4 h-4">
					                <polyline points="15 18 9 12 15 6"></polyline>
					            </svg>
							</div>	        		
		        		</a>
		        	</c:otherwise>
		        </c:choose>
		       
		        <div class="flex h-8 font-medium">
		        <c:forEach begin="${page.blockStart}" end="${page.blockEnd}" var="pagenation">
		        
         		<a href="<%= request.getContextPath() %>/mypage/orderlist?cPage=${pagenation}" class="nav prev">
	         		<c:choose>
		       	   		<c:when test="${page.currentPage eq pagenation }">
			       	    	<div class="w-8 md:flex justify-center items-center cursor-pointer leading-5 transition duration-150 ease-in border-t-2 border-orange-600 text-lg" >${pagenation}</div>
		       	   		</c:when>
			       	    <c:otherwise>
			       	    	<div class="w-8 md:flex justify-center items-center cursor-pointer leading-5 transition duration-150 ease-in border-t-2 border-transparent text-lg">${pagenation}</div>
			       	    </c:otherwise>
		       	 	</c:choose>
		         </a>
		        
		        </c:forEach> 
	        	</div>
	        	
	        	
		        <c:choose>
		        	<c:when test="${page.blockEnd+1 > page.lastPage }">
		         		<a href="<%= request.getContextPath() %>/mypage/orderlist?cPage=${page.blockEnd}" class="nav prev">
		         			<div class="h-8 w-8 ml-1 flex justify-center items-center  cursor-pointer">
					            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" 
					            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" 
					            class="feather feather-chevron-right w-4 h-4">
					                <polyline points="9 18 15 12 9 6"></polyline>
					            </svg>
							</div>
		         		</a>
		        	</c:when>
		        	<c:otherwise>
		         		<a href="<%= request.getContextPath() %>/mypage/orderlist?cPage=${page.blockEnd+1}" class="nav prev">
					        <div class="h-8 w-8 ml-1 flex justify-center items-center  cursor-pointer">
					            <svg xmlns="http://www.w3.org/2000/svg" width="100%" height="100%" fill="none" viewBox="0 0 24 24" 
					            stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" 
					            class="feather feather-chevron-right w-4 h-4">
					                <polyline points="9 18 15 12 9 6"></polyline>
					            </svg>
					        </div>	         		
		         		</a>
		        	</c:otherwise>
		   	   	</c:choose>
	 	   	 

	   	  	</div>
	   	  	  <span class="text-xs xs:text-sm text-gray-900 ">
              	Showing ${page.blockStart } to ${page.blockEnd } of ${page.lastPage }
              </span>
	   	  	</div>
	   	  	</div>
	   	  	</div>
   	  		<!-- // section pagination -->
  
  
</div>

<!-- 평점모달 -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel" >후기작성</h4>
      </div>
<form class="form-horizontal" method="post" action="<%= request.getContextPath() %>/mypage/insertreview">
      <div class="modal-body">

   <div class="form-group">
      <label for="productname" class="col-sm-3 control-label">상품이름</label>
      <div class="col-sm-9">
         <input type="text" id="productname" name="name" class="form-control" readonly/>
      </div>
   </div>
   <div class="form-group">
      <label for="productcode" class="col-sm-3 control-label">상품코드</label>
      <div class="col-sm-9">
         <input type="text" id="productcode" name="code" class="form-control" readonly/>
      </div>
   </div>
   <div class="form-group">
   <label for="productscore" class="col-sm-3 control-label">상품평점</label>
   
   <!-- 별점을 이용한 스코어 -->
   <input type="hidden" id="productscore" name="score" />
   <div class="star-box col-sm-9" style="width:75%;">
		<span class="star star_left"></span>
		<span class="star star_right"></span>
		<span class="star star_left"></span>
		<span class="star star_right"></span>
		<span class="star star_left"></span>
		<span class="star star_right"></span>
		<span class="star star_left"></span>
		<span class="star star_right"></span>
		<span class="star star_left"></span>
		<span class="star star_right"></span>
   </div>
   </div>
   <div class="form-group"> 
      <label for="comments" class="col-sm-3 control-label">후기내용</label>
	  <div class="col-sm-9"> 
	     <textarea name="review" class="form-control" rows="5" cols="40"></textarea>
	  </div>
   </div>
   	
   		<!-- 상품주문 번호  -->
      <input type="hidden" id="op_no" name="op_no" />
    
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary">작성</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>
   </form>
    </div>
  </div>
</div>

<!-- 취소모달 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">구매 취소</h4>
      </div>
<form class="form-horizontal" method="get" action="<%= request.getContextPath() %>/mypage/cancelorder">
      <div class="modal-body">
   <div class="form-group"> 
      <lable for="comments" class="col-sm-9 control-lable">정말 구매를 취소하시겠습니까?</lable>
   </div>
   		<!-- 주문 번호  -->
      <input type="hidden" id="cancelorder" name="op_no" />
    
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary">구매 취소</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
   </form>
    </div>
  </div>
</div>

<!-- 반품모달 -->
<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">반품 신청</h4>
      </div>
<form class="form-horizontal" method="get" action="<%= request.getContextPath() %>/mypage/submitreturn">
      <div class="modal-body">

   <div class="form-group"> 
      <lable for="comments" class="col-sm-3 control-lable">반품 사유를 작성해주세요</lable>
	  <div class="col-sm-9"> 
	     <textarea name="reason" class="form-control" rows="5" cols="40"></textarea>
	  </div>
   </div>
   	
   		<!-- 주문 번호  -->
      <input type="hidden" id="submitreturn" name="op_no" />
    
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary">반품 신청</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
   </form>
    </div>
  </div>
</div>

      
   
<script>

$(document).ready(function(){
    $(".btnModal1").click(function(e){
        $("#myModal1").modal();
		
        $('#productname').val( $(this).closest('.detail').children('.name').text() ); 
		$('#productcode').val( $(this).closest('.detail').children('.code').text() ); 
		$('#op_no').val( $(this).closest('.detail').children('.op_no').text() ); 
    });

    $(".btnModal2").click(function(e){
        $("#myModal2").modal();
        
        $('#cancelorder').val( $(this).parent('.col').prev('.col').children('.detail').children('.op_no').text() );
		
    });

    $(".btnModal3").click(function(e){
        $("#myModal3").modal();
        
        $('#submitreturn').val( $(this).parent('.col').prev('.col').children('.detail').children('.op_no').text() );
	
    });
});

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

	var idx = 0;
	var updatescore = 0;
	
	//별 클릭 이벤트
	$(".star").click(function() {
		
		//클릭된 별이 몇 번째 칸인지 알아내기
		idx = $(this).index();
		
		//모두 투명하게 만들기
		$(".star").removeClass("on");
		
		//클릭이 된 곳까지 채워진 별로 만들기
		for(var i=0; i<=idx; i++) {
			$(".star").eq(i).addClass("on");
		}
		
		console.log("클릭된 별의 위치 : " + idx)
		console.log("점수로 변환 : " + (idx+1)/2)
		updatescore = (idx+1)/2;
		console.log("수정한 점수 : " + updatescore);
		
		$('#productscore').attr('value', updatescore);
	});
   
</script>
</body>
</html>