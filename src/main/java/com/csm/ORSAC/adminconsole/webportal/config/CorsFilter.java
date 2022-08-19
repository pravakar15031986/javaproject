package  com.csm.ORSAC.adminconsole.webportal.config;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
@Order(4)
public class CorsFilter extends OncePerRequestFilter {

	private static final Logger LOGGER =  LoggerFactory.getLogger(CorsFilter.class);

	@Autowired
	EnvironmentVariables environmentVariables;

	
	private final String LOCALHOST = "http://localhost:";
	private final String LOCAL_HOST = "localhost:8086";
	

	private Boolean isValidOrigin(String origin, String currentRequestURI) {

		/**
		 * not checking origin for local access
		 */
		if (origin.startsWith(LOCALHOST)) {
			return true;
		}

		String allowedOrigins[] = { environmentVariables.getAppUrl()};

		if (Arrays.asList(allowedOrigins).contains(origin)) {
			return true;
		}

		return false;
	}
	
	private Boolean isValidHost(String hostName) {

		if (hostName.startsWith(LOCAL_HOST)) {
			return true;
		}

		String allowedHostnames[] = { environmentVariables.getHostName()};

		if (Arrays.asList(allowedHostnames).contains(hostName)) {
			return true;
		}

		return false;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		
		String path=request.getServletPath();
		
		
		
		
		if(path.startsWith("/profile")) {
			
			response.sendRedirect("/WRSIS");
			return;
		}
		
		//String hostName = request.getHeader("Host");  //commented on 16-06-2021
		//if(!isValidHost(hostName)) {
		//	 throw new ServletException("Hostname tampered detect!! Inform to sys admin ASAP.");
		//}
		
		
		
	
	
	
		
		if(path.startsWith("/api") || path.startsWith("/gisapi")) {
			response.addHeader("Access-Control-Allow-Origin","*" );
			response.addHeader("Access-Control-Allow-Headers", "X-Requested-With,Origin,Content-Type, Accept");
			
		}else {
			
			//response.addHeader("Access-Control-Allow-Origin",environmentVariables.getAppUrl() );  //commented on 16-06-2021
			response.addHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
			response.addHeader("Access-Control-Allow-Headers", "X-Requested-With,Origin,Content-Type, Accept");
			response.addHeader("Access-Control-Max-Age", "151200");
			
			String requestHeader = request.getHeader("Access-Control-Request-Headers");
			if (null != requestHeader && !requestHeader.equals(null)) {
				response.addHeader("Access-Control-Allow-Headers", requestHeader);
	        }
			
			
			 response.setHeader("X-XSS-Protection", "1; mode=block");
	         response.setHeader("Strict-Transport-Security", "max-age=31536000; includeSubDomains"); 
	         response.setHeader("X-Content-Type-Options", "nosniff"); 
	         response.setHeader("Cache-control", "no-store, no-cache"); 
	         response.setHeader("X-Frame-Options", "DENY"); 
         
		}
        
         
		
		filterChain.doFilter(request, response);
	}
	
	
	
	

}