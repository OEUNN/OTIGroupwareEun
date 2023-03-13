package com.oti.groupware.approval;

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
public class ApprovalProcessor {
	private Document document;
	private ApprovalLine approvalLine;
	private List<ApprovalLine> approvalLines;
	
	//return 1 => process를 수행함
	//return 0 => process를 수행하지 못함
	public boolean process(String state, String opinion, int documentMaxStep) {
		if (document != null && approvalLine != null) {
			int documentApprovalStep = document.getDocAprvStep();
			int approvalLineOrder = approvalLine.getAprvLineOrder();
			
			//결재자의 승인 요청
			if ("승인".equals(state)) {
				
				//문서 결재 순서에 맞는 경우, 결재문서의 결재단계를 하나 올림
				if (documentApprovalStep == approvalLineOrder) {
					documentApprovalStep += 1;
					document.setDocState(state);
				}
				
				//모든 결재자들이 결재하여 완결된 경우, 결재단계를 -1로 설정
				if (documentApprovalStep > documentMaxStep) {
					documentApprovalStep = -1;
					document.setDocState("완결");
					document.setDocCompleteDate(Timestamp.valueOf(LocalDateTime.now()));
				}
				
				document.setDocReadYn("N");
				document.setDocAprvStep(documentApprovalStep);
				approvalLine.setAprvLineState(state);
				approvalLine.setAprvLineOpinion(opinion);
				approvalLine.setAprvLineOpenYn("N");
				
				return true;
			}
			
			//결재자의 반려 요청
			else if ("반려".equals(state)) {
				document.setDocState(state);
				document.setDocAprvStep(-1);
				document.setDocReadYn("N");
				approvalLine.setAprvLineState(state);
				approvalLine.setAprvLineOpinion(opinion);
				approvalLine.setAprvLineOpenYn("N");
				
				return true;
			}
			
			//기안자의 회수 요청
			else if ("회수".equals(state)) {
				if (approvalLines != null) {
					//열람 중인 경우 회수가 불가능
					if (document.getDocReadYn() == "N") {
						return false;
					}
					
					//회수 가능한 상태
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
						document.setDocAprvStep(1);
						approvalLine.setAprvLineOpenYn("N");
						return true;
					}
				}
				else {
					return false;
				}
			}
			
			//결재자가 문서를 열람
			else if ("열람".equals(state)) {
				//현재 결재 순번인 사람이 열람 시
				if (documentApprovalStep == approvalLineOrder) {
					document.setDocReadYn("Y");
					approvalLine.setAprvLineOpenYn("Y");
				}
				
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

