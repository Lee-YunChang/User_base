package com.sangs.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BookMarkType {

	public static final String ATYPE = "1";
	public static final String BTYPE = "01.htm";
	public static final String CTYPE = "_01.html";
	
	private static Pattern p1 = Pattern.compile("\".*_01.html\"");
	private static Pattern p2 = Pattern.compile("\"01.htm\"");
	private static Pattern p3 = Pattern.compile("^??_??.html$");
	private static Pattern p4 = Pattern.compile("^??.htm$");
	
	private static final String contentsRootDir = "C:/Users/doldory77/AppData/Local/Temp/fz3temp-2";
	
	public static String getType(String courseNo, String treeDir) throws Exception {
		
		String indexHtmlFilePath = contentsRootDir + "/" + courseNo + "/resources/" + treeDir + "/" + "index.html";
		
		return getType(indexHtmlFilePath);
		
	}
	
	public static String getType(String indexHtmlFilePath) throws Exception {
		
		File indexHtmlFile = null;
		BufferedReader br = null;
		Matcher m1 = null;
		Matcher m2 = null;
		
		try {
			
			indexHtmlFile = new File(indexHtmlFilePath);
			br = new BufferedReader(new FileReader(indexHtmlFile));
			String line = null;
			while ( (line = br.readLine()) != null ) {
				
				m1 = p1.matcher(line);
				m2 = p2.matcher(line);
				
				if (m1.find()) {
					return CTYPE;
				}
				
				if (m2.find()) {
					return BTYPE;
				}
			}
			
			return ATYPE;
		
		} catch (Exception e) { 
			throw e;
		} finally {
			if (br != null) br.close();
		}
	}
	
	public static String getType2(String lastFrame) throws Exception {
		
		if (lastFrame == null || "".equals(lastFrame)) {
			return "";
		}
		
		
		System.out.println("11111111111111111111111111");
		
		
		Matcher m1 = null;
		Matcher m2 = null;
		System.out.println("2222222222222222222222222222222");
		m1 = p3.matcher(lastFrame);
		m2 = p4.matcher(lastFrame);
		
		System.out.println("33333333333333333333333333333333333333");
		
		
		if (m1.find()) {
			System.out.println("44444444444444444444444444444");
			return "01"+CTYPE;
		} else if (m2.find()) {
			System.out.println("55555555555555555555555555");
			return BTYPE;
		} else {
			System.out.println("6666666666666666666666666666666");
			return ATYPE;
		}
		
		
	
		
		
	}	
	
}
