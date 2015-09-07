package com.abs.util.commom;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils; 

public class AbsTool {
	/**
	 * 加百分号
	 * @param parm
	 * @return
	 */
	public static String addLike(String parm) {
		String result=null;
		if(StringUtils.isNotEmpty(parm)){
			result="%"+parm.trim()+"%";
		}
		return result;
	}
	/**
	 * 商品参数
	 * @param parm
	 * @return
	 */
	public static List<Map<String,String>> changeItemParm(String itemParm) {
		if(StringUtils.isEmpty(itemParm)){
			return null;
		}
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		String[] parms = itemParm.split("\\|");
		for (String  parm: parms) {
			if(StringUtils.isNotEmpty(parm)){
				String[] str = parm.split(":");
				Map<String,String> map = new HashMap<String,String>();
				map.put("key", str[0]);
				map.put("value", str[1]);
				list.add(map);
			}
		}
		return list;
	}
	
	/**
	 * tel check
	 * @param parm
	 * @return
	 */
	public static boolean checkTel(String tel) {
		Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");  
		Matcher m = p.matcher(tel);  
		return m.matches();
	}
	
 

}