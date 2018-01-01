package com.abs.mobile.domain;

import java.util.Date;

public class TItem {
    private Integer itemId;

    private String itemName;

    private String manufacturer;

    private String owner;

    private String ownerOpenId;

    private Integer type;

    private Integer prentItemId;

    private String parm;

    private String xiangouFlg;

    private Integer xiangouShuliang;

    private String baoyouFlg;

    private Integer wuliuId;

    private String fapiaoFlg;

    private String fapiaoTitle;

    private String shouhouFlg;

    private String shouhouMiaoshu;

    private String shangjiaFlg;

    private Integer fromArea;

    private String frendTitle;

    private String frendText;

    private String delFlg;

    private Date cDate;

    private String cUser;

    private Date uDate;

    private String uUser;

    private String fuText;

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName == null ? null : itemName.trim();
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer == null ? null : manufacturer.trim();
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner == null ? null : owner.trim();
    }

    public String getOwnerOpenId() {
        return ownerOpenId;
    }

    public void setOwnerOpenId(String ownerOpenId) {
        this.ownerOpenId = ownerOpenId == null ? null : ownerOpenId.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getPrentItemId() {
        return prentItemId;
    }

    public void setPrentItemId(Integer prentItemId) {
        this.prentItemId = prentItemId;
    }

    public String getParm() {
        return parm;
    }

    public void setParm(String parm) {
        this.parm = parm == null ? null : parm.trim();
    }

    public String getXiangouFlg() {
        return xiangouFlg;
    }

    public void setXiangouFlg(String xiangouFlg) {
        this.xiangouFlg = xiangouFlg == null ? null : xiangouFlg.trim();
    }

    public Integer getXiangouShuliang() {
        return xiangouShuliang;
    }

    public void setXiangouShuliang(Integer xiangouShuliang) {
        this.xiangouShuliang = xiangouShuliang;
    }

    public String getBaoyouFlg() {
        return baoyouFlg;
    }

    public void setBaoyouFlg(String baoyouFlg) {
        this.baoyouFlg = baoyouFlg == null ? null : baoyouFlg.trim();
    }

    public Integer getWuliuId() {
        return wuliuId;
    }

    public void setWuliuId(Integer wuliuId) {
        this.wuliuId = wuliuId;
    }

    public String getFapiaoFlg() {
        return fapiaoFlg;
    }

    public void setFapiaoFlg(String fapiaoFlg) {
        this.fapiaoFlg = fapiaoFlg == null ? null : fapiaoFlg.trim();
    }

    public String getFapiaoTitle() {
        return fapiaoTitle;
    }

    public void setFapiaoTitle(String fapiaoTitle) {
        this.fapiaoTitle = fapiaoTitle == null ? null : fapiaoTitle.trim();
    }

    public String getShouhouFlg() {
        return shouhouFlg;
    }

    public void setShouhouFlg(String shouhouFlg) {
        this.shouhouFlg = shouhouFlg == null ? null : shouhouFlg.trim();
    }

    public String getShouhouMiaoshu() {
        return shouhouMiaoshu;
    }

    public void setShouhouMiaoshu(String shouhouMiaoshu) {
        this.shouhouMiaoshu = shouhouMiaoshu == null ? null : shouhouMiaoshu.trim();
    }

    public String getShangjiaFlg() {
        return shangjiaFlg;
    }

    public void setShangjiaFlg(String shangjiaFlg) {
        this.shangjiaFlg = shangjiaFlg == null ? null : shangjiaFlg.trim();
    }

    public Integer getFromArea() {
        return fromArea;
    }

    public void setFromArea(Integer fromArea) {
        this.fromArea = fromArea;
    }

    public String getFrendTitle() {
        return frendTitle;
    }

    public void setFrendTitle(String frendTitle) {
        this.frendTitle = frendTitle == null ? null : frendTitle.trim();
    }

    public String getFrendText() {
        return frendText;
    }

    public void setFrendText(String frendText) {
        this.frendText = frendText == null ? null : frendText.trim();
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

    public String getFuText() {
        return fuText;
    }

    public void setFuText(String fuText) {
        this.fuText = fuText == null ? null : fuText.trim();
    }
}