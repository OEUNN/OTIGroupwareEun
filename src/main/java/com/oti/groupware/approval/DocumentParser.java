package com.oti.groupware.approval;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import com.oti.groupware.approval.dto.ApprovalLine;
import com.oti.groupware.approval.dto.Document;

@Component
public class DocumentParser {
	private org.jsoup.nodes.Document approvalDocument;
	private Document document;
	private ApprovalLine approvalLine;
	private List<ApprovalLine> approvalLineList;

	public void ParseDraft(String html, String drafterId) {
		approvalDocument = Jsoup.parse(html, "UTF-8");
		Element body = approvalDocument.body();
		/*
		 * 화이트리시트를 이용해 XSS 공격을 예방
		 * Jsop.clean(body, whitelist);
		 */
		String documentType = body.getElementsByClass("documentType").text();
		String documentId = body.getElementsByClass("documentId").text();
		String documentRetentionPeriod = body.getElementsByClass("documentRetentionPeriod").text();
		String documentTitle = body.getElementsByClass("documentTitle").text();
		String documentWriteDate = body.getElementsByClass("documentWriteDate").text();
		
		Elements documentApprovalLine = body.getElementsByClass("documentApprovalLine");
		
		Elements employeeIds = documentApprovalLine.get(0).getElementsByClass("employeeId");
		Elements approvalLineStates = documentApprovalLine.get(0).getElementsByClass("approvalLineState");
		Elements approvalDates = documentApprovalLine.get(0).getElementsByClass("approvalDate");
		
		int length = approvalDates.size();
		
		document = new Document();
		document.setDocId(documentId);
		document.setEmpId(drafterId);
		document.setDocType(documentType);
		document.setDocTitle(documentTitle);
		document.setDocContent(html);
		document.setDocRetentionPeriod(documentRetentionPeriod);
		document.setDocWriteDate(Date.valueOf(documentWriteDate));
		document.setDocState("결재중");
		document.setDocTempYn('N');
		/*
		 * document.setDocReportDate(docReportDate);
		 */
		
		approvalLineList = new ArrayList<ApprovalLine>();
		
		approvalLine = new ApprovalLine();
		approvalLine.setDocId(documentId);
		approvalLine.setEmpId(drafterId);
		approvalLine.setAprvLineState("승인");
		approvalLine.setAprvLineOrder(0);
		approvalLine.setAprvLineRole("기안");
		approvalLineList.add(approvalLine);
		
		for (int i = 0; i < length; i++) {
			approvalLine = new ApprovalLine();
			approvalLine.setDocId(documentId);
			approvalLine.setEmpId(employeeIds.get(i).text());
			approvalLine.setAprvLineState(approvalLineStates.get(i).text());
			approvalLine.setAprvLineOrder(i + 1);
			approvalLine.setAprvLineRole("결재");
			approvalLineList.add(approvalLine);
		}

	}
	
	public Document getParsedDocument() {
		return document;
	}
	
	public List<ApprovalLine> getParsedApprovalLines() {
		return approvalLineList;
	}
	
}
