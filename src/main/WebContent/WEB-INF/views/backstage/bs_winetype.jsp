<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>红酒商城后台管理系统</title>
<script
	src='http://codepen.io/assets/libs/fullpage/jquery_and_jqueryui.js'></script>
<%@ include file="./include/bs_public.jsp"%>
<!-- <script -->
<script
	src='${pageContext.request.contextPath }/resources/js/ajaxfileupload.js'></script>
<script
	src="http://ajax.useso.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<!-- jQuery Touch Punch - Enable Touch Drag and Drop -->
<script
	src="http://www.jqcool.net/demo/201404/jquery-shapeshift/core/vendor/jquery.touch-punch.min.js"></script>
<!-- jQuery.Shapeshift -->
<script
	src="http://www.jqcool.net/demo/201404/jquery-shapeshift/core/jquery.shapeshift.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/backstage/bs_winetype.js"></script>
<style type="text/css">
.selected {
	background-color: #abb9d3 !important;
}

table tbody .details-control {
	background: url("../resources/images/details_open.png") no-repeat scroll
		center center rgba(0, 0, 0, 0);
}

tr.details td.details-control {
	background: url("../resources/images/details_close.png") no-repeat
		scroll center center rgba(0, 0, 0, 0);
}

.child-table {
	width: 90%;
	margin-left: 10%;
	padding-left: 50px;
}

/****/
.clearfix:after {
	content: ".";
	display: block;
	height: 0;
	font-size: 0;
	clear: both;
	visibility: hidden;
}

.clearfix {
	display: inline-block;
}

* html .clearfix {
	height: 1%;
}

.clearfix {
	display: block;
}

.btn {
	margin-left: 10px;
}

.parent_left {
	width: 80%;
	float: left;
	cursor: pointer;
}

.pb_left {
	border-right: 1px solid #ccc;
}

.pb_left p {
	text-align: center;
}

.parent_right {
	width: 20%;
	float: right;
	text-align: center;
}

.pb_left {
	width: 30%;
	float: left;
}

.pb_right {
	width: 70%;
	float: right;
}

.ad_title {
	font-weight: bold;
}

.ad_img img {
	height: 250px;;
}

.op-icon {
	cursor: pointer;
	margin-right: 10px;
}
/****/
.pro_img {
	height: 200px;
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
					<h1 class="page-header">红酒类型管理</h1>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<button type="button" class="btn btn-default" data-toggle="modal"
								data-target="#addModal">新 增</button>
							<button id="btnSort" type="button" class="btn btn-default"
								onclick="sortWine()">排 序</button>
						</div>
						<div class="panel-body">
							<!-- dragdrop 拖拽菜单 -->
							<div id="tuozhuai">
								<div class="panel-group" id="accordion" role="tablist"
									aria-multiselectable="true"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->

	<!-- MODAL -->

	<!-- /.新增类型 -->
	<div id="addModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">新 增</h4>
				</div>
				<div class="modal-body">
					<form id="addForm" class="form-horizontal"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="add_name" class="col-sm-2 control-label">类别名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_name"
									maxlength="20" />
							</div>
						</div>
						<div class="form-group">
							<label for="add_title" class="col-sm-2 control-label">类别标题</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_title"
									maxlength="20" />
							</div>
						</div>
						<div class="form-group">
							<label for="add_description" class="col-sm-2 control-label">类别描述</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="add_description"
									maxlength="20" />
							</div>
						</div>
						<div class="form-group">
							<label for="add_img" class="col-sm-2 control-label">类别图片</label>
							<div class="col-sm-10">
								<div class="form-group">
									<img id="add_img_img"
										src="${pageContext.request.contextPath }/resources/images/default_wine.png"
										val="/resources/images/default_wine.png" alt="单击选择封面图"
										class="img-rounded pro_img" onclick="$('#add_img').click()">
									<input id="add_img" name="add_img" type="file"
										style="display: none;" onchange="uploadFile('add_img')" />
								</div>
							</div>
						</div>
						<div class="form-group" style="display: none;">
							<label for="add_remark" class="col-sm-2 control-label">类别描述</label>
							<div class="col-sm-10">
								<textarea type="text" class="form-control" id="add_remark"
									maxlength="200"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="addWineType()">保 存</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.新增类型 -->


	<!-- /.修改类型 -->
	<div id="modifyModal" class="modal fade">
		<input id="update_id" type="hidden">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">修 改</h4>
				</div>
				<div class="modal-body">
					<form id="updateForm" class="form-horizontal"
						enctype="multipart/form-data">
						<div class="form-group">
							<label for="update_name" class="col-sm-2 control-label">类别名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="update_name"
									maxlength="20" />
							</div>
						</div>
						<div class="form-group">
							<label for="update_title" class="col-sm-2 control-label">类别标题</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="update_title"
									maxlength="20" />
							</div>
						</div>
						<div class="form-group">
							<label for="update_description" class="col-sm-2 control-label">类别描述</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="update_description"
									maxlength="20" />
							</div>
						</div>
						<div class="form-group">
							<label for="update_img" class="col-sm-2 control-label">类别图片</label>
							<div class="col-sm-10">
								<div class="form-group">
									<img id="update_img_img"
										src="${pageContext.request.contextPath }/resources/images/default_wine.png"
										val="/resources/images/default_wine.png" alt="单击选择封面图"
										class="img-rounded pro_img" onclick="$('#update_img').click()">
									<input id="update_img" name="update_img" type="file"
										style="display: none;" onchange="uploadFile('update_img')" />
								</div>
							</div>
						</div>
						<div class="form-group" style="display: none;">
							<label for="update_remark" class="col-sm-2 control-label">类别描述</label>
							<div class="col-sm-10">
								<textarea type="text" class="form-control" id="update_remark"
									maxlength="200"></textarea>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="updateWineType()">修 改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.修改类型 -->

	<!-- /.新增子类型 -->
	<div id="addChildTypeModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">新增子类型</h4>
				</div>
				<div class="modal-body">
					<form id="addForm" class="form-horizontal"
						enctype="multipart/form-data">
						<input id="add_child_id" type="hidden" />
						<div class="form-group">
							<label for="add_name" class="col-sm-3 control-label">子类型名称</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="add_child_name"
									maxlength="20" />
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						onclick="addWineChildType()">保 存</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.新增子类型 -->
</body>
</html>
