package com.abs.mobile.domain;

import java.util.Date;

public class TItemPingjia extends TItemPingjiaKey {
    private String openId;

    private String nickname;

    private String pingjiaLevel;

    private String pingjiaText;

    private Date pingjiaDate;

    private String delFlg;

    private Date cDate;

    private String cUser;

    private Date uDate;

    private String uUser;

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId == null ? null : openId.trim();
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getPingjiaLevel() {
        return pingjiaLevel;
    }

    public void setPingjiaLevel(String pingjiaLevel) {
        this.pingjiaLevel = pingjiaLevel == null ? null : pingjiaLevel.trim();
    }

    public String getPingjiaText() {
        return pingjiaText;
    }

    public void setPingjiaText(String pingjiaText) {
        this.pingjiaText = pingjiaText == null ? null : pingjiaText.trim();
    }

    public Date getPingjiaDate() {
        return pingjiaDate;
    }

    public void setPingjiaDate(Date pingjiaDate) {
        this.pingjiaDate = pingjiaDate;
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