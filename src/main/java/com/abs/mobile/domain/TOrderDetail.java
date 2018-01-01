package com.abs.mobile.domain;

import java.math.BigDecimal;
import java.util.Date;

public class TOrderDetail extends TOrderDetailKey {
    private String guigeText;

    private String yanseText;

    private String owner;

    private Integer shuliang;

    private String huodongFlg;

    private BigDecimal price;

    private String status;

    private String msgStatus;

    private String gongsiId;

    private String wuliuCode;

    private BigDecimal cost;

    private BigDecimal lv00Lirun;

    private BigDecimal lv01Lirun;

    private BigDecimal lv02Lirun;

    private String delFlg;

    private Date cDate;

    private String cUser;

    private Date uDate;

    private String uUser;

    public String getGuigeText() {
        return guigeText;
    }

    public void setGuigeText(String guigeText) {
        this.guigeText = guigeText == null ? null : guigeText.trim();
    }

    public String getYanseText() {
        return yanseText;
    }

    public void setYanseText(String yanseText) {
        this.yanseText = yanseText == null ? null : yanseText.trim();
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner == null ? null : owner.trim();
    }

    public Integer getShuliang() {
        return shuliang;
    }

    public void setShuliang(Integer shuliang) {
        this.shuliang = shuliang;
    }

    public String getHuodongFlg() {
        return huodongFlg;
    }

    public void setHuodongFlg(String huodongFlg) {
        this.huodongFlg = huodongFlg == null ? null : huodongFlg.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

    public String getMsgStatus() {
        return msgStatus;
    }

    public void setMsgStatus(String msgStatus) {
        this.msgStatus = msgStatus == null ? null : msgStatus.trim();
    }

    public String getGongsiId() {
        return gongsiId;
    }

    public void setGongsiId(String gongsiId) {
        this.gongsiId = gongsiId == null ? null : gongsiId.trim();
    }

    public String getWuliuCode() {
        return wuliuCode;
    }

    public void setWuliuCode(String wuliuCode) {
        this.wuliuCode = wuliuCode == null ? null : wuliuCode.trim();
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