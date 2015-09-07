package com.abs.mobile.domain;

public class TOrderKey {
    private String orderId;

    private String orderZhifuId;

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
}