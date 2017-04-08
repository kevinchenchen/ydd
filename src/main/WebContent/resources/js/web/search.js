$(function() {
	loadSearched();
})

/**
 * 加载搜索数据
 */
function loadSearched() {
	var name = $.trim($("#searchText").val());
	if (null == searchText || undefined == searchText || searchText.length < 1) {
	}
	$
			.ajax({
				url : CONTEXT_PATH + "/wine/search",
				type : "post",
				dataType : "json",
				data : {
					"name" : name
				},
				success : function(data) {
					var wines = data.retData;
					var html = '';
					if (wines) {
						for (var i = 0; i < wines.length; i++) {
							html += '<li class="boxM ">';
							html += '<div class="box2">';
							html += '<a href="./detailsPage.html" target="_blank">';
							html += '<img src="../statics/images/tuijianImg2.jpg" />';
							html += '<strong class="s-title">法国拉菲·波尔多红葡萄酒</strong><span class="s-name">波尔多法定产区红葡萄酒</span>';
							html += '</a></div></li>';
						}
						$("#wineContainer").append(html);
					}
				}
			});
}