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
		
		int id=1;
		if(request.getParameter("id") != null)
		{
			id = Integer.parseInt(request.getParameter("id").toString());
		}
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select * from writer_articles where id > "+id+" order by id";
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
			while(rs.next()&&key < 3)
			{
				/*temp = rs.getString("article_writer_abstract");
				temp = temp.replaceAll("<", "&lt;");
				temp = temp.replaceAll(">", "&gt;");
				temp = temp.replaceAll("&", "&amp;");*/
				out.print("<key>" +key+ "</key>");
				out.print("<id>" +rs.getInt("id")+ "</id>");
				out.print("<number>" +rs.getString("article_writer_number")+ "</number>");
				out.print("<name>" +rs.getString("article_writer_name")+ "</name>");
				out.print("<kind>" +rs.getString("article_writer_kind")+ "</kind>");
				out.print("<writer>" +rs.getString("article_writer_writer")+ "</writer>");
				out.print("<image>" +rs.getString("article_writer_imagesmall")+ "</image>");
				out.print("<abstract>" +rs.getString("article_writer_abstract")+ "</abstract>");
				out.print("<date>" +rs.getString("article_writer_time")+ "</date>");
				
				key ++;
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







