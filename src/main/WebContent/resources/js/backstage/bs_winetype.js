/**
 * 红酒类型JS
 */
$(document).ready(function() {
	$.ajax({
		url : CONTEXT_PATH + "/winetype/list.json",
		type : "post",
		dataType : "json",
		success : function(data) {
			var types = data.data;
			if (types) {
				addParentMenu(types);
			}
		}
	});
});

/**
 * 新增红酒
 */
function addWineType() {
	var name = $.trim($("#add_name").val());
	if (name.length < 1) {
		alert("请输入类别名称");
		return;
	}
	if (name.length > 20) {
		alert("类别名称长度不能超过20");
		return;
	}
	var title = $.trim($("#add_title").val());
	if (title.length < 1) {
		alert("广告标题不能为空！");
		return;
	}
	var img = $("#add_img_img").attr("val");
	if (img.length < 1) {
		alert("广告图片不能为空！");
		return;
	}
	var description = $.trim($("#add_description").val());
	if (description.length < 1) {
		alert("广告描述不能为空！");
		return;
	}
	if (description.length > 200) {
		alert("类别描述长度不能超过200");
		return;
	}

	$
			.ajaxFileUpload({
				url : CONTEXT_PATH + "/winetype/add.json",
				fileElementId : "addImg",
				secureuri : false,
				type : "post",
				dataType : "json",
				data : {
					"name" : name,
					"title" : title,
					"img" : img,
					"description" : description
				},
				success : function(data) {
					var retCode = data.retCode;
					var type = data.retData;
					if (retCode == SUCCESS) {
						$("#addModal").modal("hide");
						var html = '';
						html += '<div class="panel panel-default" val="'
								+ type.id + '">';
						html += '<div class="panel-heading" role="tab" id="heading_'
								+ type.id + '">';
						html += '<div class="panel-title clearfix">';
						html += '<div class="parent_left" data-toggle="collapse"';
						html += 'data-parent="#accordion" href="#collapse_'
								+ type.id + '"';
						html += 'aria-expanded="false" aria-controls="collapse_'
								+ type.id + '">';
						html += '<span class="glyphicon glyphicon-list"></span> <span>'
								+ type.name + '</span>';
						html += '</div>';
						html += '<div class="parent_right">';
						html += '<span class="glyphicon glyphicon-plus op-icon"  onclick="addChildMenu(\''
								+ type.id + '\',this)"></span>';
						html += '<span class="glyphicon glyphicon-trash op-icon"  onclick="delChildMenu(\''
								+ type.id + '\',this)"></span>';
						html += '<span class="glyphicon glyphicon-pencil op-icon"  onclick="updateChildMenuShow(\''
								+ type.id + '\',this)"></span>';
						html += '</div>';
						html += '</div>';
						html += '</div>';
						html += '<div id="collapse_' + type.id
								+ '" class="panel-collapse collapse"';
						html += 'role="tabpanel" aria-labelledby="heading_'
								+ type.id + '">';
						html += '<div class="panel-body">';
						html += '<div class="pb_left">';
						html += '<p class="ad_title">' + type.title + '</p>';
						html += '<p class="ad_desc">' + type.description
								+ '</p>';
						html += '<p class="ad_img"><img src="'
								+ CONTEXT_FILE_PATH + type.img + '" /></p>';
						html += '</div>';
						html += '<div class="pb_right">';
						html += '</div>';
						html += '</div>';
						html += '</div>';
						html += '</div>';
						$("#addForm")[0].reset();
						$("#accordion").prepend(html);
					}
					alert(data.retMsg);
				}
			});
}

/**
 * 修改modal
 */
function modifyTypeModal() {
	var columnData = dataTables.row(".selected").data();
	if (!columnData) {
		alert("请先选择数据！");
		return;
	}
	$("#update_id").val(columnData.id);
	$("#update_name").val(columnData.name);
	$("#update_description").val(columnData.description);
	$("#modifyModal").modal("show");
}

/**
 * 执行修改
 */
