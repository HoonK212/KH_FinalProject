<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

<!-- HEAD -->
<%@include file="/WEB-INF/views/layout/admin_head.jsp" %>

<div class="admin-container">

<!-- HEADER -->
<%@include file="/WEB-INF/views/layout/admin_header.jsp" %>
<!-- SIDEBAR -->
<%@include file="/WEB-INF/views/layout/admin_sidebar.jsp" %>

	
<!-- SECTION  -->
<div class="lay-item">
	
	<!-- CONTENT  -->
	<div class="section-container">
	
			<!-- 상단제목 -->
			<span class="font-semibold text-4xl">상품 등록</span>
		
		
			<!-- 상단 버튼 영역 -->
			<div class="flex justify-end">
			  <div class="mr-3">
			      <select id="select">
			          <option value="1">상품번호</option>
			          <option value="2">상품명</option>
			      </select>
			  </div>
		 
	          <input type="text" class="mr-3" placeholder="입력하세요"/>
			  <button class='bg-gray-100 text-gray-800 py-2 px-3 rounded font-bold'>
			    조회하기
			  </button>
			</div>
			
			
			<!-- 테이블 영역 -->
			<form action="" method="POST">
			<div class="shadow overflow-hidden rounded border-b border-gray-200">
					
					<!-- 테이블  -->
				    <table class="bg-gray-200 table-fixed">
				    
				        <tr>
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">상품카테고리</th>
				          <td class="border py-3 px-4 text-center">
				          <select id="select" class="appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight 
				          focus:outline-none focus:bg-white focus:border-indigo-500" >
					          <option value="1">기구</option>
					          <option value="2">보조제</option>
					          <option value="3">식품</option>
					      </select></td>
				        </tr>
				        
				        <tr>  
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">상품명</th>
				          <td class="border py-3 px-4 text-center">
				          <input class="appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-indigo-500" type="text">
				          </td>
				        </tr> 
				       
				         <tr> 
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">상품설명</th>
				          <td class="border py-3 px-4 text-center">
				          <textarea id="content" class="w-full"></textarea>
				          </td>
				         </tr> 
				         
						<!-- 스마트 에디터 적용하는 코드 -->
						<!-- <textarea>에 스마트 에디터의 스킨을 입히는 코드 -->
						<script type="text/javascript">
 						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
							oAppRef: oEditors,
							elPlaceHolder: "content", //에디터가 적용되는 <textarea>의 id를 입력
							sSkinURI: "<%=request.getContextPath() %>/resources/se2/SmartEditor2Skin.html",
							fCreator: "createSEditor2"
						})
						</script>
				    
				         <tr> 
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">이미지</th>
				          <td class="grid grid-flow-col grid-cols-4 grid-rows-2 gap-4 border py-3 px-4">
							
							<div class="product-img">
								<div class="shadow-lg" style="background-image: url(<%=request.getContextPath() %>/resources/img/img.png); background-repeat: no-repeat; background-position:center;"></div>
									
								<div class="flex justify-center items-center">
									
									<button class="bg-gray-800 text-white font-bold py-2 px-4 rounded mr-2">
								    <span>업로드</span>
									</button>
									<input type="file" style="display:none; width: 2rem;"/>
								    
								    <button class="mr-2 bg-red-500 text-white font-bold rounded border-b-2 border-red-500 hover:border-red-600 hover:bg-red-500 hover:text-gray-800 shadow-md py-2 px-4">
									<span>X</span>
								    </button>
								</div>	
								
							</div>
							<div class="product-img">
								<div class="shadow-lg" style="background-image: url(<%=request.getContextPath() %>/resources/img/img.png); background-repeat: no-repeat; background-position:center;"></div>
									
								<div class="flex justify-center items-center">
									
									<button class="bg-gray-800 text-white font-bold py-2 px-4 rounded mr-2">
								    <span>업로드</span>
									</button>
									<input type="file" style="display:none; width: 2rem;"/>
								    
								    <button class="mr-2 bg-red-500 text-white font-bold rounded border-b-2 border-red-500 hover:border-red-600 hover:bg-red-500 hover:text-gray-800 shadow-md py-2 px-4">
									<span>X</span>
								    </button>
								</div>	
								
							</div>
							<div class="product-img">
								<div class="shadow-lg" style="background-image: url(<%=request.getContextPath() %>/resources/img/img.png); background-repeat: no-repeat; background-position:center;"></div>
									
								<div class="flex justify-center items-center">
									
									<button class="bg-gray-800 text-white font-bold py-2 px-4 rounded mr-2">
								    <span>업로드</span>
									</button>
									<input type="file" style="display:none; width: 2rem;"/>
								    
								    <button class="mr-2 bg-red-500 text-white font-bold rounded border-b-2 border-red-500 hover:border-red-600 hover:bg-red-500 hover:text-gray-800 shadow-md py-2 px-4">
									<span>X</span>
								    </button>
								</div>	
								
							</div>
							<div class="product-img">
								<div class="shadow-lg" style="background-image: url(<%=request.getContextPath() %>/resources/img/img.png); background-repeat: no-repeat; background-position:center;"></div>
									
								<div class="flex justify-center items-center">
									
									<button class="bg-gray-800 text-white font-bold py-2 px-4 rounded mr-2">
								    <span>업로드</span>
									</button>
									<input type="file" style="display:none; width: 2rem;"/>
								    
								    <button class="mr-2 bg-red-500 text-white font-bold rounded border-b-2 border-red-500 hover:border-red-600 hover:bg-red-500 hover:text-gray-800 shadow-md py-2 px-4">
									<span>X</span>
								    </button>
								</div>	
								
							</div>
							<div class="product-img">
								<div class="shadow-lg" style="background-image: url(<%=request.getContextPath() %>/resources/img/img.png); background-repeat: no-repeat; background-position:center;"></div>
									
								<div class="flex justify-center items-center">
									
									<button class="bg-gray-800 text-white font-bold py-2 px-4 rounded mr-2">
								    <span>업로드</span>
									</button>
									<input type="file" style="display:none; width: 2rem;"/>
								    
								    <button class="mr-2 bg-red-500 text-white font-bold rounded border-b-2 border-red-500 hover:border-red-600 hover:bg-red-500 hover:text-gray-800 shadow-md py-2 px-4">
									<span>X</span>
								    </button>
								</div>	
								
							</div>
							<div class="product-img">
								<div class="shadow-lg" style="background-image: url(<%=request.getContextPath() %>/resources/img/img.png); background-repeat: no-repeat; background-position:center;"></div>
									
								<div class="flex justify-center items-center">
									
									<button class="bg-gray-800 text-white font-bold py-2 px-4 rounded mr-2">
								    <span>업로드</span>
									</button>
									<input type="file" style="display:none; width: 2rem;"/>
								    
								    <button class="mr-2 bg-red-500 text-white font-bold rounded border-b-2 border-red-500 hover:border-red-600 hover:bg-red-500 hover:text-gray-800 shadow-md py-2 px-4">
									<span>X</span>
								    </button>
								</div>	
								
							</div>
							<div class="product-img">
								<div class="shadow-lg" style="background-image: url(<%=request.getContextPath() %>/resources/img/img.png); background-repeat: no-repeat; background-position:center;"></div>
									
								<div class="flex justify-center items-center">
									
									<button class="bg-gray-800 text-white font-bold py-2 px-4 rounded mr-2">
								    <span>업로드</span>
									</button>
									<input type="file" style="display:none; width: 2rem;"/>
								    
								    <button class="mr-2 bg-red-500 text-white font-bold rounded border-b-2 border-red-500 hover:border-red-600 hover:bg-red-500 hover:text-gray-800 shadow-md py-2 px-4">
									<span>X</span>
								    </button>
								</div>	
								
							</div>
							<div class="product-img">
								<div class="shadow-lg" style="background-image: url(<%=request.getContextPath() %>/resources/img/img.png); background-repeat: no-repeat; background-position:center;"></div>
									
								<div class="flex justify-center items-center">
									
									<button class="bg-gray-800 text-white font-bold py-2 px-4 rounded mr-2">
								    <span>업로드</span>
									</button>
									<input type="file" style="display:none; width: 2rem;"/>
								    
								    <button class="mr-2 bg-red-500 text-white font-bold rounded border-b-2 border-red-500 hover:border-red-600 hover:bg-red-500 hover:text-gray-800 shadow-md py-2 px-4">
									<span>X</span>
								    </button>
								</div>	
								
							</div>
				          </td>
				         </tr> 
				    	
				    	<tr>  
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">재고</th>
				          <td class="border py-3 px-4 text-center">
				          <input class="appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-indigo-500" type="text">
				          </td>
				        </tr>
				        
				        <tr>  
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">제조사</th>
				          <td class="border py-3 px-4 text-center">
				          <input class="appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-indigo-500" type="text">
				          </td>
				        </tr>
				        
				        <tr>  
				          <th class="bg-gray-800 text-white py-3 px-4 uppercase font-semibold text-base">제조일</th>
				          <td class="border py-3 px-4 text-center">
				          <input class="appearance-none border-2 border-gray-200 rounded w-full py-2 px-4 text-gray-700 leading-tight focus:outline-none focus:bg-white focus:border-indigo-500" type="text">
				          </td>
				        </tr>
				    </table>
			</div><!-- 테이블 영역 끝!-->
			</form>				
			
			<!-- 하단 버튼 영역  -->	
			<div class="flex justify-center items-center mt-4">
					<div>
				    <button class='bg-gray-800 text-white py-2 px-3 rounded font-bold mr-5'>
				      저장
				  	</button>
				    <button class='bg-gray-800 text-white py-2 px-3 rounded font-bold'>
				      취소
				  	</button>
					</div>
			</div>
		</div>
	</div>
	
<!-- FOOTER -->
<%@include file="/WEB-INF/views/layout/admin_footer.jsp" %>
</div>

</html>