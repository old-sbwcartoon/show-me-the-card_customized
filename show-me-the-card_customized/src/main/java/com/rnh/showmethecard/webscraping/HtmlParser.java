package com.rnh.showmethecard.webscraping;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.rnh.showmethecard.card.classes.CheckUrlStatus;
import com.rnh.showmethecard.common.Literal;

import edu.stanford.nlp.simple.Sentence;

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
				this.url = getProtocolAddedUrl(url);
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
		
		setFrom(from);
		setUrl(url);
		if (isUrlOk()) {
			setTitle(getChoosedData(Literal.ParseHtml.Keyword.TITLE));
			setDesc(getChoosedData(Literal.ParseHtml.Keyword.DESCRIPTION));
			setImg(getChoosedData(Literal.ParseHtml.Keyword.IMAGE));
			this.url = decodeStr(getUrl());
		} else {
			setUrl(null);
		}
	}
	
	private String decodeStr(String str) {
		if (str != null) {
			try {
//				if (Pattern.matches("^%[(\w\w){2}]", str))
				if (str.contains("%")) {
					String seeAddr = str.substring(str.indexOf("%"), str.indexOf("%") + 5);
					
					if (urlDoc != null) { // doc 초기화했다면
						Elements wilds = urlDoc.select("meta");
						for (Element e : wilds) {
							String lowerCaseStr = e.toString().toLowerCase();
							if (lowerCaseStr.replaceAll(" ","").contains("charset=utf-8") || e.attr("charset").toLowerCase().equals("utf-8")) {
								str = URLDecoder.decode(str, "utf-8");
								break;
							}
						}
					} else if (str.toLowerCase().contains("ie=utf-8") || str.toLowerCase().contains("ie=utf8") ||
							(seeAddr.substring(0, 1).equals("%") &&
									seeAddr.substring(seeAddr.length() - 2).contains("%"))) {
						str = URLDecoder.decode(str, "utf-8");
					}
				}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}				
		
		return str;
	}
	
	
	
	/**
	 * @param str : 원본 문자열
	 * @param length : 남길 글자 수
	 * @return 남은 문자열 + " ...."
	 */
	private String subStrLength(String str, int length) {
		if (length == 0) {
			//do nothing;
		} else if (str.length() > length) {
			str = str.substring(0, length)+ " ....";
		}
		return str;
	}
	
	
	private String getProtocolAddedUrl(String url) {
		
		if (url == "" || url == null) {
			//do nothing1
		} else {
			//url 가공
			String originalUrl = null;
			
			if (url.length() - 1 == url.lastIndexOf("/")) { // url의 마지막 글자가 "/" 라면은
				originalUrl = url.substring(0, url.lastIndexOf("/")); // 마지막 "/" 제거
			} else {
				originalUrl = url;
			}

			StringBuilder protocolAddedUrl = new StringBuilder(100);

			//url 연결 확인
			if (checkUrlOk(originalUrl)) {
				setUrlOk(true);
				return originalUrl;
			} else if (!originalUrl.contains("://")) { //http 없으면 붙이고 //다른 scheme 옵션에?
				
				String newUrl = protocolAddedUrl.append("http://").toString() + originalUrl;
				if (checkUrlOk(newUrl)) {
					setUrlOk(true);
					return newUrl;
				}
			}
//				if (!originalUrl.contains("www.")) { //접속 오류나면 www. 붙이고
//					newUrl = protocolAddedUrl.append("www.").toString() + originalUrl;
//					if (checkUrlOk(newUrl)) {
//						setUrlOk(true);
//						return newUrl;
//					}
//				}
//			}
				
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
		if (urlAddr.contains("/")) { /*주소가 프로토콜 제외하고 '/'를 포함하는 경우*/
			domain.append(urlAddr.substring(0, urlAddr.indexOf("/"))); //domain == "http(s)://domain주소"
		} else {
			domain.append(urlAddr);
		}
		
		
		return domain.toString();
	}
	
	
	
	private String seekData(Document doc, String parseKeyword) { //og: twitter: 
		
		String data = null;
		switch (parseKeyword) {
		
			case Literal.ParseHtml.Keyword.TITLE :
				
				ArrayList<String> keyTitleList = new ArrayList<>();						
				keyTitleList.add("head meta[property=og:title]");
				keyTitleList.add("head meta[name=twitter:title]");
				keyTitleList.add("title");
								
				String choosedTitle = setChoosedData(doc, keyTitleList);
				data = decodeStr(choosedTitle); // 0 글자로 제한
				break;
				
				
			case Literal.ParseHtml.Keyword.DESCRIPTION :
				
				ArrayList<String> keyDescList = new ArrayList<>();
				keyDescList.add("head meta[property=og:description]");
				keyDescList.add("head meta[name=description]");
				keyDescList.add("head meta[name=twitter:description]");

				String choosedDesc = setChoosedData(doc, keyDescList);
				if (choosedDesc == null && doc.hasText()) {
					
					int minWordNo = 2; //최소 글자 수
					int maxDescWordNo = 5; //최대 단어 수
					int maxDescSentenceNo = 3; //최대 문장 수
					
					//모든 word 추출
					List<Sentence> sentenceList = new ArrayList<>();
					ArrayList<Sentence> bestSentenceList = new ArrayList<>();
					ArrayList<String> wordList = new ArrayList<>();
					
					
//					List<kr.bydelta.koala.data.Sentence> krAnalyzedSentences = new kr.bydelta.koala.twt.Tagger().jTagParagraph(doc.text());
//					for (kr.bydelta.koala.data.Sentence stc : krAnalyzedSentences) {
//						System.out.println("###################################################################");
//						System.out.println(stc);
//					}
//					System.out.println("######################################################################################################################################");
					edu.stanford.nlp.simple.Document nlpDoc = new edu.stanford.nlp.simple.Document(doc.text());
					
					for (Sentence stc : nlpDoc.sentences()) {
						System.out.println("******************************************************************");
						System.out.println(stc);
						boolean flag = false;
						for (int i = 0; i < stc.length(); i++) { //sentence 1개 검사
							String word = stc.word(i);
							String tag = null;
							if (word.length() >= minWordNo) {
								if (word.matches(".*[a-zA-z]+.*")) {
									word = stc.lemma(i);
									tag = stc.posTag(i);
								} else if (word.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣]+.*")) {
									String wordServedTag = new kr.bydelta.koala.twt.Tagger().jTagParagraph(word).get(0).toString();
									tag = wordServedTag.substring(wordServedTag.lastIndexOf("/") + 1, wordServedTag.lastIndexOf("("));
									System.out.println("### : " + wordServedTag.substring(wordServedTag.lastIndexOf("/") + 1, wordServedTag.lastIndexOf("(")));
								}
								if (tag != null) {
									if (tag.contains(Literal.ParseHtml.Nlp.PosTag.NOUN) ||
											tag.contains(Literal.ParseHtml.Nlp.PosTag.FOREIGN_WORD) ||
											tag.contains(Literal.ParseHtml.Nlp.PosTag.VERB)) {
										
										wordList.add(word);
										
										if (!flag) {
											flag = true;
										}
									}
								}
							}
							
						}
						if (flag) {
							sentenceList.add(stc);
						}
					}
					System.out.println("wwwwww" + wordList);
					System.out.println("ssssss" + sentenceList);
					//wordList 순서 정렬 //같은 단어가 모이도록
					Collections.sort(wordList, new Comparator<String>() {

						@Override
						public int compare(String obj1, String obj2) {
							return obj1.compareToIgnoreCase(obj2);
						}
						
					});
					
					//순서를 키 값으로 보존
					HashMap<Integer, String> wordMap = new HashMap<>();
					for (int i = 0; i < wordList.size(); i++) {
						wordMap.put(i, wordList.get(i));
					}
					
					//word count 세기
					int wordMapSize = wordMap.size();
					int[] count = new int[wordMapSize];
					Arrays.fill(count, 1); //모두 1으로 채우기
					
					
					HashMap<String, Integer> wordCountMap = new HashMap<>();
					for (int i = 0; i < wordMapSize; i++) {
						if (wordMap.containsKey(i)) {
							String curWord = wordMap.get(i);							
							
							if (wordMap.size() < 2) {
								wordCountMap.put(curWord, count[i]);
							} else {
								for (int j = i + 1; j <= wordMapSize; j++) { //나머지 노드부터 //MAP에서 지워진만큼 size()도 줄어듦 //i와 j가 만나면 종료
									String nextWord = wordMap.get(j);
									if (curWord.equalsIgnoreCase(nextWord)) { //똑같은 단어가 나오면
										count[i]++;
										wordMap.remove(j); //지워졌다면 count = {20, 30, 2, 1, 5, 0, 0}와 같은 형태
									} else {
										wordCountMap.put(curWord, count[i]);
									}
								}
							}
							
						}
					}
					System.out.println(wordMap);
					ArrayList<String> sortedList = new ArrayList<>();
					sortedList.addAll(wordCountMap.keySet());
					System.out.println(sortedList);
					Collections.sort(sortedList, new Comparator<String>() {
						
						@Override
						public int compare(String obj1, String obj2) {
							Object v1 = wordCountMap.get(obj1);
							Object v2 = wordCountMap.get(obj2);
							return ((Comparable<Integer>)v1).compareTo((Integer)v2);
						}
						
					});
					Collections.reverse(sortedList);
					Iterator<String> er = sortedList.iterator();
					System.out.println(sortedList);
					int wordNo = 0;
					StringBuilder descBuilder = new StringBuilder();
					descBuilder.append("많이 나온 단어 : \n");
					ArrayList<String> bestWordList = new ArrayList<>();
					while (wordNo < maxDescWordNo && er.hasNext()) {
						String word = er.next();
						bestWordList.add(word);
						descBuilder.append(word).append(", ");
						wordNo++;
					}
					String bestWordStr = descBuilder.toString().substring(0, descBuilder.toString().lastIndexOf(",")); //마지막 ,표시 제거
					descBuilder = new StringBuilder(bestWordStr);
					
					HashMap<Integer, Integer> bestSentenceCountMap = new HashMap<>();
					//bestSentenceList
					for (int i = 0; i < sentenceList.size(); i++) {
						Sentence stc = sentenceList.get(i);
						int stcCount = 0;
						for (int j = 0; j < stc.length(); j++) {
							String stcLemma = stc.lemma(j);
							for (int k = 0; k < bestWordList.size(); k++) {
								if (stcLemma.equals(bestWordList.get(k))) {
									stcCount++;
									break;
								}
							}
						}
						if (stcCount > 0) {
							bestSentenceCountMap.put(i, stcCount);
						}
					}
					
					
					
					ArrayList<Integer> bestSentenceCountList = new ArrayList<>();
					bestSentenceCountList.addAll(bestSentenceCountMap.keySet());
					Collections.sort(bestSentenceCountList, new Comparator<Integer>() {

						@Override
						public int compare(Integer obj1, Integer obj2) {
							int v1 = bestSentenceCountMap.get(obj1);
							int v2 = bestSentenceCountMap.get(obj2);
							return ((Comparable<Integer>)v1).compareTo(v2);
						}
						
					});

					System.out.println("DDDDD*************************************SSSSSSSSSSSSSSSSSSSSS***BBBBBBBBBBBBBBBBBBBAAAAAAAAAA");
					Collections.reverse(bestSentenceCountList);
					Iterator<Integer> sr = bestSentenceCountList.iterator();
					descBuilder.append("\n단어가 포함된 문장 : ");
					int sentenceNo = 0;
					while (sentenceNo < maxDescSentenceNo && sr.hasNext()) {
						int key = sr.next();
						Sentence sstc = sentenceList.get(key);
						System.out.println(subStrLength(sstc.toString(), 130) + " " + bestSentenceCountMap.get(key));
						descBuilder.append("\n").append(subStrLength(sstc.toString(), 130)).append(" (" + bestSentenceCountMap.get(key) + ") ");
						sentenceNo++;
					}
				
					String htmlTaggedStr = descBuilder.toString();
					choosedDesc = htmlTaggedStr;
				}
				data = choosedDesc;
				break;
				
				
			case Literal.ParseHtml.Keyword.IMAGE :
				
				ArrayList<String> keyImgList = new ArrayList<>();
				keyImgList.add("head meta[property=og:image]");
				keyImgList.add("head meta[name=twitter:image]");
				keyImgList.add("img[src~=logo]");
				keyImgList.add("img[src~=.png]");
				keyImgList.add("img[src~=.jpg]");
				keyImgList.add("img[src~=.gif]");
				keyImgList.add("img[src~=.svf]");
				keyImgList.add("link[rel$=icon][href~=favicon]");
				
				String choosedImg = setChoosedData(doc, keyImgList);
				if (choosedImg == null) {
					choosedImg = "https://img.ashampoo.com/ashampoo.com_images/img/1/landingpage/snap4android_help/icon_tools_gallery.svg";
				}				

				data = getChoosedImg(choosedImg);
				break;
				
		}
		
		return data;
	}
	private <E> void sortList(List<E> list, String sortKeyword) {
		switch (sortKeyword) {
			case Literal.ParseHtml.SortKeyword.KEY :
				Collections.sort(list, new Comparator<E>() {

					@Override
					public int compare(E obj1, E obj2) {
						return ((Comparable<E>) obj1).compareTo(obj2);
					}
					
				});
				break;
				
			case Literal.ParseHtml.SortKeyword.VALUE :
				
				break;
		
		}
	}
	
	private String getAttrName(String keyStr) {
		String attrName = null;
		if (keyStr.contains("meta")) {
			attrName = "content";
		} else if (keyStr.contains("img")) {
			attrName = "src";
		} else if (keyStr.contains("href")) {
			attrName = "href";
		} else if (!keyStr.contains("[")) {
			//do nothing
		}
		return attrName;
	}

	private String setChoosedData(Document doc, ArrayList<String> keyStrList) {
		String choosedStr = null;
		
		for (String keyStr : keyStrList) {
			Element data = doc.select(keyStr).first();
			
			
			if (data != null) {
				if (getAttrName(keyStr) != null) {
					if (data.hasAttr(getAttrName(keyStr)) && data.attr(getAttrName(keyStr)) != null && data.attr(getAttrName(keyStr)) != "") {
						
						choosedStr = data.attr(getAttrName(keyStr));
						break;
					}
				} else {
					if (data.text() != null && data.text() != "") {
						choosedStr = data.text();
						break;
					}
				}
			}
			
		}
		return choosedStr;
	}
	
	
	private String getChoosedData(String parseKeyword) {
System.out.println("getUrl() : " + getUrl());
		String choosedData = null;
		if (urlDoc == null) { //urlDoc가 만들어지지 않았다면
			try {
//				urlDoc = Jsoup.parse(new URL(getUrl()).openStream(), "UTF-8", getUrl()); //UTF-8로 인코딩한 후 parse
				urlDoc = Jsoup.connect(getUrl()).userAgent("Mozilla").get();
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
//					domainDoc = Jsoup.parse(new URL(getUrlDomain(getUrl())).openStream(), "UTF-8", getUrlDomain(getUrl()));
					domainDoc = Jsoup.connect(getUrlDomain(getUrl())).userAgent("Mozilla").timeout(5000).get();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			choosedData = seekData(domainDoc, parseKeyword); //domainDoc에서 찾기
		}
				
		return choosedData;
	}

	
	private String getChoosedImg(String imgStr) {
		String choosedImgUrl = null;
		
		
		if (imgStr != null) {
			StringBuilder imgUrl = new StringBuilder(100);
			String domain = getUrlDomain(getUrl());
			String subLastSlashUrl = null;
			if (getUrl().contains("/")) {
				subLastSlashUrl = getUrl().substring(0, getUrl().lastIndexOf("/"));
			} else {
				subLastSlashUrl = getUrl();
			}
			
			
			
			if (imgStr.contains("://")) { // http://jquery.com/query-wp-content/themes/jquery.com/i/favicon.ico
				imgUrl.append(imgStr);
			} else if (imgStr.substring(0, 2).equals("//")) { // //jquery.com/jquery-wp-content/themes/jquery.com/i/favicon.ico
				String protocol = domain.split("://")[0];
				imgUrl.append(protocol).append(":").append(imgStr);
			} else if (imgStr.substring(0, 1).equals("/")) { // /jquery-wp-content/themes/jquery.com/i/favicon.ico
				imgUrl.append(domain).append(imgStr);
			} else if (imgStr.contains("../")) {
				if (subLastSlashUrl.contains("/")) {
					String subLastSecondSlashUrl = subLastSlashUrl.substring(0, subLastSlashUrl.lastIndexOf("/"));
					String parsedAddr = imgStr.substring("../".length(), imgStr.length());
					imgUrl.append(subLastSecondSlashUrl).append("/").append(parsedAddr);
				}
			} else if (imgStr.contains("./")) {
				String parsedAddr = imgStr.substring("./".length(), imgStr.length());
				imgUrl.append(subLastSlashUrl).append("/").append(parsedAddr);
			} else if (!imgStr.contains("/")) { // favicon.ico
				imgUrl.append(getUrl()).append("/").append(imgStr);
			}
			
			choosedImgUrl = imgUrl.toString();
		}
		
		return choosedImgUrl;
	}
	
	
}


