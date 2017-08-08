$(document).ready(function(){
	/*
	 * 让登录按钮在得到和失去焦点时切换图片
	 */
	$("#submit").hover(
		function() {
			$("#submit").attr("src", "image/login2.jpg");
		},
		function() {
			$("#submit").attr("src", "image/login1.jpg");
		}
	);
	
	/*
	 *默认隐藏错误信息
	 */
	$(".error").each(function(){
		showError($(this));
	});
	//var id = $(".input").attr("id");
	$(".input").focus(function(){
		var labelId = $(this).attr("id") + "Error";
		$("#" + labelId).text("");
		showError($("#" + labelId));
	});
	//var id = $(".input").attr("id");
	$(".input").blur(function(){
		// $("#" + id +"Error").text("用户名不能为空！");
		// showError($("#" + id +"Error"));
		var id = $(this).attr("id");
		if (id == "username") {
			ValidateUsername();
			showError($("#" + id + "Error"));
		}
		if (id == "password") {
			ValidatePassword();
			showError($("#" + id + "Error"));
		}
		if (id == "verifyCode") {
			ValidateverifyCode();
			showError($("#" + id + "Error"));
		}
	});

	$("#loginForm").submit(function(){
		var bool = true;
		if (!ValidateUsername()) {
			bool = false;
		}
		if (!ValidatePassword()) {
			bool = false;
		}if (!ValidateverifyCode()) {
			bool = false;
		}
		return bool;
	});
	
	$(".clear-btn").click(function(){
		var id = $(this).attr("id");
		if(id == "clearusername"){
			$("#username").val("");
			$(this).css("display","none");
		}
		if(id == "clearpassword"){
			$("#password").val("");
			$(this).css("display","none");
		}		
	});
	$(".input").click(function(){
		var id = $(this).attr("id");
		
		var value = $("#"+id).val();
		if (value) {
			$("#clear"+id).css("display","inline");
		}else{
			$("#clear"+id).css("display","none");
		}		
		
		$("#"+id).keyup(function(){
			//alert("aaa");
		var value = $("#"+id).val();
		if (value) {
			$("#clear"+id).css("display","inline");
		}else{
			$("#clear"+id).css("display","none");
		}		
	});
	});
	
});

/*
 *用户名校验方法
 */
function ValidateUsername() {
	var id = "username"
	var value = $("#" + id).val();
	if(!value) {
		$("#" + id +"Error").text("用户名不能为空！");
		showError($("#" + id +"Error"));
		return false;
	}
	// if(value.length < 3 || value.length >20) {
	// 	$("#" + id +"Error").text("用户名长度必须在3~20之间！");
	// 	showError($("#" + id +"Error"));
	// 	return false;
	// }
	return true;
}

/*
 *密码校验方法
 */
function ValidatePassword() {
	var id = "password"
	var value = $("#" + id).val();
	if(!value) {
		$("#" + id +"Error").text("密码不能为空！");
		showError($("#" + id +"Error"));
		return false;
	}
	// if(value.length < 3 || value.length >20) {
	// 	$("#" + id +"Error").text("用户名长度必须在3~20之间！");
	// 	showError($("#" + id +"Error"));
	// 	return false;
	// }
	return true;
}

/*
 *验证码校验方法
 */
function ValidateverifyCode() {
	var id = "verifyCode"
	var value = $("#" + id).val();
	if(!value) {
		$("#" + id +"Error").text("验证码不能为空！");
		showError($("#" + id +"Error"));
		return false;
	}
	// if(value.length < 3 || value.length >20) {
	// 	$("#" + id +"Error").text("用户名长度必须在3~20之间！");
	// 	showError($("#" + id +"Error"));
	// 	return false;
	// }
	return true;
}

function showError(ele) {
	var text = ele.text();
	if (!text) {
		ele.css("display","none");
		
	}else {
		ele.css("display","");
	}	
}
//换一张验证码
function _change() {
	$(".vCode").attr("src", "/Shoes_ShoppingMall/VerifyCodeServlet?" + new Date().getTime());
}

