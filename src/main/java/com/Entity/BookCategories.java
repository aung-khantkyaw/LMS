package com.Entity;

public class BookCategories {
	private String catId;
	private String catName;
	@Override
	public String toString() {
		return "BookCategories [catId=" + catId + ", catName=" + catName + "]";
	}
	public BookCategories(String catId, String catName) {
		super();
		this.catId = catId;
		this.catName = catName;
	}
	public String getCatId() {
		return catId;
	}
	public void setCatId(String catId) {
		this.catId = catId;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	
}

