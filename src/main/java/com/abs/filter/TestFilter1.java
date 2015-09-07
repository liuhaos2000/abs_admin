package com.abs.filter;

import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;

import net.sf.json.JSONObject;

/**
 * 测试用
 * 
 * @author Liu
 * @date 2014/04/14
 */
public class TestFilter1 extends HttpServlet implements Filter {

    @Override
    public void doFilter(ServletRequest sRequest, ServletResponse sResponse,
            FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) sRequest;
        HttpServletResponse response = (HttpServletResponse) sResponse;
        HttpSession session = request.getSession();
        String url = request.getServletPath();
        String state = request.getRequestURI();
        String queryString = request.getQueryString();

        if (StringUtils.isEmpty(queryString)) {
            state = url;
        } else{
            state = url + "?"+queryString;
        }

        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName()
                + ":" + request.getServerPort() + request.getContextPath()
                + "/";

        if (url.equals("")) {
            url += "/";
        }
        if (url.startsWith("/k1/") || url.startsWith("/k2/")
                || url.startsWith("/k3/") || url.startsWith("/c1/")
                || url.startsWith("/c2/c202")
                || url.startsWith("/m1/")
                || url.startsWith("/h1/")) {// 若访问后台资源
            // 过滤到login

            //UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
//            if (userInfo == null) {
                //userInfo = new UserInfo();
//                if ("1".equals(MfbConst.USER_ROLE_FLG)) {
//
//                    userInfo.setOpenId("11AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
//                    userInfo.setNickname("张小1");
//                    userInfo.setWeixinSex("2");
//                    userInfo.setCity("青岛");
//                    userInfo.setProvince("山东");
//                    userInfo.setCountry("中国");
//                    userInfo.setWeixinImageUrl("http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0");
//
//                    userInfo.setCardId("88882222");
//                    userInfo.setName("张三");
//                    userInfo.setSex("2");
//                    userInfo.setTel("18611113333");
//                    userInfo.setTelAreaFlg("1");
//                    userInfo.setTelAreaName("济南");
//                    userInfo.setMoney(new BigDecimal("500"));
//                    userInfo.setImageUrl("../img/user/22AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA.jpg");
//                } else if ("2".equals(MfbConst.USER_ROLE_FLG)) {
//
//                    userInfo.setOpenId("66AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
//                    userInfo.setNickname("张小1");
//                    userInfo.setWeixinSex("2");
//                    userInfo.setCity("青岛");
//                    userInfo.setProvince("山东");
//                    userInfo.setCountry("中国");
//                    userInfo.setWeixinImageUrl("http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0");
//
//                } else {
//                    userInfo.setOpenId("NNAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
//                    userInfo.setSubscribe("0");
//                }
                // 把cookie设置到session
                //session.setAttribute("userInfo", userInfo);
            }
//        }
        // 其他请求
        filterChain.doFilter(sRequest, sResponse);
        return;
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }

}