function updateWineType() {
	var id = $.trim($("#update_id").val());
	var name = $.trim($("#update_name").val());
	if (name.length < 1) {
		alert("请输入类别名称");
		return;
	}
	if (name.length > 20) {
		alert("类别名称长度不能超过20");
		return;
	}
	var img = $("#update_img_img").attr("val");
	if (img.length < 1) {
		alert("广告图片不能为空！");
		return;
	}
	var title = $.trim($("#update_title").val());
	if (title.length < 1) {
		alert("广告标题不能为空！");
		return;
	}
	var description = $.trim($("#update_description").val());
	if (description.length > 200) {
		alert("类别描述长度不能超过200");
		return;
	}
	$.ajax({
		url : CONTEXT_PATH + "/winetype/update.json",
		type : "post",
		dataType : "json",
		data : {
			"id" : id,
			"name" : name,
			"title" : title,
			"img" : img,
			"description" : description
		},
		success : function(data) {
			alert(data.retMsg);
			if (data.retCode == SUCCESS) {
				$("#modifyModal").modal("hide");
				window.location.reload();
			}
		}
	});
}

/**
 * 删除
 */
function delWineType() {
	var columnData = dataTables.row(".selected").data();
	if (!columnData) {
		alert("请选择一条数据！");
		return;
	}
	if (confirm("是否删除？")) {
		$.ajax({
			url : CONTEXT_PATH + "/winetype/del.json",
			type : "post",
			dataType : "json",
			data : {
				"id" : columnData.id
			},
			success : function(data) {
				if (data.retCode == SUCCESS) {
					$("#modifyModal").modal("hide");
				}
				alert(data.retMsg);
			}
		});
	}
}

/* Formatting function for row details - modify as you need */
function format(d) {
	// `d` is the original data object for the row
	var html = '';
	html += '<table class="table table-striped table-bordered table-hover child-table" cellpadding="5" cellspacing="0" border="0">';
	html += '<thead><th>编号</th><th>名称</th><th>描述</th><th>操作</th></thead>';
	html += '<tbody>';
	html += '<td>01</td>';
	html += '<td>红酒</td>';
	html += '<td>阿斯顿飞</td>';
	html += '<td><a href="">删除</a></td>';
	html += '</tbody>';
	html += '</table>';
	return html;
}

/** dragdrop */
function initialDragDrop() {
	$('#tuozhuai').droppable({
		activeClass : 'active',
		hoverClass : 'hover',
		accept : ":not(.ui-sortable-helper)", // Reject clones generated by
		// sortable
		drop : function(e, ui) {
		}
	}).sortable({
		items : '.panel',
		sort : function() {
			$(this).removeClass("active");
		}
	});
}

function initialChildDragDrop() {
	$('.pb_right').droppable({
		activeClass : 'active',
		hoverClass : 'hover',
		accept : ":not(.ui-sortable-helper)", // Reject clones generated by
		// sortable
		drop : function(e, ui) {
		}
	}).sortable({
		items : '.btn',
		sort : function() {
			$(this).removeClass("active");
		}
	});
}

/**
 * 添加子菜单
 * 
 * @param id
 * @param dom
 */
function addChildMenu(id, dom) {
	// $("#collapse_" + id).collapse('show');
	$("#add_child_id").val(id);
	$("#addChildTypeModal").modal("show");
}

/**
 * 删除子菜单
 * 
 * @param id
 * @param dom
 */
function delChildMenu(id, dom) {
	if (confirm("确定要删除该菜单类型？")) {
		$.ajax({
			url : CONTEXT_PATH + "/winetype/del.json",
			type : "post",
			dataType : "json",
			data : {
				"id" : id
			},
			success : function(data) {
				if (data.retCode == SUCCESS) {
					$("#collapse_" + id).parent().remove();
				}
				alert(data.retMsg);
			}
		});
	}
}

/**
 * 
 */
function addWineChildType() {
	var id = $.trim($("#add_child_id").val());
	var name = $.trim($("#add_child_name").val());
	if (name.length < 1) {
		alert("请输入子类型名！");
		return;
	}
	$.ajax({
		url : CONTEXT_PATH + "/childtype/add.json",
		type : "post",
		dataType : "json",
		data : {
			"typeId" : id,
			"name" : name
		},
		success : function(data) {
			if (data.retCode == SUCCESS) {
				$("#addChildTypeModal").modal("hide");
				showChildHtml(id, name);
			}
			alert(data.retMsg);
		}
	});
}

