package cn.wuziri.user.domain;

public class User {

	private String uid;
	private String username;
	private String password;
	private String email;
	private boolean status;
	private String activationCode;
	
	private String verifyCode;//验证码
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public String getActivationCode() {
		return activationCode;
	}
	public void setActivationCode(String activationCode) {
		this.activationCode = activationCode;
	}		
	public String getVerifyCode() {
		return verifyCode;
	}
	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password="
				+ password + ", email=" + email + ", status=" + status
				+ ", activationCode=" + activationCode + ", verifyCode="
				+ verifyCode + ", getUid()=" + getUid() + ", getUsername()="
				+ getUsername() + ", getPassword()=" + getPassword()
				+ ", getEmail()=" + getEmail() + ", isStatus()=" + isStatus()
				+ ", getActivationCode()=" + getActivationCode()
				+ ", getVerifyCode()=" + getVerifyCode() + "]";
	}
	
}
