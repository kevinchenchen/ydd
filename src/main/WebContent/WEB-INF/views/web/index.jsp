<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>酒商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%@ include file="../include/public.jsp"%>
</head>
<body>
	<!-- ./头部-->
	<%@ include file="../include/web/web_header.jsp"%>
	<!-- ./头部 -->

	<!-- 首页导航 -->
	<div class="contentDom">
		<div class="contenthead">
			<div class="shopall" id="shopall" onmouseout="categoryFunOut()">
				<h2>全部商品分类</h2>
				<ul class="categoryBox" id="categoryBox">
					<!-- ./推荐 -->
					<li onmouseover="categoryFunIn(0);">
						<div class="catItemCon">
							<h3>
								<i class="icon00"></i>推荐、特价专区
							</h3>
							<div class="linkBox">
								<a href="#" class="linkDom">送礼专区</a> <a href="#"
									class="linkDom on">结婚酒</a> <a href="#" class="linkDom">地方名酒</a>
								<a href="#" class="linkDom">送礼专区</a> <a href="#" class="linkDom">宴请酒</a>
								<a href="#" class="linkDom on">实惠套装</a>
							</div>
						</div>
					</li>
					<!-- ./推荐 -->
					<c:forEach items="${types }" var="type" begin="0" end="3" step="1"
						varStatus="i">
						<li onmouseover="categoryFunIn(${i.index+1});">
							<div class="catItemCon">
								<h3>
									<i class="icon00"></i>${type.name }
								</h3>
								<div class="linkBox">
									<c:forEach items="${type.childTypes }" var="ctype">
										<a href="${ctype.url }" class="linkDom">${ctype.name }</a>
									</c:forEach>
								</div>
							</div>
						</li>
					</c:forEach>
					<!-- 
					<li onmouseover="categoryFunIn(0);">
						<div class="catItemCon">
							<h3>
								<i class="icon00"></i>精品白酒肝胆照
							</h3>
							<div class="linkBox">
								<a href="#" class="linkDom">送礼专区</a> <a href="#"
									class="linkDom on">结婚酒</a> <a href="#" class="linkDom">地方名酒</a>
								<a href="#" class="linkDom">送礼专区</a> <a href="#" class="linkDom">宴请酒</a>
								<a href="#" class="linkDom on">实惠套装</a>
							</div>
						</div>
					</li>
					 -->
				</ul>
				<div class="menuBox clearfix" onmouseover="categoryFunIn(0);">
					<div class="menuCon">
						<div class="Bg"></div>
						<div class="menuDom">
							<div class="menuItem first clearfix">
								<div class="menuItemTitle">品牌</div>
								<div class="menuCon-list">
									<a href="#">茅台</a><i></i> <a href="#">剑南春</a><i></i> <a
										href="#">国窖1573</a><i></i> <a href="#">郎酒</a><i></i> <a
										href="#">古井贡酒</a><i></i> <a href="#">景德大曲</a><i></i> <a
										href="#">枝江</a><i></i> <a href="#">其他</a>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">香型</div>
								<div class="menuCon-list">
									<a href="#">酱香型</a><i></i> <a href="#">浓香型</a><i></i> <a
										href="#">清香型</a><i></i> <a href="#">馥郁香型</a><i></i> <a
										href="#">兼香型</a><i></i> <a href="#">特香型</a><i></i> <a href="#">芝麻香型</a><i></i>
									<a href="#">豉香型</a><i></i> <a href="#">凤香型</a><i></i> <a
										href="#">老白干香型</a><i></i> <a href="#">復合香</a><i></i> <a
										href="#">荞香型</a><i></i> <a href="#">靑稞清香型</a><i></i> <a
										href="#">米香型</a><i></i> <a href="#">陶香型</a><i></i> <a href="#">董香型</a><i></i>
									<a href="#">其他</a>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">产地</div>
								<div class="menuCon-list">
									<a href="#">贵州</a><i></i> <a href="#">四川</a><i></i> <a href="#">山西</a><i></i>
									<a href="#">北京</a><i></i> <a href="#">蒙古</a><i></i> <a href="#">安徽</a><i></i>
									<a href="#">湖北</a><i></i> <a href="#">湖南</a><i></i> <a href="#">云南</a><i></i>
									<a href="#">江西</a><i></i>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">价格区间</div>
								<div class="menuCon-list">
									<a href="#">1-99</a><i></i> <a href="#">100-199</a><i></i> <a
										href="#">200-499</a><i></i> <a href="#">500-999</a><i></i> <a
										href="#">1000-1999</a><i></i> <a href="#">2000-4999</a><i></i>
									<a href="#">5000以上</a><i></i>
								</div>
							</div>
						</div>
					</div>
					<div class="menuFoc">
						<a href="#"><img
							src="http://img10.jiuxian.com/brandlogo/2015/1117/51ba505f4cf741c08114487dcb68cc03.png" /></a>
					</div>
				</div>
				<div class="menuBox clearfix" onmouseover="categoryFunIn(1);">
					<div class="menuCon">
						<div class="Bg"></div>
						<div class="menuDom">
							<div class="menuItem first clearfix">
								<div class="menuItemTitle">红葡萄酒</div>
								<div class="menuCon-list">
									<a href="#">干红</a><i></i> <a href="#">半干红</a><i></i> <a
										href="#">甜红</a><i></i> <a href="#">半甜红</a><i></i>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">白葡萄酒</div>
								<div class="menuCon-list">
									<a href="#">干白</a><i></i> <a href="#">半干白</a><i></i> <a
										href="#">甜白</a><i></i> <a href="#">半甜白</a><i></i>
								</div>
							</div>
							<div class="menuItem first clearfix">
								<div class="menuItemTitle">桃红葡萄酒</div>
								<div class="menuCon-list">
									<a href="#">干型桃红</a><i></i> <a href="#">半干型桃红</a><i></i> <a
										href="#">甜型桃红</a><i></i> <a href="#">半甜型桃红</a><i></i>
								</div>
							</div>
							<div class="menuItem first clearfix">
								<div class="menuItemTitle">加强葡萄酒</div>
								<div class="menuCon-list">
									<a href="#">波特酒</a><i></i>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">国家</div>
								<div class="menuCon-list">
									<a href="#">贵州</a><i></i> <a href="#">四川</a><i></i> <a href="#">山西</a><i></i>
									<a href="#">北京</a><i></i> <a href="#">蒙古</a><i></i> <a href="#">安徽</a><i></i>
									<a href="#">湖北</a><i></i> <a href="#">湖南</a><i></i> <a href="#">云南</a><i></i>
									<a href="#">江西</a><i></i>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">价格区间</div>
								<div class="menuCon-list">
									<a href="#">1-99</a><i></i> <a href="#">100-199</a><i></i> <a
										href="#">200-499</a><i></i> <a href="#">500-999</a><i></i> <a
										href="#">1000-1999</a><i></i> <a href="#">2000-4999</a><i></i>
									<a href="#">5000以上</a><i></i>
								</div>
							</div>
						</div>
					</div>
					<div class="menuFoc">
						<a href="#"><img
							src="http://img10.jiuxian.com/brandlogo/2015/1117/51ba505f4cf741c08114487dcb68cc03.png" /></a>
					</div>
				</div>
				<div class="menuBox clearfix" onmouseover="categoryFunIn(2);">
					<div class="menuCon">
						<div class="Bg"></div>
						<div class="menuDom">
							<div class="menuItem first clearfix">
								<div class="menuItemTitle">品牌</div>
								<div class="menuCon-list">
									<a href="#">茅台</a><i></i> <a href="#">剑南春</a><i></i> <a
										href="#">国窖1573</a><i></i> <a href="#">郎酒</a><i></i> <a
										href="#">古井贡酒</a><i></i> <a href="#">景德大曲</a><i></i> <a
										href="#">枝江</a><i></i> <a href="#">其他</a>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">香型</div>
								<div class="menuCon-list">
									<a href="#">酱香型</a><i></i> <a href="#">浓香型</a><i></i> <a
										href="#">清香型</a><i></i> <a href="#">馥郁香型</a><i></i> <a
										href="#">兼香型</a><i></i> <a href="#">特香型</a><i></i> <a href="#">芝麻香型</a><i></i>
									<a href="#">豉香型</a><i></i> <a href="#">凤香型</a><i></i> <a
										href="#">老白干香型</a><i></i> <a href="#">復合香</a><i></i> <a
										href="#">荞香型</a><i></i> <a href="#">靑稞清香型</a><i></i> <a
										href="#">米香型</a><i></i> <a href="#">陶香型</a><i></i> <a href="#">董香型</a><i></i>
									<a href="#">其他</a>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">产地</div>
								<div class="menuCon-list">
									<a href="#">贵州</a><i></i> <a href="#">四川</a><i></i> <a href="#">山西</a><i></i>
									<a href="#">北京</a><i></i> <a href="#">蒙古</a><i></i> <a href="#">安徽</a><i></i>
									<a href="#">湖北</a><i></i> <a href="#">湖南</a><i></i> <a href="#">云南</a><i></i>
									<a href="#">江西</a><i></i>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">价格区间</div>
								<div class="menuCon-list">
									<a href="#">1-99</a><i></i> <a href="#">100-199</a><i></i> <a
										href="#">200-499</a><i></i> <a href="#">500-999</a><i></i> <a
										href="#">1000-1999</a><i></i> <a href="#">2000-4999</a><i></i>
									<a href="#">5000以上</a><i></i>
								</div>
							</div>
						</div>
					</div>
					<div class="menuFoc">
						<a href="#"><img
							src="http://img10.jiuxian.com/brandlogo/2015/1117/51ba505f4cf741c08114487dcb68cc03.png" /></a>
					</div>
				</div>
				<div class="menuBox clearfix" onmouseover="categoryFunIn(3);">
					<div class="menuCon">
						<div class="Bg"></div>
						<div class="menuDom">
							<div class="menuItem first clearfix">
								<div class="menuItemTitle">品牌</div>
								<div class="menuCon-list">
									<a href="#">茅台</a><i></i> <a href="#">剑南春</a><i></i> <a
										href="#">国窖1573</a><i></i> <a href="#">郎酒</a><i></i> <a
										href="#">古井贡酒</a><i></i> <a href="#">景德大曲</a><i></i> <a
										href="#">枝江</a><i></i> <a href="#">其他</a>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">香型</div>
								<div class="menuCon-list">
									<a href="#">酱香型</a><i></i> <a href="#">浓香型</a><i></i> <a
										href="#">清香型</a><i></i> <a href="#">馥郁香型</a><i></i> <a
										href="#">兼香型</a><i></i> <a href="#">特香型</a><i></i> <a href="#">芝麻香型</a><i></i>
									<a href="#">豉香型</a><i></i> <a href="#">凤香型</a><i></i> <a
										href="#">老白干香型</a><i></i> <a href="#">復合香</a><i></i> <a
										href="#">荞香型</a><i></i> <a href="#">靑稞清香型</a><i></i> <a
										href="#">米香型</a><i></i> <a href="#">陶香型</a><i></i> <a href="#">董香型</a><i></i>
									<a href="#">其他</a>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">产地</div>
								<div class="menuCon-list">
									<a href="#">贵州</a><i></i> <a href="#">四川</a><i></i> <a href="#">山西</a><i></i>
									<a href="#">北京</a><i></i> <a href="#">蒙古</a><i></i> <a href="#">安徽</a><i></i>
									<a href="#">湖北</a><i></i> <a href="#">湖南</a><i></i> <a href="#">云南</a><i></i>
									<a href="#">江西</a><i></i>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">价格区间</div>
								<div class="menuCon-list">
									<a href="#">1-99</a><i></i> <a href="#">100-199</a><i></i> <a
										href="#">200-499</a><i></i> <a href="#">500-999</a><i></i> <a
										href="#">1000-1999</a><i></i> <a href="#">2000-4999</a><i></i>
									<a href="#">5000以上</a><i></i>
								</div>
							</div>
						</div>
					</div>
					<div class="menuFoc">
						<a href="#"><img
							src="http://img10.jiuxian.com/brandlogo/2015/1117/51ba505f4cf741c08114487dcb68cc03.png" /></a>
					</div>
				</div>
				<div class="menuBox clearfix" onmouseover="categoryFunIn(4);">
					<div class="menuCon">
						<div class="Bg"></div>
						<div class="menuDom">
							<div class="menuItem first clearfix">
								<div class="menuItemTitle">品牌</div>
								<div class="menuCon-list">
									<a href="#">茅台</a><i></i> <a href="#">剑南春</a><i></i> <a
										href="#">国窖1573</a><i></i> <a href="#">郎酒</a><i></i> <a
										href="#">古井贡酒</a><i></i> <a href="#">景德大曲</a><i></i> <a
										href="#">枝江</a><i></i> <a href="#">其他</a>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">香型</div>
								<div class="menuCon-list">
									<a href="#">酱香型</a><i></i> <a href="#">浓香型</a><i></i> <a
										href="#">清香型</a><i></i> <a href="#">馥郁香型</a><i></i> <a
										href="#">兼香型</a><i></i> <a href="#">特香型</a><i></i> <a href="#">芝麻香型</a><i></i>
									<a href="#">豉香型</a><i></i> <a href="#">凤香型</a><i></i> <a
										href="#">老白干香型</a><i></i> <a href="#">復合香</a><i></i> <a
										href="#">荞香型</a><i></i> <a href="#">靑稞清香型</a><i></i> <a
										href="#">米香型</a><i></i> <a href="#">陶香型</a><i></i> <a href="#">董香型</a><i></i>
									<a href="#">其他</a>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">产地</div>
								<div class="menuCon-list">
									<a href="#">贵州</a><i></i> <a href="#">四川</a><i></i> <a href="#">山西</a><i></i>
									<a href="#">北京</a><i></i> <a href="#">蒙古</a><i></i> <a href="#">安徽</a><i></i>
									<a href="#">湖北</a><i></i> <a href="#">湖南</a><i></i> <a href="#">云南</a><i></i>
									<a href="#">江西</a><i></i>
								</div>
							</div>
							<div class="menuItem clearfix">
								<div class="menuItemTitle">价格区间</div>
								<div class="menuCon-list">
									<a href="#">1-99</a><i></i> <a href="#">100-199</a><i></i> <a
										href="#">200-499</a><i></i> <a href="#">500-999</a><i></i> <a
										href="#">1000-1999</a><i></i> <a href="#">2000-4999</a><i></i>
									<a href="#">5000以上</a><i></i>
								</div>
							</div>
						</div>
					</div>
					<div class="menuFoc">
						<a href="#"><img
							src="http://img10.jiuxian.com/brandlogo/2015/1117/51ba505f4cf741c08114487dcb68cc03.png" /></a>
					</div>
				</div>
			</div>
			<a class="contentlist" href="#">首页</a> <a class="contentlist"
				href="#">葡萄美酒</a> <a class="contentlist" href="#">一起哈啤</a> <a
				class="contentlist" href="#">酒仙也参团</a> <a class="contentlist"
				href="#">私人订制</a> <a class="contentlist" href="#">小僮不醉</a>
		</div>
	</div>
	<!-- 广告 -->
	<div class="scrollImgs" id="scrollImgs">
		<div class="divImgs" id="divImgs">
			<a href="javascript:;" target="_blank"><img
				src="${pageContext.request.contextPath }/resources/images/banner/banner1.jpg" /></a>
			<a href="javascript:;" target="_blank"><img
				src="${pageContext.request.contextPath }/resources/images/banner/banner2.jpg" /></a>
			<a href="javascript:;" target="_blank"><img
				src="${pageContext.request.contextPath }/resources/images/banner/banner3.jpg" /></a>
			<a href="javascript:;" target="_blank"><img
				src="${pageContext.request.contextPath }/resources/images/banner/banner4.jpg" /></a>
		</div>
		<ul class="divIcons" id="divIcons">
			<li class="on" onclick="setShowImg(0)"></li>
			<li onclick="setShowImg(1)"></li>
			<li onclick="setShowImg(2)"></li>
			<li onclick="setShowImg(3)"></li>
		</ul>
	</div>
	<!-- 内容 -->
	${recommendHtml } ${specialHtml } ${winesHtml }
	<!-- 内容 -->


	<!-- /.页脚 -->
	<%@ include file="../include/web/web_footer.jsp"%>
	<!-- /.页脚 -->
	<script
		src="${pageContext.request.contextPath }/resources/js/web/index.js">
	</script>
</body>
</html>