package com.rnh.showmethecard.webscraping;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class HtmlParser {
	

	private String url;
	private String title;
	private String desc;
	private String img;
	
	private Document urlDoc;
	private Document domainDoc;

	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = getProtocolAddedUrl(decodeStr(url));
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
	
	
	
	public HtmlParser(String url) {
//		try {
//			urlDoc = Jsoup.connect(getUrl()).get();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		setUrl(url);
		setTitle(getChoosedData(ParseKeyword.TITLE));
		setDesc(getChoosedData(ParseKeyword.DESCRIPTION));
		setImg(getChoosedData(ParseKeyword.IMAGE));
	}
	
	
	
	private String decodeStr(String str) {
		try {
//			if (Pattern.matches("^%[(\w\w){2}]", str))
			
			
			
			if (str.contains("%")) {			
				String seeAddr = str.substring(str.indexOf("%"), str.indexOf("%") + 5);
				
				if (urlDoc != null) { // doc ?öç?ìù ?õÑ?óî
					Elements wilds = urlDoc.select("meta");
					for (Element e : wilds) {
						String lowerCaseStr = e.toString().toLowerCase();
						if (lowerCaseStr.replaceAll(" ","").contains("charset=utf-8") || e.attr("charset").toLowerCase().equals("utf-8")) {
							str = URLDecoder.decode(str, "utf-8");
						}
					}
				} else if (str.toLowerCase().contains("ie=utf-8") || str.toLowerCase().contains("ie=utf8") ||
						(seeAddr.substring(0, 1).equals("%") &&
								seeAddr.substring(seeAddr.length() - 2).contains("%"))) {
					
					
					 // if (encoded) seeAddr.equals("%?òÅ?àò%");
//			
//			Elements nativeData = urlDoc.select("meta");
//			
//			for (Element e : nativeData) {
//				if (e.toString().toLowerCase().contains("charset=utf-8") ||
//						e.attr("charset").toLowerCase().contains("utf-8")) {
					str = URLDecoder.decode(str, "utf-8");
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
				
		
		return str;
	}
	
	
	
	/**
	 * @param str : ?õêÎ≥? Î¨∏Ïûê?ó¥
	 * @param length : Î≥¥Ïó¨Ï§? Í∏??ûê ?àò
	 * @return ?ûêÎ•? Î¨∏Ïûê?ó¥ + " ...."
	 */
	private String subStrLength(String str, int length) {
		if (str.length() > length) {
			str = str.substring(0, length)+ " ....";
		}
		return str;
	}
	
	
	/*
	private String getImgUrl(String imgSrc) {
		if (!imgSrc.contains("http")) {
			imgSrc = getUrlDomain(getUrl()) + imgSrc;
		}
		return imgSrc;
	}
	*/
	
	
	private String getProtocolAddedUrl(String url) {
		StringBuilder protocolAddedUrl = new StringBuilder(100);
		if (!url.contains("//")) {
			protocolAddedUrl.append("http://");
		}		
		return protocolAddedUrl.append(url).toString();
	}
	
	
	
	private String getUrlDomain(String protocolAddedUrl) {
		StringBuilder domain = new StringBuilder(100);
		String protocol = null;
		String urlAddr = null;
		
		String[] splitUrl = protocolAddedUrl.split("://");
		protocol = splitUrl[0];
		urlAddr = splitUrl[1];
		
		
		domain.append(protocol).append("://"); //domain == "http(s)://"		
		if (urlAddr.contains("/")) { /*Ï£ºÏÜåÍ∞? '/'Î•? ?è¨?ï®?ïòÍ≥? ?ûà?äî Í≤ΩÏö∞*/
			domain.append(urlAddr.substring(0, urlAddr.indexOf("/"))); //domain == "http(s)://domainÏ£ºÏÜå"
		} else {
			domain.append(urlAddr);
		}
		
		
		return domain.toString();
	}
	
	
	
	private String seekData(Document doc, String parseKeyword) {
		
		
		String data = null;
		switch (parseKeyword) {
		
			case ParseKeyword.TITLE :
				
				Elements ogTitle = doc.select("head meta[property=og:title]");
				Elements headTitle = doc.select("title");
				
				String parsedTitle = null;
				if (ogTitle.size() != 0) {
					parsedTitle = ogTitle.attr("content");
				} else {
					parsedTitle = headTitle.text();
				}
				data = subStrLength(decodeStr(parsedTitle), 20);
				break;
				
				
			case ParseKeyword.DESCRIPTION :
				
				Elements ogDesc = doc.select("head meta[property=og:description]");
				Elements headDesc = doc.select("head meta[name=description]");
				
				String parsedDesc = null;
				if (ogDesc.size() != 0) {
					parsedDesc = ogDesc.attr("content");
				} else {
					parsedDesc = headDesc.attr("content");
				}
				data = subStrLength(decodeStr(parsedDesc), 45);
				break;
				
				
			case ParseKeyword.IMAGE :
				
				Elements ogImg = doc.select("head meta[property=og:image]"); //1. og:tag
				Elements imgSrc = doc.select("img[src]"); //2. logo > 4. 1st image
				Elements linkRel = doc.select("link[rel]"); //3-1. favicon > 3-2. icon
				
				
				
				//link[rel]?ù¥ ?ûà?ùÑ ?ïå link[icon]?ù¥ Ï°¥Ïû¨?ïò?äîÏß? Ï∞æÎäî?ã§
				String ogImgStr = null;
				String logoImgStr = null;
				String iconImgStr = null;
				String anyImgStr = null;
				
				if (ogImg.size() != 0) {
					for (Element e : ogImg) {
						if (e.hasAttr("content")) { //2-1 logo
							ogImgStr = e.attr("content");
							break;
						}
					}
				}
				if (imgSrc.size() != 0) {
					for (Element e : imgSrc) {
						if (e.attr("src").contains("logo")) { //2-1 logo
							logoImgStr = e.attr("src");
							break;
						}
					}
				}
				if (linkRel.size() != 0) {
					for (Element e : linkRel) {
						if (e.toString().contains("favicon")) { //2-1 favicon
							iconImgStr = e.attr("href");
							break;
						} else if (e.toString().contains("icon")) { //2-2 icon
							iconImgStr = e.attr("href");
							break;
						}
					}
				}
				if (iconImgStr == null && imgSrc.size() != 0) {
					for (Element e : imgSrc) {
						if (e.attr("src").contains(".png")) { //2-1 1st picture.png
							anyImgStr = e.attr("src");
							break;
						} else if (e.attr("src").contains(".svc")) { //2-2 1st picture.svc
							anyImgStr = e.attr("src");
							break;
						} else if (e.attr("src").contains(".jpg")) { //2-3 1st picture.jpg
							anyImgStr = e.attr("src");
							break;
						} else { //2-4 1st picture.*
							anyImgStr = e.attr("src");
							break;
						}
					}
				}

				
				//?ù¥ÎØ∏Ï? Ï£ºÏÜå Ï∞æÍ∏∞
				String parsedImg = null;
				if (ogImgStr != null) {
					parsedImg = ogImgStr;
				} else if (logoImgStr != null) {
					parsedImg = logoImgStr;
				} else if (iconImgStr != null){
					parsedImg = iconImgStr;
				} else if (anyImgStr != null){
					parsedImg = anyImgStr;
				}
				
				
				//Ï£ºÏÜåÍ∞? domain ?óÜ?ù¥ Í≤ΩÎ°ú?Çò ?ÉÅ??Í≤ΩÎ°úÎß? ?ì∞?ó¨ ?ûà?äî Í≤ΩÏö∞
				if (parsedImg != null) {
					StringBuilder imgUrl = new StringBuilder(100);
					String domain = getUrlDomain(getUrl());
					
					if (parsedImg.contains("://")) { // http://jquery.com/query-wp-content/themes/jquery.com/i/favicon.ico
						imgUrl.append(parsedImg);
					} else if (parsedImg.substring(0, 2).equals("//")) { // //jquery.com/jquery-wp-content/themes/jquery.com/i/favicon.ico
						String protocol = domain.split("://")[0];
						imgUrl.append(protocol).append(":").append(parsedImg);
					} else if (parsedImg.substring(0, 1).equals("/")) { // /jquery-wp-content/themes/jquery.com/i/favicon.ico
						imgUrl.append(domain).append(parsedImg);
					} else if (parsedImg.contains("../")) {
						String parsedAddr = parsedImg.substring("../".length(), parsedImg.length());
						imgUrl.append(domain).append("/").append(parsedAddr);
					} else if (parsedImg.contains("./")) {
						String parsedAddr = parsedImg.substring("./".length(), parsedImg.length());
						imgUrl.append(domain).append("/").append(parsedAddr);
					} else if (!parsedImg.contains("/")) { // /favicon.ico
						imgUrl.append(domain).append("/").append(parsedImg);
					}
					
					parsedImg = imgUrl.toString();
				}
				data = parsedImg;

				
		}
		
		return data;
	}
	
	
	
	private String getChoosedData(String parseKeyword) {

		String choosedData = null;
		if (urlDoc == null) { //urlDocÍ∞? ?óÜ?ã§Î©?
			try {
				urlDoc = Jsoup.connect(getUrl()).get();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		String parsedData = seekData(urlDoc, parseKeyword);
		if (parsedData != null) {
			choosedData = parsedData;
		} else {
			if (domainDoc == null) { //domainDocÍ∞? ?óÜ?ã§Î©?
				try {
					domainDoc = Jsoup.connect(getUrlDomain(getUrl())).get();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			choosedData = seekData(domainDoc, parseKeyword);
		}
		
		return choosedData;
	}
	
	
}
