#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.security;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


/**
 * 防止用户不断错误尝试登录
 *
 * <p>
 *
 * @author qhlee
 * @versioin v1.0 2015年10月26日
 * @see
 */
@Component("userLoginCheckInterceptor")
public class UserLoginCheckInterceptor implements HandlerInterceptor {
	protected final Logger logger = LoggerFactory.getLogger(UserLoginCheckInterceptor.class) ;
//	@Resource(name="userService")
//	protected IUserService userService ;
	
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
	
		 
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {}

}
