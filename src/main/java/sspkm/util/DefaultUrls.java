
package sspkm.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import sspkm.models.user.User;
import sspkm.security.SecurityUtils;

@Component
public class DefaultUrls {

	public String homeUrl(HttpServletRequest request) {
		return SecurityUtils.isAuthenticated() ? userHomeUrl(request) : anonymousHomeUrl(request);
	}

	public String userHomeUrl(HttpServletRequest request) {
		User user = SecurityUtils.getUser();

		// Cookie cookie = WebUtils.getCookie( request, "default-home" );
		// if( cookie != null ) return cookie.getValue();
		String homeUrl;
		if (user.isUserAdmin())
			homeUrl = "/admin/index";
		else if (user.isUserRector())
			homeUrl = "/rector/index";
		else if (user.isUserTrustee())
			homeUrl = "/trustee/index";
		else
			homeUrl = "/student/index";

		return homeUrl;
	}

	public String anonymousHomeUrl(HttpServletRequest request) {
		// Cookie cookie = WebUtils.getCookie( request, "default-dept" );
		return "/";
	}

}
