package com.abs.util.commom;

public class AbsConst {

    // LoginUser Session KEY
    public static final String LOGIN_USER = "LOGIN_USER";

    public static String access_token = "";
    public static String jsapi_ticket = "";

    // public static final String TOKEN = "abs_web_ruihegouwu";

    // public static final String APPID = "wx9c7713176c68cf82";

    // public static final String APPSECRET =
    // "954f1660478f3909d3e49294508a9203";

    // public static final String SEVERPATH = "http://maifangbang.duapp.com/";

    // public static String AUTHORIZE_URL =
    // "https://open.weixin.qq.com/connect/oauth2/authorize?"
    // + "appid={0}&redirect_uri=http://mfbtest.duapp.com"
    // + "{1}&response_type=code&scope=snsapi_base&state={2}#wechat_redirect";

    /**
     * 业务相关================================================
     */
    public static final String MODE_ADD = "ADD";
    public static final String MODE_UPD = "UPD";
    /**
     * 订单状态 待支付 ：1
     */
    public static final String ORDER_WAIT_PAY = "1";
    /**
     * 订单状态 已付款 待发货 ：2
     */
    public static final String ORDER_PAYED = "2";
    /**
     * 订单状态 已发货 ：3
     */
    public static final String ORDER_SENDED = "3";
    /**
     * 订单状态 已钱收 ：4
     */
    public static final String ORDER_SIGN = "4";
}