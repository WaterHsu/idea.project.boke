package com.boke.xpf.writer.article;

public class WriterArticle 
{
	private String article_writer_number;
	private String article_writer_name;
	private String article_writer_kind;
	private String article_writer_writer;
	private String article_writer_imagesmall;
	private String article_writer_abstract;
	private String article_writer_time;
	private String article_writer_check_state;
	private String article_writer_context;
	
	public WriterArticle(String article_writer_number, String article_writer_name, String article_writer_kind, String article_writer_writer,String article_writer_imagesmall, String article_writer_abstract, String article_writer_time, String article_writer_check_state, String article_writer_context)
	{
		this.article_writer_number = article_writer_number;
		this.article_writer_name = article_writer_name;
		this.article_writer_kind = article_writer_kind;
		this.article_writer_writer = article_writer_writer;
		this.article_writer_imagesmall = article_writer_imagesmall;
		this.article_writer_abstract = article_writer_abstract;
		this.article_writer_time = article_writer_time;
		this.article_writer_check_state = article_writer_check_state;
		this.article_writer_context = article_writer_context;
	}
	
	public WriterArticle()
	{
		
	}

	public String getArticle_writer_number() {
		return article_writer_number;
	}

	public void setArticle_writer_number(String article_writer_number) {
		this.article_writer_number = article_writer_number;
	}

	public String getArticle_writer_name() {
		return article_writer_name;
	}

	public void setArticle_writer_name(String article_writer_name) {
		this.article_writer_name = article_writer_name;
	}

	public String getArticle_writer_kind() {
		return article_writer_kind;
	}

	public void setArticle_writer_kind(String article_writer_kind) {
		this.article_writer_kind = article_writer_kind;
	}

	public String getArticle_writer_writer() {
		return article_writer_writer;
	}

	public void setArticle_writer_writer(String article_writer_writer) {
		this.article_writer_writer = article_writer_writer;
	}

	public String getArticle_writer_abstract() {
		return article_writer_abstract;
	}

	public void setArticle_writer_abstract(String article_writer_abstract) {
		this.article_writer_abstract = article_writer_abstract;
	}

	public String getArticle_writer_time() {
		return article_writer_time;
	}

	public void setArticle_writer_time(String article_writer_time) {
		this.article_writer_time = article_writer_time;
	}

	public String getArticle_writer_check_state() {
		return article_writer_check_state;
	}

	public void setArticle_writer_check_state(String article_writer_check_state) {
		this.article_writer_check_state = article_writer_check_state;
	}

	public String getArticle_writer_context() {
		return article_writer_context;
	}

	public void setArticle_writer_context(String article_writer_context) {
		this.article_writer_context = article_writer_context;
	}

	public String getArticle_writer_imagesmall() {
		return article_writer_imagesmall;
	}

	public void setArticle_writer_imagesmall(String article_writer_imagesmall) {
		this.article_writer_imagesmall = article_writer_imagesmall;
	}

}
