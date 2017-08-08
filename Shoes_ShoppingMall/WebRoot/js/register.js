$(document).ready(function(){
	$(".error").each(function(){
		showError($(this));
	});


	$(".input").focus(function() {
		var labelId = $(this).attr("id") + "Error";//通过输入框找到对应的label的id
		$("#" + labelId).text("");//把label的内容清空！
		showError($("#" + labelId));//隐藏没有信息的label
	});

	$(".input").blur(function() {
		var id = $(this).attr("id");//获取当前输入框的id		
		var funName = "validate" + id.substring(0,1).toUpperCase() + id.substring(1) + "()";//得到对应的校验函数名
		eval(funName);//执行函数调用

	});
	
	
	
	/*
	 *  表单提交时进行校验
	 */
	$("#registForm").submit(function() {
		var bool = true;//表示校验通过
		if(!validateLoginname()) {
			bool = false;
		}
		if(!validateLoginpass()) {
			bool = false;
		}
		if(!validateReloginpass()) {
			bool = false;
		}
		if(!validateEmail()) {
			bool = false;
		}		
		return bool;
	});
});

/**
 * 登录名校验方法
 * @return {[type]} [description]
 */
function validateLoginname() {
	var id = "loginname";
	var value = $("#"+id).val();
	
	if (!value) {
		$("#" + id + "Error").text("用户名不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	
	if (value.length<3||value.length>20) {
		$("#"+id+"Error").text("用户名长度必须在3-20之间！");
		showError($("#"+id+"Error"));
		return false;
	}
	
	/*
	 *使用ajax校验用户名是否已被注册 
	 */
	$.ajax({
		url:"/Shoes_ShoppingMall/UserServlet",
		data:{method:"ajaxValidateLoginname",loginname:value},
		type:"POST",
		dataType:"json",
		async:false,
		cache:false,
		success:function(result) {
			if(!result) {//result = false;
				$("#"+id+"Error").text("用户名已被注册!");
				showError($("#"+id+"Error"));
				return false;
			}
			//return false;
		}
	});
	return true;
}

/**
 * 密码校验方法
 * @return {[type]} [description]
 */
function validateLoginpass() {
	var id = "loginpass";
	var value = $("#"+id).val();
	if (!value) {
		$("#" + id + "Error").text("密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	if (value.length<6||value.length>20) {
		$("#"+id+"Error").text("密码长度必须在6-20之间！");
		showError($("#"+id+"Error"));
		return false;
	}
	return true;
}

/**
 * 确认密码校验方法
 * @return {[type]} [description]
 */
function validateReloginpass() {
	var id = "reloginpass";
	var value = $("#"+id).val();
	if (!value) {
		$("#" + id + "Error").text("确认密码不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}
	if (value != $("#loginpass").val()) {
		$("#"+id+"Error").text("两次输入不一致！");
		showError($("#"+id+"Error"));
		return false;
	}
	return true;
}


/**
 * 邮箱校验方法
 * @return {[type]} [description]
 */
function validateEmail() {
	var id = "email";
	var value = $("#"+id).val();
	if (!value) {
		$("#" + id + "Error").text("邮箱不能为空！");
		showError($("#" + id + "Error"));
		return false;
	}

	//Email格式校验
	if (!/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/.test(value)) {
		$("#" + id + "Error").text("错误的Email格式！");
		showError($("#" + id + "Error"));
		return false;
	}
	
	//ajax校验邮箱是否已被注册
	$.ajax({
		url:"/Shoes_ShoppingMall/UserServlet",
		data:{method:"ajaxValidateEmail",email:value},
		type:"POST",
		dataType:"json",
		async:false,
		cache:false,
		success:function(result){
			if (!result) {
				$("#" + id + "Error").text("邮箱已被注册！");
				showError($("#" + id + "Error"));
				return false;
			}
			//return true;
		}
	});
	return true;
}

function showError (ele) {
	var text = ele.text();
	if (!text) {
		ele.css("display","none");
	}else{
		ele.css("display","")
	}
}