package cn.wuziri.user.domain;

public class Mail {

	private String from;//发送人
	private String toAddress;//接收地址
	private String subject;//主题
	private String content;//正文内容
	
	public Mail() {}
	
	public Mail(String from, String to, String subject, String content) {
		this.from = from;
		this.toAddress = to;
		this.subject = subject;
		this.content = content;
	}
	
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getToAddress() {
		return toAddress;
	}
	public void setToAddress(String toAddress) {
		this.toAddress = toAddress;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
		
}