function addParentMenu(types) {
	var html = '';
	for (var i = 0; i < types.length; i++) {
		var type = types[i];
		var childTypes = type.childTypes;
		html += '<div class="panel panel-default" val="' + type.id + '">';
		html += '<div class="panel-heading" role="tab" id="heading_' + type.id
				+ '">';
		html += '<div class="panel-title clearfix">';
		html += '<div class="parent_left" data-toggle="collapse"';
		html += 'data-parent="#accordion" href="#collapse_' + type.id + '"';
		html += 'aria-expanded="false" aria-controls="collapse_' + type.id
				+ '">';
		html += '<span class="glyphicon glyphicon-list"></span> <span>'
				+ type.name + '</span>';
		html += '</div>';
		html += '<div class="parent_right">';
		html += '<span class="glyphicon glyphicon-plus op-icon"  onclick="addChildMenu(\''
				+ type.id + '\',this)"></span>';
		html += '<span class="glyphicon glyphicon-trash op-icon"  onclick="delChildMenu(\''
				+ type.id + '\',this)"></span>';
		html += '<span class="glyphicon glyphicon-pencil op-icon"  onclick="updateChildMenuShow(\''
				+ type.id
				+ '\',\''
				+ type.name
				+ '\',\''
				+ type.title
				+ '\',\''
				+ type.description
				+ '\',\''
				+ type.img
				+ '\')"></span>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '<div id="collapse_' + type.id
				+ '" class="panel-collapse collapse"';
		html += 'role="tabpanel" aria-labelledby="heading_' + type.id + '">';
		html += '<div class="panel-body">';
		html += '<div class="pb_left">';
		html += '<p class="ad_title">' + type.title + '</p>';
		html += '<p class="ad_desc">' + type.description + '</p>';
		html += '<p class="ad_img"><img src="' + CONTEXT_FILE_PATH + type.img
				+ '" /></p>';
		html += '</div>';
		html += '<div class="pb_right">';
		if (childTypes) {
			for (var j = 0; j < childTypes.length; j++) {
				var childType = childTypes[j];
				html += '<span class="btn btn-default">' + childType.name
						+ '</span>';
			}
		}
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		// initialDragDrop();
		// initialChildDragDrop();
	}
	$("#accordion").append(html);
}

/**
 * 展示html
 */
function showChildHtml(id, name) {
	var html = '<span class="btn btn-default">' + name + '</a>';
	$("#collapse_" + id + " .pb_right").append(html);
	$("#collapse_" + id).collapse('show');
}
/** dragdrop */

/**
 * 显示修改
 */
function updateChildMenuShow(id, name, title, description, img) {
	$("#update_id").val(id);
	$("#update_name").val(name);
	$("#update_title").val(title);
	$("#update_description").val(description);
	$("#update_img_img").attr({
		"val" : img,
		"src" : CONTEXT_FILE_PATH + img
	});
	$("#modifyModal").modal('show');
}

/**
 * 上传图片
 * 
 * @param id
 * @param type
 */
function uploadFile(id) {
	$.ajaxFileUpload({
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
				$("#" + id + "_img").attr({
					"src" : CONTEXT_FILE_PATH + "/" + imgurl,
					"val" : imgurl
				});
			}
		}
	});
}

/**
 * 排序
 * 
 * @param obj
 */
function sortWine() {
	$('#tuozhuai').droppable({
		hoverClass : 'hover',
		accept : ":not(.ui-sortable-helper)",
		drop : function(e, ui) {
		}
	}).sortable({
		items : '.panel',
		sort : function() {
			$(this).removeClass("active");
		}
	});
	$("#btnSort").attr({
		"onclick" : "saveSortWine()"
	});
	$("#btnSort").text("保 存");
}

/**
 * 保存排序
 * 
 * @param obj
 */
function saveSortWine() {
	$("#btnSort").attr({
		"onclick" : "sortWine()"
	});
	var ids = '';
	for (var i = 0; i < $("#accordion .panel").length; i++) {
		var id = $("#accordion .panel").eq(i).attr("val");
		ids += id + ',';
	}
	$("#btnSort").text("排 序");
	$("#tuozhuai").sortable("destroy");
	$.ajax({
		url : CONTEXT_PATH + "/winetype/savesort",
		type : "post",
		dataType : "json",
		data : {
			"ids" : ids
		},
		success : function(data) {
			var retCode = data.retCode;
			if (retCode == SUCCESS) {
			}
			alert(data.retMsg);
		}
	});
}