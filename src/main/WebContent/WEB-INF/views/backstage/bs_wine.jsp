<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>红酒商城后台管理系统</title>

<%@ include file="./include/bs_public.jsp"%>
<!-- DataTables Responsive CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugin/startbootstrap/bower_components/datatables-responsive/css/dataTables.responsive.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugin/fileinput/css/fileinput.min.css">
<!-- <link rel="stylesheet" -->
<!-- 	href="//netdna.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.css"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugin/summernote-0.7.0-dist/summernote.css">
<!-- DataTables JavaScript -->
<script
	src="${pageContext.request.contextPath }/resources/plugin/startbootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugin/startbootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
<script
	src='${pageContext.request.contextPath }/resources/plugin/fileinput/js/fileinput.min.js'></script>
<script
	src='${pageContext.request.contextPath }/resources/plugin/fileinput/js/fileinput_locale_zh.js'></script>
<script
	src='${pageContext.request.contextPath }/resources/js/ajaxfileupload.js'></script>
<script
	src='${pageContext.request.contextPath }/resources/plugin/summernote-0.7.0-dist/summernote.js'></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/backstage/bs_wine.js"></script>
<style type="text/css">
.file-preview-frame {
	width: 100px;
}

.img-rounded {
	width: 200px;
}

table.dataTable tbody tr.selected {
	background-color: #b0bed9;
}

tr.highlight {
	background-color: #ccc !important;
}

.input_width {
	width: auto;
}

.pro_img {
	width: 128px;
	height: 128px;
}

.modal-body-fixed {
	height: 400px;
	overflow: auto;
}
</style>
</head>

