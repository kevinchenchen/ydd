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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/web/detail.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/web/img_magnifier.js"></script>
</head>
<body>
	<!-- ./头部 -->
	<%@ include file="../include/web/web_header.jsp"%>
	<!-- ./头部 -->
	<!-- /.页面导航 -->
	<div class="contentDom">
		<div class="contenthead">
			<a class="contentlist" href="#">首页</a> <a class="contentlist"
				href="#">葡萄美酒</a> <a class="contentlist" href="#">一起哈啤</a> <a
				class="contentlist" href="#">酒仙也参团</a> <a class="contentlist"
				href="#">私人订制</a> <a class="contentlist" href="#">小僮不醉</a>
		</div>
	</div>
	<!-- /.页面导航 -->

	<div class="contentDiv clearfix">
		<div class="mainImg">
			<div class="imgDom">
				<div id="magnifier">
					<img id="imgSrc"
						src="${pageContext.request.contextPath }/${wine.cover}" />
					<div id="Browser"></div>
				</div>
				<div id="mag">
					<img id="magnifierImg" />
				</div>
			</div>
			<div class="img-list clearfix" id="img-list">
				<c:forEach items="${pimg }" var="img">
					<a href="javascript:void;" class="imgCtrl on"><img
						src="${pageContext.request.contextPath }/${img }" /></a>
				</c:forEach>
			</div>
		</div>
		<div class="mainWord">
			<h2>${wine.name }</h2>
			<p>${wine.description }</p>
			<div class="priceDom">
				<div class="p1">
					价格<span>￥<s>${wine.price }</s></span>
				</div>
				<div class="p2">
					促销价<span>￥<strong>${wine.discountPrice }</strong></span>
				</div>
			</div>
			<div class="tip">
				该商品<span>免运费</span>，由<em>特产中国.岳西馆</em>配送并提供售后服务
			</div>
			<div class="choseBox">
				<input id="numValueInput" type="text" value="1" maxlength="5" /> <a
					class="lessen" href="javascript:void(0);" onclick="lessenFun()">-</a>
				<a class="add" href="javascript:void(0);" onclick="addedFun()">+</a>
			</div>
			<a class="aBtn aBtn00" href="#">立即购买</a> <a class="aBtn aBtn01"
				href="#">加入购物车</a>
		</div>
	</div>
	<div class="contentDiv clearfix">
		<div class="leftDom">
			<div class="modlue">
				<h2>相关分类</h2>
				<div class="modlueBody clearfix">
					<c:forEach items="${types }" var="type">
						<a href="#" class="class-name ellipsis">${type.name }</a>
					</c:forEach>
				</div>
			</div>
			<div class="modlue">
				<h2>相关分类</h2>
				<div class="modlueBody clearfix">
					<c:forEach items="${childTypes }" var="type">
						<a href="#" class="brand-name ellipsis">${type.name }</a>
					</c:forEach>
				</div>
			</div>
			<div class="modlue">
				<h3>
					看过本商品的用户还购买过
					</h2>
					<ul class="modlueBody clearfix">
						<c:forEach items="${wines }" var="wine">
							<li class="goods-list"><a href="#" class="img-name"><img
									src="http://img07.jximage.com/2015/0606/71449b4738af4c8a8c68d5afbd4556582.jpg" /></a>
								<a href="#" class="word-name">${wine.name } </a> <a href="#"
								class="word-name">${wine.description } </a>
								<p class="price-name">￥${wine.price }</p></li>
						</c:forEach>
					</ul>
			</div>
		</div>
		<div class="mainCon">
			<div class="contationHead">
				<h2>商品介绍</h2>
			</div>
			<div class="contationBodylab">
				<div class="contationBody">
					<div class="parameterBox clearfix">
						<h3>规格参数</h3>
						<p>产地：${wine.placeoforigin }</p>
						<p>容量：${wine.capacity }</p>
						<p>储存方式：${wine.storageCondition }</p>
						<p>瓶塞：木塞</p>
						<p>类型：${wine.wineType.name}</p>
						<p>葡萄品种：${wine.varieties}</p>
						<p>酒精度数：${wine.alcohol }</p>
					</div>
					<div class="labBox">
						<h3>产品介绍</h3>
						<p>${wine.description }</p>
					</div>
					${wine.detail }
				</div>
			</div>
		</div>
	</div>

	<!-- /.页脚 -->
	<%@ include file="../include/web/web_footer.jsp"%>
	<!-- /.页脚 -->
	<script>
		var numValue = 1;
		function lessenFun() {
			numValue--;
			if (numValue <= 0) {
				numValue = 1;
			}
			$("#numValueInput").val(numValue);
		}
		function addedFun() {
			numValue++;
			if (numValue > 200) {
				numValue = 200;
			}
			$("#numValueInput").val(numValue);
		}
	</script>
</body>
</html>