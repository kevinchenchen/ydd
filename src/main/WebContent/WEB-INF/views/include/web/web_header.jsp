<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- /.页面顶部导航条 -->
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
<!-- /.页面顶部导航条 -->

<!-- /.头部广告 -->
<div>
	<img style="width: 100%;"
		src="http://img10.jximage.com/bill/2015/1118/de8a4530d0364c199843876ab67a8f11.jpg" />
</div>
<!-- /.头部广告 -->

<!-- /.LOGO和搜索 -->
<div id="header">
	<div class="headDom clearfix">
		<img class="logoImg"
			src="${pageContext.request.contextPath }/resources/images/logo/logo.jpg">
		<!-- 搜索框 -->
		<div class="searchBox clearfix">
			<input id="inputSearch" class="searchInput borderBox" type="text"
				placeholder="商品" /> <a class="aSearchBtn"
				href="javascript:void(0);" onclick="clickSearch()"></a>
		</div>
		<div class="headerProtect">
			<a href="#"></a><a href="#"></a><a href="#"></a>
		</div>
	</div>
</div>
<!-- /.LOGO和搜索 -->
<script>
	function clickSearch() {
		var search = $.trim($("#inputSearch").val());
		window.open(CONTEXT_PATH + "/web/search?wine="
				+ encodeURI(encodeURI(search)));
	}
</script>