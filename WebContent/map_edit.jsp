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

	})
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
	width: 90%;
	height: 100%;
	border: 1px solid transparent;
	background: transparent;
	text-align: left;
}
</style>
</head>


<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="index.jsp">首页</a></li>
			<li><a href="#">导航列表</a></li>

		</ul>
	</div>

	<div class="rightinfo">

		<div class="tools">

			<ul class="toolbar">
				<!-- 自动添加导航栏-->
				<li class="click"
					onclick="javascript:console.log($(this).text()=='添加');if($(this).text()=='添加'){$(this).html($(this).html().replace('添加',''));}else{$(this).html($(this).html().replace('取消添加',''));} var t=$($(this).children('span'));console.log($('#addMap').css('visibility'));if($('#addMap').css('visibility')=='hidden'){t.after('取消添加');$('#addMap').css('visibility','visible');}else{t.after('添加');$('#addMap').css('visibility','hidden');}"><span><img
						src="images/t01.png" /></span>添加</li>
				<li><span><img src="images/t04.png" /></span>统计</li>
			</ul>




		</div>


		<center>
			<table style="width: 100%;" class="tablelist">
				<thead>
					<tr>
						<th style="width: 30%;">编号<i class="sort"><img
								src="images/px.gif" /></i></th>
						<th style="width: 30%;">导航文字</th>
						<th style="width: 30%;">导航链接</th>
						<th style="">操作</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#session.maps" var="mapsInfo">

						<tr class="tables">
							<td  class="idSort"></td>
							<td style="width: 30%;"><input
								type="text" value="${mapsInfo.map_content}"
								name="map.map_content" disabled="disabled" /></td>
							<td style="width: 30%;"><input
								type="text" value="${mapsInfo.map_links}" name="map.map_links"
								disabled="disabled" /></td>
							<td ><a
								href="searchAloneMap?map.map_id=${mapsInfo.map_id}">修改</a> <a
								href="deleteMap?map.map_id=${mapsInfo.map_id}"> 删除</a></td>

						</tr>

					</s:iterator>

					<tr id="addMap" style="visibility: hidden;">
						<form id="addMapForm">
							<td style="text-align: center;">*</td>
							<td style="text-align: center; width: 30%;"><input
								type="text" name="map.map_content" placeholder="请输入导航内容" /></td>
							<td style="text-align: center; width: 30%;"><input
								type="text" name="map.map_links" placeholder="请输入导航链接" /></td>
						</form>
						<td style="text-align: center;"><a href="#"
							onclick="sendAjax('addMap')"> 添加导航</a></td>

					</tr>

				</tbody>
			</table>
		</center>


		<div class="tip">
			<div class="tiptop">
				<span>提示信息</span><a></a>
			</div>

			<div class="tipinfo">
				<span><img src="images/ticon.png" /></span>
				<div class="tipright">
					<p>是否确认对信息的修改 ？</p>
					<cite>如果是请点击确定按钮 ，否则请点取消。</cite>
				</div>
			</div>

			<div class="tipbtn">
				<input name="" type="button" class="sure" value="确定" />&nbsp; <input
					name="" type="button" class="cancel" value="取消" />
			</div>

		</div>




	</div>
</body>
</html>
