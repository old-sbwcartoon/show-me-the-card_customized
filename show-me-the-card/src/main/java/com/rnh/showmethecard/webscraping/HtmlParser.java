package com.rnh.showmethecard.webscraping;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.rnh.showmethecard.card.classes.CheckUrlStatus;
import com.rnh.showmethecard.common.Literal;

public class HtmlParser {
	

	private String url;
	private String title;
	private String desc;
	private String img;
	private boolean urlOk;
	private String from;

	private Document urlDoc;
	private Document domainDoc;

	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		switch (getFrom()) {
			case Literal.ParseHtml.From.WEB : 
				this.url = getProtocolAddedUrl(decodeStr(url));
				break;
				
			case Literal.ParseHtml.From.DB  :
				this.url = url;
				setUrlOk(true);
				break;
		}		
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
	public boolean isUrlOk() {
		return urlOk;
	}
	public void setUrlOk(boolean urlOk) {
		this.urlOk = urlOk;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}

	
	
	public HtmlParser(String url, String from) {
//		try {
//			urlDoc = Jsoup.connect(getUrl()).get();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		setFrom(from);
		setUrl(url);
		
		if (isUrlOk()) {
			setTitle(getChoosedData(Literal.ParseHtml.Keyword.TITLE));
			setDesc(getChoosedData(Literal.ParseHtml.Keyword.DESCRIPTION));
			setImg(getChoosedData(Literal.ParseHtml.Keyword.IMAGE));
		} else {
			setUrl(null);
		}
	}
	
