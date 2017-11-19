#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by qhlee on 2015/10/22.
 * 防止会话固定攻击
 * 防止会话劫持攻击
 * http://localhost:7002/${artifactId}/path/xxx;jsessionid=xxxxxxxxxxxxxxx
 */
@Component("antiSessionInterceptor")
public class AntiSessionInterceptor implements HandlerInterceptor {
	protected final Logger logger = LoggerFactory.getLogger(AntiSessionInterceptor.class) ;
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		logger.debug("AntiSessionInterceptor pre hand");
		if(request.isRequestedSessionIdFromURL()){
			 HttpSession session = request.getSession() ;
             if(session != null) {
                 session.invalidate();
                 response.sendRedirect("index.jsp");
             }
             logger.info("AntiSessionInterceptor pre handed RequestedSessionIdFromURL,back to /user/login");
             return false ;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
