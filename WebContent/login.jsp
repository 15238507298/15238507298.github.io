<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>欢迎登录后台管理系统--模板之家 www.cssmoban.com</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
span {
	display: inline-block;
	width: 100%;
	height: 100%;
}
</style>
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>

<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
    //2秒提示消失特效
    var time=0;
    setInterval(function(){
    	if(time==1){
    		$("#hide").hide();
    	}
    	time++;
    },1000);
    
}); 
	//非空验证，不为空执行登陆
	function isNull(){

		if($(":input[name='user1.user_name]']").val()!='' && $(":input[name='user1.user_password']").val()!=''){
			window.location.href="loginUser?"+$("#loginInfo").serialize();
		}
		else{
			$("#clickLogin").text("用户名或密码为空");
		}
	}
</script>

</head>

<body
	style="background-color: #1c77ac; background-image: url(images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">
	<h2 id="hide"
		style="color: #FF1493; z-index: 10; border: 0px solid gray; text-align: center; background: rgba(255, 255, 255, 0); width: 550px; height: 200px; margin: auto; position: absolute; top: 9%; bottom: 0; left: 15%;; right: 0;">
		<s:fielderror value="loginErr"></s:fielderror>
	</h2>


	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>


	<div class="logintop">

		<span>欢迎登录后台管理界面平台</span>
		<ul>
			<li><a href="judgeLogin">回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>

	<div class="loginbody">

		<span class="systemlogo"></span>

		<div class="loginbox">

			<ul>
				<form id="loginInfo"  method="post">
					<li><input name="user1.user_name" type="text"
						class="loginuser"  onclick="JavaScript:this.value='';" placeholder="请输入用户名" /></li>
					<li id="clickLogin" style="color:blue;height:5px;font-size:12px;">&nbsp;</li>
					<li><input name="user1.user_password" type="password"
						class="loginpwd"  onclick="JavaScript:this.value=''"  placeholder="请输入密码"/></li>
					
				</form>
				<li style="text-align: center;"><input type="submit"
						 onclick="isNull()" class="loginbtn" value="登录" /></li>
			</ul>


		</div>

	</div>



	<div class="loginbm">版权所有</div>
</body>
</html>
