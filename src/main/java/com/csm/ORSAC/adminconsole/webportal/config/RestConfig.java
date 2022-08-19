package com.csm.ORSAC.adminconsole.webportal.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.ClientHttpRequestFactory;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

//@Configuration
public class RestConfig {

	
	
	@Bean
	RestTemplate restTemplate(){
		
		return new RestTemplate();
	}
	private ClientHttpRequestFactory getClientHttpRequestFactory(){
		
		int timeout=5000;
		HttpComponentsClientHttpRequestFactory clientHttpRequestFactory=new HttpComponentsClientHttpRequestFactory();
		clientHttpRequestFactory.setConnectTimeout(timeout);
		return clientHttpRequestFactory;
	
	}
}
