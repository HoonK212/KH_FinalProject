<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%@include file="../layout/shopping_header.jsp" %>

<link href="https://tailwindcomponents.com/css/component.ecommerce-product.css" rel="stylesheet">
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<style type="text/css">
#wrap{
  font-size:70%;
}

#product_layout_3 .product_image{
  display:block;
  box-sizing:border-box;
  width:40%;
  float:left;
}
#product_layout_3 .product_image .main_image img{
  margin:0 auto;
  border-radius:2px;
}
#product_layout_3 .product_desc{
  width:50%;
  float:left;
  margin-left:10%;
  min-height:660px;
}
#product_layout_3 .product_desc h1{
  font-size:3.6em;
  font-weight:500;
}
#product_layout_3 .product_desc .price{
  display:block;
  font-size:2.4em;
  color:#ccc;
  text-decoration:line-through;
}
#product_layout_3 .product_desc .sale_price{
  display:block;
  font-size:2.8em;
  color:crimson;
  font-weight:700;
}
#product_layout_3 .product_desc .stars{
  display:block;
  font-size:2em;
  color:goldenrod;
  margin-top:5px;
}
#product_layout_3 .product_options .select{
  width: 100%;
  max-width:300px;
  height: 40px;
  overflow: hidden;
  background: url('https://i.imgur.com/10e9Roz.png') no-repeat right #FFF;
  border: 1px solid #ccc;
  border-radius:2px;
  margin-top:15px;  
}
#product_layout_3 .product_options select{
  background: transparent;
  display:block;
  width: 268px;
  padding: 5px;
  font-size: 2em;
  line-height: 1;
  border: 0;
  border-radius:0;
  height: 40px;
  -webkit-appearance: none;
}
#product_layout_3 .buying{
  max-width:300px;
  width:100%;
  display:block;
}
#product_layout_3 .buying .quantity{
  font-size:2em;
  margin-top:15px;
  width:35%;
  float:left;
  display:block;
}
#product_layout_3 .buying .quantity [type="text"]{
  width:40px;
  height:40px;
  border:1px solid #ccc;
  border-radius:2px;
  padding:10px;
  box-sizing:border-box;
  font-size:1em;
}
#product_layout_3 .buying .cart{
  margin-top:25px;
  width:65%;
  float:left;
  margin-bottom:20px;
}
#product_layout_3 .buying .cart a.add{
  font-size:2em;
  float:right;
  color:#FFF;
  background:skyblue;
  text-decoration:none;
  padding:10px 20px;
  margin-top:-10px;
  border-radius:2px;
}
#product_layout_3 .product_desc .other_options{
  color:#aaa;
  display:block;
  float:left;
  width:100%;
  min-height:30px;
  margin-bottom:15px;
}
#product_layout_3 .product_desc .other_options span{
  display:block;
}
#product_layout_3 .product_desc .description{
  font-size:1.4em;
  display:block;
  width:100%;
  clear:both;
}
#product_layout_3 .product_desc .social{
  font-size:1.4em;
  line-height:1.2;
  margin-bottom:15px;
  width:60%;
  display:block;
  margin:15px 0px;
}
#product_layout_3 .product_desc .social .share{
  margin-top:-5px;
  margin-bottom:15px;
}
#product_layout_3 .product_desc .buttons{
  margin-top:20px;
  margin-left:10px;
  display:inline-block;
  width:30%;
}
#product_layout_3 .tabular{
  display:block;
  margin-top:20px;
  width:100%
}
#product_layout_3 .tabular ul.tabs {
	width: 50%;
	height: 85px;
	list-style: none;
	overflow: hidden;
  padding: 0;
}
#product_layout_3 .tabular ul.tabs li {	
	float: left;
	width: 32%;
  margin-right:1%;
}
#product_layout_3 .tabular ul.tabs li a {
  border-top:1px solid #808080;
  border-left:1px solid #808080;
  border-right:1px solid #808080;
  	display: block;
	margin-top: 40px;	
	padding: 10px 0 0 0;
	font-size: 1.5em;
	text-align: center;	
	text-decoration: none;
	color: #black;
  border-top-left-radius: 3px;
  border-top-right-radius: 3px;
}
#product_layout_3 .tabular .tabs li:first-child a {
  border-top-left-radius: 3px;
}
#product_layout_3 .tabular .tabs li:nth-child(2) a {
}
#product_layout_3 .tabular .tabs li:last-child a {
  border-top-right-radius: 3px;
}
#product_layout_3 .tabular ul.tabs li a.active {
	background: white;
}
#product_layout_3 .tabular .group:after {
   clear: both;
}
#product_layout_3 .tabular #content {
  width: 100%;
  min-height: 200px;
  background: #white;
  border-bottom-right-radius: 3px;
  border-bottom-left-radius: 3px;
  border-top-right-radius:3px;
  padding:2em;
  float:left;
  margin-top:-10px;
  border:1px solid #808080;
  border-top:0;
  margin-bottom:30px;
  box-sizing:border-box;
  -moz-box-sizing:border-box;
}
#product_layout_3 .tabular #content p{
  color: #black;
  font-weight:500;
  font-size: 1.4em;
  margin: 10px;
}
#product_layout_3 .tabular #content #one .images{
  width:45%;
  float:left;  
}
#product_layout_3 .tabular #content #one{
  -webkit-columns: 2;
  -moz-columns: 2;
}
#product_layout_3 .tabular #content #two .author{
  font-size:1.6em;
  font-weight:700;
  color:#FFF;
  display:inline-block;
  margin:10px;
}
#product_layout_3 .tabular #content #two .stars{
  font-size:1.8em;
  color:goldenrod;
  display:inline-block;
  margin:10px;
}
#product_layout_3 .tabular #content #two span.full_review a{
  font-size:1.4em;
  display:block;
  color:skyblue;
  text-align:center;
}
#product_layout_3 .tabular #content #two span.write_review a{
  font-size:1.4em;
  color:skyblue;
  text-align:center;
  display:block;
  margin-top:10px;
}
#product_layout_3 .tabular #content #three .images{
  width:45%;
  float:left;
  display:block;
  margin-right:5%;
  -moz-columns:2;
  -webkit-columns:2;
  height:auto;
}
#product_layout_3 .tabular #content #three .images img{
  width:100px;
  margin-top:20px;
  margin-left:auto;
  margin-right:auto;
  display:block;
}
#product_layout_3 .tabular #content #three .details{
  width:45%;
  float:left;
  margin-left:5%;
  height:auto;
}
@media (max-width:500px){
  #product_layout_3 .product_image{
    width:100%;
    margin-left:0;
    margin-right:0;
  }
   #product_layout_3 .product_desc{
     width:100%;
     margin-left:0;
     margin-right:0;
   }
  #product_layout_3 .tabular ul.tabs {
	width: 100%;
  }
  #product_layout_3 .tabular #content #three{
     height:auto;
    display:block;
  }
  #product_layout_3 .tabular #content #one,
  #product_layout_3 .tabular #content #three .images,
  #product_layout_3 .tabular #content #three .details{
  width:100%;
  float:none;
  -moz-columns:1;
  -webkit-columns:1;
}
  #product_layout_3 .buying .quantity{
    width:35%;
  }
  #product_layout_3 .buying .cart{
    width:65%;
  }
