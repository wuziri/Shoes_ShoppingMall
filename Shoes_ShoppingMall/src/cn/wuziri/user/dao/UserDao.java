package cn.wuziri.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



import cn.wuziri.user.domain.User;
import cn.wuziri.utils.MD5Utils;



public class UserDao {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	public  UserDao(Connection conn) {
		this.conn = conn;
	}
	
	/*
	 * ajax校验用户名是否已被注册方法
	 */
	public boolean ajaxValidateLoginname(String loginname) throws SQLException {		
		String sql = "select * from user where username=?";				
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, loginname);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rs.close();
				pstmt.close();
				return false;
			}	
			rs.close();
			pstmt.close();
		return true;
	}
	
	/*
	 * ajax校验邮箱是否已被注册方法
	 */
	public boolean ajaxValidateEmail(String email) throws SQLException {		
		String sql = "select * from user where email=?";				
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) {
				rs.close();
				pstmt.close();
				return false;
			}	
			rs.close();
			pstmt.close();
		return true;
	}
	
	/*
	 * 注册添加用户
	 */
	public boolean addUser(User user) throws SQLException {
		String sql = "insert into user(uid,username,password,email,status,activationCode) value(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, user.getUid());
		pstmt.setString(2, user.getUsername());
		pstmt.setString(3, MD5Utils.md5(user.getPassword()));
		pstmt.setString(4, user.getEmail());
		pstmt.setBoolean(5, user.isStatus());
		pstmt.setString(6, user.getActivationCode());
		int result = pstmt.executeUpdate();
		if (result!=0){
			return true;
		}
		return false;
	}
	
	/*
	 * 根据激活码查询
	 */
	public User findByCode(String code) throws SQLException {
		User user = new User();
		String sql = "select * from user where activationCode=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, code);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			user.setUid(rs.getString("uid"));
			user.setStatus(rs.getBoolean("status"));
//			System.out.println(rs.getString("uid"));
//			System.out.println(rs.getBoolean("status"));
			return user;
		}
		return user;
		//return qr.query(sql, new BeanHandler<User>(User.class), code);
	}
	/*
	 * 改变激活状态
	 */
	public void updateStatus(String uid, boolean status) throws SQLException {
		String sql = "update user set status=? where uid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setBoolean(1, status);
		pstmt.setString(2, uid);		
		pstmt.executeUpdate();
		//qr.update(sql, status, uid);
	}
	
	/*
	 * 登录验证
	 */
	public User login(String loginname, String password) throws SQLException {
		User user = new User();
		//user = null;
		String sql = "select * from user where username=? and password=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, loginname);
		pstmt.setString(2, MD5Utils.md5(password));
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			user.setUsername(rs.getString("username"));
			user.setStatus(rs.getBoolean("status"));
			return user;
		}
		return user;
	}

	public String findActivationCode(String username, String email) throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select activationCode from user where username=? and email=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, username);
		pstmt.setString(2, email);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			return rs.getString("activationCode");
		}
		return null;
	}
}


