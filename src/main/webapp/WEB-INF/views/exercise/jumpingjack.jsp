<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 캠 레이아웃 시작 -->
<div class="antialiased max-w-full mx-auto px-8">
	<div class="relative block md:flex items-center">
		<div class="w-auto md:w-1/2 relative z-1 bg-gray-100 rounded shadow-lg overflow-hidden">
			<div class="text-lg font-medium text-black-500 uppercase p-8 text-center border-b border-gray-200 tracking-wide">운동 정보</div>
			<div class="block sm:flex md:block items-center justify-center layout-overflow">
				<div class="w-full text-center">

					<!-- 단계별 설명 탬플릿 시작 -->
				<div class="flex flex-col justify-center m-auto">
					<div class="flex flex-col bg-teal-200 justify-center text-center">
						<div class="flex flex-col justify-center items-center relative">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full  border-teal-300 border-dashed"></div>
							</div>
							<div
								class="rounded-full w-12 h-12 text-xl text-teal-100 bg-teal-700 font-black flex justify-center items-center absolute top-0 right-0 mt-16 shadow-lg mr-2">1</div>
							<img alt="step1" class="w-56 h-56 shadow my-5 object-scale-down" src="<%=request.getContextPath() %>/resources/image/exercise/Jumpingjack1-1.png">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full border-r-4 border-teal-300 border-dashed"></div>
							</div>
						</div>
						<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-teal-200">
							<div class="text-xs uppercase font-bold text-teal-500">Step 1</div>
							<div class="text-xl font-bold text-teal-700">차렷 자세를 취합니다.</div>
						</div>
					</div>

					<div class="flex flex-col bg-orange-200 justify-center text-center">
						<div class="flex flex-col justify-center items-center relative">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full border-r-4 border-orange-300 border-dashed"></div>
							</div>
							<div class="rounded-full w-12 h-12 text-xl text-orange-100 bg-orange-700 font-black flex justify-center items-center absolute top-0 right-0 mt-16 shadow-lg mr-2">2</div>
							<img alt="step2" class="w-56 h-56 shadow my-5 object-scale-down" src="<%=request.getContextPath() %>/resources/image/exercise/Jumpingjack1-2.png">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full border-r-4 border-orange-300 border-dashed"></div>
							</div>
						</div>
						<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-orange-200">
							<div class="text-xs uppercase font-bold text-orange-500">Step 2</div>
							<div class="text-xl font-bold text-orange-700">두 팔을 양옆으로 올리면서 두 발을 점프해서 벌립니다.</div>
						</div>
					</div>

					<div class="flex flex-col bg-indigo-200 justify-center text-center">
						<div class="flex flex-col justify-center items-center relative">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full border-r-4 border-indigo-300 border-dashed"></div>
							</div>
							<div class="rounded-full w-12 h-12 text-xl text-indigo-100 bg-indigo-700 font-black flex justify-center items-center absolute top-0 right-0 mt-16 shadow-lg mr-2">3</div>
							<img alt="step3" class="w-56 h-56 shadow my-5 object-scale-down" src="<%=request.getContextPath() %>/resources/image/exercise/Jumpingjack1-1.png">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full border-r-4 border-indigo-300 border-dashed"></div>
							</div>
						</div>
						<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-indigo-200">
							<div class="text-xs uppercase font-bold text-indigo-500">Step 3</div>
							<div class="text-xl font-bold text-indigo-700">다시 차렷 자세로 돌아갑니다.</div>
						</div>
					</div>

					<div class="flex flex-col bg-pink-200 justify-center text-center">
						<div class="flex flex-col justify-center items-center relative">
							<div class="w-56 h-12 md:flex hidden justify-center">
								<div class="h-full border-r-4 border-pink-300 border-dashed"></div>
							</div>
							<div class="rounded-full w-12 h-12 text-xl text-pink-100 bg-pink-700 font-black flex justify-center items-center absolute top-0 right-0 mt-16 shadow-lg mr-2">4</div>
							<img alt="step4" class="w-56 h-56 shadow my-5 object-scale-down" src="<%=request.getContextPath() %>/resources/image/exercise/Jumpingjack1-3.png">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full  border-pink-300 border-dashed"></div>
							</div>
						</div>
						<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-pink-200">
							<div class="text-xs uppercase font-bold text-pink-500">Step 4</div>
							<div class="text-xl font-bold text-pink-700">두 발을 점프해서 더 넓게 벌리면서 두 손은 머리 위로 올려 박수를 칩니다.</div>
						</div>
					</div>
					
					<div class="flex flex-col bg-teal-200 justify-center text-center">
						<div class="flex flex-col justify-center items-center relative">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full  border-teal-300 border-dashed"></div>
							</div>
							<div
								class="rounded-full w-12 h-12 text-xl text-teal-100 bg-teal-700 font-black flex justify-center items-center absolute top-0 right-0 mt-16 shadow-lg mr-2">5</div>
							<img alt="step1" class="w-56 h-56 shadow my-5 object-scale-down" src="<%=request.getContextPath() %>/resources/image/exercise/Jumpingjack1-1.png">
							<div class="w-56 h-12 hidden justify-center">
								<div class="h-full border-r-4 border-teal-300 border-dashed"></div>
							</div>
						</div>
						<div class="ml-5 p-10 flex flex-col justify-center max-w-2xl rounded bg-teal-200">
							<div class="text-xs uppercase font-bold text-teal-500">Step 5</div>
							<div class="text-xl font-bold text-teal-700">다시 차렷 자세로 돌아갑니다.</div>
						</div>
					</div>
				</div>
				<!-- 단계별 설명 탬플릿 끝 -->

			</div>
		</div>
	</div>
	
	<div class="w-full md:w-1/2 relative z-0">
		<div
			class="bg-blue-900 text-white rounded-b md:rounded-b-none md:rounded-r shadow-lg overflow-hidden">
			<div class="text-lg font-medium text-white-500 uppercase p-8 text-center border-b border-gray-200 tracking-wide">
				운동 촬영 영상
			</div>
			
    					<!-- 진짜 웹캠 공간 -->

							<div class="text-center text-sm sm:text-md max-w-lg mx-auto text-gray-900 mt-8 px-8 lg:px-0 layout-cam">
							
								<div><canvas id="canvas" style="display: inline;"></canvas></div>
								<div id="label-container"></div>
							
							</div>
							
							<!-- 진짜 웹캠 공간끝 -->
			
			<div class="mt-8 border border-blue-800 mx-8 lg:mx-16 flex flex-wrap">
			
				<!-- 프로그래스바 템플릿 시작 -->
				<div style="margin: 10px 15px; width: 100%;">
					<div style="width: 100%;">
						<h5>세트</h5>
						<div class="progress">
							<div class="progress-bar-set" role="progressbar"
								aria-valuenow="0" aria-valuemin="0" aria-valuemax="1"></div>
						</div>
						<h5>횟수</h5>
						<div class="progress" >
							<div class="progress-bar-count" role="progressbar"
								aria-valuenow="0" aria-valuemin="0" aria-valuemax="0"></div>
						</div>
					</div>
				</div>
				<!-- 프로그래스바 템플릿 끝 -->
					
				</div>
				<a href="<%=request.getContextPath()%>/exercise/exercisefinish" class="block flex items-center justify-center bg-blue-800 hover:bg-blue-700 p-4 text-md font-semibold text-gray-300 uppercase mt-8 complete">
					<span>운동 보상 받기</span> <span class="font-medium text-gray-300 ml-2">➔</span>
				</a>
			</div>
		</div>
		
	</div>
	
</div>
<!-- 캠 레이아웃 끝 -->				