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

<title>官网后台管理系统</title>

<%@ include file="./include/bs_public.jsp"%>
<!-- DataTables Responsive CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/plugin/startbootstrap/bower_components/datatables-responsive/css/dataTables.responsive.css">
<!-- DataTables JavaScript -->
<script
	src="${pageContext.request.contextPath }/resources/plugin/startbootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/plugin/startbootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
</head>

<body>

	<div id="wrapper">

		<!-- header -->
		<%@ include file="./include/bs_header.jsp"%>
		<!-- header -->

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">产品案例</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- /#wrapper -->
</body>
</html>
