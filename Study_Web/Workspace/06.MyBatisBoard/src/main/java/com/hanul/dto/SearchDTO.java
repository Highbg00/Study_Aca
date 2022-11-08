package com.hanul.dto;

import java.io.Serializable;

public class SearchDTO implements Serializable {

	private String search, keyword;

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
