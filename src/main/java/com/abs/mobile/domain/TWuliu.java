package com.abs.mobile.domain;

import java.math.BigDecimal;
import java.util.Date;

public class TWuliu {
    private Integer wuliuId;

    private Integer fromArea;

    private String fromText;

    private Integer toArea;

    private String toText;

    private BigDecimal price;

    private BigDecimal pricePlus;

    private String unitId;

    private String unitName;

    private String delFlg;

    private Date cDate;

    private String cUser;

    private Date uDate;

    private String uUser;

    public Integer getWuliuId() {
        return wuliuId;
    }

    public void setWuliuId(Integer wuliuId) {
        this.wuliuId = wuliuId;
    }

    public Integer getFromArea() {
        return fromArea;
    }

    public void setFromArea(Integer fromArea) {
        this.fromArea = fromArea;
    }

    public String getFromText() {
        return fromText;
    }

    public void setFromText(String fromText) {
        this.fromText = fromText == null ? null : fromText.trim();
    }

    public Integer getToArea() {
        return toArea;
    }

    public void setToArea(Integer toArea) {
        this.toArea = toArea;
    }

    public String getToText() {
        return toText;
    }

    public void setToText(String toText) {
        this.toText = toText == null ? null : toText.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getPricePlus() {
        return pricePlus;
    }

    public void setPricePlus(BigDecimal pricePlus) {
        this.pricePlus = pricePlus;
    }

    public String getUnitId() {
        return unitId;
    }

    public void setUnitId(String unitId) {
        this.unitId = unitId == null ? null : unitId.trim();
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName == null ? null : unitName.trim();
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