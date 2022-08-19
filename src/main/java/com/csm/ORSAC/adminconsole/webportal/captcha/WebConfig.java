package com.csm.ORSAC.adminconsole.webportal.captcha;

import javax.servlet.http.HttpServlet;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class WebConfig {
   @Bean	
   public ServletRegistrationBean<HttpServlet> CaptchaGenerator() {
	   ServletRegistrationBean<HttpServlet> servRegBean = new ServletRegistrationBean<>();
	   servRegBean.setServlet(new CaptchaGenerator());
	   servRegBean.addUrlMappings("/thymeleaf/Captcha.jpg");
	   servRegBean.setLoadOnStartup(1);
	   return servRegBean;
   }
    
} 