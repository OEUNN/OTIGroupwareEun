package com.oti.groupware.approval.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.approval.dto.SearchQuery;
import com.oti.groupware.common.Pager;

@Repository
public interface DocumentDAO {
	public Document getDocumentById(String docId);
	public void insertDocument(Document document);
	public void updateDocument(Document document);
	public void deleteDocument(String docId);
	
	public void insertDraft(Document draft);
	public int updateDocumentReadState(Document document);
	
	
	
	public int getDraftDocumentCount(String empId);
	public List<Document> getDraftDocumentList(@Param("pager") Pager pager, @Param("empId") String empId);
	
	public int getPendedDocumentCount(String empId);
	public List<Document> getPendedDocumentList(@Param("pager") Pager pager, @Param("empId") String empId);
	
	public int getReturnedDocumentCount(String empId);
	public List<Document> getReturnedDocumentList(@Param("pager") Pager pager, @Param("empId") String empId);
	
	public int getCompletedDocumentCount(String empId);
	public List<Document> getCompletedDocumentList(@Param("pager") Pager pager, @Param("empId") String empId);
	
	public int getTempDocumentCount(String empId);
	public List<Document> getTempDocumentList(@Param("pager") Pager pager, @Param("empId") String empId);
	
	
	
	public int getPendedDocumentCountByQuery(@Param("empId") String empId, @Param("searchQuery") SearchQuery searchQuery);
	public List<Document> getPendedDocumentListByQuery(@Param("pager") Pager pager, @Param("empId") String empId, @Param("searchQuery") SearchQuery searchQuery);
	
	public int getDraftDocumentCountByQuery(@Param("empId") String empId, @Param("searchQuery") SearchQuery searchQuery);
	public List<Document> getDraftDocumentListByQuery(@Param("pager") Pager pager, @Param("empId") String empId, @Param("searchQuery") SearchQuery searchQuery);
}