package com.abs.util.commom;

import java.util.Map;
import java.util.TreeMap;

public class AbsConstMap {

	public final static Map<String, String> ORDER_STATUS = new TreeMap<String, String>() {
		private static final long serialVersionUID = -3849927724096985474L;
		{
	        put("1", "待付款");
	        put("2", "已付款");
	        put("3", "已发货");
	        put("4", "已完成");
	        put("5", "已关闭");
	    }
	};
    
	
	public final static Map<String, String> ITEM_TYPE = new TreeMap<String, String>() {

		private static final long serialVersionUID = 7058096106009835265L;

		{
	        put("2", "果品优选");
	        put("5", "海外优选");

	    }
	};
	
	public final static Map<String, String> SHANGJIA_FLG = new TreeMap<String, String>() {

		private static final long serialVersionUID = -3228637765067209970L;

		{
	        put("1", "上架");
	        put("0", "下架");

	    }
	};
	public final static Map<String, String> BAOYOU_FLG = new TreeMap<String, String>() {
		private static final long serialVersionUID = -8500037348082745026L;
		{
	        put("1", "包邮");
	        put("0", "不包邮");

	    }
	};
	
	public final static Map<String, String> PICTURE_TYPE = new TreeMap<String, String>() {
		private static final long serialVersionUID = 8092490886491152324L;
		{
	        put("1", "转发图");
	        put("2", "滚动图");
	        put("3", "购物车图");

	    }
	};
	
	public final static Map<String, String> LEVER_ID = new TreeMap<String, String>() {
		private static final long serialVersionUID = -8149174408079035632L;
		{
	        put("00", "顶级");
	        put("01", "一级");
	        put("02", "二级");
	        put("98", "申请");
	        put("99", "一般");
	    }
	};
}