</style>

    <main class="my-5 py-3">
        <div class="container mx-auto px-6">
            <div class="md:flex md:items-center">
	<div class="w-full h-64 md:w-1/2 lg:h-96">
		<img class="h-full w-full rounded-md object-cover max-w-lg mx-auto" src="https://images.unsplash.com/photo-1578262825743-a4e402caab76?ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80" alt="Nike Air">
	</div>
	<div class="w-full max-w-lg mx-auto mt-5 md:ml-8 md:mt-0 md:w-1/2">
	
		<h3 class="text-2xl text-gray-700 uppercase text-lg">${detail.name }</h3>
		<div class="flex items-center">
			<div class="flex items-center mt-2 mb-4">
				<c:if test="${avg ne 0 }">
					<c:forEach begin="0" end="${avg }">
						<svg class="mx-1 w-4 h-4 fill-current text-yellow-500" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09 1.123-6.545L.489 6.91l6.572-.955L10 0l2.939 5.955 6.572.955-4.756 4.635 1.123 6.545z"/></svg>
					</c:forEach>
				</c:if>
				<c:forEach begin="0" end="${4-avg }">
					<svg class="mx-1 w-4 h-4 fill-current text-gray-400" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M10 15l-5.878 3.09 1.123-6.545L.489 6.91l6.572-.955L10 0l2.939 5.955 6.572.955-4.756 4.635 1.123 6.545z"/></svg>
				</c:forEach>
			</div>
		</div>
		
 		<span class="text-gray-700 mt-3">${detail.price }원</span>
		<hr class="my-3">
		<div class="mt-2">
			<div class="flex items-center mt-1 py-2">
				<input type="hidden" value="${detail.code }" id="code">
				<label class="text-gray-700 text-sm mr-3" for="count">Count:</label>
				<input type="number" min="1" value="1" name="amount" id="amount"
				class="text-center text-gray-700 bg-gray-200 outline-none focus:outline-none hover:text-black focus:text-black" />
			</div>
		</div>
		<div class="flex items-center mt-6">
			<input type="hidden" id="userId" value="${logInInfo.id }"/>
			<!-- 주문하기 -->
			<button onclick="sendOrder();" class="px-8 py-2 bg-indigo-600 text-white text-sm font-medium rounded hover:bg-indigo-500 focus:outline-none focus:bg-indigo-500">주문하기</button>
			<!-- 장바구니 담기 -->
			<button onclick="sendBasket();" class="mx-2 text-gray-600 border rounded-md p-2 hover:bg-gray-200 focus:outline-none">
				<svg class="h-5 w-5" fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"><path d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 2a2 2 0 11-4 0 2 2 0 014 0z"></path></svg>
			</button>
		</div>
	</div>
