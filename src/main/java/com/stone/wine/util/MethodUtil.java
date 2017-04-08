package com.stone.wine.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 公共方法
 * 
 * @author stone
 *
 */
public class MethodUtil {
	/**
	 * 日期格式
	 */
	private static String pattern = "yyyy-MM-dd HH:mm";

	/**
	 * 返回当前日期字符串
	 * 
	 * @return
	 */
	public static String getCurrentDateStr() {
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
		return dateFormat.format(new Date());
	}
}
