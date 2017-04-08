/**
 * 
 */
/*
 * ================================================== 轮播
 * ==================================================
 */
var count = 0, // 计数器
myTime; // 轮播参数
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
/*
 * ================================================== 分类导航
 * ==================================================
 */
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