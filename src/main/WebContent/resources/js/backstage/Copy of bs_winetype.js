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
	initialTable();
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
	var description = $.trim($("#add_description").val());
	if (description.length > 200) {
		alert("类别描述长度不能超过200");
		return;
	}
	$.ajax({
		url : CONTEXT_PATH + "/winetype/add.json",
		type : "post",
		dataType : "json",
		data : {
			"name" : name,
			"description" : description
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
	dataTables = $('#dataTables-winetype').DataTable({
		"processing" : true,
		"serverSide" : true,
		"ordering" : false,
		ajax : {
			url : CONTEXT_PATH + "/winetype/list.json",
			type : "post"
		},
		language : language,
		columns : [ {
			"class" : "details-control",
			"orderable" : false,
			"data" : null,
			"defaultContent" : ""
		}, {
			data : "id",
			title : "编号"
		}, {
			data : "name",
			title : "名称"
		}, {
			data : "description",
			title : "描述"
		}, {
			data : "addTime",
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

	// 单行选择
	$('#dataTables-winetype tbody').on('click', 'tr', function() {
		if ($(this).hasClass('selected')) {
			$(this).removeClass('selected');
		} else {
			dataTables.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});

	// Array to track the ids of the details displayed rows
	var detailRows = [];

	$('#dataTables-winetype tbody').on('click', 'tr td.details-control',
			function() {
				var tr = $(this).closest('tr');
				var row = dataTables.row(tr);
				var idx = $.inArray(tr.attr('id'), detailRows);

				if (row.child.isShown()) {
					tr.removeClass('details');
					row.child.hide();

					// Remove from the 'open' array
					detailRows.splice(idx, 1);
				} else {
					tr.addClass('details');
					row.child(format(row.data())).show();

					// Add to the 'open' array
					if (idx === -1) {
						detailRows.push(tr.attr('id'));
					}
				}
			});

	// On each draw, loop over the `detailRows` array and show any child rows
	dataTables.on('draw', function() {
		$.each(detailRows, function(i, id) {
			$('#' + id + ' td.details-control').trigger('click');
		});
	});
}

/**
 * refresh data
 */
function refreshData() {
	// 选中行数据获取
	var column = dataTables.row(".selected").data();
	// dataTables.ajax.reload();
}

function invaild() {
	$.ajax({
		url : CONTEXT_PATH + "/winetype/list.json",
		type : "post",
		dataType : "json",
		data : {},
		success : function(data) {
			// alert(data.retData);
			dataTables = $('#dataTables-winetype').DataTable({
				ajax : CONTEXT_PATH + "/winetype/list.json",
				language : language,
				columns : [ {
					data : "id",
					title : "编号"
				}, {
					data : "name",
					title : "名称"
				}, {
					data : "description",
					title : "描述"
				}, {
					data : "addTime",
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
		}
	});
}

function modifyType() {
	
}

/* Formatting function for row details - modify as you need */
function format ( d ) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>Full name:</td>'+
            '<td>'+d.name+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Extension number:</td>'+
            '<td>'+d.extn+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Extra info:</td>'+
            '<td>And any further details here (images etc)...</td>'+
        '</tr>'+
    '</table>';
}