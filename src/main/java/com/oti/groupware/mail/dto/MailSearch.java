package com.oti.groupware.mail.dto;

import java.util.List;

import lombok.Data;

@Data
public class MailSearch {
	private String search;
	private int mailId;
	private List<Integer> mailList;
	private int page;
	private String result;
}