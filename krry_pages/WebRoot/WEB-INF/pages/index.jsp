<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("basePath", basePath);
%>

<!DOCTYPE HTML>
<html>
  <head>
    <title>分页</title>
    <style>
    	body{background:url("resource/images/78788.jpg");background-size:cover;}
    	.titless{font-size: 34px;text-align: center;color: black;margin-bottom: 16px;}
    	.ke_tabbox{min-height:556px;width:900px;background:#f9f9f9;margin:20px auto 0;padding:6px;position:relative;}
			.ke_tabbox .sendMy{text-align: center;
					font-family: "微软雅黑";
					font-size: 28px;
					-webkit-text-fill-color: transparent;
					background: -webkit-gradient(linear,left top,left bottom,from(#FD8700),to(#FF00B1));
					-webkit-background-clip: text;
					margin:8px auto 0;line-height: 35px;}
			.ke_tabbox .ke_table{width:100%;margin-top: 26px;}
			.ke_tabbox  th{background:#ccc;font-weight:bold;}
			.ke_tabbox .ke_table td,th{overflow: hidden;white-space: nowrap;text-overflow: ellipsis;border:1px solid #fff;padding:4px 12px;color:#666;font-size:12px;}
			/*分页相关*/
			.tzPage{font-size: 12px;position: absolute;top: 480px;right: 0px;}
    		
    		#tbody tr:hover{background:#eaeaea;}
    		#tbody .t_mode{padding-right:4px;}
    		#tbody .t_avbiaoq:hover{color:#FF6857;transition:.4s}
    		#tbody .t_dele{padding-left:4px;}
    
			.tzPage a{text-decoration:none;border:none;color:#7d7d7d;background-color:#f2f2f2;border-radius: 3px;}
			.tzPage a:hover{background:#dd5862;color:#FFF;}
			.tzPage a,.tzPage span{display:block;float:left;padding:0em 0.5em;margin-right:5px;margin-bottom:5px;min-width:1em;text-align:center;line-height: 22px;height: 22px;}
			.tzPage .current{background:#dd5862;color:#FFF;border:none;border-radius: 3px;}
			.tzPage .current.prev,.tzPage .current.next{color:#999;border:1px solid #e5e5e5;background:#fff;}
			.tm_psize_go{margin-right:4px;float:left;height:24px;line-height:33px;position:relative;border:1px solid #e5e5e5;color:#999}
			#tm_pagego{border-radius:3px;height:18px;width:30px;float:left;text-align:center;border:1px solid #e5e5e5;line-height: 22px;color:#999}
			.sortdesc{border-top:5px solid;width:0px;height:0px;display:inline-block;vertical-align:middle;border-right:5px solid transparent;border-left:5px solid transparent;margin-left:5px;}
			.sortasc{border-bottom:5px solid;width:0px;height:0px;display:inline-block;vertical-align:middle;border-right:5px solid transparent;border-left:5px solid transparent;margin-left:5px;}
			.red{color:red}	
			.green{color:green}
			
			.hideAdd{height: 300px;
				    text-align: center;
				    line-height: 300px;
				    margin-top: 16px;display:none;}
			.hideAdd a{font-size:28px;-webkit-text-fill-color:transparent;background: -webkit-gradient(linear,left top,left bottom,from(#FD0051),to(#A22C93));-webkit-background-clip: text;}
    </style>
  </head>
  
  <body>
  	<div class="ke_tabbox">
  		<p class="titless">分页展示</p>
		<table class="ke_table">
			<thead>
				<tr>
					<th style="width:25%">标题</th>
					<th style="width:25%">音乐人</th>
					<th style="width:30%">音乐标题</th>
					<th style="width:20%">发布时间</th>
				</tr>
			</thead>
			
			<tbody id="tbody" data-itemcount="${coutBlogs}">
				<c:forEach var="blog" items="${blogs}">
					<tr>
						<td><a class="t_avbiaoq" title="${blog.TITLE}">${blog.TITLE}</a></td>
						<td><a class="t_avbiaoq" title="${blog.MUSICTOR}">${blog.MUSICTOR}</a></td>
						<td><a class="t_avbiaoq" title="${blog.MUSICTITLE}">${blog.MUSICTITLE}</a></td>
						<td>${blog.CREATETIME}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="krryPage"></div>
	</div>
	<script type="text/javascript" src="${basePath}/resource/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src="${basePath}/resource/js/krry_page.js"></script>
	<script type="text/javascript">var basePath = "${basePath}";</script>
	<script type="text/javascript">
		
		var krryAdminBlog = {
			initPage:function(itemCount){
				$("#krryPage").tzPage(itemCount, {
					num_display_entries : 5, //主体页数
					num_edge_entries : 4,//边缘页数
					current_page : 0,//指明选中页码
					items_per_page : 10, //每页显示多少条
					prev_text : "上一页",
					next_text : "下一页",
					showGo:true,//显示
					showSelect:false,
					callback : function(pageNo, psize) {//会回传两个参数，第一个是当前页数，第二个是每页要显示的数量
						krryAdminBlog.loadData(pageNo,psize);
					}
				});
			},
			//设置data参数：pageNo（下一页）：就是当前页数 * 下一页要显示的数量
			//			pageSize（下一页）：已经查询出来的数量（pageNo）  + 每页要显示的数量
			//在数据库中是  WN <= pageSize and WN > pageNo 来查询分页数据
			loadData:function(pageNo,pageSize){
				pageNo = pageNo * pageSize;
				pageSize = pageNo + 10;
				$.ajax({
					type:"post",
					url:basePath+"/loadData",
					data:{pageNo:pageNo,pageSize:pageSize},
					success:function(data){
						if(data){
							var html = "";
							var blogArr = data.blogs;
							for(var i=0,len=blogArr.length;i < len;i++){
								var json = blogArr[i];
								html+= "<tr>"+
								"	<td><a class='t_avbiaoq' title='"+json.TITLE+"'>"+json.TITLE+"</a></td>"+
								"	<td><a class='t_avbiaoq' title='"+json.NAME+"'>"+json.MUSICTOR+"</a></td>"+
								"	<td><a class='t_avbiaoq' title='"+json.MUSICTITLE+"'>"+json.MUSICTITLE+"</a></td>"+
								"	<td>"+json.CREATETIME+"</td>"+
								"</tr>";
							}
							$("#tbody").html(html);
						}
					}
				});
			}
		};
		
		krryAdminBlog.initPage($("#tbody").data("itemcount"));
		
	</script>
  </body>
</html>
