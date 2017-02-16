package com.rnh.showmethecard.card.classes;

import java.net.HttpURLConnection;
import java.net.URL;

public class CheckUrlStatus {
	private String url;
	private int status;
	public CheckUrlStatus(String url){
		try
        {

			URL checkUrl = new URL(url);
            HttpURLConnection connection = (HttpURLConnection)checkUrl.openConnection();
            connection.setRequestMethod("GET");
            connection.connect();

            int code = connection.getResponseCode();  
            System.out.println("code: "+code);
            status = code;
        }
        catch(Exception e)
        {
        	System.out.println(e);
        }
		this.url = url;
	}
}
