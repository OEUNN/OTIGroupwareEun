package com.oti.groupware.mail.dto;

import lombok.Data;

@Data
public class MailFile {

    private int mailFileId;
    private int sendMailId;
    private String mailFileName;
    private byte[] mailFileData;
    private String mailFileType;
    private int mailFileLength;
}