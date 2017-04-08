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

<%@ include file="./include/bs_public.jsp"%>
<!-- DataTables Responsive CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugin/startbootstrap/bower_components/datatables-responsive/css/dataTables.responsive.css">
<!-- DataTables JavaScript -->
<script
	src="${pageContext.request.contextPath }/resources/plugin/startbootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugin/startbootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/backstage/bs_winetype.js"></script>
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
								data-target="#addModal">新增分类</button>
						</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<div class="dataTable_wrapper">
								<table class="table table-striped table-bordered table-hover"
									id="dataTables-example">
									<thead>
										<tr>
											<th>Rendering engine</th>
											<th>Browser</th>
											<th>Platform(s)</th>
											<th>Engine version</th>
											<th>CSS grade</th>
										</tr>
									</thead>
									<tbody>
										<tr class="odd gradeX">
											<td>Trident</td>
											<td>Internet Explorer 4.0</td>
											<td>Win 95+</td>
											<td class="center">4</td>
											<td class="center">X</td>
										</tr>
										<tr class="even gradeC">
											<td>Trident</td>
											<td>Internet Explorer 5.0</td>
											<td>Win 95+</td>
											<td class="center">5</td>
											<td class="center">C</td>
										</tr>
										<tr class="odd gradeA">
											<td>Trident</td>
											<td>Internet Explorer 5.5</td>
											<td>Win 95+</td>
											<td class="center">5.5</td>
											<td class="center">A</td>
										</tr>
										<tr class="even gradeA">
											<td>Trident</td>
											<td>Internet Explorer 6</td>
											<td>Win 98+</td>
											<td class="center">6</td>
											<td class="center">A</td>
										</tr>
										<tr class="odd gradeA">
											<td>Trident</td>
											<td>Internet Explorer 7</td>
											<td>Win XP SP2+</td>
											<td class="center">7</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.6</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">1.6</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.7</td>
											<td>Win 98+ / OSX.1+</td>
											<td class="center">1.7</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Mozilla 1.8</td>
											<td>Win 98+ / OSX.1+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Gecko</td>
											<td>Seamonkey 1.1</td>
											<td>Win 98+ / OSX.2+</td>
											<td class="center">1.8</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>iPod Touch / iPhone</td>
											<td>iPod</td>
											<td class="center">420.1</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Webkit</td>
											<td>S60</td>
											<td>S60</td>
											<td class="center">413</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera 7.0</td>
											<td>Win 95+ / OSX.1+</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
										<tr class="gradeA">
											<td>Presto</td>
											<td>Opera for Wii</td>
											<td>Wii</td>
											<td class="center">-</td>
											<td class="center">A</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /.table-responsive -->
							<div class="well">
								<h4>DataTables Usage Information</h4>
								<p>
									DataTables is a very flexible, advanced tables plugin for
									jQuery. In SB Admin, we are using a specialized version of
									DataTables built for Bootstrap 3. We have also customized the
									table headings to use Font Awesome icons in place of images.
									For complete documentation on DataTables, visit their website
									at <a target="_blank" href="https://datatables.net/">https://datatables.net/</a>.
								</p>
								<a class="btn btn-default btn-lg btn-block" target="_blank"
									href="https://datatables.net/">View DataTables
									Documentation</a>
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
	<div id="addModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">新增分类</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<input type="hidden" id="approved_id" />
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="approved_username"
									readonly="readonly" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">学校</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="approved_school"
									disabled="disabled" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">学段</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"
									id="approved_rangeOfGrade" disabled="disabled" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">工龄</label>
							<div class="col-sm-10">
								<input type="text" class="form-control"
									id="approved_numberOfYear" disabled="disabled" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">学科</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="approved_discipline"
									disabled="disabled" />
							</div>
						</div>
						<div class="form-group">
							<label for="inputEmail3" class="col-sm-2 control-label">证书</label>
							<div class="col-sm-10">
								<div class="row" id="approved_certificate">
									<div class="col-xs-6 col-md-3">
										<a href="#" class="thumbnail"> <img
											src="http://t12.baidu.com/it/u=3289489283,3828898207&fm=76"
											alt="证书">
										</a>
									</div>
									<div class="col-xs-6 col-md-3">
										<a href="#" class="thumbnail"> <img
											src="http://t12.baidu.com/it/u=3289489283,3828898207&fm=76"
											alt="证书">
										</a>
									</div>
									<div class="col-xs-6 col-md-3">
										<a href="#" class="thumbnail"> <img
											src="http://t12.baidu.com/it/u=3289489283,3828898207&fm=76"
											alt="证书">
										</a>
									</div>
									<div class="col-xs-6 col-md-3">
										<a href="#" class="thumbnail"> <img
											src="http://t12.baidu.com/it/u=3289489283,3828898207&fm=76"
											alt="证书">
										</a>
									</div>
									<div class="col-xs-6 col-md-3">
										<a href="#" class="thumbnail"> <img
											src="http://t12.baidu.com/it/u=3289489283,3828898207&fm=76"
											alt="证书">
										</a>
									</div>
									<div class="col-xs-6 col-md-3">
										<a href="#" class="thumbnail"> <img
											src="http://t12.baidu.com/it/u=3289489283,3828898207&fm=76"
											alt="证书">
										</a>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default"
						onclick="notPassApproved()">驳 回</button>
					<button type="button" class="btn btn-primary"
						onclick="passApproved()">通 过</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /.新增类型 -->
</body>
</html>
