package com.rnh.showmethecard.card.classes;

import java.net.HttpURLConnection;
import java.net.URL;

public class CheckUrlStatus {
	private String url;
	private boolean urlOk;
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public boolean isUrlOk() {
		return urlOk;
	}

	public void setUrlOk(boolean urlOk) {
		this.urlOk = urlOk;
	}

	public CheckUrlStatus(String url){
		try
        {

			URL checkUrl = new URL(url);
            HttpURLConnection connection = (HttpURLConnection)checkUrl.openConnection();
            connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11");
            connection.setRequestMethod("GET");
            connection.connect();

            int code = connection.getResponseCode();  
            System.out.println("code: "+code);
            if(code >= 200 && code < 400){ // 2xx: succeeded, 3xx: redirection done 
            	urlOk = true;
            }else{
            	urlOk = false;
            }
        }
        catch(Exception e)
        {
        	System.out.println("CheckUrlStatus 클래스 에러코드:"+e);
        }
		this.url = url;
	}
}
