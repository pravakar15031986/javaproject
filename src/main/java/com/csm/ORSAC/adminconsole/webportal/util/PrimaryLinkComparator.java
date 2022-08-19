package com.csm.ORSAC.adminconsole.webportal.util;

import java.util.Comparator;

import com.csm.ORSAC.adminconsole.webportal.entity.PrimaryLink;

public class PrimaryLinkComparator implements Comparator<PrimaryLink> {

	@Override
	public int compare(PrimaryLink obj1, PrimaryLink obj2) {
		return obj1.getSlNo() - obj2.getSlNo();
	}

}
