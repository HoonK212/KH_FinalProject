/*
 * 
 * 장바구니
 * 
 * */

const modal = document.querySelector('.main-modal');
const closeButton = document.querySelectorAll('.modal-close');

const modalClose = () => {
	modal.classList.remove('fadeIn');
	modal.classList.add('fadeOut');
	setTimeout(() => {
		modal.style.display = 'none';
	}, 500);
}

const openModal = (code) => {
	modal.classList.remove('fadeOut');
	modal.classList.add('fadeIn');
	modal.style.display = 'flex';
	
	loadBody(code);
}

for (let i = 0; i < closeButton.length; i++) {
	const elements = closeButton[i];
	elements.onclick = (e) => modalClose();
	modal.style.display = 'none';
	window.onclick = function (event) {
		if (event.target == modal) modalClose();
	}
}
		
const loadBody = (code) => {
	var xhr = new XMLHttpRequest();
	xhr.open('GET', '<%=request.getContextPath()%>/shopping/modalload?code='+code);
	xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xhr.send();
	xhr.addEventListener('load', function() {
		var data = xhr.response;
		document.querySelector('#modalBody').innerHTML = data;
	});
}

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
