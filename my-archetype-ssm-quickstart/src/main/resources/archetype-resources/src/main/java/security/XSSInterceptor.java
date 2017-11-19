#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 防止XSS攻击
 *
 * <p>
 *
 * @author qhlee
 * @versioin v1.0 2015年10月26日
 * @see
 */
@Component("xssInterceptor")
public class XSSInterceptor implements HandlerInterceptor {
	protected final Logger logger = LoggerFactory.getLogger(XSSInterceptor.class) ;
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		logger.debug("XSSInterceptor pre hand");
		request = new XssHttpServletRequest(request);//对特殊字符进行转义
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
 

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		 

	}

}
