package com.saltlux.jjangumall.dto.used;

public class SearchVo {
	
	private Long page;
	private String option; 
	private String search;
	
	
	public Long getPage() {
		return page;
	}
	public void setPage(Long page) {
		this.page = page;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
	
	@Override
	public String toString() {
		return "SearchVo [page=" + page + ", option=" + option + ", search=" + search + "]";
	}
	
	

}
