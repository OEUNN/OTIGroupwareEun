package com.oti.groupware.approval.component;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

import com.oti.groupware.approval.dto.Document;

@Component
public class DocumentParser {
	private org.jsoup.nodes.Document approvalDocument;
	private Document document;
	
	public String getParsedTarget() {
		return approvalDocument.toString();
	}
	
	public void setParsingTarget(String html) {
		approvalDocument = Jsoup.parse(html, "UTF-8");
	}
	
	public Element getElementById(String id) {
		return approvalDocument.body().getElementById(id);
	}
	
	public Elements getElementsByClass(String rId) {
		return approvalDocument.body().getElementsByClass(rId);
	}

	public Document getParsedDocument() {
		return document;
	}
	
}