<body>

	<div id="wrapper">

		<!-- header -->
		<%@ include file="./include/bs_header.jsp"%>
		<!-- header -->

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">红酒管理</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<button type="button" class="btn btn-default"
								onclick="clickAddShow()">添加</button>
							<button type="button" class="btn btn-default"
								onclick="clickModifyModalShow()">修改</button>
							<button type="button" class="btn btn-default"
								onclick="clickDel()">删除</button>
							<button type="button" class="btn btn-default"
								onclick="clickSetRecommend()">设为推荐</button>
							<button type="button" class="btn btn-default"
								onclick="clickSetSpecial()">设为特价</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-wine">
								</table>
							</div>
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- MODAL -->

	<!-- /.新增类型 -->
	<div id="addModal" class="modal fade bs-example-modal-lg"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">添加</h4>
				</div>
				<div class="modal-body modal-body-fixed">
					<form id="addForm" class="form-horizontal">
						<div class="form-group">
							<label for="add_name" class="col-sm-2 control-label">名称</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="add_name"
									maxlength="20" />
							</div>
							<label for="add_placeoforigin" class="col-sm-2 control-label">产地</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="add_placeoforigin" />
							</div>
						</div>
						<div class="form-group">
							<label for="add_cover" class="col-sm-2 control-label">封面图</label>
							<div class="col-sm-10 input_width">
								<img id="add_cover_img"
									src="${pageContext.request.contextPath }/resources/images/default_wine.png"
									val="/resources/images/default_wine.png" alt="单击选择封面图"
									class="img-rounded pro_img" onclick="$('#add_cover').click()">
								<input id="add_cover" name="add_cover" name="add_cover"
									type="file" style="display: none;"
									onchange="uploadFile('add_cover',1)">
							</div>
						</div>
						<div class="form-group">
							<label for="add_pimg" class="col-sm-2 control-label">产品图片</label>
							<div class="col-sm-10">
								<input id="add_pimg" name="add_pimg" type="file"
									style="display: none;" onchange="uploadFile('add_pimg',2)">
								<div id="add_pimg_container" class="row">
									<div class="col-xs-6 col-md-3">
										<img onclick="$('#add_pimg').click()"
											src="${pageContext.request.contextPath }/resources/images/add.png"
											alt="单击上传图片">
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="add_price" class="col-sm-2 control-label">单价</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="add_price"
									maxlength="10" />
							</div>
							<label for="add_discountPrice" class="col-sm-2 control-label">折扣价</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="add_discountPrice"
									maxlength="10" />
							</div>
						</div>
						<div class="form-group">
							<label for="add_stock" class="col-sm-2 control-label">库存</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="add_stock"
									maxlength="5" />
							</div>
							<label for="add_capacity" class="col-sm-2 control-label">容量</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="add_capacity"
									max="50" />
							</div>
						</div>
						<div class="form-group">
							<label for="add_varieties" class="col-sm-2 control-label">品种</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="add_varieties"
									maxlength="50" />
							</div>
							<label for="add_typeId" class="col-sm-2 control-label">类型</label>
							<div class="col-sm-10 input_width">
								<select class="form-control" id="add_typeId">
									<option value="">类型</option>
									<c:forEach items="${types }" var="type">
										<option value="${type.id }">${type.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="add_alcohol" class="col-sm-2 control-label">酒精度</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="add_alcohol" />
							</div>
							<label for="add_storageCondition" class="col-sm-2 control-label">贮藏条件</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control"
									id="add_storageCondition" />
							</div>
						</div>
						<div class="form-group">
							<label for="add_description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="add_description"
									maxlength="500"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="add_storageCondition" class="col-sm-2 control-label">详情</label>
							<div class="col-sm-10">
								<div id="add_detail"></div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="addWine()">保
						存</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.新增类型 -->

	<!-- /.修改类型 -->
	<div id="modifyModal" class="modal fade bs-example-modal-lg"
		data-keyboard="false" data-backdrop="static">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修改</h4>
				</div>
				<div class="modal-body modal-body-fixed">
					<form id="updateForm" class="form-horizontal">
						<input type="hidden" id="update_id" />
						<div class="form-group">
							<label for="update_name" class="col-sm-2 control-label">名称</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="update_name"
									maxlength="20" />
							</div>
							<label for="update_placeoforigin" class="col-sm-2 control-label">产地</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control"
									id="update_placeoforigin" />
							</div>
						</div>
						<div class="form-group">
							<label for="update_cover" class="col-sm-2 control-label">封面图</label>
							<div class="col-sm-10 input_width">
								<img id="update_cover_img"
									src="${pageContext.request.contextPath }/resources/images/default_wine.png"
									val="/resources/images/default_wine.png" alt="单击选择封面图"
									class="img-rounded pro_img"
									onclick="$('#update_cover').click()"> <input
									id="update_cover" name="update_cover" name="update_cover"
									type="file" style="display: none;"
									onchange="uploadFile('update_cover',1)">
							</div>
						</div>
						<div class="form-group">
							<label for="update_pimg" class="col-sm-2 control-label">产品图片</label>
							<div class="col-sm-10">
								<input id="update_pimg" name="update_pimg" type="file"
									style="display: none;" onchange="uploadFile('update_pimg',2)">
								<div id="update_pimg_container" class="row">
									<div class="col-xs-6 col-md-3">
										<img onclick="$('#update_pimg').click()"
											src="${pageContext.request.contextPath }/resources/images/add.png"
											alt="单击上传图片">
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="update_price" class="col-sm-2 control-label">单价</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="update_price"
									maxlength="10" />
							</div>
							<label for="update_discountPrice" class="col-sm-2 control-label">折扣价</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control"
									id="update_discountPrice" maxlength="10" />
							</div>
						</div>
						<div class="form-group">
							<label for="update_stock" class="col-sm-2 control-label">库存</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="update_stock"
									maxlength="5" />
							</div>
							<label for="update_capacity" class="col-sm-2 control-label">容量</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="update_capacity"
									max="50" />
							</div>
						</div>
						<div class="form-group">
							<label for="update_varieties" class="col-sm-2 control-label">品种</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="update_varieties"
									maxlength="50" />
							</div>
							<label for="update_typeId" class="col-sm-2 control-label">类型</label>
							<div class="col-sm-10 input_width">
								<select class="form-control" id="update_typeId">
									<c:forEach items="${types }" var="type">
										<option value="${type.id }">${type.name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="update_alcohol" class="col-sm-2 control-label">酒精度</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control" id="update_alcohol" />
							</div>
							<label for="update_storageCondition"
								class="col-sm-2 control-label">贮藏条件</label>
							<div class="col-sm-10 input_width">
								<input type="text" class="form-control"
									id="update_storageCondition" />
							</div>
						</div>
						<div class="form-group">
							<label for="update_description" class="col-sm-2 control-label">描述</label>
							<div class="col-sm-10">
								<textarea class="form-control" id="update_description"
									maxlength="500"></textarea>
							</div>
						</div>
						<div class="form-group">
							<label for="update_storageCondition"
								class="col-sm-2 control-label">详情</label>
							<div class="col-sm-10">
								<div id="update_detail"></div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="clickModify()">修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.修改类型 -->
</body>
</html>