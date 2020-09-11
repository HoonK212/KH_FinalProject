<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- CSS -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/header.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/layout/footer.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/exercise/exercise.css">

<!-- HEADER -->
<%@include file="../layout/header.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">

$(document).ready(function() {
	
	$(".form-exercies").submit(function() {
		if( !($("input:checkbox[name='exercise']").is(":checked")) ) {
			alert("1개 이상을 선택해주세요")
			return false;
		}
		$(this).submit()
	})
	
	if( <%= session.getAttribute("exercise") %> != null) {
		$("input:radio[id='<%= session.getAttribute("exercise") %>']").prop("checked", true)
	}
});
</script>

<style>
.image-plank {
	background-image: url( "<%=request.getContextPath() %>/resources/image/exercise/Plank.jpg");
	background-size: cover;
	background-repeat: round;
}

.image-jumping-jack {
	background-image: url( "<%=request.getContextPath() %>/resources/image/exercise/Jumping-Jack.jpg");
	background-size: cover;
	background-repeat: round;
}

.image-burpee {
	background-image: url( "<%=request.getContextPath() %>/resources/image/exercise/Burpee(2).png");
	background-size: cover;
	background-repeat: round;
}

.exer-legraise {
	background-image: url( "<%=request.getContextPath() %>/resources/image/exercise/Leg-Raise.png");
	background-size: cover;
	background-repeat: round;
}

.exer-crunch {
	background-image: url( "<%=request.getContextPath() %>/resources/image/exercise/Crunch.png");
	background-size: cover;
	background-repeat: round;
}

.exer-pushup {
	background-image: url( "<%=request.getContextPath() %>/resources/image/exercise/Push-Up.jpg");
	background-size: cover;
	background-repeat: round;
}

.exer-kneepushup {
	background-image: url( "<%=request.getContextPath() %>/resources/image/exercise/Kneepushup.png");
	background-size: cover;
	background-repeat: round;
}

.exer-mountain {
	background-image: url( "<%=request.getContextPath() %>/resources/image/exercise/sidelunge.png");
	background-size: cover;
	background-repeat: round;
}

.exer-squat {
	background-image: url( "<%=request.getContextPath() %>/resources/image/exercise/Squat.png");
	background-size: cover;
	background-repeat: round;
}

.exer-lunge {
	background-image: url( "<%=request.getContextPath() %>/resources/image/exercise/Lunge.jpg");
	background-size: cover;
	background-repeat: round;
}

.animated {
	-webkit-animation-duration: 1s;
	animation-duration: 1s;
	-webkit-animation-fill-mode: both;
	animation-fill-mode: both;
}

.animated.faster {
	-webkit-animation-duration: 500ms;
	animation-duration: 500ms;
}

.fadeIn {
	-webkit-animation-name: fadeIn;
	animation-name: fadeIn;
}

.fadeOut {
	-webkit-animation-name: fadeOut;
	animation-name: fadeOut;
}

@keyframes fadeIn {
	from {
		opacity: 0;
	}

	to {
		opacity: 1;
	}
}

@keyframes fadeOut {
	from {
		opacity: 1;
	}

	to {
		opacity: 0;
	}
}
</style>

