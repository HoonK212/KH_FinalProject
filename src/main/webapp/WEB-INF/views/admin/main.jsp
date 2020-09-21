<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- HEAD -->
<%@include file="/WEB-INF/views/layout/admin_head.jsp" %>

<div class="admin-container">

<!-- HEADER -->
<%@include file="/WEB-INF/views/layout/admin_header.jsp" %>

<!-- SECTION  -->
<div class="lay-item">
	
	<!-- CONTENT -->
	<div class="section-container">
		
		<div class="flex rounded-lg shadow-lg w-full sm:w-3/4 lg:w-1/2 bg-white sm:mx-0" style="min-height: 560px; width: 80%; margin: 0 auto;">
            <div class="flex flex-col w-full md:w-1/2 p-4">
                <div class="flex flex-col flex-1 justify-center mb-8">
                    <h1 class="text-3xl text-center font-extrabold text-gray-800">관리자 로그인</h1>
                    <div class="w-full mt-4">
                        <div class="form-horizontal w-3/4 mx-auto" >
                            <div class="flex flex-col mt-4">
                                <input type="text" class="flex-grow h-8 px-2 border rounded border-grey-400" id = "id" name="id" value="" required="" placeholder="ID">
                            </div>
                            <div class="flex flex-col mt-4">
                                <input type="password" class="flex-grow h-8 px-2 rounded border border-grey-400" id = "pw" name="pw" required="" placeholder="Password">
                            </div>
                            <span id="error" style="color: red; font-size: 0.8rem; min-height: 1rem; display:inline-block"></span>
                            <div class="flex flex-col mt-4">
                                <button onclick="login()" class="bg-blue-500 hover:bg-blue-700 text-white text-sm font-semibold py-2 px-4 rounded">
                                    로그인
                                </button>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hidden md:block md:w-1/2 rounded-r-lg" style="background: url('https://images.unsplash.com/photo-1536922246289-88c42f957773?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=1980&amp;q=80'); background-size: cover; background-position: center center;"></div>
        </div>
	
	</div>

</div>

<!-- FOOTER -->
<%@include file="/WEB-INF/views/layout/admin_footer.jsp" %>

</div>

<script type="text/javascript">
//로그인
	function login(){
		
		var id = document.querySelector("#id").value;
		var pw = document.querySelector("#pw").value;
		
		//입력하지 않았을때 막기
		if( id == "" || pw == "" ){
			document.querySelector('#error').textContent = '아이디/비밀번호 입력을 완성하세요.';
			return false;
		}
		
		
		var xhr = new XMLHttpRequest();
		xhr.open('POST', '<%=request.getContextPath()%>/adminlogin/loginimple');
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send('id='+id +'&pw='+pw);
		
		xhr.addEventListener('load', function(){
			
			var data = xhr.response;
			console.log(data);

			//로그인 실패
			if (data == '2') {
				document.querySelector('#error').textContent = '아이디/비밀번호를 다시 확인하세요.';
			} else if (data == '1') { //로그인 성공
				location.href = '<%=request.getContextPath()%>/admin/productlist';
			} else {
				document.querySelector('#error').textContent = '에러가 발생하였습니다.';
			}
		});
		
	}
</script>	
	
</html>