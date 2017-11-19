#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class UserLoginFilter implements Filter {
	protected final Logger logger = LoggerFactory.getLogger(UserLoginFilter.class) ;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
//		HttpServletRequest httpServletReuqest = (HttpServletRequest)request ;
//		HttpServletResponse httpServletResponse = (HttpServletResponse)response ;
//		Sale sale = (Sale) httpServletReuqest.getSession().getAttribute(Constants.LOGON_SALE) ;
//		if(sale == null) {
//			logger.debug("user not login,back to {}", Constants.ACTION_USER_LOGIN);
//			//httpServletResponse.sendRedirect(httpServletReuqest.getContextPath()+Constants.ACTION_LOGIN);
//		}
//		else
			chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

}
