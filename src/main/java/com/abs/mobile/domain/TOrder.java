package com.abs.mobile.domain;

import java.math.BigDecimal;
import java.util.Date;

public class TOrder extends TOrderKey {
    private Date orderDate;

    private String status;

    private String openId;

    private Integer addressId;

    private BigDecimal totlePrice;

    private BigDecimal wuliuYunfei;

    private String yhqFlg;

    private Integer yhqCode;

    private String jifenFlg;

    private BigDecimal jifenDixiao;

    private BigDecimal shijiPrice;

    private String delFlg;

    private Date cDate;

    private String cUser;

    private Date uDate;

    private String uUser;

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

    public Integer getAddressId() {
        return addressId;
    }

    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
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