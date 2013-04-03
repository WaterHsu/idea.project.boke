package com.boke.xpf.other;

public class GetImagesmall 
{	
	private String imageroute = null;
	
	public String getImage(String image)
	{
		this.imageroute = getImage2(image);
		
		return this.imageroute;
	}
	
	public String getImage1(String image)
	{
		String temp = null;
		
		for(int i = 0; i < image.length(); i++)
		{
			if(image.charAt(i) == '<')
			{
				if(image.substring(i + 1, i + 4).equals("img"))
				{
					System.out.println(image.substring(i + 1, i + 4));
					temp = image.substring(i, image.indexOf('>', i) + 1);
					break;
				}
			}
		}
		
		
		
		//System.out.println(image);
		return temp;
	}
	
	public String getImage2(String image)
	{
		String temp = null;
		
		temp = image.substring(image.indexOf("<img"), image.indexOf("/>", image.indexOf("<img")) + 2);
		
		System.out.println(temp);
		temp = temp.substring(temp.indexOf("src=") + 5, temp.indexOf(' ', temp.indexOf("src=")) -1);
	
		return temp;
	}
	
	public static void main(String args[])
	{
		GetImagesmall test = new GetImagesmall();
		String temp = "<p><img src='/boke_first/ueditor.jpg' width='300' /><img src='/boke_first/ueditor/jsp/upload/djdadfjo.jpg' width='200' /></p>";
		
		System.out.println(test.getImage2(temp));  
	}
}
