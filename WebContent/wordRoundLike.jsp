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

</script>
<script type="text/javascript">
	$(document).ready(function(){
	 $(".click").click(function(){
	 $(".tip").fadeIn(200);
	 });
	
	 $(".tiptop a").click(function(){
	 $(".tip").fadeOut(200);
	 });

	 $(".sure").click(function(){
	 $(".tip").fadeOut(100);
	 });

	 $(".cancel").click(function(){
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


		 $(".click").eq(0).click(function(){
		     $(".tip").eq(0).fadeIn(200);
		 });
		 $(".click").eq(1).click(function(){
		     $(".tip").eq(1).fadeIn(200);
		 }) ;
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

		function useAjax(id) {
			$.ajax({
				url : "roundFindWord",
				data : "lword.leaveWord_id="+id,
				type : "post",
				success : function(suc) {
					if(suc==1){
						window.location.href="wordRoundLike.jsp";
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
		$("#removeIndex").click(function(){
			$(":input[name=indexWord]:checked").each(function(i,v){
				checks[i]=$(v).val();
			});
			alert(checks);
			window.location.href="removeManyWord?stringIndex="+checks;
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
				window.location.href = 'searchWPage?lword.leaveWord_id='
						+ (parseInt(index) - 1);
				$($('.paginItem')[5]).addClass('current');
			}
			else{
				window.location.href = 'searchWPage?lword.leaveWord_id='
					+1;
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
		$(":input[name=checkall]").change(function(){
	         this.checked!=this.checked;
			$(":input[name=indexWord]").each(function(index,value){
					
					if($(":input[name=checkall]").attr("checked")){

						$(value).attr("checked",true);
					}
					else{
						$(value).attr("checked",false);
					}
				
				
				
			});
			
			
		});
		//点击跳转
		$(".page").click(function(){
		var bigPage=$(':input[name=bigPage]').val();
		if(parseInt(bigPage)>=parseInt($(this).text())){
			useAjax(parseInt($(this).text()));
			
		
			}
		})
		

		
		//模糊查询用户留言
		$("#searchButton").click(function(){
			console.log($("#searchWord").serialize());
			
			$.ajax({
				type:"post",
				url:"roundFindWord",
				dataType:"json",
				data:$("#searchWord").serialize(),
				success:function(msg){
					if(msg==1){
						window.location.href="wordRoundLike.jsp";
					}
					else{
						alert("用户信息未找到！");
						console.log(111);
						console.log($("#searchWord"));
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
			<li><a href="#">首页</a></li>
			<li><a href="#">用户留言</a></li>
			<li><a href="#">留言信息</a></li>
		</ul>
	</div>

	<div class="rightinfo">

		<div class="tools">

			<ul class="toolbar">
				<li id="removeIndex" style="cursor: pointer;"><span><img
						src="images/t03.png" /></span><b>删除留言</b></li>
				<li id="removeAll" style="cursor: pointer;"><span><img
						src="images/t03.png" /></span><b>清空留言</b></li>
				<li><form  method="post" id="searchWord" ><input type="hidden" value="1" name="lword.leaveWord_id" /> <input type="text" name="lword.leaveWord_name" style="height:90%;margin:0;padding:0 15px;" /><span><img src="images/t04.png" /></span><b id="searchButton">查询</b></form></li>
			</ul>

		</div>


		<table class="tablelist">
			<thead>
				<tr>
					<th><input name="checkall" type="checkbox" value=""  /></th>
					<th>编号<i class="sort"><img src="images/px.gif" /></i></th>
					<th>用户姓名</th>
					<th>电话</th>
					<th>发布内容</th>
					<th>邮箱</th>
					<th>地址</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#session.wordsLeave" var="lWord">
					<tr>
						<input type="hidden" name="lword.leaveWord_id"
							value="${lWord.leaveWord_id}"></input>
						<td><input name="indexWord" type="checkbox"
							value="${lWord.leaveWord_id}" /></td>
						<td class="lword"></td>
						<td>${lWord.leaveWord_telephone}</td>
						<td>${lWord.leaveWord_name}</td>
						<td>${lWord.leaveWord_content}</td>
						<td>${lWord.leaveWord_email}</td>
						<td>${lWord.leaveWord_address}</td>
						<td><a href="findWord?lword.leaveWord_id=${lWord.leaveWord_id}" class="tablelink">查看</a> <a
							class="wordSinRemove" onclick="javascript:return false;"> 删除</a></td>
					</tr>
				</s:iterator>

			</tbody>
		</table>

		<input type="hidden" name="currenPage"
			value="<s:property value="#session.lword.leaveWord_id" />"></input> <input
			type="hidden" name="bigPage"
			value="<s:property value="#session.wordS.size()/11+1" />"></input>
		<div class="pagin">
			<div class="message">
				共<i class="blue"><s:property value="#session.wordS.size()" /></i>条记录，当前显示第&nbsp;<i
					class="blue"><s:property value="#session.lword.leaveWord_id" />&nbsp;</i>页
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


		<div class="tip" style="width: 700px">

			<!--弹出添加用户窗口-->
			<!--提示框的页眉-->
			<div class="tiptop">
				<span>添加新闻信息</span><a></a>
			</div>
			<div class="tipinfo">
				<form action="addNews" method="post">
					<table border="0px" class="myTable">
						<tr>
							<td>编&nbsp;&nbsp;号:</td>
							<td><input type="text" name="" /></td>
						</tr>
						<tr>
							<td>标&nbsp;&nbsp;题:</td>
							<td>
								<!-- 新闻标题--> <input type="text" name="news_title" />
							</td>
						</tr>
						<tr>
							<td>用&nbsp;&nbsp;户:</td>
							<td>
								<!-- 欢迎信息中的有用户名--> <input type="text" name="" />
							</td>
						</tr>
						<tr>
							<td>用&nbsp;&nbsp;户:</td>
							<td>
								<!-- 欢迎信息中的有应该有用户名--> <input type="text" name="" />
							</td>
						</tr>
						<tr>
							<td>发布时间:</td>
							<td>
								<!--  js获取当前时间，可修改新闻更新时间就会是发布时间--> <input type="date"
								name="news_updateTime" />
							</td>
						</tr>
						<tr>
							<td>文章内容:</td>
							<td><textarea id="content7" name="content"
									style="width: 500px; height: 350px; heights: 650px; visibility: hidden;"></textarea>

							</td>
						</tr>
						<tr>
							<td>是否审核:</td>
							<td><input type="radio" name="xxx" />已审核<input type="radio"
								name="xxx" checked="checked" />未审核</td>
						</tr>
					</table>
					<div class="tipbtn" style="position: absolute; top: 80%;">
						<input name="" type="submit" class="sure" value="确定" />&nbsp; <input
							name="" type="button" class="cancel" value="取消" />
					</div>
				</form>
			</div>


		</div>


		<!--修改信息-->

		<div class="tip" style="width: 700px;">
			<!--<div class="tiptop"><span>提示信息</span><a></a></div>

          <div class="tipinfo">
            <span><img src="images/ticon.png" /></span>
            <div class="tipright">
            <p>是否确认对信息的修改 ？</p>
            <cite>如果是请点击确定按钮 ，否则请点取消。</cite>
            </div>
            </div>

            <div class="tipbtn">
            <input name="" type="button"  class="sure" value="确定" />&nbsp;
            <input name="" type="button"  class="cancel" value="取消" />
            </div>-->
			<!--弹出添加用户窗口-->
			<!--提示框的页眉-->
			<div class="tiptop">
				<span>修改新闻信息</span><a></a>
			</div>
			<div class="tipinfo">
				<form action="" method="" class="myTable">
					<table>
						<tr>
							<td>编&nbsp;&nbsp;号:</td>
							<td><input type="text" name="" /></td>
						</tr>

						<tr>
							<td>标&nbsp;&nbsp;题:</td>
							<td>
								<!--新闻标题--> <input type="text" name="news_title" />
							</td>
						</tr>
						<tr>
							<td>用&nbsp;&nbsp;户:</td>
							<td>
								<!--用户--> <input type="text" name="" />
							</td>
						</tr>
						<tr>
							<td>籍&nbsp;&nbsp;贯:</td>
							<td>
								<!--籍贯--> <input type="text" name="" />
							</td>
						</tr>

						<tr>
							<td>发布时间:</td>
							<td>
								<!--发布时间--> <input type="date" name="" />
							</td>
						</tr>

						<tr>
							<td>文章内容:</td>
							<td>
								<!--文章内容--> <textarea id="content8" name="content"
									style="width: 500px; height: 350px; heights: 650px; visibility: hidden;"></textarea>
							</td>
						</tr>
						<tr>
							<td>是否审核:</td>
							<td>
								<!--是否审核--> <input type="radio" name="xxx" />已审核<input
								type="radio" name="xxx" checked="checked" />未审核
							</td>
						</tr>
					</table>

					<div class="tipbtn" style="position: absolute; top: 80%">
						<input name="" type="button" class="sure" value="确定" />&nbsp; <input
							name="" type="button" class="cancel" value="取消" />
					</div>


				</form>






				<script type="text/javascript">
					$('.tablelist tbody tr:odd').addClass('odd');
				</script>
</body>
</html>
