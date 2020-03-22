package com.liujiajun.domain;

public class FindBookCondition {
    private String selectCategory;
    private String selectAppearance;
    private String selectPrice;

    public String getSelectCategory() {
        return selectCategory;
    }

    public void setSelectCategory(String selectCategory) {
        this.selectCategory = selectCategory;
    }

    public String getSelectAppearance() {
        return selectAppearance;
    }

    public void setSelectAppearance(String selectAppearance) {
        this.selectAppearance = selectAppearance;
    }

    public String getSelectPrice() {
        return selectPrice;
    }

    public void setSelectPrice(String selectPrice) {
        this.selectPrice = selectPrice;
    }

    @Override
    public String toString() {
        return "FindBookCondition{" +
                "selectCategory='" + selectCategory + '\'' +
                ", selectAppearance='" + selectAppearance + '\'' +
                ", selectPrice='" + selectPrice + '\'' +
                '}';
    }
}
