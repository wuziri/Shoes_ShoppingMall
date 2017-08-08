package cn.wuziri.user.service;

import java.sql.SQLException;
import java.util.UUID;

import cn.wuziri.utils.DBConnection;
import cn.wuziri.user.dao.UserDao;
import cn.wuziri.user.domain.Mail;
import cn.wuziri.user.domain.User;
import cn.wuziri.utils.JavaMailUtils;

public class UserService {
	private DBConnection dbconn = null;
	private UserDao userDao = null;
	
	public UserService() throws SQLException {
		this.dbconn = new DBConnection();
		this.userDao = new UserDao(dbconn.getConnection());
	}

	public boolean ajaxValidateLoginname(String loginname) throws SQLException{
	//	System.out.println("UserService()...");
//		System.out.println(userDao.ajaxValidateLoginname(loginname));
		
		return userDao.ajaxValidateLoginname(loginname);
	}
	
	public boolean ajaxValidateEmail(String email) throws SQLException{
			
			return userDao.ajaxValidateEmail(email);
		}
	
	public void register(User user) throws SQLException {
		
		user.setUid(UUID.randomUUID().toString().replace("-", "").toUpperCase());
		user.setStatus(false);
		user.setActivationCode(UUID.randomUUID().toString().toUpperCase());
		userDao.addUser(user);
		
		/*
		 * 发送激活码到注册的邮箱账号
		 */	
		Mail mail = new Mail("1301027194@qq.com", "1301027194@qq.com", "来自千里行网上鞋店的激活邮件", "恭喜，您已注册成功，请点击<a href='http://localhost:7001/Shoes_ShoppingMall/UserServlet?method=activation&activationCode="+user.getActivationCode()+"'>这里</a>完成激活。");
		try {
			JavaMailUtils.send("1301027194","zahajxtjwmnohaef",mail);//QQ 要授权码才能成功
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public User login(String loginname, String password) throws SQLException{
		
		return userDao.login(loginname, password);
	}

	public void activatioin(String code) throws SQLException {
		// TODO Auto-generated method stub
			
		User user = userDao.findByCode(code);
		System.out.println(user);
		if(user == null) {
			System.out.println("无效激活码！");
		}
		if(user.isStatus()){
			System.out.println("你已经激活过了");
		}
		userDao.updateStatus(user.getUid(), true);
		
	}
	
	public boolean sendCodeToEmail(String username, String email) throws SQLException{
		String activationCode = userDao.findActivationCode(username,email);
		if(activationCode!=null){
			Mail mail = new Mail("1301027194@qq.com", "1301027194@qq.com", "来自千里行网上鞋店的激活邮件", "恭喜，您已注册成功，请点击<a href='http://localhost:7001/Shoes_ShoppingMall/UserServlet?method=activation&activationCode="+activationCode+"'>这里</a>完成激活。");
			try {
				JavaMailUtils.send("1301027194","zahajxtjwmnohaef",mail);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
			
		}else{
			System.out.println("用户名或邮箱不存在！");
			return false;
		}
	}
}
