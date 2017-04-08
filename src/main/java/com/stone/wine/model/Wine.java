package com.stone.wine.model;

/**
 * 酒
 * 
 * @author stone
 * 
 */
/**
 * @author Administrator
 *
 */
/**
 * @author Administrator
 * 
 */
public class Wine {

    public Wine() {
    }

    public Wine(String name) {
        this.name = name;
    }

    /**
     * 编号
     */
    private long id;

    /**
     * 名称
     */
    private String name;

    /**
     * 封面图
     */
    private String cover;

    /**
     * 产品图
     */
    private String pimg;

    /**
     * 单价
     */
    private double price;

    /**
     * 折扣价
     */
    private double discountPrice;

    /**
     * 库存
     */
    private int stock;

    /**
     * 描述
     */
    private String description;

    /**
     * 容量
     */
    private String capacity;

    /**
     * 红酒类型编号
     */
    private long typeId;

    /**
     * 葡萄品种
     */
    private String varieties;

    /**
     * 产地
     */
    private String placeoforigin;

    /**
     * 酒精度
     */
    private String alcohol;

    /**
     * 贮藏条件
     */
    private String storageCondition;

    /**
     * 添加时间
     */
    private String addtime;

    /**
     * 标识
     */
    private int flag;

    /**
     * 推荐
     */
    private String recommend;

    /**
     * 特价
     */
    private String special;

    /**
     * 详细
     */
    private String detail;

    private WineType wineType;

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

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getPimg() {
        return pimg;
    }

    public void setPimg(String pimg) {
        this.pimg = pimg;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscountPrice() {
        return discountPrice;
    }

    public void setDiscountPrice(double discountPrice) {
        this.discountPrice = discountPrice;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public long getTypeId() {
        return typeId;
    }

    public void setTypeId(long typeId) {
        this.typeId = typeId;
    }

    public void setVarieties(String varieties) {
        this.varieties = varieties;
    }

    public String getPlaceoforigin() {
        return placeoforigin;
    }

    public void setPlaceoforigin(String placeoforigin) {
        this.placeoforigin = placeoforigin;
    }

    public String getAlcohol() {
        return alcohol;
    }

    public void setAlcohol(String alcohol) {
        this.alcohol = alcohol;
    }

    public String getStorageCondition() {
        return storageCondition;
    }

    public void setStorageCondition(String storageCondition) {
        this.storageCondition = storageCondition;
    }

    public int getFlag() {
        return flag;
    }

    public void setFlag(int flag) {
        this.flag = flag;
    }

    public WineType getWineType() {
        return wineType;
    }

    public void setWineType(WineType wineType) {
        this.wineType = wineType;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    public String getVarieties() {
        return varieties;
    }

    public String getRecommend() {
        return recommend;
    }

    public void setRecommend(String recommend) {
        this.recommend = recommend;
    }

    public String getSpecial() {
        return special;
    }

    public void setSpecial(String special) {
        this.special = special;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

}
