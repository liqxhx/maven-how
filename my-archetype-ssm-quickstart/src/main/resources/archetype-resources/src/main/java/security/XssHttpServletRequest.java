#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.security;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.springframework.util.StringUtils;

public class XssHttpServletRequest extends HttpServletRequestWrapper {

    private HttpServletRequest orgReuqest = null ;

    public XssHttpServletRequest(HttpServletRequest request){
        super(request);
        this.orgReuqest = request ;
    }
    @Override
    public String getParameter(String name) {
        return xssEncoder(super.getParameter(name));

    }

    @Override
    public String getHeader(String name) {
        return xssEncoder(super.getParameter(name));
    }

    private String xssEncoder(String value){
        if(!StringUtils.hasText(value)){
            return value ;
        }

        StringBuilder sb = new StringBuilder();
        for(int i = 0 ; i < value.length() ; i++){
            char ch = value.charAt(i) ;
            switch(ch){
                case '>':
                    sb.append("&gt;") ;
                    break;
                case '<':
                    sb.append("&lt;");
                    break;
                case '&':
                    sb.append("&amp;");
                    break;
                case '${symbol_escape}"':                  //全角引号
                    sb.append("&quot;");
                    break;
                default:
                    sb.append(ch) ;
                    break;
            }
        }


        return sb.toString() ;
    }




}
