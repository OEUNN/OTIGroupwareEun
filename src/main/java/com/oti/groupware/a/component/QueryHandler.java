package com.oti.groupware.a.component;

import org.springframework.stereotype.Component;

import com.oti.groupware.approval.dto.SearchQuery;

@Component
public class QueryHandler {

	public void appendTimeToReportDate(SearchQuery searchQuery) {
		if (searchQuery.getDocReportEndDate() != null) {
			searchQuery.setDocReportEndDate(searchQuery.getDocReportEndDate() + " 23:59:59");
		}
	}
	
	public void appendTimeToCompleteDate(SearchQuery searchQuery) {
		if (searchQuery.getDocCompleteEndDate() != null) {
			searchQuery.setDocCompleteEndDate(searchQuery.getDocCompleteEndDate() + " 23:59:59");
		}
	}
	
	public void appendTimeToWriteDate(SearchQuery searchQuery) {
		if (searchQuery.getDocWriteEndDate() != null) {
			searchQuery.setDocWriteEndDate(searchQuery.getDocWriteEndDate() + " 23:59:59");
		}
	}
	
	public void deleteTimeFromReportDate(SearchQuery searchQuery) {
		if (searchQuery.getDocReportEndDate() != null) {
			searchQuery.setDocReportEndDate(searchQuery.getDocReportEndDate().substring(0, searchQuery.getDocReportEndDate().length() - 9));
		}
	}
	
	public void deleteTimeFromCompleteDate(SearchQuery searchQuery) {
		if (searchQuery.getDocCompleteEndDate() != null) {
			searchQuery.setDocCompleteEndDate(searchQuery.getDocCompleteEndDate().substring(0, searchQuery.getDocCompleteEndDate().length() - 9));
		}
	}
	
	public void deleteTimeFromWriteDate(SearchQuery searchQuery) {
		if (searchQuery.getDocWriteEndDate() != null) {
			searchQuery.setDocWriteEndDate(searchQuery.getDocWriteEndDate().substring(0, searchQuery.getDocWriteEndDate().length() - 9));
		}
	}
	

	
}
