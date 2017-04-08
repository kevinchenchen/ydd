package com.stone.wine.model;

import java.util.List;

/**
 * 酒类型
 * 
 * @author stone
 * 
 */
public class WineType {
    /**
     * 编号
     */
    private long id;
    /**
     * 名称
     */
    private String name;

    /**
     * 标题
     */
    private String title;

    /**
     * 描述
     */
    private String description;

    /**
     * 图片
     */
    private String img;

    /**
     * 备注
     */
    private String remark;

    /**
     * 添加时间
     */
    private String addTime;
    /**
     * 标志
     */
    private int flag;

    /**
     * 排序
     */
    private String sort;

    /**
     * 子类型
     */
    private List<WineChildType> childTypes;

    /**
     * 红酒
     */
    private List<Wine> wines;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getAddTime() {
        return addTime;
    }

    public void setAddTime(String addTime) {
        this.addTime = addTime;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public List<WineChildType> getChildTypes() {
        return childTypes;
    }

    public void setChildTypes(List<WineChildType> childTypes) {
        this.childTypes = childTypes;
    }

    public List<Wine> getWines() {
        return wines;
    }

    public void setWines(List<Wine> wines) {
        this.wines = wines;
    }

    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

}
