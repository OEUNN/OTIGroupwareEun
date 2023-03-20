package com.oti.groupware.approval.component;

import java.util.List;

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
	
	public String getParsedTarget() {
		return approvalDocument.toString();
	}
	
	public void setParsingTarget(String html) {
		approvalDocument = Jsoup.parse(html, "UTF-8");
	}
	
	public String getTokenById(String id) {
		return approvalDocument.body().getElementById(id).text();
	}
	
	public List<String> getTokensByClass(String name) {
		return approvalDocument.body().getElementsByClass(name).eachText();
	}
	
	public int getTokenSizeById(String id) {
		return approvalDocument.body().getElementById(id).childrenSize();
	}
	
	public void insertTokenToElementById(String id, String token) {
		approvalDocument.body().getElementById(id).text(token);
	}
	
	public void insertTokensToElementChildrenById(String id, List<String> tokens) {
		Elements targets = approvalDocument.body().getElementById(id).children();
		int length = targets.size();
		
		for (int i = 0; i < length; i++) {
			targets.get(i).text(tokens.get(i));
		}
	}
	
	public void insertTokensToElementChildrenById(String id, String[] tokens) {
		Elements targets = approvalDocument.body().getElementById(id).children();
		int length = targets.size();
		
		for (int i = 0; i < length; i++) {
			targets.get(i).text(tokens[i]);
		}
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