</div>
            
<div id="wrap" class="py-3">
  <div id="product_layout_3">
      <div class="tabular">
        <ul class="tabs group">
          <li><a href="#/one" class="hover:bg-gray-500">상세정보</a></li>
          <li><a href="#/two" class="hover:bg-gray-500">리뷰</a></li>
          <li><a href="#/three" class="active">Q&A</a></li>
        </ul>
          <div id="content">
          
            <aside id="one">
            <div>
	            <p>${detail.describe }</p>
            </div>
            </aside>
            
            <aside id="two"><!-- 리뷰 리스트명 reviews -->
            	<c:if test="${empty reviews }">
					<p class="py-2 text-center font-semibold text-blue-700">리뷰가 없습니다</p>
				</c:if>
				<c:if test="${not empty reviews }">
				<c:forEach items="${reviews }" var="review">
					<div>
					
					
					</div>
				</c:forEach>
				</c:if>
            </aside>
            
            <aside id="three">
              <div class="images">
<!--                 <img src="사진"/> -->
              </div>
              <div class="details">
              <p>Excuse me. I'll call you tonight. Right. Yeah, I think maybe you do. Wait a minute, wait a minute, Doc, are you telling me that you built a time machine out of a delorean.</p>
              <p>Um, well it's a delorean, right? Yeah okay. Wow, ah Red, you look great. Everything looks great. 1:24, I still got time. Oh my god. No, no not again, c'mon, c'mon. Hey. Libyans. Yeah, well uh, lets keep this brain melting stuff to ourselves, okay? Yeah, yeah what are you wearing, Dave</p>
              </div>
              </aside>
              
          </div>
      </div>
    </div>
  </div>
            
            
            <div class="mt-16">
				<h3 class="text-gray-600 text-2xl font-medium">더 보기</h3>
				<div class="grid gap-6 grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 mt-6">
                
					<c:forEach items="${list}" var="item" begin="0" end="3">
						<div class="w-full max-w-sm mx-auto rounded-md shadow-md overflow-hidden">
							<a href="/shopping/detail?code=${item.code }">
								<div class="flex items-end justify-end h-56 w-full bg-cover" style="background-image: url('https://images.unsplash.com/photo-1495856458515-0637185db551?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80')"></div>
							</a>
							<div class="px-5 py-3">
								<h3 class="text-gray-700 uppercase"><a href="/shopping/detail?code=${item.code }">${item.name}</a></h3>
								<span class="text-gray-500 mt-2">${item.price}</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
        </div>
    </main>