<section style="min-height:73vh;">

	<!-- MODAL START -->
	<div class="plank fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster">
		<div
			class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-xl mx-auto rounded shadow-lg z-50 overflow-y-auto">
			<div class="modal-content py-4 text-left px-6">
				<!--Title-->
				<div class="flex justify-between items-center pb-3">
					<p class="text-2xl font-bold">플랭크</p>
					<div class="modal-close1 cursor-pointer z-50">
						<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
							<path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
							</path>
						</svg>
					</div>
				</div>
				<!--Body-->
				<div class="my-5">
					<p>운동부위 : 전신</p>
					<p>소모칼로리 : 0.1kcal(초)</p>
					<p>운동세트 : 3세트</p>
					<p>운동개수 : 15개 / 23개 / 30개 / 38개 / 45개</p>
				</div>
				<div class="my-5">
					<p>1. 견갑골(날개뼈)과 쇄골은 전체적으로 뒤로 밀리지 않도록 단단히 고정시켜준다. 어깨는 방향이 지면과 수직을 이루도록 한다. 허리는 일직선을 만들고 고개도 들지 않는다.</p>
					<p>2. 엉덩이는 허리가 아래쪽으로 처지지 않도록 지속적으로 엉덩이 근육을 수축시키면서 긴장 상태를 유지해야 한다. 그래서 머리부터 발끝까지 일직선을 유지해야 한다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="jumping-jack fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster">
		<div
			class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-xl mx-auto rounded shadow-lg z-50 overflow-y-auto">
			<div class="modal-content py-4 text-left px-6">
				<!--Title-->
				<div class="flex justify-between items-center pb-3">
					<p class="text-2xl font-bold">점핑잭</p>
					<div class="modal-close2 cursor-pointer z-50">
						<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
							<path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
							</path>
						</svg>
					</div>
				</div>
				<!--Body-->
				<div class="my-5">
					<p>운동부위 : 전신</p>
					<p>소모칼로리 : 0.3kcal(개)</p>
					<p>운동세트 : 3세트</p>
					<p>운동개수 : 10개 / 15개 / 20개 / 25개 / 30개</p>
				</div>
				<div class="my-5">
					<p>1. 차렷 자세를 취합니다.</p>
					<p>2. 두 팔을 양옆으로 올리면서 두 발을 점프해서 벌립니다.</p>
					<p>3. 다시 차렷 자세로 돌아갑니다.</p>
					<p>4. 두 발을 점프해서 더 넓게 벌리면서 두 손은 머리 위로 올려 박수를 칩니다.</p>
					<p>5. 다시 차렷 자세로 돌아갑니다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="burpee fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster">
		<div
			class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-xl mx-auto rounded shadow-lg z-50 overflow-y-auto">
			<div class="modal-content py-4 text-left px-6">
				<!--Title-->
				<div class="flex justify-between items-center pb-3">
					<p class="text-2xl font-bold">버피</p>
					<div class="modal-close3 cursor-pointer z-50">
						<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
							<path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
							</path>
						</svg>
					</div>
				</div>
				<!--Body-->
				<div class="my-5">
					<p>운동부위 : 전신</p>
					<p>소모칼로리 : 2.5kcal(회)</p>
					<p>운동세트 : 3세트</p>
					<p>운동개수 : 5개 / 8개 / 10개 / 13개 / 15개</p>
				</div>
				<div class="my-5">
					<p>1. 무릎을 굽혀 바닥에 손을 집고 상체를 숙여줍니다.</p>
					<p>2. 다리를 뒤쪽으로 길게 뻗어 푸쉬업 자세를 만듭니다.</p>
					<p>3. 다리를 가슴쪽으로 다시 당깁니다.</p>
					<p>4. 차렷자세에서 점프를 합니다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="leg-raise fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster">
		<div
			class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-xl mx-auto rounded shadow-lg z-50 overflow-y-auto">
			<div class="modal-content py-4 text-left px-6">
				<!--Title-->
				<div class="flex justify-between items-center pb-3">
					<p class="text-2xl font-bold">레그레이즈</p>
					<div class="modal-close4 cursor-pointer z-50">
						<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
							<path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
							</path>
						</svg>
					</div>
				</div>
				<!--Body-->
				<div class="my-5">
					<p>운동부위 : 상체</p>
					<p>소모칼로리 : 0.5kcal(개)</p>
					<p>운동세트 : 3세트</p>
					<p>운동개수 : 5개 / 8개 / 10개 / 13개 / 15개</p>
				</div>
				<div class="my-5">
					<p>1. 무릎을 굽혀 바닥에 손을 집고 상체를 숙여줍니다.</p>
					<p>2. 다리를 들어올렸다면 숨을 들이마셔 복부에 공기를 채운다는 느낌으로 배에 힘을 줍니다.</p>
					<p>3. 다시 몸통과 같이 직각이 되도록 다리를 들어올립니다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="crunch fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster">
		<div
			class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-xl mx-auto rounded shadow-lg z-50 overflow-y-auto">
			<div class="modal-content py-4 text-left px-6">
				<!--Title-->
				<div class="flex justify-between items-center pb-3">
					<p class="text-2xl font-bold">크런치</p>
					<div class="modal-close5 cursor-pointer z-50">
						<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
							<path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
							</path>
						</svg>
					</div>
				</div>
				<!--Body-->
				<div class="my-5">
					<p>운동부위 : 상체</p>
					<p>소모칼로리 : 0.3kcal(개)</p>
					<p>운동세트 : 3세트</p>
					<p>운동개수 : 5개 / 8개 / 10개 / 13개 / 15개</p>
				</div>
				<div class="my-5">
					<p>1. 손은 머리 뒤로 가져간상태에서 천장을 보고 눕는다.</p>
					<p>2. 바닥에서 어깨가 살짝 떨어질 정도로만 왼쪽으로 상체를 일으켜 세우면서 호흡을 내쉰다.</p>
					<p>3. 바닥에서 어깨가 살짝 떨어질 정도로만 오른쪽으로 상체를 일으켜 세우면서 호흡을 내쉰다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="push-up fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster">
		<div
			class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-xl mx-auto rounded shadow-lg z-50 overflow-y-auto">
			<div class="modal-content py-4 text-left px-6">
				<!--Title-->
				<div class="flex justify-between items-center pb-3">
					<p class="text-2xl font-bold">푸쉬업</p>
					<div class="modal-close6 cursor-pointer z-50">
						<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
							<path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
							</path>
						</svg>
					</div>
				</div>
				<!--Body-->
				<div class="my-5">
					<p>운동부위 : 상체</p>
					<p>소모칼로리 : 0.3kcal(개)</p>
					<p>운동세트 : 3세트</p>
					<p>운동개수 : 7개 / 11개 / 15개 / 18개 / 21개</p>
				</div>
				<div class="my-5">
					<p>1. 팔을 어깨보다 살짝 넓게 벌려 바닥을 짚는다.</p>
					<p>2. 머리부터 발끝까지 일자를 유지한 채 가슴에 바닥이 닿을 정도로 내려간다.</p>
					<p>3. 복근을 포함한 코어 의 긴장감을 유지하면서 올라온다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="knee-push-up fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster">
		<div
			class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-xl mx-auto rounded shadow-lg z-50 overflow-y-auto">
			<div class="modal-content py-4 text-left px-6">
				<!--Title-->
				<div class="flex justify-between items-center pb-3">
					<p class="text-2xl font-bold">니 푸쉬업</p>
					<div class="modal-close7 cursor-pointer z-50">
						<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
							<path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
							</path>
						</svg>
					</div>
				</div>
				<!--Body-->
				<div class="my-5">
					<p>운동부위 : 상체</p>
					<p>소모칼로리 : 0.2kcal(개)</p>
					<p>운동세트 : 3세트</p>
					<p>운동개수 : 아직 데이터 없음 수정해야함</p>
				</div>
				<div class="my-5">
					<p>1. 양 팔을 어깨넓이의 두 배 정도로 벌려 바닥을 짚습니다.</p>
					<p>2. 팔을 굽혀 가슴이 바닥에 닿을 정도로 내려갑니다.</p>
					<p>3. 두 팔을 밀며 천천히 올라옵니다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="sidelunge fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster">
		<div
			class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-xl mx-auto rounded shadow-lg z-50 overflow-y-auto">
			<div class="modal-content py-4 text-left px-6">
				<!--Title-->
				<div class="flex justify-between items-center pb-3">
					<p class="text-2xl font-bold">사이드 런지</p>
					<div class="modal-close8 cursor-pointer z-50">
						<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
							<path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
							</path>
						</svg>
					</div>
				</div>
				<!--Body-->
				<div class="my-5">
					<p>운동부위 : 하체</p>
					<p>소모칼로리 : 0.1kcal(개)</p>
					<p>운동세트 : 3세트</p>
					<p>운동개수 : 10개 / 15개 / 20개 / 25개 / 30개</p>
				</div>
				<div class="my-5">
					<p>1. 골반너비의 약 2~3배 정도로 발을 벌려 양쪽 발끝은 정면을 향하여 11자가 되게 섭니다.</p>
					<p>2. 오른쪽 다리는 무릎을 굽히지 않고 다리를 곧게 피며 발바닥을 바닥에 밀착합니다. 남은 다리는 스쿼트를 하듯이 골반을 뒤로 빼며 앉습니다.</p>
					<p>3. 왼쪽 다리는 무릎을 굽히지 않고 다리를 곧게 피며 발바닥을 바닥에 밀착합니다. 남은 다리는 스쿼트를 하듯이 골반을 뒤로 빼며 앉습니다.</p>
					<p>4. 양쪽다리 모두 지탱하며 일어섭니다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="squat fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster">
		<div
			class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-xl mx-auto rounded shadow-lg z-50 overflow-y-auto">
			<div class="modal-content py-4 text-left px-6">
				<!--Title-->
				<div class="flex justify-between items-center pb-3">
					<p class="text-2xl font-bold">스쿼트</p>
					<div class="modal-close9 cursor-pointer z-50">
						<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
							<path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
							</path>
						</svg>
					</div>
				</div>
				<!--Body-->
				<div class="my-5">
					<p>운동부위 : 하체</p>
					<p>소모칼로리 : 0.2kcal(개)</p>
					<p>운동세트 : 3세트</p>
					<p>운동개수 : 6개 / 9개 / 12개 / 15개 / 18개</p>
				</div>
				<div class="my-5">
					<p>1. 발 각도는 대략 120도 정도로 고정시킵니다. 견갑골을 고정시켜 가슴을 폅니다.</p>
					<p>2. 엉덩이부터 천천히 내빼면서 서서히 내려갔다가 무릎까지 90도를 만든 다음에 올라옵니다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="lunge fixed w-full h-100 inset-0 z-50 overflow-hidden flex justify-center items-center animated fadeIn faster">
		<div
			class="border border-teal-500 shadow-lg modal-container bg-white w-11/12 md:max-w-xl mx-auto rounded shadow-lg z-50 overflow-y-auto">
			<div class="modal-content py-4 text-left px-6">
				<!--Title-->
				<div class="flex justify-between items-center pb-3">
					<p class="text-2xl font-bold">런지</p>
					<div class="modal-close10 cursor-pointer z-50">
						<svg class="fill-current text-black" xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
							<path d="M14.53 4.53l-1.06-1.06L9 7.94 4.53 3.47 3.47 4.53 7.94 9l-4.47 4.47 1.06 1.06L9 10.06l4.47 4.47 1.06-1.06L10.06 9z">
							</path>
						</svg>
					</div>
				</div>
				<!--Body-->
				<div class="my-5">
					<p>운동부위 : 하체</p>
					<p>소모칼로리 : 0.3kcal(개)</p>
					<p>운동세트 : 3세트</p>
					<p>운동개수 : 6개 / 9개 / 12개 / 15개 / 18개</p>
				</div>
				<div class="my-5">
					<p>1. 골반너비로 두 발을 벌리고 허리에 손을 대고 바로 서줍니다. 한쪽 발을 70~100cm 가량 앞으로 벌려 내밀고, 왼발의 뒤꿈치를 세워줍니다.</p>
					<p>2. 허리와 등을 똑바로 편 채로 오른편 무릎을 90도로 구부리고 반대편 무릎은 바닥에 닿는 느낌으로 몸을 내려줍니다. 하체 힘을 써서 처음 자세로 천천히 돌아오고 동작으로 반복합니다.</p>
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL END -->
	
	<script>
		/* MODAL1 START */
		const modal1 = document.querySelector('.plank');
		const closeButton1 = document.querySelectorAll('.modal-close1');

		const modalClose1 = () => {
			modal1.classList.remove('fadeIn');
			modal1.classList.add('fadeOut');	
			setTimeout(() => {
				modal1.style.display = 'none';
			}, 500);
		}

		const openModal1 = () => {
			if($("input:checkbox[id='exer1']").is(":checked") == true) {
				modal1.classList.remove('fadeOut');
				modal1.classList.add('fadeIn');
				modal1.style.display = 'flex';
			}
		}

		for (let i = 0; i < closeButton1.length; i++) {
			const elements = closeButton1[i];
			elements.onclick = (e) => modalClose1();
			modal1.style.display = 'none';
			window.onclick = function (event) {
				if (event.target == modal1) modalClose1();
			}
		}
		/* MODAL1 END */
		/* MODAL2 START */
		const modal2 = document.querySelector('.jumping-jack');
		const closeButton2 = document.querySelectorAll('.modal-close2');

		const modalClose2 = () => {
			modal2.classList.remove('fadeIn');
			modal2.classList.add('fadeOut');	
			setTimeout(() => {
				modal2.style.display = 'none';
			}, 500);
		}

		const openModal2 = () => {
			if($("input:checkbox[id='exer2']").is(":checked") == true) {
				modal2.classList.remove('fadeOut');
				modal2.classList.add('fadeIn');
				modal2.style.display = 'flex';
			}
		}

		for (let i = 0; i < closeButton2.length; i++) {
			const elements = closeButton2[i];
			elements.onclick = (e) => modalClose2();
			modal2.style.display = 'none';
			window.onclick = function (event) {
				if (event.target == modal2) modalClose2();
			}
		}
		/* MODAL2 END */
		/* MODAL3 START */
		const modal3 = document.querySelector('.burpee');
		const closeButton3 = document.querySelectorAll('.modal-close3');

		const modalClose3 = () => {
			modal3.classList.remove('fadeIn');
			modal3.classList.add('fadeOut');	
			setTimeout(() => {
				modal3.style.display = 'none';
			}, 500);
		}

		const openModal3 = () => {
			if($("input:checkbox[id='exer3']").is(":checked") == true) {
				modal3.classList.remove('fadeOut');
				modal3.classList.add('fadeIn');
				modal3.style.display = 'flex';
			}
		}

		for (let i = 0; i < closeButton3.length; i++) {
			const elements = closeButton3[i];
			elements.onclick = (e) => modalClose3();
			modal3.style.display = 'none';
			window.onclick = function (event) {
				if (event.target == modal3) modalClose3();
			}
		}
		/* MODAL3 END */
		/* MODAL4 START */
		const modal4 = document.querySelector('.leg-raise');
		const closeButton4 = document.querySelectorAll('.modal-close4');

		const modalClose4 = () => {
			modal4.classList.remove('fadeIn');
			modal4.classList.add('fadeOut');	
			setTimeout(() => {
				modal4.style.display = 'none';
			}, 500);
		}

		const openModal4 = () => {
			if($("input:checkbox[id='exer4']").is(":checked") == true) {
				modal4.classList.remove('fadeOut');
				modal4.classList.add('fadeIn');
				modal4.style.display = 'flex';
			}
		}

		for (let i = 0; i < closeButton4.length; i++) {
			const elements = closeButton4[i];
			elements.onclick = (e) => modalClose4();
			modal4.style.display = 'none';
			window.onclick = function (event) {
				if (event.target == modal4) modalClose4();
			}
		}
		/* MODAL4 END */
		/* MODAL5 START */
		const modal5 = document.querySelector('.crunch');
		const closeButton5 = document.querySelectorAll('.modal-close5');

		const modalClose5 = () => {
			modal5.classList.remove('fadeIn');
			modal5.classList.add('fadeOut');	
			setTimeout(() => {
				modal5.style.display = 'none';
			}, 500);
		}

		const openModal5 = () => {
			if($("input:checkbox[id='exer5']").is(":checked") == true) {
				modal5.classList.remove('fadeOut');
				modal5.classList.add('fadeIn');
				modal5.style.display = 'flex';
			}
		}

		for (let i = 0; i < closeButton5.length; i++) {
			const elements = closeButton5[i];
			elements.onclick = (e) => modalClose5();
			modal5.style.display = 'none';
			window.onclick = function (event) {
				if (event.target == modal5) modalClose5();
			}
		}
		/* MODAL5 END */
		/* MODAL6 START */
		const modal6 = document.querySelector('.push-up');
		const closeButton6 = document.querySelectorAll('.modal-close6');

		const modalClose6 = () => {
			modal6.classList.remove('fadeIn');
			modal6.classList.add('fadeOut');	
			setTimeout(() => {
				modal6.style.display = 'none';
			}, 500);
		}

		const openModal6 = () => {
			if($("input:checkbox[id='exer6']").is(":checked") == true) {
				modal6.classList.remove('fadeOut');
				modal6.classList.add('fadeIn');
				modal6.style.display = 'flex';
			}
		}

		for (let i = 0; i < closeButton6.length; i++) {
			const elements = closeButton6[i];
			elements.onclick = (e) => modalClose6();
			modal6.style.display = 'none';
			window.onclick = function (event) {
				if (event.target == modal6) modalClose6();
			}
		}
		/* MODAL6 END */
		/* MODAL7 START */
		const modal7 = document.querySelector('.knee-push-up');
		const closeButton7 = document.querySelectorAll('.modal-close7');

		const modalClose7 = () => {
			modal7.classList.remove('fadeIn');
			modal7.classList.add('fadeOut');	
			setTimeout(() => {
				modal7.style.display = 'none';
			}, 500);
		}

		const openModal7 = () => {
			if($("input:checkbox[id='exer6']").is(":checked") == true) {
				modal7.classList.remove('fadeOut');
				modal7.classList.add('fadeIn');
				modal7.style.display = 'flex';
			}
		}

		for (let i = 0; i < closeButton7.length; i++) {
			const elements = closeButton7[i];
			elements.onclick = (e) => modalClose7();
			modal7.style.display = 'none';
			window.onclick = function (event) {
				if (event.target == modal7) modalClose7();
			}
		}
		/* MODAL7 END */
		/* MODAL8 START */
		const modal8 = document.querySelector('.sidelunge');
		const closeButton8 = document.querySelectorAll('.modal-close8');

		const modalClose8 = () => {
			modal8.classList.remove('fadeIn');
			modal8.classList.add('fadeOut');	
			setTimeout(() => {
				modal8.style.display = 'none';
			}, 500);
		}

		const openModal8 = () => {
			if($("input:checkbox[id='exer7']").is(":checked") == true) {
				modal8.classList.remove('fadeOut');
				modal8.classList.add('fadeIn');
				modal8.style.display = 'flex';
			}
		}

		for (let i = 0; i < closeButton8.length; i++) {
			const elements = closeButton8[i];
			elements.onclick = (e) => modalClose8();
			modal8.style.display = 'none';
			window.onclick = function (event) {
				if (event.target == modal8) modalClose8();
			}
		}
		/* MODAL8 END */
		/* MODAL9 START */
		const modal9 = document.querySelector('.squat');
		const closeButton9 = document.querySelectorAll('.modal-close9');

		const modalClose9 = () => {
			modal9.classList.remove('fadeIn');
			modal9.classList.add('fadeOut');	
			setTimeout(() => {
				modal9.style.display = 'none';
			}, 500);
		}

		const openModal9 = () => {
			if($("input:checkbox[id='exer8']").is(":checked") == true) {
				modal9.classList.remove('fadeOut');
				modal9.classList.add('fadeIn');
				modal9.style.display = 'flex';
			}
		}

		for (let i = 0; i < closeButton9.length; i++) {
			const elements = closeButton9[i];
			elements.onclick = (e) => modalClose9();
			modal9.style.display = 'none';
			window.onclick = function (event) {
				if (event.target == modal9) modalClose9();
			}
		}
		/* MODAL9 END */
		/* MODAL10 START */
		const modal10 = document.querySelector('.lunge');
		const closeButton10 = document.querySelectorAll('.modal-close10');

		const modalClose10 = () => {
			modal10.classList.remove('fadeIn');
			modal10.classList.add('fadeOut');	
			setTimeout(() => {
				modal10.style.display = 'none';
			}, 500);
		}

		const openModal10 = () => {
			if($("input:checkbox[id='exer9']").is(":checked") == true) {
				modal10.classList.remove('fadeOut');
				modal10.classList.add('fadeIn');
				modal10.style.display = 'flex';
			}
		}

		for (let i = 0; i < closeButton10.length; i++) {
			const elements = closeButton10[i];
			elements.onclick = (e) => modalClose10();
			modal10.style.display = 'none';
			window.onclick = function (event) {
				if (event.target == modal10) modalClose10();
			}
		}
		/* MODAL10 END */
	</script>
	
	<!-- div wrap 시작 -->
	<div id="wrap">
	
		<!-- 프로그래스바 시작 -->
		<div class="max-w-5xl mx-auto my-16 border-b-2 pb-4">	
		<div class="flex pb-3">
			<div class="flex-1">
			</div>
	
			<div class="flex-1">
				<div class="w-10 h-10 bg-green-500 mx-auto rounded-full text-lg text-white flex items-center">
					<span class="text-white text-center w-full">1</span>
				</div>
			</div>
	
	
			<div class="w-1/6 align-center items-center align-middle content-center flex">
				<div class="w-full bg-gray-300 rounded items-center align-middle align-center flex-1">
				 	<div class="bg-green-500 text-xs leading-none py-1 text-center text-grey-darkest rounded " style="width: 100%"></div>
				</div>
			</div>
		
			
			<div class="flex-1">
				<div class="w-10 h-10 bg-green-500 mx-auto rounded-full text-lg text-white flex items-center">
					<span class="text-white text-center w-full">2</span>
				</div>
			</div>
		
			<div class="w-1/6 align-center items-center align-middle content-center flex">
				<div class="w-full bg-gray-300 rounded items-center align-middle align-center flex-1">
				 	<div class="bg-green-500 text-xs leading-none py-1 text-center text-grey-darkest rounded " style="width: 100%"></div>
				</div>
			</div>
		
			<div class="flex-1">
				<div class="w-10 h-10 bg-green-500 mx-auto rounded-full text-lg text-white flex items-center">
					<span class="text-white text-center w-full">3</span>
				</div>
			</div>
		
		
			<div class="w-1/6 align-center items-center align-middle content-center flex">
				<div class="w-full bg-gray-300 rounded items-center align-middle align-center flex-1">
				 	<div class="bg-green-500 text-xs leading-none py-1 text-center text-grey-darkest rounded " style="width: 20%"></div>
				</div>
			</div>
	
	
			<div class="flex-1">
				<div class="w-10 h-10 bg-white border-2 border-grey-light mx-auto rounded-full text-lg text-white flex items-center">
					<span class="text-gray-600 text-center w-full">4</span>
				</div>
			</div>
		
		
			<div class="flex-1">
			</div>		
		</div>
		
		<div class="flex text-base content-center text-center">
			<div class="w-1/4">
				종류선택
			</div>
			
			<div class="w-1/4">
				등급선택
			</div>
			
			<div class="w-1/4">
				운동선택
			</div>
			
			<div class="w-1/4">
				운동시작
			</div>			
		</div>
		</div>
		<!-- 프로그래스바 끝 -->
		
		<!-- checkbox 시작 -->
		<div class="container_checkbox">
		<h1 class="level-title">운동을 선택해주세요</h1>
		
		<form class="form-exercies cf" action="<%=request.getContextPath() %>/exercise/trainning" method="post">
			<section class="plan cf">
																													<!-- 다 끝나고 모달 1~10 onclick에 등록 -->
				<input type="checkbox" name="exercise" id="exer1" value="plank" onclick="">
				<label class="basic-label four col image-plank" for="exer1"></label>
				<input type="checkbox" name="exercise" id="exer2" value="jumpingjack" onclick="">
				<label class="basic-label four col image-jumping-jack" for="exer2"></label>
				<input type="checkbox" name="exercise" id="exer3" value="burpee" onclick="">
				<label class="premium-label four col image-burpee" for="exer3"></label>
			</section>
			<section class="plan cf">
				<input type="checkbox" name="exercise" id="exer4" value="legraise" onclick="">
				<label class="free-label four col exer-legraise" for="exer4"></label>
				<input type="checkbox" name="exercise" id="exer5" value="crunch" onclick="">
				<label class="basic-label four col exer-crunch" for="exer5"></label>
				<c:if test="${user.gender eq 'Male'}">
				<input type="checkbox" name="exercise" id="exer6" value="pushup" onclick="">
				<label class="premium-label four col exer-pushup" for="exer6"></label>
				</c:if>
				<c:if test="${user.gender eq 'Female'}">
				<input type="checkbox" name="exercise" id="exer6" value="kneepushup" onclick="">
				<label class="premium-label four col exer-kneepushup" for="exer6"></label>
				</c:if>
			</section><section class="plan cf">
				<input type="checkbox" name="exercise" id="exer7" value="sidelunge" onclick="">
				<label class="free-label four col exer-mountain" for="exer7"></label>
				<input type="checkbox" name="exercise" id="exer8" value="squat" onclick="">
				<label class="basic-label four col exer-squat" for="exer8"></label>
				<input type="checkbox" name="exercise" id="exer9" value="lunge" onclick="">
				<label class="premium-label four col exer-lunge" for="exer9"></label>
			</section>
			
			<!-- 버튼 시작 -->
			<div class="flex nav-button margin-topbottom">
			    <button type="button" class="border border-gray-500 text-black-500 block rounded-sm font-bold py-4 px-6 mr-2 flex items-center hover:bg-green-500 hover:text-white">
			        <svg class="h-5 w-5 mr-2 fill-current" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="-49 141 512 512" style="enable-background:new -49 141 512 512;" xml:space="preserve">
			            <path id="XMLID_10_" d="M438,372H36.355l72.822-72.822c9.763-9.763,9.763-25.592,0-35.355c-9.763-9.764-25.593-9.762-35.355,0 l-115.5,115.5C-46.366,384.01-49,390.369-49,397s2.634,12.989,7.322,17.678l115.5,115.5c9.763,9.762,25.593,9.763,35.355,0 c9.763-9.763,9.763-25.592,0-35.355L36.355,422H438c13.808,0,25-11.193,25-25S451.808,372,438,372z"></path>
			        </svg>
			        <a href="<%=request.getContextPath() %>/exercise/level">Previous page</a>
			    </button>
			    <button type="submit" class="border border-gary-500 bg-green-500 text-white block rounded-sm font-bold py-4 px-6 ml-2 flex items-center">
			        Next page
			        <svg class="h-5 w-5 ml-2 fill-current" clasversion="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="-49 141 512 512" style="enable-background:new -49 141 512 512;" xml:space="preserve">
			        <path id="XMLID_11_" d="M-24,422h401.645l-72.822,72.822c-9.763,9.763-9.763,25.592,0,35.355c9.763,9.764,25.593,9.762,35.355,0
			            l115.5-115.5C460.366,409.989,463,403.63,463,397s-2.634-12.989-7.322-17.678l-115.5-115.5c-9.763-9.762-25.593-9.763-35.355,0
			            c-9.763,9.763-9.763,25.592,0,35.355l72.822,72.822H-24c-13.808,0-25,11.193-25,25S-37.808,422-24,422z"></path>
			        </svg>
			    </button>
			</div>
			<!-- 버튼 끝 -->	
			
		</form>
		</div>
		<!-- checkbox 끝 -->
	</div>
	<!-- div wrap 끝 -->

</section>


<!-- FOOTER -->
<%@include file="../layout/footer.jsp" %>