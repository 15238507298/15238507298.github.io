<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新开元网站后台</title>
<script language="JavaScript" src="js/jquery.js"></script>
<script type="text/javascript">
//判断用户状态
console.log($(":input[name=state]").text());
console.log($(":input[name=state]").text()=="false");
if($(":input[name=state]").text()=="0"){
	confirm("您的用户是未登录状态,5秒后帮您转到登陆页面！");
	var ti=0;
	setInterval(function(){
		console.log(ti);
		if(ti==4){
			window.location.href="judgeLogin";
		}
		ti++;
	},1000);
};
</script>
</head>
<input type="hidden" value="${userState}" name="state"></input>
<frameset rows="88,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="187,*" frameborder="no" border="0" framespacing="0">
    <frame src="left.jsp" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="index.jsp" name="rightFrame" id="rightFrame" title="rightFrame" />
  </frameset>
</frameset>
<noframes><body>
</body></noframes>
</html>
