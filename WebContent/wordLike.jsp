<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery.js"></script>
<script language="javascript">
	$(function() {
		//导航切换
		$(".imglist li").click(function() {
			$(".imglist li.selected").removeClass("selected")
			$(this).addClass("selected");
		})

		$(".tables").each(function(i, v) {
			$(this)
		})

		$(".idSort").each(function(i, v) {
			$(this).text("导航栏" + (i + 1));
		})
		//点击返回用户留言管理
		$("#returnWord").click(function(){
			window.location.href='searchWPage?lword.leaveWord_id=1';
		});

	})
	//ajax添加导航栏
	function sendAjax(urll) {

		$.ajax({
			type : "post",
			url : urll,
			dataType : "json",
			data : $("#addMapForm").serialize(),
			success : function(msg) {
				if (parseInt(msg) == 1) {
					alert("添加成功！");
					window.location.href = "map_edit.jsp";
				} else if (parseInt(msg) == 6) {
					alert("导航栏已达到最大栏位，不能添加！");
				} else if (parseInt(msg) == 9) {
					alert("因系统原因，不能添加！");
				} else {
					alert("添加导航栏信息失败！");
				}
			}
		});
	
	}

</script>
<style>
table{
border:1px solid gray;
}
td,tbody{
padding:0;
margin:0;
}
input{
background:white;
width:98%;
height:100%;
float:left;
outline: none;
padding:4px;
text-align:center;
}
textarea{
background:white;
width:98%;
height:100%;
float:left;
outline: none;
resize:none;
display:inline-block;
text-align:left;
padding-left:8px;
}
#returnWord{
cursor:pointer;
}
</style>
</head>


<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="judgeLogin">首页</a></li>
			<li><a href="map_edit.jsp">模块设计</a></li>
			<li><a href="#">修改</a></li>
		</ul>
	</div>

	<div class="rightinfo">

		<div class="tools">




			<ul class="toolbar1">
				<li id="returnWord" ><span><img src="images/t05.png" /></span>返回</li>
			</ul>

		</div>


		<center>
			<table class="tablelist" style="width: 45%;">
				
					<tr class="tables">
						<th style="text-align: center;" colspan="2">用户留言查看</th>
					</tr>

				
				
					<form action="updateWord" method="post">
						<input type="hidden" name="lword.leaveWord_id"
							value="${lword.leaveWord_id}"   disabled="disabled" />
						<tr class="tables">
							<td style="text-align: center; width: 15%;">姓名</td>
							<td style="text-align: center; width: 30%;"><input
								type="text" value="${lword.leaveWord_name}"
								name="lword.leaveWord_name"   disabled="disabled"
								 /></td>

						</tr>
						
						<tr class="tables">
							<td style="text-align: center; width: 15%;">电话</td>
							<td style="text-align: center; width: 30%;"><input
								type="text" value="${lword.leaveWord_telephone}"
								name="lword.leaveWord_telephone"   disabled="disabled"
								/></td>
						</tr>
						<tr class="tables">
							<td style="text-align: center; width: 15%;">邮箱</td>
							<td style="text-align: center; width: 30%;"><input
								type="text" value="${lword.leaveWord_email}"
								name="lword.leaveWord_email" disabled="disabled"
								 /></td>
						</tr>
						<tr class="tables">
							<tr class="tables">
								<td style="text-align: center; width: 15%;">地址</td>
								<td style="text-align: center; width: 30%;"><input
									type="text" value="${lword.leaveWord_address}"
									name="lword.leaveWord_address"   disabled="disabled"
									 /></td>
							</tr>
							<tr class="tables"  >
							<td style="text-align: center; width: 15%;" >留言内容</td>
							<td style="text-align: center; width: 30%;" ><textarea
								 disabled="disabled"	cols="8" rows="6" >&nbsp;&nbsp;${lword.leaveWord_content}</textarea></td>
						</tr>
					</form>



				
			</table>
		</center>







	</div>
</body>
</html>
