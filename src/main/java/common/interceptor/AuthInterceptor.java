package common.interceptor;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class AuthInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws ServletException, IOException {
		
		if(req.getRequestURI().contains("board/") && req.getSession().getAttribute("logInInfo") == null) {
			
			req.setAttribute("alertMsg", "비회원은 접근할 권한이 없습니다.");
			req.setAttribute("url", req.getContextPath()+"/main");
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			rd.forward(req, resp);
			
			return false;
		} else {
			
			return true;
		}
	}
	
}
