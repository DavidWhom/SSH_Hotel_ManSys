package cn.iankeri.hotel.web;

import cn.iankeri.hotel.entities.Record;

public class CriteriaOrder {
	private Record record;
	private Integer pageNo;
	private Boolean isOverdue;
	
	public Boolean getIsOverdue() {
		return isOverdue;
	}
	public void setIsOverdue(Boolean isOverdue) {
		this.isOverdue = isOverdue;
	}
	public Record getRecord() {
		return record;
	}
	public void setRecord(Record record) {
		this.record = record;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public CriteriaOrder() {}
	public CriteriaOrder(Record record, Integer pageNo) {
		super();
		this.record = record;
		this.pageNo = pageNo;
	}
	
}
