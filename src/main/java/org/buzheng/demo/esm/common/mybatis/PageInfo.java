package org.buzheng.demo.esm.common.mybatis;

public class PageInfo {

    private int pageSize;
    private int pageNumber;
    private String orderByString;

    public PageInfo(int pageNumber, int pageSize, String orderByString) {
        this.pageSize = pageSize;
        this.pageNumber = pageNumber;
        this.orderByString = orderByString;
    }
    public PageInfo(int pageNumber, int pageSize, String sort,String order) {
        this.pageSize = pageSize;
        this.pageNumber = pageNumber;
        
        this.orderByString = sortFormat(sort) + " " + order;
    }
    public int getOffset() {
        return pageSize * pageNumber;
    }
    /**
     * @return the pageSize
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * @param pageSize
     *            the pageSize to set
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * @return the pageNumber
     */
    public int getPageNumber() {
        return pageNumber;
    }

    /**
     * @param pageNumber
     *            the pageNumber to set
     */
    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    /**
     * @return the orderByString
     */
    public String getOrderByString() {
        return orderByString;
    }

    /**
     * @param orderByString
     *            the orderByString to set
     */
    public void setOrderByString(String orderByString) {
        this.orderByString = orderByString;
    }

    /**
     * 大写字母前插入空格
     * @param sort
     * @return
     */
    private String sortFormat(String sort) {

        String result="";
        
        for (int i = 0; i < sort.length(); i++) {
            char c = sort.charAt(i);
            if (!Character.isLowerCase(c)) {
                result = result + "_" + c;
            } else {
                result = result + c;
            }
        }
        return result.toUpperCase();
    }
}
