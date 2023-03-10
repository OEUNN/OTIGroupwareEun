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
	public String sendMamilGetImport(@Param("mailId")int mailId);
	public void sendMamilChangeImport(@Param("star")String star, @Param("mailId")int mailId );
	
	
}