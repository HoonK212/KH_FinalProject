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
		
		if(req.getRequestURI().contains("board/write") && req.getSession().getAttribute("logInInfo") == null) {
			auth(req, resp);
			return false;
		} else if(req.getRequestURI().contains("comments/write") && req.getSession().getAttribute("logInInfo") == null) {
			auth(req, resp);
			return false;
		} else if(req.getRequestURI().contains("report/") && req.getSession().getAttribute("logInInfo") == null) {
			auth(req, resp);
			return false;
		} else if(req.getRequestURI().contains("exercise/") && req.getSession().getAttribute("logInInfo") == null) {
			auth(req, resp);
			return false;
		} else if(req.getRequestURI().contains("event/") && req.getSession().getAttribute("logInInfo") == null) {
			auth(req, resp);
			return false;
		} else if(req.getRequestURI().contains("shopping/payment") && req.getSession().getAttribute("logInInfo") == null) {
			auth(req, resp);
			return false;
		} else if(req.getRequestURI().contains("mypage/") && req.getSession().getAttribute("logInInfo") == null) {
			auth(req, resp);
			return false;
		} else if(req.getRequestURI().contains("admin/") && req.getSession().getAttribute("logInInfo") == null) {
			adminauth(req, resp);
			return false;
		} else {
			return true;
		}
	}
	
	public void auth(HttpServletRequest req, HttpServletResponse resp) {
		
		req.setAttribute("alertMsg", "비회원은 권한이 없습니다.");
		req.setAttribute("url", req.getContextPath()+"/user/login");
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
		
		try {
			rd.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void adminauth(HttpServletRequest req, HttpServletResponse resp) {
		
		req.setAttribute("alertMsg", "관리자 권한이 없습니다.");
		req.setAttribute("url", req.getContextPath()+"/adminlogin/main");
		RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
		
		try {
			rd.forward(req, resp);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
