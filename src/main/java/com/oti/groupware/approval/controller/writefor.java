package com.oti.groupware.approval.controller;

public class writefor {
	public static void main(String[] args) {
		for (int i = 6; i < 27; i+=5) {
			System.out.println("[출장][장그래][03/"+i+"] 장그래 3월 "+i+"일~3월"+(i+3)+"일 출장\r\n" + 
					"2023-03-"+i+"\r\n" + 
					"2023-03-"+(i+3)+"\r\n" + 
					"뉴욕 센트럴파크\r\n" + 
					"1,500,000원\r\n" + 
					"개발자 컨퍼런스 참여\r\n" + 
					"otiexaint@gmail.com");
		}
	}
}
