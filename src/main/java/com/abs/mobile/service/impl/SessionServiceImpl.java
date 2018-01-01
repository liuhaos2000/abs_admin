package com.abs.mobile.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.buzheng.demo.esm.App;
import org.buzheng.demo.esm.domain.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abs.mobile.service.SessionService;


@Service
public class SessionServiceImpl implements SessionService {
   
    @Autowired(required = false)
    private  HttpServletRequest request;
    
    @Override
    public SysUser getLoginUser() {
        HttpSession session =request.getSession();
        SysUser user = (SysUser)session.getAttribute(App.USER_SESSION_KEY);
        return user;
    }

	@Override
	public void setLoginUser(SysUser user) {
		HttpSession session =request.getSession();
		session.setAttribute(App.USER_SESSION_KEY, user);
	}

    @Override
    public String getUserIp() {
        return request.getRemoteAddr();
    }

	@Override
	public HttpSession getSession() {
		return request.getSession();
	}


	
	
}