	private String decodeStr(String str) {
		try {
//			if (Pattern.matches("^%[(\w\w){2}]", str))
			
			
			
			if (str.contains("%")) {
				String seeAddr = str.substring(str.indexOf("%"), str.indexOf("%") + 5);
				
				if (urlDoc != null) { // doc ?��?�� ?��?��
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
					
					
					 // if (encoded) seeAddr.equals("%?��?��%");
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
	 * @param str : ?���? 문자?��
	 * @param length : 보여�? �??�� ?��
	 * @return ?���? 문자?�� + " ...."
	 */
	private String subStrLength(String str, int length) {
		if (length == 0) {
			//do nothing;
		} else if (str.length() > length) {
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
		
		if (checkUrlOk(url)) {
			setUrlOk(true);
			return url;
		} else {
			String newUrl = null;
			if (!url.contains("://")) { //http 없으면 붙이고
				newUrl = protocolAddedUrl.append("http://").toString() + url;
				if (checkUrlOk(newUrl)) {
					setUrlOk(true);
					return newUrl;
				}
			}
			if (!url.contains("www.")) { //접속 오류나면 www. 붙이고
				newUrl = protocolAddedUrl.append("www.").toString() + url;				
				if (checkUrlOk(newUrl)) {
					setUrlOk(true);
					return newUrl;
				}
			}
		}		
		setUrlOk(false);
		return null; // 모두 오류나면 url=null
	}
	
	
	private boolean checkUrlOk(String url) {
		CheckUrlStatus checkUrlStatus = new CheckUrlStatus(url);
		return checkUrlStatus.isUrlOk();
	}
	
	private String getUrlDomain(String protocolAddedUrl) {
		StringBuilder domain = new StringBuilder(100);
		String protocol = null;
		String urlAddr = null;
		
		String[] splitUrl = protocolAddedUrl.split("://");
		protocol = splitUrl[0];
		urlAddr = splitUrl[1];
		
		
		domain.append(protocol).append("://"); //domain == "http(s)://"		
		if (urlAddr.contains("/")) { /*주소�? '/'�? ?��?��?���? ?��?�� 경우*/
			domain.append(urlAddr.substring(0, urlAddr.indexOf("/"))); //domain == "http(s)://domain주소"
		} else {
			domain.append(urlAddr);
		}
		
		
		return domain.toString();
	}
	
	
	
	private String seekData(Document doc, String parseKeyword) {
		
		
		String data = null;
		switch (parseKeyword) {
		
			case Literal.ParseHtml.Keyword.TITLE :
				
				Elements ogTitle = doc.select("head meta[property=og:title]");
				Elements headTitle = doc.select("title");
				
				String parsedTitle = null;
				if (ogTitle.size() != 0) {
					parsedTitle = ogTitle.attr("content");
				} else {
					parsedTitle = headTitle.text();
				}
				data = subStrLength(decodeStr(parsedTitle), 0); // 300 글자로 제한
				break;
				
				
			case Literal.ParseHtml.Keyword.DESCRIPTION :
				
				Elements ogDesc = doc.select("head meta[property=og:description]");
				Elements headDesc = doc.select("head meta[name=description]");
				
				String parsedDesc = null;
				if (ogDesc.size() != 0) {
					parsedDesc = ogDesc.attr("content");
				} else {
					parsedDesc = headDesc.attr("content");
				}
				data = subStrLength(decodeStr(parsedDesc), 0); // 300 글자로 제한
				break;
				
				
			case Literal.ParseHtml.Keyword.IMAGE :
				
				
//				//link[rel]?�� ?��?�� ?�� link[icon]?�� 존재?��?���? 찾는?��
//				String ogImgStr = null;
//				String logoImgStr = null;
//				String iconImgStr = null;
//				String anyImgStr = null;
				
				Elements ogImg = doc.select("head meta[property=og:image]");
				if (ogImg.size() != 0) { //1. og:tag
					for (Element e : ogImg) {
						if (e.hasAttr("content")) { //2-1 logo
							return getChoosedImg(e.attr("content"));
						}
					}
				}
				
				Elements imgSrc = doc.select("img[src]");
				if (imgSrc.size() != 0) { //2. logo > 4. 1st image
					for (Element e : imgSrc) {
						if (e.attr("src").contains("logo")) { //2-1 logo
							return getChoosedImg(e.attr("src"));
						}
					}
				}
				
				Elements linkRel = doc.select("link[rel]");
				if (linkRel.size() != 0) { //3-1. favicon > 3-2. icon
					for (Element e : linkRel) {
						if (e.toString().contains("favicon")) { //2-1 favicon
							return getChoosedImg(e.attr("href"));
						} else if (e.toString().contains("icon")) { //2-2 icon
							return getChoosedImg(e.attr("href"));
						}
					}
				}
				
				if (linkRel.toString() == null && imgSrc.size() != 0) {
					String firstImgStr = null;
					for (Element e : imgSrc) {
						if (e.attr("src").contains(".png")) { //2-1 1st picture.png
							firstImgStr = e.attr("src");
							break;
						} else if (e.attr("src").contains(".svc")) { //2-2 1st picture.svc
							firstImgStr = e.attr("src");
							break;
						} else if (e.attr("src").contains(".jpg")) { //2-3 1st picture.jpg
							firstImgStr = e.attr("src");
							break;
						} else { //2-4 1st picture.*
							firstImgStr = e.attr("src");
							break;
						}
					}
					return getChoosedImg(firstImgStr);
				}

				

				
		}
		
		return data;
		
		
	}
	
	
	
	private String getChoosedData(String parseKeyword) {

		long start = System.currentTimeMillis();
		
		String choosedData = null;
		if (urlDoc == null) { //urlDoc가 만들어지지 않았다면
			try {
				urlDoc = Jsoup.connect(getUrl()).timeout(5000).get(); //5초까지만 탐색
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		String parsedData = seekData(urlDoc, parseKeyword);
		if (parsedData != null) { //해당 url에서 data를 찾았다면
			choosedData = parsedData;
		} else {
			if (domainDoc == null) { //domainDoc가 만들어지지 않았다면
				try {
					domainDoc = Jsoup.connect(getUrlDomain(getUrl())).timeout(5000).get(); //5초까지만 탐색
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			choosedData = seekData(domainDoc, parseKeyword); //domainDoc에서 찾기
		}
		
		long end = System.currentTimeMillis();
		System.out.println(String.format("LAP TIME %d", end - start));
		
		return choosedData;
	}

	
	private String getChoosedImg(String imgStr) {
		String choosedImgUrl = null;
		
		
		switch (getFrom()) {
		
		
			case Literal.ParseHtml.From.WEB :
				if (imgStr != null) {
					StringBuilder imgUrl = new StringBuilder(100);
					String domain = getUrlDomain(getUrl());
					
					if (imgStr.contains("://")) { // http://jquery.com/query-wp-content/themes/jquery.com/i/favicon.ico
						imgUrl.append(imgStr);
					} else if (imgStr.substring(0, 2).equals("//")) { // //jquery.com/jquery-wp-content/themes/jquery.com/i/favicon.ico
						String protocol = domain.split("://")[0];
						imgUrl.append(protocol).append(":").append(imgStr);
					} else if (imgStr.substring(0, 1).equals("/")) { // /jquery-wp-content/themes/jquery.com/i/favicon.ico
						imgUrl.append(domain).append(imgStr);
					} else if (imgStr.contains("../")) {
						String parsedAddr = imgStr.substring("../".length(), imgStr.length());
						imgUrl.append(domain).append("/").append(parsedAddr);
					} else if (imgStr.contains("./")) {
						String parsedAddr = imgStr.substring("./".length(), imgStr.length());
						imgUrl.append(domain).append("/").append(parsedAddr);
					} else if (!imgStr.contains("/")) { // /favicon.ico
						imgUrl.append(domain).append("/").append(imgStr);
					}
					
					choosedImgUrl = imgUrl.toString();
				}				
				break;
				
				
			case Literal.ParseHtml.From.DB  :
				choosedImgUrl = imgStr;
				break;
		}
		
		
		
		return choosedImgUrl;
	}
}


