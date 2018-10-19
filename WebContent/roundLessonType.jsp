<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"  isELIgnored="false"%>

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
		//分页模糊查询ajax
		
		function useAjax(id) {
			$.ajax({
				url : "roundFindLessonType",
				data : "lessonTypes.lessonType_id="+id,
				type : "post",
				success : function(suc) {
					if(suc==1){
						console.log("success");
						window.location.href="roundLessonType.jsp";
					}
					else{
						alert("用户信息未找到！");
						console.log(111);
						console.log($("#searchWord"));
					}
				}
			});
		}
		
		$(".lword").each(function(index, value) {
			$(value).text((index + 1));

		});
		//       清除所有当前页面效果
		$('.paginItem').removeClass('current');
		//添加当前效果到对应的页面数
		$($('.paginItem')[parseInt($(':input[name=currenPage]').val())])
				.addClass('current');
		//导航切换
		$(".imglist li").click(function() {
			$(".imglist li.selected").removeClass("selected")
			$(this).addClass("selected");
		})

		$(".tables").each(function(i, v) {
			$(this)
		})

		$(".idSort").each(function(i, v) {
			$(this).text((i + 1));
		})
		
		//通过点击复选框选中或取消要删除的元素
		var checks = [];
		$(":input[name=indexWord]").change(function() {
			var value = $(this).val();
			if ($(this).attr("checked") == true) {
				console.log("选中操作！");
				checks.push(value);
			} else {

				$(checks).each(function(i, v) {
					console.log(value);
					console.log(v == value);
					console.log("取消选中！");
					if (v == value) {
						checks.splice(i, 1);
					}
				});

			}
		
			console.log(checks);
		});
		
		
		var curragpeLine=parseInt($(":input[name=currenPage]").val()%6)+1;
		var currLineagpe=((parseInt($(":input[name=currenPage]").val())%6-1)*5)-parseInt($(":input[name=currenPage]").val())+1;
		var bigPAGE=parseInt($(":input[name=bigPage]").val());
		var curr=parseInt($(":input[name=currenPage]").val());
		//页数转换
		$(".page").each(function(i,v){
			$($(this).children("a")).text(parseInt(curr/6)*5+parseInt((i+1)));
		});
		
		//左移
		$(".pagepre").click(function(){
			var index=$('.current').index();
			$('.paginItem').removeClass('current');
			if(index>1){
				$($('.paginItem')[parseInt(index)-1]).addClass('current');
				useAjax(parseInt(index)-1);

			} else if(parseInt($($('.current').children("a")).text())>5) {
				useAjax((parseInt(index) - 1));
			
				$($('.paginItem')[5]).addClass('current');
			}
			else{
				useAjax(1);
				
			
			}
			
		});
		
		//右移
		$(".pagenxt").click(function(){
		var index=$('.current').index();
		$('.paginItem').removeClass('current');
		if(index<7){
			//小于第五行继续查询页数
			if(parseInt($("input[name=currenPage]").val())<bigPAGE){
				$($('.paginItem')[parseInt(index)+1]).addClass('current');
				useAjax(parseInt(index)+1);
				
			}
			else{
				useAjax(parseInt($("input[name=currenPage]").val()));
	
			}
				
			}else{
			
// 			//到第五行换页
				$($('.paginItem')[1]).addClass('current');
				useAjax(parseInt(curr)+parseInt(1));
				
				}
		})
		
		//全选
		$(":input[name=checkall]").change(function() {
			this.checked != this.checked;
			$(":input[name=indexWord]").each(function(index, value) {

				if ($(":input[name=checkall]").attr("checked")) {

					$(value).attr("checked", true);
				} else {
					$(value).attr("checked", false);
				}

			});

		});
		//点击跳转
		$(".page")
				.click(
						function() {
							var bigPage = $(':input[name=bigPage]').val();
							if (parseInt(bigPage) >= parseInt($(this).text())) {
								useAjax(parseInt($(this).text()));
							
							}
						});
		$("#searchButton").click(function() {
			console.log($("#searchWord").serialize());
			$.ajax({
				type : "post",
				url : "roundFindLessonType",
				data: $("#searchWord").serialize(),
				success : function(msg) {
					if (msg == 1) {
						window.location.href = "roundLessonType.jsp";
					} else {
						alert("未搜到任何信息！");

					}
				}

			});
		});
		
		
		

		
		
		
	});

	//添加课程类型
	function sendAjax(urll) {

		$.ajax({
			type : "post",
			url : urll,
			dataType : "json",
			data : $("#addMapForm").serialize(),
			success : function(msg) {
				if (msg == 1) {
					alert("添加成功！");
					window.location.href = "searchLYPage?lessonTypes.lessonType_id=1";
				}  else {
					alert("添加失败！");
				}
			}
		});
	}
	

