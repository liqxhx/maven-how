#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//import ${package}.utils.Constants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Created by qhlee on 2015/10/22.
 */
@Controller("welcomeController")
//@RequestMapping(value={Constants.ACTION_WELCOME})
public class WelcomeController {
//  private static final Logger logger = LoggerFactory.getLogger(WelcomeController.class) ;/
 
    
    @RequestMapping(value = "/about", method= RequestMethod.GET)
    public String welcomeSomeone() {
    		return "about";
    		
    }
}
