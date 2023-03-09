package com.oti.groupware.approval;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Component;

import com.oti.groupware.approval.dto.Document;

@Component
public class DocumentParser {
	private org.jsoup.nodes.Document approvalDocument;
	private Document document;

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
		int documentMaxStep = body.getElementById("formApprovalState").childNodeSize();
		
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
	
	public Document getParsedDocument() {
		return document;
	}
	
}
