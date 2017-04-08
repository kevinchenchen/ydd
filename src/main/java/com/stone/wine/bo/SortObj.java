package com.stone.wine.bo;

/**
 * 排序对象
 * 
 * @author stone
 *
 */
public class SortObj {

	public SortObj() {
	}

	public SortObj(String id, String sort) {
		this.id = id;
		this.sort = sort;
	}

	/**
	 * id
	 */
	private String id;
	/**
	 * 序号
	 */
	private String sort;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

}
