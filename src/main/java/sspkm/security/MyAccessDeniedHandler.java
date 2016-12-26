package sspkm.security;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import sspkm.util.DefaultUrls;

public class MyAccessDeniedHandler implements AccessDeniedHandler {

	private String accessDeniedUrl;

	public String getAccessDeniedUrl() {
		return accessDeniedUrl;
	}

	public void setAccessDeniedUrl(String accessDeniedUrl) {
		this.accessDeniedUrl = accessDeniedUrl;
	}
	
	@Autowired
	private DefaultUrls defaultUrls;

	public MyAccessDeniedHandler() {
		
	}

	public MyAccessDeniedHandler(String accessDeniedUrl) {
		this.accessDeniedUrl = accessDeniedUrl;
	}

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException {
		String s1=request.getRequestURI();
		String s2="/sspkm/login";
		if(s1.equals(s2)){
			response.sendRedirect(request.getContextPath()+defaultUrls.homeUrl(request));
		}else {
			response.sendRedirect(request.getContextPath()+accessDeniedUrl);
		}
		
		

	}

}
