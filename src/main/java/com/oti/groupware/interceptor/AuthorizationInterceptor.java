package com.oti.groupware.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.oti.groupware.employee.dto.Employee;

import lombok.extern.log4j.Log4j2;

@Log4j2
public class AuthorizationInterceptor implements HandlerInterceptor{

	//Controller 전처리
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//return true이면 Controller 실행
		//return false이면 controller 실행 안함
		//return true;
		
		//Controller에 @Authorization이 붙어있는지 확인
		Employee employee = (Employee)request.getSession().getAttribute("employee");
		if(employee !=null) {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			Authorization authorization = handlerMethod.getMethodAnnotation(Authorization.class);
			if(authorization != null) {
				if(authorization.value().equals("ROLE_HR")) {
					if(employee.getDepName().equals("경영지원부")) {
						return true;
					}else {
						response.sendRedirect(request.getContextPath() + "/home");
						return false;
					}
				}
			}else {
				return true;
			}
		}
		response.sendRedirect(request.getContextPath() + "/login/login");
		return false;
	}
	
	//Controller 후처리
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}
	
	//view(JSP) 후처리
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	}
	
}
