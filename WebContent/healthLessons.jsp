<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">

/* .tip  .tipinfo  input{margin-top: 25px; margin-left: 15px;border-color: #878787;
                border-style: solid;
                border-top-width: 0px;
                border-right-width: 0px;
                border-bottom-width: 1px;
                border-left-width: 0px;}*/
.tip  .tipinfo   input {
	-webkit-box-shadow: 1px 1px 9px black inset;
	margin: 8px auto
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新开元后台管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="editor/kindeditor.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$(".click").click(function() {
			$(".tip").fadeIn(200);
		});

		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});

	$(document).ready(function() {
		//让表格奇数行和偶数行不同颜色

		/*js获取当前时间并赋值到日期中*/
		function getNowFormatDate() {
			var date = new Date();
			var seperator1 = "-";
			var year = date.getFullYear();
			var month = date.getMonth() + 1;
			var strDate = date.getDate();
			if (month >= 1 && month <= 9) {
				month = "0" + month;
			}
			if (strDate >= 0 && strDate <= 9) {
				strDate = "0" + strDate;
			}
			var currentdate = year + seperator1 + month + seperator1 + strDate;
			$(".tip .tipinfo input[type=date]:eq(0)").val(currentdate);

		}
		getNowFormatDate();

		$(".click").each(function(i) {
			$(this).click(function() {
				$(".tip").eq(i).fadeIn(200);
			});
		});

		function useAjax() {
			$.ajax({
				url : "",
				data : {},
				type : "post",
				success : function(suc) {

				}
			});
		}
		$(".click").eq(0).click(function() {
			$(".tip").eq(0).fadeIn(200);
		});
		$(".click").eq(1).click(function() {
			$(".tip").eq(1).fadeIn(200);
		});
		$(".tiptop a").click(function() {
			$(".tip").fadeOut(200);
		});

		$(".sure").click(function() {
			$(".tip").fadeOut(100);
		});

		$(".cancel").click(function() {
			$(".tip").fadeOut(100);
		});

	});
	$(function() {

		$(".lword").each(function(index, value) {
			$(value).text((index + 1));

		});
		//       清除所有当前页面效果
		$('.paginItem').removeClass('current');
		//添加当前效果到对应的页面数
		$($('.paginItem')[parseInt($(':input[name=currenPage]').val())])
				.addClass('current');
		//清空所有课程
		$("#removeAll").click(function() {
			window.location.href = "removeWordAll";
		});
		//清除单条课程
		$(".wordSinRemove").click(
				function() {
					var value = $(
							$(
									$(".tablelist tbody>tr")[$(
											$(this).parent("td")).parent("tr")
											.index()]).children(
									":input[type=hidden]")).val();

					window.location.href = "removeSinleson?lessons.lessons_id="
							+ value;
				});
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
		//点击删除多条课程
		$("#removeIndex").click(function() {
			$(":input[name=indexWord]:checked").each(function(i, v) {
				checks[i] = $(v).val();
			});
			alert(checks);
			window.location.href = "removeManyWord?stringIndex=" + checks;
		});

		var curragpeLine = parseInt($(":input[name=currenPage]").val() % 6) + 1;
		var currLineagpe = ((parseInt($(":input[name=currenPage]").val()) % 6 - 1) * 5)
				- parseInt($(":input[name=currenPage]").val()) + 1;
		var bigPAGE = parseInt($(":input[name=bigPage]").val());
		var curr = parseInt($(":input[name=currenPage]").val());
		//页数转换
		$(".page").each(
				function(i, v) {
					$($(this).children("a")).text(
							parseInt(curr / 6) * 5 + parseInt((i + 1)));
				});

		//左移
		$(".pagepre")
				.click(
						function() {
							var index = $('.current').index();
							$('.paginItem').removeClass('current');
							if (index > 1) {
								$($('.paginItem')[parseInt(index) - 1])
										.addClass('current');

								window.location.href = 'searchWPage?lword.leaveWord_id='
										+ (parseInt(index) - 1);
							} else if (parseInt($($('.current').children("a"))
									.text()) > 5) {
								window.location.href = 'searchWPage?lword.leaveWord_id='
										+ (parseInt(index) - 1);
								$($('.paginItem')[5]).addClass('current');
							} else {
								window.location.href = 'searchWPage?lword.leaveWord_id=' + 1;
							}

						});

		//右移
		$(".pagenxt")
				.click(
						function() {
							var index = $('.current').index();
							$('.paginItem').removeClass('current');
							$($('.paginItem')[parseInt(index) + 1]).addClass(
									'current');
							if (index < 7) {
								//小于第五行继续查询页数
								if (parseInt($(":input[name=currenPage]").val()) < parseInt(bigPAGE)) {
									window.location.href = 'searchWPage?lword.leaveWord_id='
											+ (parseInt(index) + 1);
								} else {
									// 							
									window.location.href = 'searchWPage?lword.leaveWord_id='
											+ parseInt($(
													":input[name=currenPage]")
													.val());
								}

							} else {
								// 			//到第五行换页
								$($('.paginItem')[1]).addClass('current');

								window.location.href = 'searchWPage?lword.leaveWord_id='
										+ (parseInt(curr) + parseInt(1));
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
								window.location.href = 'searchWPage?lword.leaveWord_id='
										+ parseInt($(this).text());
							}
						})
		//模糊查询课程
		$("#searchButton").click(function() {
			console.log($("#searchWord").serialize());
			$.ajax({
				type : "post",
				url : "roundFindWord",
				data : $("#searchWord").serialize(),
				success : function(msg) {
					if (msg == 1) {
						window.location.href = "wordRoundLike.jsp";
					} else {
						alert("用户信息未找到！");

					}
				}

			});
		});
	});
