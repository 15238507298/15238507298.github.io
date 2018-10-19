<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

       .tip  .tipinfo   input{ -webkit-box-shadow: 1px 1px 9px black inset;margin:8px auto }


    </style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新开元后台管理系统</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="editor/kindeditor.js"></script>
    <script type="text/javascript">
        KE.show({
            id : 'content7',
            cssPath : './index.css'
        });
        KE.show({
            id : 'content8',
            cssPath : './index.css'
        });
    </script>
<script type="text/javascript">
/*$(document).ready(function(){
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

});*/


$(document).ready(function(){
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

$(".click").each(
    function(i){
        $(this).click(
            function(){
                $(".tip").eq(i).fadeIn(200);
            }
        );
    }
);

function  useAjax() {
    $.ajax(
        {
            url:"",
            data:{},
            type:"post",
            success:function(suc){

            }
        }
    );
}
   /* $(".click").eq(0).click(function(){
        $(".tip").eq(0).fadeIn(200);
    });
    $(".click").eq(1).click(function(){
        $(".tip").eq(1).fadeIn(200);
    }) ;*/
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
</script>


</head>


<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    <li><a href="#">用户留言</a></li>
    <li><a href="#">留言信息</a></li>
    </ul>
    </div>
    
    <div class="rightinfo">
    
    <div class="tools">
    
    	<ul class="toolbar">
        <li><span><img src="images/t03.png" /></span><b>删除</b></li>
        <li><span><img src="images/t04.png" /></span><b>查询</b></li>
        </ul>
    
    </div>
    
    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th><input name="" type="checkbox" value="" checked="checked"/></th>
        <th>编号<i class="sort"><img src="images/px.gif" /></i></th>
        <th>标题</th>
        <th>用户</th>
        <th>籍贯</th>
        <th>发布时间</th>
        <th>是否审核</th>
        <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20130908</td>
        <td>王金平幕僚：马英九声明字字见血 人活着没意思</td>
        <td>admin</td>
        <td>江苏南京</td>
        <td>2013-09-09 15:05</td>
        <td>已审核</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink"> 删除</a></td>
        </tr> 
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20130907</td>
        <td>温州19名小学生中毒流鼻血续：周边部分企业关停</td>
        <td></td>
        <td>山东济南</td>
        <td>2013-09-08 14:02</td>
        <td>未审核</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink">删除</a></td>
        </tr>
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20130906</td>
        <td>社科院:电子商务促进了农村经济结构和社会转型</td>
        <td>user</td>
        <td>江苏无锡</td>
        <td>2013-09-07 13:16</td>
        <td>未审核</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink">删除</a></td>
        </tr>
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20130905</td>
        <td>江西&quot;局长违规建豪宅&quot;：局长检讨</td>
        <td>admin</td>
        <td>北京市</td>
        <td>2013-09-06 10:36</td>
        <td>已审核</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink">删除</a></td>
        </tr>
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20130904</td>
        <td>中国2020年或迈入高收入国家行列</td>
        <td></td>
        <td>江苏南京</td>
        <td>2013-09-05 13:25</td>
        <td>已审核</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink">删除</a></td>
        </tr>
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20130903</td>
        <td>深圳地铁车门因乘客拉闸打开 3人被挤入隧道</td>
        <td>user</td>
        <td>广东深圳</td>
        <td>2013-09-04 12:00</td>
        <td>已审核</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink">删除</a></td>
        </tr>
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20130902</td>
        <td>33次地表塌陷 村民不敢下地劳作(图)</td>
        <td>admin</td>
        <td>湖南长沙</td>
        <td>2013-09-03 00:05</td>
        <td>未审核</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink">删除</a></td>
        </tr>
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20130901</td>
        <td>医患关系：医生在替改革不彻底背黑锅</td>
        <td>admin</td>
        <td>江苏南京</td>
        <td>2013-09-02 15:05</td>
        <td>未审核</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink">删除</a></td>
        </tr>
        
        <tr>
        <td><input name="" type="checkbox" value="" /></td>
        <td>20130900</td>
        <td>山东章丘公车进饭店景点将自动向监控系统报警</td>
        <td></td>
        <td>山东滨州</td>
        <td>2013-09-01 10:26</td>
        <td>已审核</td>
        <td><a href="#" class="tablelink">查看</a>     <a href="#" class="tablelink">删除</a></td>
        </tr>        
        </tbody>
    </table>
    
   
    <div class="pagin">
    	<div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="javascript:;">1</a></li>
        <li class="paginItem current"><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
    
    
    <div class="tip" style="width: 700px " >
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
        <div class="tiptop"><span>添加新闻信息</span><a></a></div>
        <div class="tipinfo">
    <form action="addNews" method="post" >
<table border="0px" class="myTable">
     <tr>
         <td>
             编&nbsp;&nbsp;号:
     </td>
     <td>
         <input type="text" name=""/>
     </td>
     </tr>
    <tr>
        <td>
            标&nbsp;&nbsp;题:
        </td>
        <td>
            <!-- 新闻标题-->
            <input type="text" name="news_title"/>
        </td>
    </tr>
    <tr>
        <td>
            用&nbsp;&nbsp;户:
        </td>
        <td>
            <!-- 欢迎信息中的有用户名-->
          <input type="text" name=""/>
        </td>
    </tr>
    <tr>
        <td>
            用&nbsp;&nbsp;户:
        </td>
        <td>
            <!-- 欢迎信息中的有应该有用户名-->
            <input type="text" name=""/>
        </td>
    </tr>
    <tr>
        <td>
            发布时间:
        </td>
        <td>
            <!--  js获取当前时间，可修改新闻更新时间就会是发布时间-->
            <input type="date" name="news_updateTime"/>
        </td>
    </tr>
    <tr>
        <td>
            文章内容:
        </td>
        <td>
             <textarea id="content7" name="content" style="width:500px;height: 350px;heights:650px;visibility:hidden;"></textarea>

        </td>
    </tr>
    <tr>
        <td>
            是否审核:
        </td>
        <td>
            <input type="radio" name="xxx"/>已审核<input type="radio" name="xxx" checked="checked"/>未审核
        </td>
    </tr>
</table>
        <div class="tipbtn" style="position: absolute;top: 80%;">
            <input name="" type="submit"  class="sure" value="确定" />&nbsp;
            <input name="" type="button"  class="cancel" value="取消" />
        </div>
    </form>
        </div>


    </div>


        <!--修改信息-->

        <div class="tip"  style="width: 700px;" >
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
            <div class="tiptop"><span>修改新闻信息</span><a></a></div>
            <div class="tipinfo">
                <form action="" method="" class="myTable" >
    <table><tr>
        <td>
            编&nbsp;&nbsp;号:
        </td>
        <td>
            <input type="text" name=""/>
        </td>
    </tr>

        <tr>
            <td>
                标&nbsp;&nbsp;题:
            </td>
            <td>  <!--新闻标题-->
                <input type="text" name="news_title"/>
            </td>
        </tr>
        <tr>
            <td>
                用&nbsp;&nbsp;户:
            </td>
            <td>  <!--用户-->
                <input type="text" name=""/>
            </td>
        </tr>
        <tr>
            <td>
                籍&nbsp;&nbsp;贯:
            </td>
            <td>  <!--籍贯-->
                <input type="text" name=""/>
            </td>
        </tr>

        <tr>
            <td>
                发布时间:
            </td>
            <td>  <!--发布时间-->
                <input type="date" name=""/>
            </td>
        </tr>

        <tr>
            <td>
                文章内容:
            </td>
            <td>  <!--文章内容-->
                <textarea id="content8" name="content" style="width:500px;height: 350px;heights:650px;visibility:hidden;"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                是否审核:
            </td>
            <td>  <!--是否审核-->
                <input type="radio" name="xxx"/>已审核<input type="radio" name="xxx" checked="checked"/>未审核
            </td>
        </tr>
    </table>

                    <div class="tipbtn" style="position: absolute;top: 80% "   >
                        <input name="" type="button"  class="sure" value="确定" />&nbsp;
                        <input name="" type="button"  class="cancel" value="取消" />
                    </div>


                </form>






        <script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>

</body>
</html>
