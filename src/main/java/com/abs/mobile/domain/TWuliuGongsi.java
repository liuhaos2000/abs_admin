package com.abs.mobile.domain;

public class TWuliuGongsi {
    private String gongsiId;

    private String gongsiName;

    public String getGongsiId() {
        return gongsiId;
    }

    public void setGongsiId(String gongsiId) {
        this.gongsiId = gongsiId == null ? null : gongsiId.trim();
    }

    public String getGongsiName() {
        return gongsiName;
    }

    public void setGongsiName(String gongsiName) {
        this.gongsiName = gongsiName == null ? null : gongsiName.trim();
    }
}