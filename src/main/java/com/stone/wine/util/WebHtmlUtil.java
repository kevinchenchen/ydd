package com.stone.wine.util;

import java.util.List;

import com.stone.wine.model.Wine;
import com.stone.wine.model.WineChildType;
import com.stone.wine.model.WineType;

public class WebHtmlUtil {

	private static int recommendLength = 8;

	/**
	 * 获得推荐
	 * 
	 * @param wines
	 * @return
	 */
	public static String getWebIndexRecommendHtml(List<Wine> wines) {
		if (null == wines || wines.size() < 1) {
			return null;
		}
		StringBuffer recommendHtml = new StringBuffer();
		int tempLenght1 = 1;
		recommendHtml
				.append("<div class=\"divCon\"><div class=\"conHead\"><a href=\"javascript:;\">特价专区</a>");
		recommendHtml.append("</div><ul class=\"conBody clearfix\">");
		for (int i = 0; i < wines.size(); i++) {
			Wine tempWine = wines.get(i);
			if (tempLenght1 <= recommendLength
					&& ConstantUtil.RD_OR_SP.equals(tempWine.getRecommend())) {
				if (tempLenght1 != 3 && tempLenght1 != 6) {
					if (tempLenght1 == 1 || tempLenght1 == 4
							|| tempLenght1 == 7) {
						recommendHtml.append("<li class=\"boxM\">");
					}
					recommendHtml
							.append("<div class=\"box2 borderB borderBox\"><a href=\""
									+ ConstantUtil.SERVER_PATH
									+ "/web/detail?id="
									+ tempWine.getId()
									+ "\" target=\"_blank\">");
					recommendHtml.append("<strong class=\"s-title\">"
							+ tempWine.getDescription()
							+ "</strong><span class=\"s-name\">"
							+ tempWine.getDescription() + "</span>");
					recommendHtml.append("<img src=\""
							+ ConstantUtil.SERVER_FILE_PATH
							+ tempWine.getCover() + "\" /></a></div>");
					if (tempLenght1 == 2 || tempLenght1 == 5
							|| tempLenght1 == 8) {
						recommendHtml.append("</li>");
					}

				} else {
					recommendHtml.append("<li class=\"boxM\">");
					recommendHtml.append("<a  href=\""
							+ ConstantUtil.SERVER_PATH + "/web/detail?id="
							+ tempWine.getId()
							+ "\" target=\"_blank\"><img src=\""
							+ ConstantUtil.SERVER_FILE_PATH
							+ tempWine.getCover() + "\" /></a>");
					recommendHtml.append("</li>");
				}
				tempLenght1 += 1;
			}
		}
		recommendHtml.append("</ul></div>");
		return recommendHtml.toString();
	}

	/**
	 * 获得特价HTML
	 * 
	 * @param wines
	 * @return
	 */
	public static String getWebIndexSpecialHtml(List<Wine> wines) {
		if (null == wines || wines.size() < 1) {
			return null;
		}
		StringBuffer specialHtml = new StringBuffer();
		specialHtml
				.append("<div class=\"divCon\"><div class=\"conHead\"><a href=\"javascript:;\">特价专区</a>");
		specialHtml.append("</div><ul class=\"conBody clearfix\">");
		for (int i = 0; i < wines.size(); i++) {
			Wine tempWine = wines.get(i);
			specialHtml.append("<li class=\"boxM\"><a href=\""
					+ ConstantUtil.SERVER_PATH + "/web/detail?id="
					+ tempWine.getId() + "\" target=\"_blank\">");
			specialHtml.append("<img	class=\"sparea\" src=\""
					+ ConstantUtil.SERVER_FILE_PATH + tempWine.getCover()
					+ "\" /></a></li>");
		}
		specialHtml.append("</ul></div>");
		return specialHtml.toString();
	}

	/**
	 * 红酒分类
	 * 
	 * @param types
	 * @return
	 */
	public static String getWebIndexWineGroupHtml(List<WineType> types) {
		if (null == types || types.size() < 1) {
			return null;
		}
		StringBuffer html = new StringBuffer();
		for (int i = 0; i < types.size(); i++) {
			html.append("<div class=\"divCon\"><div class=\"conHead\"><a href=\"javascript:;\">"
					+ types.get(i).getName() + "</a></div>");
			html.append("<ul class=\"conBody clearfix\"><li class=\"boxSM\">");
			List<WineChildType> childTypes = types.get(i).getChildTypes();
			html.append("<div class=\"listDom clearfix\">");
			if (null != childTypes && childTypes.size() > 0) {
				for (int j = 0; j < childTypes.size(); j++) {
					html.append("<a href=\"javascript:;\" class=\"list-name\">"
							+ childTypes.get(j).getName() + "</a>");
				}
			}
			WineType tempType = types.get(i);
			html.append("</div><div class=\"box-bottom\"><a href=\""
					+ ConstantUtil.SERVER_PATH + "/web/detail?id=1"
					+ "\" target=\"_blank\">");
			html.append("<h2 class=\"h-title\">" + tempType.getDescription()
					+ "</h2> <span class=\"h-name\">" + tempType.getName()
					+ "</span>");
			html.append("<img src=\"" + ConstantUtil.SERVER_FILE_PATH
					+ tempType.getImg() + "\" /></a></div></li>");
			List<Wine> wines = types.get(i).getWines();
			if (null != wines && wines.size() > 0) {
				for (int k = 1; k <= wines.size(); k++) {
					Wine tempWine = wines.get(k - 1);
					if (k == 1 || k == 4) {
						html.append("<li class=\"boxL\"><a href=\""
								+ ConstantUtil.SERVER_PATH + "/web/detail?id="
								+ tempWine.getId() + "\" target=\"_blank\">");
						html.append("<img class=\"lgwineimg\" src=\""
								+ ConstantUtil.SERVER_FILE_PATH
								+ tempWine.getCover() + "\" />");
						html.append("</a></li>");
					} else {
						if (k == 2 || k == 5) {
							html.append("<li class=\"boxS\">");
						}
						html.append("<div class=\"box2 borderB borderBox\">");
						html.append("<a href=\"" + ConstantUtil.SERVER_PATH
								+ "/web/detail?id=" + tempWine.getId()
								+ "\" target=\"_blank\"><p class=\"p-title\">"
								+ tempWine.getDescription() + "</p>");
						html.append("<span class=\"p-name\">"
								+ tempWine.getName() + "</span><img src=\""
								+ ConstantUtil.SERVER_FILE_PATH
								+ tempWine.getCover() + "\" />");
						html.append("</a></div>");
						if (k == 3 || k == 6) {
							html.append("</li>");
						}
					}
				}
			}
			html.append("</ul></div>");
		}
		return html.toString();
	}
}
