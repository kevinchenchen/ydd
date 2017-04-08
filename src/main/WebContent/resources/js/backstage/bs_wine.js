/**
 * 红酒类型JS
 */
var dataTables;
var language = {
	"sEmptyTable" : "Keine Daten in der Tabelle vorhanden",
	"sInfo" : "显示 _START_ 至 _END_ 条 &nbsp;&nbsp;共 _TOTAL_ 条",
	"sInfoEmpty" : "没有数据",
	"sInfoFiltered" : "(筛选自 _MAX_ 条数据)",
	"sInfoPostFix" : "",
	"sInfoThousands" : ".",
	"sLengthMenu" : "每页显示 _MENU_ 条记录",
	"sLoadingRecords" : "Wird geladen...",
	"sProcessing" : "正在加载数据...",
	"sSearch" : "搜索",
	"sZeroRecords" : "没有检索到数据",
	"oPaginate" : {
		"sFirst" : "首页",
		"sPrevious" : "上一页",
		"sNext" : "下一页",
		"sLast" : "末页"
	},
	"oAria" : {
		"sSortAscending" : ": aktivieren, um Spalte aufsteigend zu sortieren",
		"sSortDescending" : ": aktivieren, um Spalte absteigend zu sortieren"
	}
};

$(document).ready(function() {
	// $("#add_pimg").fileinput({
	// showUpload : false,
	// showCaption : false,
	// allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
	// browseClass : "btn btn-primary btn-lg",
	// fileType : "any",
	// previewFileIcon : "<i class='glyphicon glyphicon-king'></i>"
	// });
	initialTable();
	$('#add_detail,#update_detail').summernote({
		height : 300
	});
});

/**
 * 新增红酒
 */
function addWine() {
	var name = $.trim($("#add_name").val());
	if (name.length < 1) {
		alert("请输入类别名称");
		return;
	}
	if (name.length > 20) {
		alert("类别名称长度不能超过20");
		return;
	}
	var cover = $("#add_cover_img").attr("val");
	if (cover.length < 1) {
		alert("请选择封面图");
		return;
	}
	var pimg = '';
	for (var i = 0; i < $("#add_pimg_container .pimg").length; i++) {
		pimg += $("#add_pimg_container .pimg").eq(i).attr("val") + ";";
	}
	if (pimg.length < 1) {
		alert("请选择产品图片");
		return;
	}

	var price = $.trim($("#add_price").val());
	if (price.length < 0) {
		alert("请输入单价");
		return;
	}

	var discountPrice = $.trim($("#add_discountPrice").val());
	if (discountPrice.length < 1) {
		alert("请输入折扣价");
		return;
	}

	var stock = $.trim($("#add_stock").val());
	if (stock.length < 1) {
		alert("请输入产品折扣价");
		return;
	}

	var description = $.trim($("#add_description").val());
	if (description.length < 1) {
		alert("请输入产品描述");
		return;
	}

	var capacity = $.trim($("#add_capacity").val());
	if (capacity.length < 1) {
		alert("请输入容量");
		return;
	}

	var typeId = $("#add_typeId").val();
	if (typeId.length < 1) {
		alert("请选择类型");
		return;
	}

	var varieties = $.trim($("#add_varieties").val());
	if (varieties.length < 1) {
		alert("请输入品种");
		return;
	}

	var placeoforigin = $.trim($("#add_placeoforigin").val());
	if (placeoforigin.length < 1) {
		alert("请输入产地");
		return;
	}

	var alcohol = $.trim($("#add_alcohol").val());
	if (alcohol.length < 1) {
		alert("请输入酒精度");
		return;
	}

	var storageCondition = $.trim($("#add_storageCondition").val());

	var detail = $('#add_detail').summernote('code');

	$.ajax({
		url : CONTEXT_PATH + "/wine/add.json",
		type : "post",
		dataType : "json",
		data : {
			"name" : name,
			"cover" : cover,
			"pimg" : pimg,
			"price" : price,
			"discountPrice" : discountPrice,
			"stock" : stock,
			"description" : description,
			"capacity" : capacity,
			"typeId" : typeId,
			"varieties" : varieties,
			"placeoforigin" : placeoforigin,
			"alcohol" : alcohol,
			"storageCondition" : storageCondition,
			"detail" : detail
		},
		success : function(data) {
			alert(data.retMsg);
			var retCode = data.retCode;
			if (retCode == SUCCESS) {
				$("#addModal").modal("hide");
				refreshData();
			} else {
			}
		}
	});
}

/**
 * 初始化
 */