<script type="text/javascript">
const sendOrder = () => {
	var orderForm = document.createElement("form");
	orderForm.setAttribute("method", "get");
	orderForm.setAttribute("action", "<%=request.getContextPath()%>/shopping/payment");
	
	var code = document.createElement("input"); 
	code.setAttribute("type", "hidden"); 
	code.setAttribute("name", "codes"); 
	code.setAttribute("value", document.querySelector("#code").value);
	
	var amount = document.createElement("input"); 
	amount.setAttribute("type", "hidden"); 
	amount.setAttribute("name", "amount"); 
	amount.setAttribute("value", document.querySelector('#amount').value);
	
	var userId = document.createElement("input"); 
	userId.setAttribute("type", "hidden"); 
	userId.setAttribute("name", "userId"); 
	userId.setAttribute("value", document.querySelector('#userId').value);
	
	orderForm.appendChild(code);
	orderForm.appendChild(amount);
	orderForm.appendChild(userId);
	
	document.body.appendChild(orderForm); 
	orderForm.submit();
}

//장바구니 추가
const sendBasket = () => {
	var basketForm = document.createElement("form");
	basketForm.setAttribute("method", "post");
	basketForm.setAttribute("action", "<%=request.getContextPath()%>/shopping/basket");
	
	var code = document.createElement("input"); 
	code.setAttribute("type", "hidden"); 
	code.setAttribute("name", "codes"); 
	code.setAttribute("value", document.querySelector("#code").value);
	
	var amount = document.createElement("input"); 
	amount.setAttribute("type", "hidden"); 
	amount.setAttribute("name", "amount"); 
	amount.setAttribute("value", document.querySelector('#amount').value);
	
	var userId = document.createElement("input"); 
	userId.setAttribute("type", "hidden"); 
	userId.setAttribute("name", "userId"); 
	userId.setAttribute("value", document.querySelector('#userId').value);
	
	basketForm.appendChild(code);
	basketForm.appendChild(amount);
	basketForm.appendChild(userId);
	
	document.body.appendChild(basketForm);
	
	send(event, basketForm);
}

const send = (e,form) => {
	fetch(form.action,{method:'post', body: new FormData(form)})
	.then(function(response) {
		if(response.ok) {
			var con_test = confirm("장바구니에 상품을 담았습니다. \n장바구니로 이동하시겠습니까?");
			if(con_test == true){
				location.href='<%=request.getContextPath()%>/shopping/basket';
			}
			else if(con_test == false){
				modalClose();
			}
		}
	});
	e.preventDefault();
}


(function($) {

	var tabs =  $(".tabs li a");
  
	tabs.click(function() {
		var content = this.hash.replace('/','');
		tabs.removeClass("active");
		$(this).addClass("active");
    $("#content > aside").hide();
    $(content).fadeIn(200);
	});

})(jQuery);
</script> 
<%@include file="../layout/shopping_footer.jsp" %>