package com.csm.ORSAC.adminconsole.webportal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author Samir
 * This class is a Abstract Class where we add common function like set session and getSession
 *
 */
public abstract class OrsacPortalAbstractController {

	/**
	 * @param request
	 * @param attributeName
	 * @return session object
	 */
	public final Object getAttibuteFromSession(final HttpServletRequest request, 
			final String attributeName) {
		final HttpSession session = request.getSession(false);
		Object returnObject = null;
		if(session !=null && session.getAttribute(attributeName) != null) {
			returnObject = session.getAttribute(attributeName);
		}
		return returnObject;
	}
	
	
	/**
	 * @param request
	 * @param attribute
	 * @param attributeName
	 *  set value in the session.
	 */
	public final void addAttibuteInSession(final HttpServletRequest request, final Object attribute, 
			final String attributeName) {
		final HttpSession session = request.getSession(false);
		session.setAttribute(attributeName, attribute);
	}
	
	
	
}
