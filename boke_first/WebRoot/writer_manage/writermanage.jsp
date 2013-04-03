<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="java.sql.*" %>
<%@ page import="com.boke.xpf.database.ConDB" %>


<% 
	ConDB condb = new ConDB();
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = "select * from writer_articles";
	
	try
	{
		conn = condb.getCon();
		
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery(sql);
	
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link rel="stylesheet" type="text/css" href="./css/jquery.dataTables.css"></link>
	<link rel="stylesheet" type="text/css" href="./css/jquery.dataTables_themeroller.css"></link>
	<link rel="stylesheet" type="text/css" href="./css/boke_xpf_css.css"></link>
	
	<script type="text/javascript" language="javascript" src="./js/jquery.js"></script>
    <script type="text/javascript" language="javascript" src="./js/jquery.dataTables.min.js"></script>
    
    
    <script type="text/javascript" charset="utf-8" src="./ueditor/editor_config.js"></script>
    <script type="text/javascript" charset="utf-8" src="./ueditor/editor_all.js"></script>
    
    <script type="text/javascript" src="./ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
    <link rel="stylesheet" type="text/css" href="./ueditor/third-party/SyntaxHighlighter/shCoreDefault.css"/>
    
    <script type="text/javascript">
    
    	function opendiv(div1, div2)
		{
			document.getElementById(div1).style.display = 'block';
			document.getElementById(div2).style.display = 'block';
		}
		
		function closediv(div1, div2)
		{
			document.getElementById(div1).style.display = 'none';
			document.getElementById(div2).style.display = 'none';
		}
		
		$(document).ready(	
 		function()
 		{
 			$("#example").dataTable();
 		});
 		
 		
 		function getData(id)
 		{
 			var url = "ajax/ajax_context.jsp?id=" + id;
 			
 		//	alert(url);
 			loadXMLDoc(url);
 		}
 		
 		function loadXMLDoc(url)
 		{
 			var xmlhttp;
 			
 			if(window.XMLHttpRequest)
			{
				xmlhttp=new XMLHttpRequest();
			}
			else
			{
				xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			
			xmlhttp.onreadystatechange=function()
			{
				if (xmlhttp.readyState==4 && xmlhttp.status==200)
				{
					xmlDoc=xmlhttp.responseXML;
					x = xmlDoc.getElementsByTagName("context");
				
				//alert( x[0].childNodes[0].nodeValue);
	
						str = x[0].childNodes[0].nodeValue;
						
						str = str.replace(/&lt;/g, "<");
						str = str.replace(/&gt;/g, ">");
						str = str.replace(/&amp;/g, "&");
						
					var title = xmlDoc.getElementsByTagName("title")[0].childNodes[0].nodeValue;
					var author = xmlDoc.getElementsByTagName("author")[0].childNodes[0].nodeValue;
					var date = xmlDoc.getElementsByTagName("date")[0].childNodes[0].nodeValue;
				
					var str2 = '<h2>'+title+'</h2><span>作者：'+author+'</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>时间:'+date+'</span>';
				
					document.getElementById('context-body-up').innerHTML = str2;		
					document.getElementById('context-body-down').innerHTML = str;
			
				
				
					opendiv('context', 'boke_xpf_total_bg');
				}
			}
			
			xmlhttp.open("GET",url,true);
			xmlhttp.send();
 		}
		
    </script>

  </head>
  
  <body>
  
  		<div id="boke_xpf_total_bg" style="display:none" ></div>
    	<div id="boke_xpf_total">
    		
    		<div>
    			<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
    				<thead>
    					<tr>
    						<th>文章名称</th>
    						<th>文章类别</th>
    						<th>文章作者</th>
    						<th>文章审核状态</th>
    						<th>文章日期</th>
    						<th>操作</th>
    					</tr>
    				</thead>
    				<tbody>
    					<% 
    						while(rs.next())
    						{
    					%>
    					<tr>
    						<td><%=rs.getString("article_writer_name") %></td>
    						<td><%=rs.getString("article_writer_kind") %></td>
    						<td><%=rs.getString("article_writer_writer") %></td>
    						<td><%=rs.getString("article_writer_check_state") %></td>
    						<td><%=rs.getString("article_writer_time") %></td>
    						<td><a href="javascript:void(0)" id="<%=rs.getString("article_writer_number") %>" onclick="getData(this.id)" >查看</a></td>
    					</tr>
    					<% 
    						}
    					%>
    				</tbody>
    			</table>
    		</div>
    		<br>
    		<br>
    		<br>
    		<a href="javascript:void(0)" onclick="opendiv('boke_xpf_article_add', 'boke_xpf_total_bg')" >添加文章</a>
    	</div>
<% 
}catch(Exception e)
	{
		e.printStackTrace();
	}finally
	{
		condb.toClose(rs, ps, conn);
	}
%>    	
    	
    	
    	<div id="context" style="display:none">
    		<div id="context-header">
    			<a href="javascript:void(0)" onclick="closediv('context', 'boke_xpf_total_bg')">close</a>
    		</div>
    		<div id="context-body">
    			
    			<div id="context-body-up" style="text-align:center; border-bottom:1px solid #cccccc; margin-bottom:5px;">
    				
    			</div>
    			
    			<div id="context-body-down">
    			
    			</div>
    			
    			
    		</div>
    	</div>
    	
    	
    	
    	<div id="boke_xpf_article_add" style="display:none">
    		<div id="boke_xpf_article_add-header">
    		
    		</div>
    		<div id="boke_xpf_article_add-body">
    		<form method="post" action="AddWriterArticle">
    			<table>
    				<tr>
    					<td>文章名称</td>
    					<td><input name="boke_xpf_article_writer_name" /></td>
    				</tr>
    				<tr>
    					<td>文章类别</td>
    					<td>
    						<select name="boke_xpf_article_writer_kind">
    							<option>原创</option>
    							<option>翻译</option>
    						</select>
    					</td>
    				</tr>
    				<tr>
    					<td>作者</td>
    					<td><input name="boke_xpf_article_writer_writer" /></td>
    				</tr>
    				<tr>
    					<td>文章摘要</td>
    					<td>
    						<div >
    							<textarea style="width:600px; height:200px;"  name="boke_xpf_article_writer_abstract"> 摘要 </textarea>
    							<br>
    						</div>  						
    					</td>
    				</tr>
    				<tr>
    					<td></td>
    					<td><textarea id="boke_xpf_editor2" name="boke_xpf_article_writer_context"> 正文 </textarea></td>
    				</tr>
    				<tr>
    					<td></td>
    					<td><input type="submit" value="提交" /> <input type="button" value="关闭" onclick="closediv('boke_xpf_article_add', 'boke_xpf_total_bg')" /></td>
    				</tr>
    			</table>
    		</form>
    		</div>
    	</div>
  </body>
  
  <script type="text/javascript">
    //实例化编辑器
     var editor2 = new UE.ui.Editor({initialFrameWidth:900,initialFrameHeight:500,autoHeightEnabled:false});
     editor2.render('boke_xpf_editor2');
      
      SyntaxHighlighter.all();
   //  var editor = new UE.ui.Editor({initialFrameWidth:700,initialFrameHeight:300,autoHeightEnabled:false});
    // editor.render('boke_xpf_editor1');
</script>
  
</html>
