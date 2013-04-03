<%@ page contentType="text/xml" import="java.util.*" pageEncoding="utf-8"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%@page import="java.sql.*" %>


<% 
		Class.forName("com.mysql.jdbc.Driver"); 
		
		String dbUrl = "jdbc:mysql://127.0.0.1:3309/boke";
		String dbUsr = "root";
		String dbPwd = "475356336";
		
	
		String number = request.getParameter("id").toString();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from writer_articles where article_writer_number = '"+number+"'";
		int key = 0;;
		
		try
		{
			Connection con=DriverManager.getConnection(dbUrl,dbUsr,dbPwd);
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery(sql);
			
			String temp = null;
			
			out.clear();
			out.print("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			out.print("<article>");
			while(rs.next())
			{
				temp = rs.getString("article_writer_context");
				temp = temp.replaceAll("<", "&lt;");
				temp = temp.replaceAll(">", "&gt;");
				temp = temp.replaceAll("&", "&amp;");

				out.print("<context>" +temp+ "</context>");
				out.print("<title>" +rs.getString("article_writer_name")+ "</title>");
				out.print("<author>" +rs.getString("article_writer_writer")+ "</author>");
				out.print("<date>" +rs.getString("article_writer_time")+ "</date>");
			
			}
			
			out.print("</article>");
			
			con.close();
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			rs.close();
			ps.close();
			//con.close();
		}
%>







