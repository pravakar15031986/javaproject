package com.csm.ORSAC.webportal.util;

import java.util.Random;


public class RandomDigitGenerator {
	
	
	public static int numberGenerator() {
	    Random r = new Random( System.currentTimeMillis() );
	    return 100000 + r.nextInt(200000);
	}

}
