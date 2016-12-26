
package sspkm.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.stereotype.Component;

import sspkm.models.user.User;
import sspkm.util.DefaultUrls;

@Component("logoutRedirectHandler")
public class LogoutRedirectHandler implements LogoutSuccessHandler {

    @Autowired
    DefaultUrls defaultUrls;

    private final static Logger logger = LoggerFactory.getLogger( LogoutRedirectHandler.class );

    @Override
    public void onLogoutSuccess( HttpServletRequest request,
        HttpServletResponse response, Authentication authentication )
        throws IOException, ServletException
    {
        // authentication could be null if the session already expired or the
        // user clicked the logout link twice.
        if( authentication != null )
        {
            User user = (User) authentication.getPrincipal();
            logger.info( user.getUsername() + " signed out." );
        }

        SimpleUrlLogoutSuccessHandler logoutSuccessHandler = new SimpleUrlLogoutSuccessHandler();
        logoutSuccessHandler.setDefaultTargetUrl( defaultUrls.anonymousHomeUrl( request ) );
        logoutSuccessHandler.onLogoutSuccess( request, response, authentication );
    }

}
