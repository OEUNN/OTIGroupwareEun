package com.oti.groupware.approval.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.common.Pager;

@Repository
public interface DocumentDAO {
	public Document getDocumentById(String docId);
	public void insertDocument(Document document);
	public void updateDocument(Document document);
	public void deleteDocument(String docId);
	
	public void insertDraft(Document draft);
	public int getDraftDocumentCount(String empId);
	public List<Document> getDraftDocumentList(@Param("pager") Pager pager, @Param("empId") String empId);
	
	public List<Document> getCompletedDocumentList(Pager pager, String empId);
	public List<Document> getTempDocumentList(Pager pager, String empId);
	public List<Document> getReturnedDocumentList(Pager pager, String empId);
	public List<Document> getpendedDocumentList(Pager pager, String empId);
}