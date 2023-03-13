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
    public void deleteSendMail(int sendMailId);
	public int sendMailRowsCount(String empId);
	public List<SendMail> getSendMail(@Param("empId")String empId, @Param("pager")Pager pager);
	public int mailSearchRowsCount(@Param("empId")String empId,@Param("search") String search);
	public List<SendMail> getSearchSendMail(@Param("empId")String empId, @Param("pager")Pager pager, @Param("search")String search);
	public String sendMailGetImport(@Param("mailId")int mailId);
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
	
	
}