</script>



</head>


<body>


	<div class="place">
		<span>位置:</span>
		<ul class="placeul">
			<li><a href="index.jsp">首页</a></li>
			<li><a href="healthLessonType.jsp">课程分类</a></li>
			<li><a href="#">视频课程</a></li>
		</ul>
	</div>

	<div class="rightinfo">

		<div class="tools">

			<ul class="toolbar">
				<li id="removeIndex" style="cursor: pointer;"><span><img
						src="images/t03.png" /></span><b>删除课程</b></li>
				<li id="removeAll" style="cursor: pointer;"><span><img
						src="images/t03.png" /></span><b>清空课程</b></li>
				<li><form id="searchWord">
						<input type="hidden" value="1" name="lessons.lessons_id"></input>
						<input type="text" name="lessons.lessons_name"
							style="height: 90%; margin: 0; padding: 0 15px;"></input> <span><img
							src="images/t04.png" /></span> <b id="searchButton">查询</b>
					</form></li>

			</ul>

		</div>


		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="checkall" type="checkbox" value="" /></th>
					<th>编号<i class="sort"><img src="images/px.gif" /></i></th>
					<th>课程名</th>
					<th>课程图片</th>
					<th>课程视频</th>
					<th>课程介绍</th>
					<th>课程公告</th>
					<th>知识库</th>
					<th>主讲老师</th>
					<th>发布时间</th>
					<th>学习人数</th>
					<th>上课费用</th>
					<th>学习目标</th>
					<th>课程关注度</th>
					<th>操作</th>

				</tr>
			</thead>
			<tbody>
				<s:iterator value="#session.pageLesson" var="lWord">
					<tr>
						<input type="hidden" name="lword.lessons_id"
							value="${lWord.lessons_id}"></input>
						<td><input name="indexWord" type="checkbox"
							value="${lWord.lessons_id}" /></td>
						<td class="lword"></td>
						<td>${lWord.lessons_name}</td>
						<td ><img src="${lWord.lessons_image}" style="width:100px;height:60px;" ></img></td>
						<td><video  width="100px";height="60px";><source src="${lWord.lessons_video}"
								type="video/mp4"  /> </video></td>
						<td>${lWord.lessons_introduce}</td>
						<td>${lWord.lessons_advert}</td>
						<td>${lWord.lessons_library}</td>
						<td>${lWord.lessons_teacher}</td>
						<td>${lWord.lessons_updateTime}</td>
						<td>${lWord.lessons_student.size()}</td>
						<td>${lWord.lessons_money}￥</td>
						<td>${lWord.lessons_target}</td>
						<td>${lWord.lessons_concerns}</td>

						<td><a
							href="updateleson?lessons.lessons_id=${lWord.lessons_id}"
							class="tablelink">修改</a> <a class="wordSinRemove"
							onclick="javascript:return false;"> 删除</a></td>
					</tr>
				</s:iterator>

			</tbody>
		</table>

		<input type="hidden" name="currenPage"
			value="<s:property value="lessons.lessons_id" />"></input> <input
			type="hidden" name="bigPage"
			value="<s:property value="#session.sessionWhole.size()/11+2" />"></input>
		<div class="pagin">
			<div class="message">
				共<i class="blue"><s:property
						value="#session.sessionWhole.size()" /></i>条记录，当前显示第&nbsp;<i
					class="blue"><s:property value="lessons.lessons_id" />&nbsp;</i>页
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




		<script type="text/javascript">
			$('.tablelist tbody tr:odd').addClass('odd');
		</script>
</body>
</html>
