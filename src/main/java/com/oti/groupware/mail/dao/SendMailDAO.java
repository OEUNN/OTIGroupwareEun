package com.oti.groupware.mail.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.groupware.common.Pager;
import com.oti.groupware.mail.dto.SendMail;

public interface SendMailDAO {
	public void insertTempMail(SendMail sendMail);
	public void insertSendMail(SendMail sendMail);
	public String getEmpIdById(int sendMailId);
	public String getTitleById(int sendMailId);
	public SendMail getSendMailById(int sendMailId);
    public void updateSendMail(SendMail sendMail);
	public int sendMailRowsCount(String empId);
	public List<SendMail> getSendMail(@Param("empId")String empId, @Param("pager")Pager pager);
	public int mailSearchRowsCount(@Param("empId")String empId,@Param("search") String search);
	public List<SendMail> getSearchSendMail(@Param("empId")String empId, @Param("pager")Pager pager, @Param("search")String search);
	public String sendMailGetImport(@Param("mailId")int mailId); //보낸 메일함 중요도 표시
	public void sendMailChangeImport(@Param("star")String star, @Param("mailId")int mailId );
	public int getImportRowCount(@Param("empId")String empId);
	public List<SendMail> getImportMail(@Param("empId")String empId, @Param("pager")Pager pager);
	public SendMail getMailInformation(int sendMailId);
	public String getWhereTable(@Param("mailId")int mailId, @Param("empId")String empId);
	public void importMailChangeImport(int mailId);
	public int tempMailRowsCount(String empId);
	public List<SendMail> getTempMail(@Param("empId")String empId, @Param("pager")Pager pager);
	public int getTrashRowCount(String empId);
	public List<SendMail> getTrashMail(@Param("empId")String empId, @Param("pager")Pager pager);
	public void sendMailSearchDelete(@Param("arr")List<Integer> mailId); //send메일 휴지통 보내기
	public void deleteTempMail(@Param("arr")List<Integer> mailId); //임시보관함 삭제하기
	public void updateTrashMail(@Param("arr")List<Integer> mailId); //휴지통에서 메일 복구하기 - received
	public void updateSendRestore(@Param("arr")List<Integer> mailId); //휴지통에서 메일 복구하기 -send
	public List<SendMail> getDeleteTrashMail(); //휴지통에 들어간지 30일이 지난 메일 가져오기 -send, received
	public void updateCompleteSendMail(@Param("arr")List<Integer> sendMail); //휴지통에 들어간지 30일이 지난 메일을 완전 삭제로 바꿔준다.
	public List<Integer> getCompleteMail(); //완전삭제된 sendMail을 받아온다.
	public void deleteSendMail(int sendMailId); //완전 삭제되었을때 sendmail을 삭제해준다.
	public int getTempCount(String empId); //임시저장 갯수
	
}