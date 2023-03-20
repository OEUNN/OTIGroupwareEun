package com.oti.groupware.approval.component;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.stereotype.Component;

import com.oti.groupware.approval.dto.ApprovalLine;
import com.oti.groupware.approval.dto.Document;

/*
 * 결재 문서를 승인 또는 반려 하는 경우, ApprovalLine과 Document의 상태를 변경하는 책임을 가지는 클래스
 */
@Component
public class ApprovalHandler {
	private Document document;
	private ApprovalLine approvalLine;
	private List<ApprovalLine> approvalLines;
	
	//return 1 => process를 수행함
	//return 0 => process를 수행하지 못함
	
	//승인
	public boolean handleApprove(String state, String opinion, int documentMaxStep) {
		if (document != null && approvalLine != null) {
			int documentApprovalStep = document.getDocAprvStep();
			int approvalLineOrder = approvalLine.getAprvLineOrder();
			
			//문서 결재 순서에 맞는 경우, 결재문서의 결재단계를 하나 올림
			if (documentApprovalStep == approvalLineOrder) {
				documentApprovalStep += 1;
				document.setDocState("진행");
			}
			
			//모든 결재자들이 결재하여 완결된 경우, 결재단계를 -1로 설정
			if (documentApprovalStep >= documentMaxStep) {
				documentApprovalStep = -1;
				document.setDocState("승인");
				document.setDocCompleteDate(Timestamp.valueOf(LocalDateTime.now()));
			}
			
			document.setDocReadYn("N");
			document.setDocAprvStep(documentApprovalStep);
			approvalLine.setAprvLineState(state);
			approvalLine.setAprvLineOpinion(opinion);
			approvalLine.setAprvLineOpenYn("N");
			approvalLine.setAprvLineApprovalDate(Timestamp.valueOf(LocalDateTime.now()));
			
			return true;
		}
		
		else {
			return false;
		}
	}
	
	//반려
	public boolean handleReturn(String state, String opinion) {
		if (document != null && approvalLine != null) {
			
			document.setDocState(state);
			document.setDocAprvStep(-1);
			document.setDocReadYn("N");
			approvalLine.setAprvLineState(state);
			approvalLine.setAprvLineOpinion(opinion);
			approvalLine.setAprvLineOpenYn("N");
			approvalLine.setAprvLineApprovalDate(Timestamp.valueOf(LocalDateTime.now()));
			
			return true;
		}
		
		else {
			return false;
		}
	}
					
	//회수
	public boolean handleRetrieve(String state) {
		if (document != null && approvalLine != null && approvalLines != null) {
			
			//열람인 경우 회수가 불가능
			//승인, 반려는 가능
			if ("열람".equals(document.getDocState()) || "회수".equals(document.getDocState())) {
				return false;
			}
			
			//열람이 아닌경우
			else {
				//결재문서의 결재자들의 상태를 초기화
				for (ApprovalLine approvalLine : approvalLines) {
					if (!"기안".equals(approvalLine.getAprvLineRole())) {
						approvalLine.setAprvLineState("미결");
						approvalLine.setAprvLineApprovalDate(null);
						approvalLine.setAprvLineOpinion(null);
					}
				}
				
				document.setDocState(state);
				document.setDocReadYn("N");
				document.setDocAprvStep(0);
				approvalLine.setAprvLineOpenYn("N");
				return true;
			}
		}
		
		else {
			return false;
		}
	}
	
	//열람
	public boolean handleOpen() {
		if (document != null && approvalLine != null) {
			//결재자가 미결일 때 열람 상태로 변경 가능
			if ("미결".equals(approvalLine.getAprvLineState())) {
				document.setDocReadYn("Y");
				document.setDocState("열람");
				approvalLine.setAprvLineOpenYn("Y");
				approvalLine.setAprvLineState("열람");
				return true;
			}
			else {
				return false;
			}
		}
		else {
			return false;
		}
	}
	
	public void setDocument(Document document) {
		this.document = document;
	}
	
	public void setApprovalLine(ApprovalLine approvalLine) {
		this.approvalLine = approvalLine;
	}
	
	public void setApprovalLines(List<ApprovalLine> approvalLines) {
		this.approvalLines = approvalLines;
	}
	
	public Document getDocument() {
		return this.document;
	}
	
	public ApprovalLine getApprovalLine() {
		return this.approvalLine;
	}
	
	public List<ApprovalLine> getApprovalLines() {
		return this.approvalLines;
	}
}

