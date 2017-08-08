package cn.wuziri.user.servlet;

import java.io.IOException;
import java.sql.SQLException;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import cn.wuziri.user.domain.User;
import cn.wuziri.user.service.UserService;

public class UserServlet extends BaseServlet{

	//UserService userService = new UserService();
	
	

	


	public void ajaxValidateLoginname(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String loginname = request.getParameter("loginname");
		/*
		 * 2. 通过service得到校验结果
		 */
		boolean b = false;
		try {
			b = new UserService().ajaxValidateLoginname(loginname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * 3. 发给客户端
		 */
		response.getWriter().print(b);
	}
	
	public void ajaxValidateEmail(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String email = request.getParameter("email");
		/*
		 * 2. 通过service得到校验结果
		 */
		boolean b = false;
		try {
			b = new UserService().ajaxValidateEmail(email);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * 3. 发给客户端
		 */
		response.getWriter().print(b);
	}
	
	public String register(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
			User user = new User();		
		    BeanUtils.populate(user, request.getParameterMap());
		    
		    Map<String,String> errors = validateRegist(user, request.getSession());
			if(errors.size() > 0) {
				request.setAttribute("form", user);
				request.setAttribute("errors", errors);
				return "f:/register.jsp";
			}
			
			UserService userService = new UserService();
			userService.register(user);
		
			
		return "f:/login.jsp";
	}
	
	/*
	 * 注册校验
	 * 对表单的字段进行逐个校验，如果有错误，使用当前字段名称为key，错误信息为value，保存到map中
	 * 返回map
	 */
	private Map<String,String> validateRegist(User formUser, HttpSession session) throws SQLException {
		Map<String,String> errors = new HashMap<String,String>();
		/*
		 * 1. 校验登录名
		 */
		String loginname = formUser.getUsername();
		if(loginname == null || loginname.trim().isEmpty()) {
			errors.put("loginname", "用户名不能为空！");
		} else if(loginname.length() < 3 || loginname.length() > 20) {
			errors.put("loginname", "用户名长度必须在3~20之间！");
		} else if(!new UserService().ajaxValidateLoginname(loginname)) {
			errors.put("loginname", "用户名已被注册！");
		}
		
		/*
		 * 2. 校验登录密码
		 */
		String loginpass = formUser.getPassword();
		if(loginpass == null || loginpass.trim().isEmpty()) {
			errors.put("password", "密码不能为空！");
		} else if(loginpass.length() < 6 || loginpass.length() > 20) {
			errors.put("password", "密码长度必须在6~20之间！");
		}
		
		/*
		 * 3. 确认密码校验
		 */
//		String reloginpass = formUser.getRepassword();
//		if(reloginpass == null || reloginpass.trim().isEmpty()) {
//			errors.put("reloginpass", "确认密码不能为空！");
//		} else if(!reloginpass.equals(loginpass)) {
//			errors.put("reloginpass", "两次输入不一致！");
//		}
//		
		/*
		 * 4. 校验email
		 */
		String email = formUser.getEmail();
		if(email == null || email.trim().isEmpty()) {
			errors.put("email", "Email不能为空！");
		} else if(!email.matches("^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\\.[a-zA-Z0-9_-]{2,3}){1,2})$")) {
			errors.put("email", "Email格式错误！");
		} else if(!new UserService().ajaxValidateEmail(email)) {
			errors.put("email", "邮箱已被注册！");
		}
		
		/*
		 * 5. 验证码校验
		 */
//		String verifyCode = formUser.getVerifyCode();
//		String vcode = (String) session.getAttribute("vCode");
//		if(verifyCode == null || verifyCode.trim().isEmpty()) {
//			errors.put("verifyCode", "验证码不能为空！");
//		} else if(!verifyCode.equalsIgnoreCase(vcode)) {
//			errors.put("verifyCode", "验证码错误！");
//		}
		
		return errors;
	}
	
	/*
	 * 激活账户
	 */
	public String activation(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException, SQLException {
		/*
		 * 1. 获取参数激活码
		 * 2. 用激活码调用service方法完成激活
		 *   > service方法有可能抛出异常, 把异常信息拿来，保存到request中，转发到msg.jsp显示
		 * 3. 保存成功信息到request，转发到msg.jsp显示。
		 */
		String code = req.getParameter("activationCode");
		System.out.println(code);
		
		UserService userService = new UserService();
		userService.activatioin(code);
//		req.setAttribute("code", "success");// 通知msg.jsp显示对号
//		req.setAttribute("msg", "恭喜，激活成功，请马上登录！");

		return "f:/login.jsp";
	}
	
	public String login(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		User formUser = new User();
		
		BeanUtils.populate(formUser, request.getParameterMap());
		
		Map<String,String> errors = validateLogin(formUser, request.getSession());
		if(errors.size() > 0) {
			request.setAttribute("user", formUser);
			request.setAttribute("errors", errors);
			return "f:/login.jsp";
		}
		
		UserService userService = new UserService();
		User user = userService.login(formUser.getUsername(), formUser.getPassword());
		System.out.println(user);
		if(user.getUsername()==null){			
			request.setAttribute("message", "用户名或密码错误！");
			request.setAttribute("user", formUser);
			return "f:/login.jsp";
			
		}else if(!user.isStatus()) {
			request.setAttribute("message", "您还没有激活！"+"<a href='activate.jsp'>去激活</a>");
			request.setAttribute("user", formUser);
			return "f:/login.jsp";
		}else {
			request.getSession().setAttribute("sessionUser", formUser.getUsername());
			return "r:/index.jsp";
		}		
	}
	/*
	 * 登录校验
	 */
	private Map<String,String> validateLogin(User formUser, HttpSession session) throws SQLException {
		Map<String,String> errors = new HashMap<String,String>();
		String username = formUser.getUsername();
		String password = formUser.getPassword();
		
		if(username == null||username.trim().isEmpty()) {
			errors.put("loginname", "登录名不能为空！");
		}
		if(password == null||password.trim().isEmpty()) {
			errors.put("password", "密码不能为空！");
		}
		String verifyCode = formUser.getVerifyCode();
		String vCode = (String)session.getAttribute("vCode");
		if(verifyCode==null||verifyCode.trim().isEmpty()) {
			errors.put("verifyCode", "验证码不能为空！");
		}else if(!verifyCode.equalsIgnoreCase(vCode)) {
			errors.put("verifyCode", "验证码错误！");
		}
		return errors;
	}
	
	/*
	 * 注销登录用户
	 */
	
	public String quit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		return "r:/login.jsp";
	}
	
	/*
	 * 发送激活码到邮箱
	 */
	public String sendCodeToEmail(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException, SQLException{
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		boolean boo = new UserService().sendCodeToEmail(username, email);
		if(boo){
			return "r:/login.jsp";
		}else{
			return "f:/activate.jsp";
		}
	}
}
