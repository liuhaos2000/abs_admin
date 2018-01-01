package com.abs.mobile.domain;

import java.math.BigDecimal;
import java.util.Date;

public class TOrder {
    private String orderId;

    private String orderZhifuId;

    private Date orderDate;

    private String status;

    private String openId;

    private String userLv;

    private Integer addressId;

    private String name;

    private String tel;

    private String addressFull;

    private BigDecimal totlePrice;

    private BigDecimal wuliuYunfei;

    private String yhqFlg;

    private Integer yhqCode;

    private String jifenFlg;

    private BigDecimal jifenDixiao;

    private BigDecimal shijiPrice;

    private String pOpenId;

    private String pUserLv;

    private BigDecimal cost;

    private BigDecimal lv00Lirun;

    private BigDecimal lv01Lirun;

    private BigDecimal lv02Lirun;

    private String delFlg;

    private Date cDate;

    private String cUser;

    private Date uDate;

    private String uUser;

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId == null ? null : orderId.trim();
    }

    public String getOrderZhifuId() {
        return orderZhifuId;
    }

    public void setOrderZhifuId(String orderZhifuId) {
        this.orderZhifuId = orderZhifuId == null ? null : orderZhifuId.trim();
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId == null ? null : openId.trim();
    }

    public String getUserLv() {
        return userLv;
    }

    public void setUserLv(String userLv) {
        this.userLv = userLv == null ? null : userLv.trim();
    }

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getAddressFull() {
        return addressFull;
    }

    public void setAddressFull(String addressFull) {
        this.addressFull = addressFull == null ? null : addressFull.trim();
    }

    public BigDecimal getTotlePrice() {
        return totlePrice;
    }

    public void setTotlePrice(BigDecimal totlePrice) {
        this.totlePrice = totlePrice;
    }

    public BigDecimal getWuliuYunfei() {
        return wuliuYunfei;
    }

    public void setWuliuYunfei(BigDecimal wuliuYunfei) {
        this.wuliuYunfei = wuliuYunfei;
    }

    public String getYhqFlg() {
        return yhqFlg;
    }

    public void setYhqFlg(String yhqFlg) {
        this.yhqFlg = yhqFlg == null ? null : yhqFlg.trim();
    }

    public Integer getYhqCode() {
        return yhqCode;
    }

    public void setYhqCode(Integer yhqCode) {
        this.yhqCode = yhqCode;
    }

    public String getJifenFlg() {
        return jifenFlg;
    }

    public void setJifenFlg(String jifenFlg) {
        this.jifenFlg = jifenFlg == null ? null : jifenFlg.trim();
    }

    public BigDecimal getJifenDixiao() {
        return jifenDixiao;
    }

    public void setJifenDixiao(BigDecimal jifenDixiao) {
        this.jifenDixiao = jifenDixiao;
    }

    public BigDecimal getShijiPrice() {
        return shijiPrice;
    }

    public void setShijiPrice(BigDecimal shijiPrice) {
        this.shijiPrice = shijiPrice;
    }

    public String getpOpenId() {
        return pOpenId;
    }

    public void setpOpenId(String pOpenId) {
        this.pOpenId = pOpenId == null ? null : pOpenId.trim();
    }

    public String getpUserLv() {
        return pUserLv;
    }

    public void setpUserLv(String pUserLv) {
        this.pUserLv = pUserLv == null ? null : pUserLv.trim();
    }

    public BigDecimal getCost() {
        return cost;
    }

    public void setCost(BigDecimal cost) {
        this.cost = cost;
    }

    public BigDecimal getLv00Lirun() {
        return lv00Lirun;
    }

    public void setLv00Lirun(BigDecimal lv00Lirun) {
        this.lv00Lirun = lv00Lirun;
    }

    public BigDecimal getLv01Lirun() {
        return lv01Lirun;
    }

    public void setLv01Lirun(BigDecimal lv01Lirun) {
        this.lv01Lirun = lv01Lirun;
    }

    public BigDecimal getLv02Lirun() {
        return lv02Lirun;
    }

    public void setLv02Lirun(BigDecimal lv02Lirun) {
        this.lv02Lirun = lv02Lirun;
    }

    public String getDelFlg() {
        return delFlg;
    }

    public void setDelFlg(String delFlg) {
        this.delFlg = delFlg == null ? null : delFlg.trim();
    }

    public Date getcDate() {
        return cDate;
    }

    public void setcDate(Date cDate) {
        this.cDate = cDate;
    }

    public String getcUser() {
        return cUser;
    }

    public void setcUser(String cUser) {
        this.cUser = cUser == null ? null : cUser.trim();
    }

    public Date getuDate() {
        return uDate;
    }

    public void setuDate(Date uDate) {
        this.uDate = uDate;
    }

    public String getuUser() {
        return uUser;
    }

    public void setuUser(String uUser) {
        this.uUser = uUser == null ? null : uUser.trim();
    }
}