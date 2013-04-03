<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	
	<script type="text/javascript" src="ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
    <link rel="stylesheet" type="text/css" href="ueditor/third-party/SyntaxHighlighter/shCoreDefault.css"/>
	<link rel="stylesheet" href="css/pubu.css">
	
	<link rel="stylesheet" href="css/boke_xpf_css.css">
  </head>
  
  <body onload="firstload()" id="xxx">
  
  		<div id="warpbg" style="display:none"></div>  	
    	<div id="warp" class="warp">
    		
    		<div class="full" id="row1"></div>
    		
    	</div>
    	
    	<div id="context" style="display:none">
    		<div id="context-header">
    			<a href="javascript:void(0)" onclick="closediv('context', 'warpbg','xxx')">close</a>
    		</div>
    		<div id="context-body">
    			
    			<div id="context-body-up" style="text-align:center; border-bottom:1px solid #cccccc; margin-bottom:5px;">
    				
    			</div>
    			
    			<div id="context-body-down">
    			
    			</div>
    			
    			<script type="text/javascript">      
                       SyntaxHighlighter.highlight();
                       SyntaxHighlighter.all(); 
                        //调整左右对齐
                       for(var i=0,di;di=SyntaxHighlighter.highlightContainers[i++];){
                            var tds = di.getElementsByTagName('td');
                            for(var j=0,li,ri;li=tds[0].childNodes[j];j++){
                            ri = tds[1].firstChild.childNodes[j];
                            ri.style.height = li.style.height = ri.offsetHeight + 'px';
                            }
                       }      
			   </script>
    			
    		</div>
    	</div>
    	
  </body>
  
  <script type="text/javascript" src="js/pubu.js"></script>
  
</html>
