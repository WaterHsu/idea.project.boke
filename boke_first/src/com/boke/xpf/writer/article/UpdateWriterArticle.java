package com.boke.xpf.writer.article;

import java.sql.*;
import com.boke.xpf.database.*;

public class UpdateWriterArticle 
{
	private ConDB condb = new ConDB();
	
	public void Update(int key, WriterArticle wa)
	{
		switch(key)
		{
		case 1:
			String sql = "insert into writer_articles(article_writer_number, article_writer_name, article_writer_kind, article_writer_writer, article_writer_imagesmall, article_writer_abstract, article_writer_time, article_writer_check_state, article_writer_context) values(?,?,?,?,?,?,?,?,?)";
			AddWriterArticle(sql, wa);
			break;
		}
	}
	
	public void AddWriterArticle(String sql, WriterArticle wa)
	{
		Connection conn = null;
		PreparedStatement ps = null;
		
		try
		{
			conn = condb.getCon();
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, wa.getArticle_writer_number());
			ps.setString(2, wa.getArticle_writer_name());
			ps.setString(3, wa.getArticle_writer_kind());
			ps.setString(4, wa.getArticle_writer_writer());
			ps.setString(5, wa.getArticle_writer_imagesmall());
			ps.setString(6, wa.getArticle_writer_abstract());
			ps.setString(7, wa.getArticle_writer_time());
			ps.setString(8, wa.getArticle_writer_check_state());
			ps.setString(9, wa.getArticle_writer_context());
			
			ps.execute();
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}finally
		{
			condb.toClose(null, ps, conn);
		}
	}
}
