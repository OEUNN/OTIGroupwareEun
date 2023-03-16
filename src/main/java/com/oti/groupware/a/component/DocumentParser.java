package com.oti.groupware.a.component;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import com.oti.groupware.approval.dto.ApprovalLine;
import com.oti.groupware.approval.dto.Document;
import com.oti.groupware.approval.dto.DocumentContent;
import com.oti.groupware.mail.dto.EmployeeInfo;

@Component
public class DocumentParser {
	private org.jsoup.nodes.Document approvalDocument;
	private Document document;

	public void parseDocument(String html, String drafterId) {
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
		int documentMaxStep = body.getElementById("formApprovalState").childrenSize();
		
		document = new Document();
		document.setDocId(documentId);
		document.setEmpId(drafterId);
		document.setDocType(documentType);
		document.setDocTitle(documentTitle);
		document.setDocContent(html);
		document.setDocRetentionPeriod(documentRetentionPeriod);
		document.setDocState("결재중");
		document.setDocTempYn("N");
		document.setDocMaxStep(documentMaxStep);
	}
	
	//문서 기안 시 작성 내용을 문서에 반영
	public String initializetHTML(String html, Document document, DocumentContent documentContent, EmployeeInfo drafter) {
		approvalDocument = Jsoup.parse(html, "UTF-8");
		Element body = approvalDocument.body();
		
		body.getElementsByClass("documentId").get(0).text(document.getDocId());
		body.getElementsByClass("documentRetentionPeriod").get(0).text(document.getDocRetentionPeriod());
		
		Elements formApprvalPositions = body.getElementById("formApprovalPosition").children();
		Elements formApprovalStates = body.getElementById("formApprovalState").children();
		Elements formApprovalNames = body.getElementById("formApprovalName").children();
		Elements formApprovalDates = body.getElementById("formApprovalDate").children();
		
		for (int i = 0; i < formApprvalPositions.size() - 1; i++) {
			formApprvalPositions.get(i).text(documentContent.getPosName()[i]);
		}
		for (int i = 0; i < formApprovalStates.size(); i++) {
			formApprovalStates.get(i).text(documentContent.getApprovalState()[i]);
		}
		for (int i = 0; i < formApprovalNames.size(); i++) {
			formApprovalNames.get(i).text(documentContent.getApprovalName()[i]);
		}
		for (int i = 0; i < formApprovalDates.size(); i++) {
			formApprovalDates.get(i).text(documentContent.getApprovalDate()[i]);
		}
		
		body.getElementById("formDrafterDepName").text(drafter.getDepName());
		body.getElementById("formDrafterPosName").text(drafter.getPosName());
		body.getElementById("formDrafterName").text(drafter.getEmpName());
		
		body.getElementsByClass("documentTitle").get(0).text(document.getDocTitle());
		
		return approvalDocument.toString();
	}
	
	//approvalLine에 들어있는 값을 문서에 반영
	public String setHTML(String html, ApprovalLine approvalLine) {
		approvalDocument = Jsoup.parse(html, "UTF-8");
		Element body = approvalDocument.body();
		
		String className = "r" + approvalLine.getEmpId();
		String state = approvalLine.getAprvLineState();
		String date;
		if (approvalLine.getAprvLineApprovalDate() != null) {
			date = approvalLine.getAprvLineApprovalDate().toString();
		}
		else {
			date = "미정";
		}
		
		body.getElementById("formApprovalState").getElementsByClass(className).get(0).text(state);
		body.getElementById("formApprovalDate").getElementsByClass(className).get(0).text(date);
		
		return approvalDocument.toString();
	}
	
	public Document getParsedDocument() {
		return document;
	}
	
}
