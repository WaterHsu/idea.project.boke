package com.boke.xpf.writer.article;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

import com.boke.xpf.other.*;


public class AddWriterArticle extends HttpServlet
{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException
	{
		String article_writer_name = request.getParameter("boke_xpf_article_writer_name").toString();
		article_writer_name = new String(article_writer_name.getBytes("iso-8859-1"), "utf-8");
		
		String article_writer_kind = request.getParameter("boke_xpf_article_writer_kind").toString();
		article_writer_kind = new String(article_writer_kind.getBytes("iso-8859-1"), "utf-8");
		
		String article_writer_writer = request.getParameter("boke_xpf_article_writer_writer").toString();
		article_writer_writer = new String(article_writer_writer.getBytes("iso-8859-1"), "utf-8");
		
		String article_writer_abstract = request.getParameter("boke_xpf_article_writer_abstract").toString();
		article_writer_abstract = new String(article_writer_abstract.getBytes("iso-8859-1"), "utf-8");
		
		String article_writer_context = request.getParameter("boke_xpf_article_writer_context").toString();
		article_writer_context = new String(article_writer_context.getBytes("iso-8859-1"), "utf-8");
		
		Getnumber getnum = new Getnumber();
		
		String article_writer_number = getnum.getNumber();
		String article_writer_time = getnum.getTime();
		
		GetImagesmall getimagesmall = new GetImagesmall();
		String article_writer_imagesmall = getimagesmall.getImage(article_writer_context);
		
		WriterArticle wa = new WriterArticle(article_writer_number, article_writer_name, article_writer_kind, article_writer_writer,article_writer_imagesmall, article_writer_abstract, article_writer_time, "等待审核", article_writer_context);
	
	//	UpdateWriterArticle updatewa = new UpdateWriterArticle();
		//updatewa.update(1, wa);
		
		UpdateWriterArticle updatewa = new UpdateWriterArticle();
		updatewa.Update(1, wa);
		
		
		response.sendRedirect("writer_manage/writermanage.jsp");
	}
}
