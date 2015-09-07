package com.abs.mobile.domain;

public class TCartKey {
    private Integer itemId;

    private Integer itemGuige;

    private Integer itemYanse;

    private String openId;

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public Integer getItemGuige() {
        return itemGuige;
    }

    public void setItemGuige(Integer itemGuige) {
        this.itemGuige = itemGuige;
    }

    public Integer getItemYanse() {
        return itemYanse;
    }

    public void setItemYanse(Integer itemYanse) {
        this.itemYanse = itemYanse;
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId == null ? null : openId.trim();
    }
}