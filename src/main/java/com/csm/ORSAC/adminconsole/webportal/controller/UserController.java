package com.csm.ORSAC.adminconsole.webportal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.csm.ORSAC.adminconsole.webportal.api.ApiUrl;
import com.csm.ORSAC.adminconsole.webportal.bean.PrimaryLinkReqDto;
import com.csm.ORSAC.adminconsole.webportal.response.RestResponse;
import com.csm.ORSAC.adminconsole.webportal.util.GenericServiceRequest;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UserController {

	public static final Logger LOG = LoggerFactory.getLogger(UserController.class);

	@RequestMapping(value = ApiUrl.User.GET_PRIMARY_LNK_ACTION, method = RequestMethod.POST)
	@ResponseBody
	public RestResponse<PrimaryLinkReqDto> getPrimaryLinkAction(@RequestBody PrimaryLinkReqDto plnkDto) {
		JsonNode JsonNode = null;
		RestResponse<PrimaryLinkReqDto> response = new RestResponse<>();
		try {

			GenericServiceRequest<PrimaryLinkReqDto> genericReq = new GenericServiceRequest<>(plnkDto);
			JsonNode = genericReq.sendPOST("getPrimaryLinkAction");
			ObjectMapper mapper = new ObjectMapper();
			response = mapper.readValue(JsonNode.toString(), new TypeReference<RestResponse<PrimaryLinkReqDto>>() {
			});
		} catch (Exception e) {
			LOG.error("UserController::getPrimaryLinkAction():" + e);
		}
		return response;
	}

}
