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
		//清空所有留言信息
		$("#removeAll").click(function() {
			window.location.href = "removeWordAll";
		});
		//清除单条留言信息
		$(".wordSinRemove").click(
				function() {
					var value = $(
							$(
									$(".tablelist tbody>tr")[$(
											$(this).parent("td")).parent("tr")
											.index()]).children(
									":input[type=hidden]")).val();

					window.location.href = "removeSinWord?lword.leaveWord_id="
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
		//点击删除多条留言
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
		//上传文件
		$(".files").mouseover(function() {
			$(this).get(0).setAttribute("type","file");

		});
		$(".files").mouseout(function() {
			console.log(111);
			
			if($(this).val()==''){
				$(this).get(0).setAttribute("type","text");
			}
			

		});
		//ajax模糊查询		
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

<style>
input {
	padding: 5px;
	float: left;
	width: 80%;
	height: 90%;
}



tr, td {
	width: 45%;
}
</style>

</head>


<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="#">首页</a></li>
			<li><a href="#">表单</a></li>
		</ul>
	</div>

	<div class="formbody">

		<div class="formtitle">
			<span>课程发布</span>
		</div>
		<form action="addLesson" method="post" enctype="multipart/form-data">
		<ul class="forminfo">
			<li><label>课程标题</label><input name="lessons.lessons_name"
				type="text" class="dfinput" /><i>标题不能超过30个字符</i></li>
			<li><label>课程图片</label><input name="files1.image"
				type="text" class="dfinput files"  placeholder="上传图片" /><i></i></li>
			<li><label>课程视频</label><cite><input
					name="files1.video" type="text" class="dfinput files"
					 placeholder="上传视频" /> </cite><i></i></li>
			<li><label>课程介绍</label><input name="lessons.lessons_introduce"
				type="text" class="dfinput" /><i>课程简介</i></li>
			<li><label>课程公告</label><input name="lessons.lessons_advert"
				type="text" class="dfinput" /></li>
			<li><label>知识库</label><input name="lessons.lessons_library"
				type="text" class="dfinput" /></li>
			<li><label>主讲老师</label><input name="lessons.lessons_teacher"
				type="text" class="dfinput" /></li>
			<li><label>上课费用</label><input name="lessons.lessons_money"
				type="text" class="dfinput" placeholder="￥"></input></li>
			<li><label>学习目标</label><input name="lessons.lessons_target"
				type="text" class="dfinput" /></li>
			<li><label>课程类型</label><select name="lessons.lessontype.lessonType_id"
				class="dfinput" style="padding: 2px;">
					<s:iterator value="#session.lessonTypesS" var="typeId">
						<option value="${typeId.lessonType_id}">${typeId.lessonType_name}</option>
					</s:iterator>
			</select></li>
			<li><label>&nbsp;</label><input type="submit"  class="btn"
				value="发布课程" /></li>
		</ul>

</form>
	</div>

</body>
</html>
