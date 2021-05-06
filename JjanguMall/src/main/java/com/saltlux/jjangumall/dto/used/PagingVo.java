package com.saltlux.jjangumall.dto.used;

public class PagingVo {

	private Long page;
	private Long maxCount;
	private Long maxPage;
	private Long minView;
	private Long maxView;

	public PagingVo(Long page, Long maxCount) {

		this.page = page;
		this.maxCount = maxCount;
		maxPage = (maxCount + 2) / 3;
		minView = page < 3 ? 1 : page - 2;
		maxView = (page + 2) <= maxPage ? page + 2 : maxPage;
	}

	public Long getPage() {
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	public Long getMaxCount() {
		return maxCount;
	}

	public void setMaxCount(Long maxCount) {
		this.maxCount = maxCount;
	}

	public Long getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(Long maxPage) {
		this.maxPage = maxPage;
	}

	public Long getMinView() {
		return minView;
	}

	public void setMinView(Long minView) {
		this.minView = minView;
	}

	public Long getMaxView() {
		return maxView;
	}

	public void setMaxView(Long maxView) {
		this.maxView = maxView;
	}

	@Override
	public String toString() {
		return "PagingVo [page=" + page + ", maxCount=" + maxCount + ", maxPage=" + maxPage + ", minView=" + minView
				+ ", maxView=" + maxView + "]";
	}

	
}