</script>
<style>
input {
	outline: none;
	width: 80%;
	height: 100%;
	border: 1px solid transparent;
	background: transparent;
	text-align: left;
	padding: 20px;
}
.message{
float:left;
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
					onclick="javascript:console.log($(this).text()=='添加');if($(this).text()=='添加'){$(this).html($(this).html().replace('添加',''));}else{$(this).html($(this).html().replace('取消添加',''));} var t=$($(this).children('span'));console.log($('.addMap').css('visibility'));if($('.addMap').css('visibility')=='hidden'){t.after('取消添加');$('.addMap').css('visibility','visible');}else{t.after('添加');$('.addMap').css('visibility','hidden');}"><span><img
						src="images/t01.png" /></span>添加</li>
				<li><form id="searchWord"><span>
					
					<input type="text" name="lessonTypes.lessonType_name"
						style="height:90%; line-height:100%; margin: 0; padding: 0px 11px;"></input>
						<input type="hidden" value="1" name="lessonTypes.lessonType_id"></input>
					<img src="images/t04.png" /></span><b id="searchButton" >查询</b>
					</form></li>
			</ul>




		</div>


		<center>
			<table style="width: 100%;" class="tablelist">
				<thead>
					<tr>
						<th style="width: 30%;">编号<i class="sort"><img
								src="images/px.gif" /></i></th>
						<th style="width: 30%;">课程类型</th>
						<th style="width: 30%;">课程内容</th>
						<th style="">操作</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator value="#session.roundLessonTypePage" var="mapsInfo">


						<tr class="tables">
							<td class="idSort"></td>
							<td style="width: 30%;"><input type="text"
								value="${mapsInfo.lessonType_name}"
								name="lessonTypes.lessonType_name" disabled="disabled" /></td>

							<td style="width: 30%;"><a
								href="findLessons?lessonTypes.lessonType_id=${mapsInfo.lessonType_id}">查看课程</a></td>
							<td><a
								href="searchAloneLessonType?lessonTypes.lessonType_id=${mapsInfo.lessonType_id}">修改</a>
								<a
								href="deleteLessonType?lessonTypes.lessonType_id=${mapsInfo.lessonType_id}">
									删除</a></td>

						</tr>

					</s:iterator>

					<tr class="addMap" style="visibility: hidden;">
						<form id="addMapForm">
							<td style="text-align: center;">*</td>
							<td style="text-align: center; width: 30%;"><input
								type="text" name="lessonTypes.LessonType_name"
								placeholder="请输入课程类型" /></td>
							<td style="text-align: center; width: 30%;">*</td>
						</form>
						<td style="text-align: center;"><a href="#"
							onclick="sendAjax('addLessonType')"> 增添</a></td>

					</tr>

				</tbody>
			</table>
			<input type="hidden" name="currenPage"
				value="<s:property value="#session.lessonTypes.lessonType_id" />"></input> <input
				type="hidden" name="bigPage"
				value="<s:property value="#session.roundLessonTypeS.size()/11+1" />"></input>
			<div class="pagin">
				<div class="message" >
					共<i class="blue"><s:property value="#session.roundLessonTypeS.size()" /></i>条记录，当前显示第&nbsp;<i
						class="blue"><s:property value="#session.lessonTypes.lessonType_id" />&nbsp;</i>页
				</div>
				<ul class="paginList">
					<li class="paginItem"><a><span class="pagepre"></span></a></li>
					<li class="paginItem page current"><a>1</a></li>
					<li class="paginItem page"><a>2</a></li>
					<li class="paginItem page"><a>3</a></li>
					<li class="paginItem page"><a>4</a></li>
					<li class="paginItem page"><a>5</a></li>
					<li class="paginItem"><a><span class="pagenxt"></span></a></li>
				</ul>
			</div>


		</center>


		



		</div>




	</div>
</body>
</html>
