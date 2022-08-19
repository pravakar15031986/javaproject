package com.csm.ORSAC.adminconsole.webportal.config;

import com.google.common.cache.Cache;
import java.io.IOException;
import java.util.Arrays;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

@Component
@Order(2)
//@WebFilter( filterName = "validationfilter",  urlPatterns = { "/viewSucessWebLoginDetails"})
public class ValidateSalt extends OncePerRequestFilter  {

    
    @Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
    	
        // Assume its HTTP
        HttpServletRequest httpReq = (HttpServletRequest) request;
       
        // Get the salt sent with the request
        String salt = (String) httpReq.getParameter("csrf_token_");

        // Validate that the salt is in the cache
        Cache<String, Boolean> csrfPreventionSaltCache = (Cache<String, Boolean>)
            httpReq.getSession(false).getAttribute("csrf_token_repo_cache");

        if (csrfPreventionSaltCache != null &&
                salt != null &&
                csrfPreventionSaltCache.getIfPresent(salt) != null){
        		
        	csrfPreventionSaltCache.invalidate(salt);
            // If the salt is in the cache, we move on
        	filterChain.doFilter(request, response);
        } else {
            // Otherwise we throw an exception aborting the request flow
            throw new ServletException("CSRF attack detected!! Inform to sys admin ASAP.");
        }
    }
    
    public static boolean substringExistsInArray(String inputStr, String[] items) {
        return Arrays.stream(items).parallel().anyMatch(inputStr::contains);
     }

    
    @Override
    protected boolean shouldNotFilter(HttpServletRequest request) {
    	String[] exludeURLs= {"/home","/forgotPassword","/firstTimeLogin","/viewProfilePhoto","/firstTimeChangePassword","/passwordReset",
					"/webapp/", "/WEB-INF/", "/resources/","/templates/", "/jsp/", "/tiles/",
		    		"/styles/", "/images/", "/scripts/", "/fonts/", "/pdf/", "/WRSISGIS/","/thymeleaf/Captcha.jpg",
		    		"/wrsis/","/icons/","/justifiedGallery/","/Portal/","/css/","/img/","/script/","/api/","/mobile/","/pagejs/","/gisapi/","/external/",
		    		"/signUpPacsInspector","/savePacsInspectorData","/saveOtp","/validateOtp","/MobileAPI/sendOtp","/MobileAPI/verifyOtp","/MobileAPI/masterData","/fetchBlockDetailsByDistId",
		    		"/fetchPacsDetailsByBlockId","/MobileAPI/uploadProfileImage","/MobileAPI/getVillageList","/MobileAPI/getPendingPlots","/MobileAPI/takeAction","/viewSurveyReport","/actionOnPacsInspector",
		    		"/viewRegisterPacsInspector","/viewRegisterPacsInspectorApprove","/viewRegisterPacsInspectorReject","/fetchtahasilListByDistCode","/fetchvillageListByTahasilCode","/fetchPlotDetailsByPlotCode","/actionOnSurveyDetails",
		    		"/updateGroupPermission","/changePassword","/plotSearchReport","/tahasilSummaryReport","/mapViewerReport","/villageSummaryFarmerWiseReport","/villageSummaryPlotWiseReport","/api//getDistrictsMaster","/queryBuilder","/api/getTahasilMaster",
		    		"/api/getVillageMaster","/viewSuspectedPlot","/fetchPacsListByDistCode"};

		
		if("GET".equalsIgnoreCase(request.getMethod())) {
			return true;
		}
		
    	
        String path = request.getServletPath();
        System.out.println(path+"................servlt path in csrf......"+Arrays.asList(exludeURLs).contains(path));
      
        return Arrays.asList(exludeURLs).contains(path);
    }
    
    
}
