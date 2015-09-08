package com.abs.mobile.domain;

import java.util.Date;

public class TUserAddress extends TUserAddressKey {
    private String country;

    private String regionName1;

    private String regionName2;

    private String regionName3;

    private String addressDetail;

    private String name;

    private String tel;

    private String post;

    private String delFlg;

    private Date cDate;

    private String cUser;

    private Date uDate;

    private String uUser;

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country == null ? null : country.trim();
    }

    public String getRegionName1() {
        return regionName1;
    }

    public void setRegionName1(String regionName1) {
        this.regionName1 = regionName1 == null ? null : regionName1.trim();
    }

    public String getRegionName2() {
        return regionName2;
    }

    public void setRegionName2(String regionName2) {
        this.regionName2 = regionName2 == null ? null : regionName2.trim();
    }

    public String getRegionName3() {
        return regionName3;
    }

    public void setRegionName3(String regionName3) {
        this.regionName3 = regionName3 == null ? null : regionName3.trim();
    }

    public String getAddressDetail() {
        return addressDetail;
    }

    public void setAddressDetail(String addressDetail) {
        this.addressDetail = addressDetail == null ? null : addressDetail.trim();
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

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post == null ? null : post.trim();
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