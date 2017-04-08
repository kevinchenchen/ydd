<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>酒商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<%@ include file="./include/public.jsp"%>
</head>
<body>
	<!-- 页面导航条 -->
	<div id="shortcut">
		<div class="w clearfix">
			<ul class="fl">
				<li class="fore1"><b class="bx"></b><a href="#">收藏酒商城</a></li>
			</ul>
			<ul class="fr">
				<li class="fore">您好，<span>打酒的小僮</span>！<a href="#">[退出]</a></li>
				<li class="fore"><s></s>关注微信<span>1218983938</span></li>
				<li class="fore"><s></s>全国订购电话<span>400-828-8678</span></li>
				<li class="fore"><s></s>QQ咨询<span>1218983938</span></li>
			</ul>
		</div>
	</div>
	<!-- 广告 -->
	<div>
		<img style="width: 100%;"
			src="http://img10.jximage.com/bill/2015/1118/de8a4530d0364c199843876ab67a8f11.jpg" />
	</div>
	<!-- header -->
	<div id="header">
		<div class="headDom clearfix">
			<img class="logoImg"
				src="${pageContext.request.contextPath }/resources/images/logo/logo.jpg">
			<!-- 搜索框 -->
			<div class="searchBox clearfix">
				<input class="searchInput borderBox" type="text" placeholder="商品搜索" />
				<a class="aSearchBtn" href="#"></a>
			</div>
			<div class="headerProtect">
				<a href="#"></a><a href="#"></a><a href="#"></a>
			</div>
		</div>
	</div>
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
						<li onmouseover="categoryFunIn(${i.index});">
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
				</ul>
				<!--  <ul class="categoryBox" id="categoryBox">
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
					<li onmouseover="categoryFunIn(1);">
						<div class="catItemCon">
							<h3>
								<i class="icon01"></i>庄园藏品窖中仙
							</h3>
							<div class="linkBox">
								<a href="#" class="linkDom">送礼专区</a> <a href="#"
									class="linkDom on">结婚酒</a> <a href="#" class="linkDom">地方名酒</a>
								<a href="#" class="linkDom">送礼专区</a> <a href="#" class="linkDom">宴请酒</a>
								<a href="#" class="linkDom on">实惠套装</a>
							</div>
						</div>
					</li>
					<li onmouseover="categoryFunIn(2);">
						<div class="catItemCon">
							<h3>
								<i class="icon02"></i>漂洋过海品一品
							</h3>
							<div class="linkBox">
								<a href="#" class="linkDom">送礼专区</a> <a href="#"
									class="linkDom on">结婚酒</a> <a href="#" class="linkDom">地方名酒</a>
								<a href="#" class="linkDom">送礼专区</a> <a href="#" class="linkDom">宴请酒</a>
								<a href="#" class="linkDom on">实惠套装</a>
							</div>
						</div>
					</li>
					<li onmouseover="categoryFunIn(3);">
						<div class="catItemCon">
							<h3>
								<i class="icon03"></i>四两佳酿健脾胃
							</h3>
							<div class="linkBox">
								<a href="#" class="linkDom">送礼专区</a> <a href="#"
									class="linkDom on">结婚酒</a> <a href="#" class="linkDom">地方名酒</a>
								<a href="#" class="linkDom">送礼专区</a> <a href="#" class="linkDom">宴请酒</a>
								<a href="#" class="linkDom on">实惠套装</a>
							</div>
						</div>
					</li>
					<li onmouseover="categoryFunIn(4);">
						<div class="catItemCon">
							<h3 class="ellipsis">
								<i class="icon04"></i>酒中仙,杯中情,推心置腹满桌瓶
							</h3>
							<div class="linkBox">
								<a href="#" class="linkDom">送礼专区</a> <a href="#"
									class="linkDom on">结婚酒</a> <a href="#" class="linkDom">地方名酒</a>
								<a href="#" class="linkDom">送礼专区</a> <a href="#" class="linkDom">宴请酒</a>
								<a href="#" class="linkDom on">实惠套装</a>
							</div>
						</div>
					</li>
				</ul>-->
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
	<div class="divCon">
		<div class="conHead">
			<a href="#">推荐专区</a>
		</div>
		<ul class="conBody clearfix">
			<li class="boxM"><a href="./detailsPage.html" target="_blank"><img
					src="${pageContext.request.contextPath }/resources/images/recommend/tuijianImg1.jpg" /></a></li>
			<li class="boxM">
				<div class="box2 borderB borderBox">
					<a href="./detailsPage.html" target="_blank"><strong
						class="s-title">法国拉菲·波尔多红葡萄酒</strong><span class="s-name">波尔多法定产区红葡萄酒</span><img
						src="../statics/images/tuijianImg2.jpg" /></a>
				</div>
				<div class="box2">
					<a href="./detailsPage.html" target="_blank"><strong
						class="s-title">法国拉菲·波尔多红葡萄酒</strong><span class="s-name">波尔多法定产区红葡萄酒</span><img
						src="${pageContext.request.contextPath }/resources/images/recommend/tuijianImg2.jpg" /></a>
				</div>
			</li>
			<li class="boxM">
				<div class="box2 borderB borderBox">
					<a href="./detailsPage.html" target="_blank"><strong
						class="s-title">法国拉菲·波尔多红葡萄酒</strong><span class="s-name">波尔多法定产区红葡萄酒</span><img
						src="../statics/images/tuijianImg2.jpg" /></a>
				</div>
				<div class="box2">
					<a href="./detailsPage.html" target="_blank"><strong
						class="s-title">法国拉菲·波尔多红葡萄酒</strong><span class="s-name">波尔多法定产区红葡萄酒</span><img
						src="../statics/images/tuijianImg2.jpg" /></a>
				</div>
			</li>
			<li class="boxM"><a href="./detailsPage.html" target="_blank"><img
					src="${pageContext.request.contextPath }/resources/images/recommend/tuijianImg1.jpg" /></a></li>
			<li class="boxM">
				<div class="box2 borderB borderBox">
					<a href="./detailsPage.html" target="_blank"><strong
						class="s-title">法国拉菲·波尔多红葡萄酒</strong><span class="s-name">波尔多法定产区红葡萄酒</span><img
						src="../statics/images/tuijianImg2.jpg" /></a>
				</div>
				<div class="box2">
					<a href="./detailsPage.html" target="_blank"><strong
						class="s-title">法国拉菲·波尔多红葡萄酒</strong><span class="s-name">波尔多法定产区红葡萄酒</span><img
						src="../statics/images/tuijianImg2.jpg" /></a>
				</div>
			</li>
		</ul>
	</div>
	<div class="divCon">
		<div class="conHead">
			<a href="#">特价专区</a>
		</div>
		<ul class="conBody clearfix">
			<li class="boxM"><a href="./detailsPage.html" target="_blank"><img
					class="sparea"
					src="http://img07.jximage.com/bill/2015/1116/192932f64c2e4bd78d1c5d8096086c74.jpg" /></a>
			</li>
			<li class="boxM"><a href="./detailsPage.html" target="_blank"><img
					class="sparea" src="../statics/images/tuijianImg1.jpg" /></a></li>
			<li class="boxM"><a href="./detailsPage.html" target="_blank"><img
					class="sparea"
					src="http://img07.jximage.com/bill/2015/1116/192932f64c2e4bd78d1c5d8096086c74.jpg" /></a>
			</li>
			<li class="boxM"><a href="./detailsPage.html" target="_blank"><img
					class="sparea" src="../statics/images/tuijianImg1.jpg" /></a></li>
			<li class="boxM"><a href="./detailsPage.html" target="_blank"><img
					class="sparea"
					src="http://img07.jximage.com/bill/2015/1116/192932f64c2e4bd78d1c5d8096086c74.jpg" /></a>
			</li>
		</ul>
	</div>
	<div class="divCon">
		<div class="conHead">
			<a href="#">葡萄酒</a>
		</div>
		<ul class="conBody clearfix">
			<li class="boxSM">
				<div class="listDom clearfix">
					<a href="#" class="list-name">红葡萄酒</a> <a href="#"
						class="list-name">白葡萄酒</a> <a href="#" class="list-name">桃红葡萄酒</a>
					<a href="#" class="list-name">加强葡萄酒</a> <a href="#"
						class="list-name">气泡酒</a>
				</div>
				<div class="box-bottom">
					<a href="./detailsPage.html" target="_blank"><h2
							class="h-title">法国原装进口</h2> <span class="h-name">梅赫斯城堡干红葡萄酒750ml*2</span><img
						src="http://img09.jiuxian.com/2015/0916/c89d76f224a04d4e90d51bdc730d0d902.jpg" /></a>
				</div>
			</li>
			<li class="boxL"><a href="./detailsPage.html" target="_blank"><img
					class="lgwineimg"
					src="http://img10.jximage.com/2015/1013/2756578508564bd994b254c82035e6625.jpg" /></a>
			</li>
			<li class="boxS">
				<div class="box2 borderB borderBox">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">醉爱干红葡萄酒</p>
						<span class="p-name">西班牙醉爱干红葡萄酒</span><img
						src="http://img09.jximage.com/2015/0915/47234c1256c942fb865d983daee448344.jpg" /></a>
				</div>
				<div class="box2">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">醉爱干红葡萄酒</p>
						<span class="p-name">西班牙醉爱干红葡萄酒</span><img
						src="../statics/images/ganhongImg3.jpg" /></a>
				</div>
			</li>
			<li class="boxS borderBox">
				<div class="box1 borderL borderR borderBox">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">醉爱干红葡萄酒</p>
						<span class="p-name">西班牙醉爱干红葡萄酒</span><img class="smwineimg"
						src="http://img07.jximage.com/2014/0920/ddd28c3ccf9440d18440147e499a41525.jpg" /></a>
				</div>
			</li>
			<li class="boxS">
				<div class="box2 borderB borderBox">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">醉爱干红葡萄酒</p>
						<span class="p-name">西班牙醉爱干红葡萄酒</span><img
						src="http://img09.jximage.com/2015/0924/5babf640fc5d4debaea7c7c9bb0b0f424.jpg" /></a>
				</div>
				<div class="box2">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">醉爱干红葡萄酒</p>
						<span class="p-name">西班牙醉爱干红葡萄酒</span><img
						src="../statics/images/ganhongImg3.jpg" /></a>
				</div>
			</li>
		</ul>
	</div>
	<div class="divCon">
		<div class="conHead">
			<a href="#">洋酒</a>
		</div>
		<ul class="conBody clearfix">
			<li class="boxSM">
				<div class="listDom clearfix">
					<a href="#" class="list-name">白兰地</a> <a href="#" class="list-name">威士忌</a>
					<a href="#" class="list-name">伏特加</a> <a href="#" class="list-name">龙舌兰</a>
				</div>
				<div class="box-bottom">
					<a href="./detailsPage.html" target="_blank"><h2
							class="h-title">大气张扬 我就是夏魅</h2> <span class="h-name">法国夏魅XO白兰地</span><img
						src="http://img09.jiuxian.com/2014/0512/bcb5a454c9fa4a98aa3dcf73728800322.jpg" /></a>
				</div>
			</li>
			<li class="boxL"><a href="./detailsPage.html" target="_blank"><img
					class="lgwineimg"
					src="http://img06.jiuxian.com/2015/0928/768022bf3d994f319fdfe3346d94323f5.jpg" /></a>
			</li>
			<li class="boxS">
				<div class="box2 borderB borderBox">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">苏格兰威士忌</p>
						<span class="p-name">40°英国鹰勇12年调配型</span><img
						src="http://img09.jiuxian.com/2015/0906/a9223daa811440df848cfb9f0c6471b02.jpg" /></a>
				</div>
				<div class="box2">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">火力延续
							抓紧抢购</p> <span class="p-name">40°法国轩尼诗XO 700ml </span><img
						src="http://img09.jiuxian.com/2013/1002/3f9bdd62ef134bd2aa29515564997b3c2.jpg" /></a>
				</div>
			</li>
			<li class="boxS borderBox">
				<div class="box1 borderL borderR borderBox">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">自营直采
							正品认证</p> <span class="p-name">40°法国香奈XO白兰地700ml</span><img
						src="../statics/images/ganhongImg4.jpg" /></a>
				</div>
			</li>
			<li class="boxS">
				<div class="box2 borderB borderBox">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">苏格兰威士忌</p>
						<span class="p-name">40°英国鹰勇12年调配型</span><img
						src="http://img09.jiuxian.com/2015/0906/a9223daa811440df848cfb9f0c6471b02.jpg" /></a>
				</div>
				<div class="box2">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">火力延续
							抓紧抢购</p> <span class="p-name">40°法国轩尼诗XO 700ml </span><img
						src="http://img09.jiuxian.com/2013/1002/3f9bdd62ef134bd2aa29515564997b3c2.jpg" /></a>
				</div>
			</li>
		</ul>
	</div>
	<div class="divCon">
		<div class="conHead">
			<a href="#">白酒</a>
		</div>
		<ul class="conBody clearfix">
			<li class="boxSM">
				<div class="listDom clearfix">
					<a href="#" class="list-name">洋河蓝色经典</a> <a href="#"
						class="list-name">茅台</a> <a href="#" class="list-name">泸州老窖</a> <a
						href="#" class="list-name">五粮液</a> <a href="#" class="list-name">帝王黄</a>
				</div>
				<div class="box-bottom">
					<a href="./detailsPage.html" target="_blank"><h2
							class="h-title">洋河蓝色经典</h2> <span class="h-name">绵柔型白酒</span><img
						src="http://img07.jiuxian.com/2014/0425/99a279148e7a4c448cdf2d492d0d167c2.jpg" /></a>
				</div>
			</li>
			<li class="boxL"><a href="./detailsPage.html" target="_blank"><img
					class="lgwineimg"
					src="http://img06.jiuxian.com/2015/0812/7c488a208b504cc5be6949f85b1cbeb56.jpg" /></a>
			</li>
			<li class="boxS">
				<div class="box2 borderB borderBox">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">特曲浓香好酒</p>
						<span class="p-name">52°泸州老窖特曲1000ml</span><img
						src="http://img10.jximage.com/2015/1024/28b9cbb72ba148f7b83b4cb791cc592b5.jpg" /></a>
				</div>
				<div class="box2">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">泸州老窖</p>
						<span class="p-name">52°泸州老窖特曲1000ml</span><img
						src="http://img07.jiuxian.com/2015/1024/f6d510902f7f499eaaa2c6692af6dbe72.jpg" /></a>
				</div>
			</li>
			<li class="boxS borderBox">
				<div class="box1 borderL borderR borderBox">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">周恩来纪念酒</p>
						<span class="p-name">53°茅台500ml</span><img class="smwineimg"
						src="http://img06.jiuxian.com/2015/0818/8b12a7e072174df2824e89db7477ce6f5.jpg" /></a>
				</div>
			</li>
			<li class="boxS">
				<div class="box2 borderB borderBox">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">甜蜜糖巧
							买1送1</p> <span class="p-name">进口糖巧品类中心</span><img
						src="http://img07.jiuxian.com/2015/0720/0dbe1200409943a1bcf2d85e628e30732.jpg" /></a>
				</div>
				<div class="box2">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">茅台仁酒</p>
						<span class="p-name">53°茅台仁酒500ml</span><img
						src="http://img07.jiuxian.com/2015/0619/2afc667ba90a471294e62571e7f963602.jpg" /></a>
				</div>
			</li>
		</ul>
	</div>
	<div class="divCon">
		<div class="conHead">
			<a href="#">养生酒</a>
		</div>
		<ul class="conBody clearfix">
			<li class="boxSM">
				<div class="listDom clearfix">
					<a href="#" class="list-name">宁夏红</a> <a href="#" class="list-name">竹叶青</a>
					<a href="#" class="list-name">劲牌</a> <a href="#" class="list-name">天赋鸿运</a>
				</div>
				<div class="box-bottom">
					<a href="./detailsPage.html" target="_blank"><h2
							class="h-title">劲酒虽好 可不要贪杯呦</h2> <span class="h-name">35°中国劲酒680ml</span><img
						src="http://img07.jximage.com/2015/1109/7d01fd30f7884f838ac19e6b6abeece42.jpg" /></a>
				</div>
			</li>
			<li class="boxL"><a href="./detailsPage.html" target="_blank"><img
					class="lgwineimg"
					src="http://img07.jximage.com/2015/0814/0eb777d48e6441d1bfa56eb6bbaf77f25.jpg" /></a>
			</li>
			<li class="boxS">
				<div class="box2 borderB borderBox">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">五粮液黄金酒</p>
						<span class="p-name">39°五粮液黄金酒万福礼盒480ml*2</span><img
						src="http://img07.jximage.com/2015/0623/af0f28ed788640f9a75fe35e772c0dab2.jpg" /></a>
				</div>
				<div class="box2">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">古越龙山花雕</p>
						<span class="p-name">15°古越龙山花雕2000 500ml（6瓶装）</span><img
						src="http://img07.jximage.com/2014/0428/0e34450010b74db8a3ac52e765bd3f822.jpg" /></a>
				</div>
			</li>
			<li class="boxS borderBox">
				<div class="box1 borderL borderR borderBox">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">英国尊尼获加</p>
						<span class="p-name">无畏艰险 勇往直前</span><img class="smwineimg"
						src="http://img10.jximage.com/2013/1002/4f2c82cf5fc7413e9567e2be65114b775.jpg" /></a>
				</div>
			</li>
			<li class="boxS">
				<div class="box2 borderB borderBox">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">德国奥丁格</p>
						<span class="p-name">【清仓】德国奥丁格小麦啤酒500ml(6瓶装）</span><img
						src="http://img07.jximage.com/2015/0527/c47fd69d94bc46d4b61d9d846e3bb46a2.jpg" /></a>
				</div>
				<div class="box2">
					<a href="./detailsPage.html" target="_blank"><p class="p-title">德国施瓦皇冠</p>
						<span class="p-name">德国施瓦皇冠黑啤酒500ml（24瓶装）</span><img
						src="http://img07.jximage.com/2015/0618/ee34c37b2a8b4e1e80e3d57787b283ea2.jpg" /></a>
				</div>
			</li>
		</ul>
	</div>
	<!-- 广告 -->
	<div>
		<img style="width: 100%;"
			src="http://img10.jximage.com/bill/2015/1118/de8a4530d0364c199843876ab67a8f11.jpg" />
	</div>
	<div id="footer">
		<span class="line lineL inlineBlock"></span> <span class="inlineBlock">
			<p>
				<a href="index.html">酒中酒官网</a>丨集智创新技术支持<br />ICP许可证xxxx 0000000000
			</p>
		</span> <span class="line lineR inlineBlock"></span>
	</div>
	<script>
		/*================================================== 轮播 ==================================================*/
		var count = 0, //计数器
		myTime; //轮播参数
		/* 自动轮播 */

		myTime = setInterval(function() {
			count++;
			if (count >= 4) {
				count = 0;
			}
			showImg(count);
		}, 3000);
		/* 小点控轮播 */
		function setShowImg(num) {
			showImg(num);
			if (myTime) {
				clearInterval(myTime);
			}
			myTime = setInterval(function() {
				count++;
				if (count >= 4) {
					count = 0;
				}
				showImg(count);
			}, 3000);
		}
		/* 轮播基本方法 */
		function showImg(num) {
			var marL = num * $(window).width();
			$("#divIcons li").removeClass("on");
			$("#divImgs").animate({
				"margin-left" : -marL
			}, 300, function() {
				$("#divIcons li").eq(num).addClass("on");
			});
		}
		/*================================================== 分类导航 ==================================================*/
		function categoryFunIn(num) {
			$("#categoryBox li").removeClass("on");
			$("#categoryBox li").eq(num).addClass("on");
			$("#shopall .menuBox").hide();
			$("#shopall .menuBox").eq(num).show();
		}
		function categoryFunOut(num) {
			$("#categoryBox li").removeClass("on");
			$("#shopall .menuBox").hide();
		}
		/*$(document).ready(function(){
		 $("#categoryBox li").each(function(){
		 $(this).hover(function(){
		 var index = $(this).index();
		 $(this).siblings().removeClass("on");
		 $(this).addClass("on");
		 $("#shopall .menuBox").hide();
		 $("#shopall .menuBox").eq(index).show();
		 });
		 });
		 $("#shopall .menuBox").each(function(){
		 $(this).hover(function(){
		 var index = $(this).index() - 2;
		 $(this).siblings(".menuBox").hide();
		 $(this).show();
		 $("#categoryBox li")
		 $("#categoryBox li").eq(index).addClass("on");
		 });
		 });
		 });*/
	</script>
</body>
</html>