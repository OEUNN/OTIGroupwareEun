package com.oti.groupware.mail.dto;

import lombok.Data;

@Data
public class MailCount {
    private int receivedCount;
    private int notReadCount;
    private int tempCount;
    private int importCount;
}