function initialTable() {
	dataTables = $('#dataTables-wine').DataTable({
		"processing" : true,
		"serverSide" : true,
		"ordering" : false,
		ajax : {
			url : CONTEXT_PATH + "/wine/list.json",
			type : "post"
		},
		language : language,
		columns : [ {
			data : "id",
			title : "编号"
		}, {
			data : "name",
			title : "名称"
		}
		// , {
		// data : "cover",
		// title : "封面图"
		// }, {
		// data : "pimg",
		// title : "产品图"
		// }
		, {
			data : "price",
			title : "单价"
		}, {
			data : "discountPrice",
			title : "折扣价"
		}, {
			data : "stock",
			title : "库存"
		}, {
			data : "description",
			title : "描述"
		}, {
			data : "capacity",
			title : "容量"
		}, {
			data : "wineType.name",
			title : "类型"
		}, {
			data : "varieties",
			title : "葡萄品种"
		}, {
			data : "placeoforigin",
			title : "产地"
		}, {
			data : "alcohol",
			title : "酒精度"
		}, {
			data : "storageCondition",
			title : "贮藏条件"
		}, {
			data : "addtime",
			title : "添加时间"
		}, {
			data : "flag",
			title : "状态",
			render : function(data, type, full, meta) {
				if (data == 0) {
					return "正常";
				} else {
					return "禁用";
				}
			}
		} ]
	});

	/*----------鼠标停留高亮选中----------
	$('#dataTables-wine tbody').on('mouseover', 'td', function() {
		var colIdx = table.cell(this).index().column;
		if (colIdx !== lastIdx) {
			$(table.cells().nodes()).removeClass('highlight');
			$(table.column(colIdx).nodes()).addClass('highlight');
		}
	}).on('mouseleave', function() {
		$(table.cells().nodes()).removeClass('highlight');
	});*/
	/*----------鼠标停留高亮选中----------*/

	/*-------当行选择-------*/
	$('#dataTables-wine tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			dataTables.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
	/*-------当行选择-------*/

}

/**
 * 刷新数据
 */
function refreshData() {
	dataTables.ajax.reload();
}

/**
 * 上传图片
 * 
 * @param id
 * @param type
 */
function uploadFile(id, type) {
	$
			.ajaxFileUpload({
				url : CONTEXT_PATH + "/fileupload/upload",
				fileElementId : id,
				secureuri : false,
				type : "post",
				dataType : "json",
				data : {
					"id" : id
				},
				success : function(data) {
					var retCode = data.retCode;
					var imgurl = data.retData;
					if (retCode == SUCCESS) {
						switch (type) {
						case 1:
							$("#" + id + "_img").attr({
								"src" : CONTEXT_FILE_PATH + "/" + imgurl,
								"val" : imgurl
							});
							break;
						case 2:
							var html = '<div class="col-xs-6 col-md-3"><a href="#" class="thumbnail">';
							html += '<img class="pimg" src="'
									+ CONTEXT_FILE_PATH + "/" + imgurl
									+ '" val="' + imgurl + '">';
							html += '</a></div>';
							$("#" + id + "_container").prepend(html);
							break;
						}
					}
				}
			});
}

/**
 * 清除表单
 */
function resetForm(op) {
	$("#" + op + "Form")[0].reset();
	$("#" + op + "_cover").val("");
	$("#" + op + "_cover_img").attr("src",
			CONTEXT_PATH + "/resources/images/default_wine.png");
	$("#" + op + "_pimg").val("");
	$("#" + op + "_pimg_container img.pimg").parent().parent().remove();
}

/**
 * 添加
 */
function clickAddShow() {
	resetForm("add");
	$("#addModal").modal('show');
}

/**
 * 修改弹层显示
 */
function clickModifyModalShow() {
	resetForm("update");
	var column = dataTables.row(".selected").data();
	if (!column) {
		alert("请选择一条数据！");
		return false;
	}
	$("#update_id").val(column.id);
	$("#update_name").val(column.name);
	var coverPath = column.cover == '/resources/images/default_wine.png' ? CONTEXT_PATH
			: CONTEXT_FILE_PATH;
	$("#update_cover_img").attr({
		"src" : coverPath + "/" + column.cover,
		"val" : column.cover
	});
	$("#update_price").val(column.price);
	$("#update_discountPrice").val(column.discountPrice);
	$("#update_stock").val(column.stock);
	$("#update_description").val(column.description);
	$("#update_capacity").val(column.capacity);
	$("#update_typeId option[value='" + column.typeId + "']").attr("selected",
			true);
	$("#update_varieties").val(column.varieties);
	$("#update_placeoforigin").val(column.placeoforigin);
	$("#update_alcohol").val(column.alcohol);
	$("#update_storageCondition").val(column.storageCondition);
	if (column.pimg) {
		var html = '';
		var pimgs = column.pimg.split(";");
		for (var i = 0; i < pimgs.length - 1; i++) {
			html += '<div class="col-xs-6 col-md-3"><a href="#" class="thumbnail">';
			html += '<img class="pimg" src="' + CONTEXT_FILE_PATH + "/"
					+ pimgs[i] + '" val="' + pimgs[i] + '">';
			html += '</a></div>';
		}
		$('#update_detail').summernote('code', column.detail);
		$("#update_pimg_container").prepend(html);
	}

	$("#modifyModal").modal('show');
}

/**
 * 修改
 * 
 * @returns {Boolean}
 */
function clickModify() {
	var id = $("#update_id").val();
	var name = $.trim($("#update_name").val());
	if (name.length < 1) {
		alert("请输入类别名称");
		return;
	}
	if (name.length > 20) {
		alert("类别名称长度不能超过20");
		return;
	}
	var cover = $("#update_cover_img").attr("val");
	if (cover.length < 1) {
		alert("请选择封面图");
		return;
	}
	var pimg = '';
	for (var i = 0; i < $("#update_pimg_container .pimg").length; i++) {
		pimg += $("#update_pimg_container .pimg").eq(i).attr("val") + ";";
	}
	if (pimg.length < 1) {
		alert("请选择产品图片");
		return;
	}

	var price = $.trim($("#update_price").val());
	if (price.length < 0) {
		alert("请输入单价");
		return;
	}

	var discountPrice = $.trim($("#update_discountPrice").val());
	if (discountPrice.length < 1) {
		alert("请输入折扣价");
		return;
	}

	var stock = $.trim($("#update_stock").val());
	if (stock.length < 1) {
		alert("请输入产品折扣价");
		return;
	}

	var description = $.trim($("#update_description").val());
	if (description.length < 1) {
		alert("请输入产品描述");
		return;
	}

	var capacity = $.trim($("#update_capacity").val());
	if (capacity.length < 1) {
		alert("请输入容量");
		return;
	}

	var typeId = $("#update_typeId").val();
	if (typeId.length < 1) {
		alert("请选择类型");
		return;
	}

	var varieties = $.trim($("#update_varieties").val());
	if (varieties.length < 1) {
		alert("请输入品种");
		return;
	}

	var placeoforigin = $.trim($("#update_placeoforigin").val());
	if (placeoforigin.length < 1) {
		alert("请输入产地");
		return;
	}

	var alcohol = $.trim($("#update_alcohol").val());
	if (alcohol.length < 1) {
		alert("请输入酒精度");
		return;
	}

	var storageCondition = $.trim($("#update_storageCondition").val());

	var detail = $('#update_detail').summernote('code');

	$.ajax({
		url : CONTEXT_PATH + "/wine/update.json",
		type : "post",
		dataType : "json",
		data : {
			"id" : id,
			"name" : name,
			"cover" : cover,
			"pimg" : pimg,
			"price" : price,
			"discountPrice" : discountPrice,
			"stock" : stock,
			"description" : description,
			"capacity" : capacity,
			"typeId" : typeId,
			"varieties" : varieties,
			"placeoforigin" : placeoforigin,
			"alcohol" : alcohol,
			"storageCondition" : storageCondition,
			"detail" : detail
		},
		success : function(data) {
			alert(data.retMsg);
			var retCode = data.retCode;
			if (retCode == SUCCESS) {
				$("#modifyModal").modal("hide");
				refreshData();
			} else {
			}
		}
	});
}

/**
 * 删除商品
 */
function clickDel() {
	var column = dataTables.row(".selected").data();
	if (!column) {
		alert("请选择一条数据！");
		return false;
	}
	if (confirm("确定删除？")) {
		$.ajax({
			url : CONTEXT_PATH + "/wine/del.json",
			type : "post",
			dataType : "json",
			data : {
				"id" : column.id
			},
			success : function(data) {
				var retCode = data.retCode;
				if (retCode == SUCCESS) {
					alert("删除成功！");
					refreshData();
				} else {
					alert("删除失败！");
				}
			}
		});
	}
}

/**
 * 设置商品为推荐
 */
function clickSetRecommend() {
	var column = dataTables.row(".selected").data();
	if (column) {
		$.ajax({
			url : CONTEXT_PATH + "/wine/setrecmd.json",
			type : "post",
			dataType : "json",
			data : {
				"id" : column.id,
				"recommend" : "1"
			},
			success : function(data) {
				var retCode = data.retCode;
				if (retCode == SUCCESS) {
					alert("设置成功！");
				} else {
					alert("设置失败！");
				}
			}
		});
	} else {
		alert("请选择一条数据！");
	}
}

/**
 * 设置商品为特价
 */
function clickSetSpecial() {
	var column = dataTables.row(".selected").data();
	if (column) {
		$.ajax({
			url : CONTEXT_PATH + "/wine/setscl.json",
			type : "post",
			dataType : "json",
			data : {
				"id" : column.id,
				"special" : "1"
			},
			success : function(data) {
				var retCode = data.retCode;
				if (retCode == SUCCESS) {
					alert("设置成功！");
				} else {
					alert("设置失败！");
				}
			}
		});
	} else {
		alert("请选择一条数据！");
	}
}