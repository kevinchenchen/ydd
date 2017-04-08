package com.stone.wine.model;

/**
 * 红酒子类型
 * 
 * @author stone
 *
 */
public class WineChildType {
	/**
	 * 编号
	 */
	private long id;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 父类型编号
	 */
	private long typeId;

	/**
	 * url
	 */
	private String url;
	/**
	 * 添加时间
	 */
	private String addTime;
	/**
	 * 标识
	 */
	private int flag;

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

	public long getTypeId() {
		return typeId;
	}

	public void setTypeId(long typeId) {
		this.typeId = typeId;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getAddTime() {
		return addTime;
	}

	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}

}
