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
		
		$("#returnMap").click(function(){
			window.location.href = 'searchMap'
		});

	})
	//返回导航主页
    
	//添加导航
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
input {
	width: 100%;
	background: transparent;
	outline: none;
	width: 90%;
	height: 100%;
	padding:10px;
	border: 1px solid transparent;
	text-align: center;
}
input[type=submit]:hover{
color:gray;
}
#returnMap{
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
				<li  id="returnMap"><span
					><img src="images/t05.png" /></span>返回</li>
			</ul>

		</div>


		<center>
			<table class="tablelist" style="width: 45%;">
				<thead>
					<tr>
						<th style="text-align: center;" colspan="2">导航栏修改</th>
					</tr>

				</thead>
				<tbody>
					<form action="updateMap" method="post">
						<input type="hidden" name="map.map_id" value="${uMap.map_id}" />
						<tr class="tables">
							<td style="text-align: center; width: 30%;">导航文字</td>
							<td style="text-align: center; width: 30%;"><input
								type="text" value="${uMap.map_content}" name="map.map_content"
								 /></td>

						</tr>
						<tr class="tables">
							<td style="text-align: center; width: 30%;">导航链接</td>
							<td style="text-align: center; width: 30%;"><input
								type="text" value="${uMap.map_links}" name="map.map_links"
								/></td>
						</tr>
						<tr class="tables">

							<td  colspan="2" ><input
								type="submit" value="修改" /></td>

						</tr>
					</form>



				</tbody>
			</table>
		</center>







	</div>
</body>
</html>
