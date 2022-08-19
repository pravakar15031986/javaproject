package com.csm.ORSAC.adminconsole.webportal.util;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;

/**
 * The class use for pagination.
 * 
 * @author niranjan.biswal
 *
 */
public class Pagination implements Serializable {

	private static final long serialVersionUID = 1L;

	private int page = 1;
	private int size = 10;
	private List<String> sortProperties;
	private String sortOrder = "DESC";
	private HttpServletRequest request;

	public Pagination() {
	}

	public Pagination(int page, int size) {
		super();
		this.page = page;
		this.size = size;
	}

	/**
	 * @param page           : page number.
	 * @param size           : page size.
	 * @param sortProperties : sort field name.
	 */
	public Pagination(int page, int size, List<String> sortProperties) {
		super();
		this.page = page;
		this.size = size;
		this.sortProperties = sortProperties;

	}

	/**
	 * @param page           : page number.
	 * @param size           : page size.
	 * @param sortProperties : sort fields names.
	 * @param sortOrder      : sort order.
	 */
	public Pagination(int page, int size, List<String> sortProperties, String sortOrder) {
		super();
		this.page = page;
		this.size = size;
		this.sortProperties = sortProperties;
		this.sortOrder = sortOrder;

	}

	/**
	 * @param sortProperties : sort field name.
	 * @param sortOrder      : sort order.
	 */
	public Pagination(List<String> sortProperties, String sortOrder) {
		super();
		this.sortProperties = sortProperties;
		this.sortOrder = sortOrder;
	}

	/**
	 * @param sortProperties : sort field name.
	 */
	public Pagination(List<String> sortProperties) {
		super();
		this.sortProperties = sortProperties;
	}

	/**
	 * @param request : HttpServlet request object.
	 */
	public Pagination(HttpServletRequest request) {
		this.request = request;
	}

	/**
	 * The method is use for pagination.
	 * 
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public Pageable getPageable() {
		Pageable pageable = null;
		if (request != null) {
			if (request.getParameter("page") != null && !request.getParameter("page").isEmpty()
					&& Integer.parseInt(request.getParameter("page")) > 0)
				page = Integer.parseInt(request.getParameter("page"));
			if (request.getParameter("size") != null && !request.getParameter("size").isEmpty())
				size = Integer.parseInt(request.getParameter("size"));
		}
		
		Sort sort = null;
		if (sortProperties != null && sortProperties.size() > 0 && !sortProperties.get(0).equals("")) {
			if (sortOrder.equalsIgnoreCase("DESC"))
				sort = new Sort(Direction.DESC, sortProperties);
			else if (sortOrder.equalsIgnoreCase("ASC"))
				sort = new Sort(Direction.ASC, sortProperties);
		}
		if (sort != null)
			pageable = new PageRequest(page - 1, size, sort);
		else if (sort == null)
			pageable = new PageRequest(page, size);
		return pageable;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public List<String> getSortProperties() {
		return sortProperties;
	}

	public void setSortProperties(List<String> sortProperties) {
		this.sortProperties = sortProperties;
	}

	public String getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public String toString() {
		return "Pagination [page=" + page + ", size=" + size + ", sortProperties=" + sortProperties + ", sortOrder="
				+ sortOrder + ", request=" + request + "]";
	}

}
