package com.saltlux.jjangumall.dto;

public class WeeksCaloryVo {
	private long Sunday = 0L;
	private long Monday = 0L;
	private long Tuesday = 0L;
	private long Wednesday = 0L;
	private long Thursday = 0L;
	private long Friday = 0L;
	private long Saturday = 0L;

	public long getSunday() {
		return this.Sunday;
	}

	public void setSunday(long sunday) {
		this.Sunday = sunday;
	}

	public long getMonday() {
		return this.Monday;
	}

	public void setMonday(long monday) {
		this.Monday = monday;
	}

	public long getTuesday() {
		return this.Tuesday;
	}

	public void setTuesday(long tuesday) {
		this.Tuesday = tuesday;
	}

	public long getWednesday() {
		return this.Wednesday;
	}

	public void setWednesday(long wednesday) {
		this.Wednesday = wednesday;
	}

	public long getThursday() {
		return this.Thursday;
	}

	public void setThursday(long thursday) {
		this.Thursday = thursday;
	}

	public long getFriday() {
		return this.Friday;
	}

	public void setFriday(long friday) {
		this.Friday = friday;
	}

	public long getSaturday() {
		return this.Saturday;
	}

	public void setSaturday(long saturday) {
		this.Saturday = saturday;
	}

	public String toString() {
		return "WeeksCaloryVo [Sunday=" + this.Sunday + ", Monday=" + this.Monday + ", Tuesday=" + this.Tuesday
				+ ", Wednesday=" + this.Wednesday + ", Thursday=" + this.Thursday + ", Friday=" + this.Friday
				+ ", Saturday=" + this.Saturday + "]";
	}
}
