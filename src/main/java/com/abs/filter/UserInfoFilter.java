package com.abs.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

import net.sf.json.JSONObject;

import com.abs.util.Log4jUtil;
import com.abs.weixin.utils.WeixinConst;
//import com.aklk.beans.c2.pojoBean.UserInfo;


/**
 * 认证用户信息取得
 * 
 * @author Liu
 * @date 2014/04/14
 */
public class UserInfoFilter extends HttpServlet implements Filter {

    /**
     * 
     */
    private static final long serialVersionUID = 8007900399585396266L;
    private final String renzhengurl = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=SCOPE&state=STATE#wechat_redirect";
    private final String scope = "snsapi_base";
    private final String redirecturi = WeixinConst.SEVERPATH + "c2/c20101.do";

    @Override
    public void doFilter(ServletRequest sRequest, ServletResponse sResponse,
            FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) sRequest;
        HttpServletResponse response = (HttpServletResponse) sResponse;
        HttpSession session = request.getSession();
        String url = request.getServletPath();
        String state = null;
        String queryString = request.getQueryString();
        if (StringUtils.isEmpty(queryString)) {
            state = url;
        } else{
            state = url + "?"+queryString;
            // 转换
            try {
                state = URLEncoder.encode(state, "UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
           
        }

        if (url.equals("")) {
            url += "/";
        }

        if (url.startsWith("/k1/") || url.startsWith("/k2/")
                || url.startsWith("/k3/") || url.startsWith("/c1/")
                || url.startsWith("/c2/c202")
                || url.startsWith("/m1/")
                || (url.startsWith("/h1/")&&(!url.startsWith("/h1/h10104")))) {// 若访问后台资源

//            UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
            Logger log = Log4jUtil.getLogger();

//            if (userInfo == null) {
                // session 没有 去找Cookie
//                CookieTool cookieTool = new CookieTool(request, response);
//                String val = cookieTool.getCookieValue("userInfo");
//                if (StringUtils.isNotEmpty(val)) {
//                    
//                    JSONObject jsonobject = JSONObject.fromObject(val);
//                    userInfo = new UserInfo();
//                    //
//                    userInfo.setOpenId(jsonobject.getString("openId"));
//                    userInfo.setSubscribe(jsonobject.getString("subscribe"));
//                    userInfo.setNickname(jsonobject.getString("nickname"));
//                    userInfo.setWeixinSex(jsonobject.getString("weixinSex"));
//                    userInfo.setCity(jsonobject.getString("city"));
//                    userInfo.setProvince(jsonobject.getString("province"));
//                    userInfo.setCountry(jsonobject.getString("country"));
//                    userInfo.setWeixinImageUrl(jsonobject
//                            .getString("weixinImageUrl"));
//                    userInfo.setCardId(jsonobject.getString("cardId"));
//                    userInfo.setName(jsonobject.getString("name"));
//                    userInfo.setSex(jsonobject.getString("sex"));
//                    userInfo.setTel(jsonobject.getString("tel"));
//                    userInfo.setTelAreaFlg(jsonobject.getString("telAreaFlg"));
//                    userInfo.setTelAreaName(jsonobject.getString("telAreaName"));
//                    //userInfo.setMoney(new BigDecimal(jsonobject.getString("money")));
//                    userInfo.setImageUrl(jsonobject.getString("imageUrl"));
//                    // 把cookie设置到session
//                    session.setAttribute("userInfo", userInfo);
//                    log.debug("2222222222222 cookie :"+userInfo.getOpenId());
//                    // 已获取用户信息
//                } else {

                    // Cookie 也没有
                    String rurl = renzhengurl
                            .replace("APPID", WeixinConst.APPID)
                            .replace("REDIRECT_URI", redirecturi)
                            .replace("SCOPE", scope).replace("STATE", state);
                    log.debug(rurl);
                    response.sendRedirect(rurl);
                    return;
//                }
//            }

            // C101 & 未关注
//            if (url.startsWith("/c1/init")
//                    && "0".equals(userInfo.getSubscribe())) {
//                // Cookie 也没有
//                String rurl = renzhengurl.replace("APPID", WeixinConst.APPID)
//                        .replace("REDIRECT_URI", redirecturi)
//                        .replace("SCOPE", scope).replace("STATE", state);
//                response.sendRedirect(rurl);
//                return;
//
//            }

        }
        // 其他请求
        filterChain.doFilter(sRequest, sResponse);
        return;
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        // TODO Auto-generated method stub

    }

}
