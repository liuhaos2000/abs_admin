package com.abs.util.commom;

import java.math.BigDecimal;

public class ObjUtil {
	public static String ObjCheck(Object obj) {
		
    	if(obj instanceof String){
    		return (String)obj;
    	}else if(obj instanceof Integer){
    		return obj.toString();
    	}else if(obj instanceof BigDecimal){
    		return obj.toString();
    	}
		return null;
	}
}