<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>文件上传</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet" />
<link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
<link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/style-responsive.css" rel="stylesheet" />
<link href="css/jquery-ui-1.10.4.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/dialog.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-ui-1.10.4.min.js"></script>
<script src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/dialog.js"></script>
</head>

<body>
	<section id="main-content">
	<section class="wrapper">
	<!-- Form validations -->
	<div class="row">
		<div class="col-lg-12">
		<!-- 文件上传面板开始 -->
			<section class="panel">
				<header class="panel-heading">文件上传</header>
					<div class="panel-body">
						<div class="form">
							<form class="form-validate form-horizontal" id="feedback_form"
								  method="post" action="file_upFile" enctype="multipart/form-data">
								<div class="form-group ">
									<div>
										<label for="curl" class="control-label col-lg-2">文件介绍
											<span class="required">*</span>
										</label>
									</div>
									<div class="col-sm-8">
										<textarea id="f_introduce" class="form-control"></textarea>
									</div>
								</div>
								<%-- <div class="form-group ">
									<div>
										<label for="curl" class="control-label col-lg-2">所属部门
											<span class="required">*</span>
										</label>
									</div>
									<div class="col-sm-8">
										<select id="select_dept" class="form-control m-bot15" name="d_number">
											<option value="-1">所有部门</option>
											<c:if test="${user.role_num == '003' }">
												<c:forEach items="${alldept}" var="deptInfo">
													<option value="${deptInfo.d_number}">${deptInfo.d_name}</option>
												</c:forEach>
											</c:if>
											<c:if test="${user.role_num == '001'||user.role_num == '002' }">
												<option value="${user.d_number}">${user.d_name}</option>
											</c:if>
										</select>
									</div>
								</div> --%>
								<div class="form-group ">
									<div>
										<label for="curl" class="control-label col-lg-2">文件上传
											<span class="required">*</span>
										</label>
									</div>
									<input id="lefile" type="file" style="display: none"
										name="file" onchange="change();">
									<div class="col-sm-8">
										<input id="filePath" class="form-control" type="text"
												disabled="disabled">
									</div>
									<div class="col-sm-1">
										<a class="btn btn-primary"
											onclick="$('input[id=lefile]').click();">选择文件</a>
									</div>
									</div>
								<div class="form-group" style="text-align: right;">
									<div class="col-lg-offset-2 col-lg-10">
										<button id="from_submit" class="btn btn-primary"
											type="button" disabled="disabled" data-toggle="modal"
											data-target="#myModal" onclick="uploadFile();">提交</button>
										<button class="btn btn-default" type="button" onclick="reset();">重置</button>
									</div>
								</div>
							</form>
						</div>
					</div>
						<!-- 模态框（Modal） -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true"
							data-backdrop="static" data-keyboard="false">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">文件上传中</h4>
									</div>
									<div class="modal-body">
										<div id="progress" class="progress progress-striped">
											<div id="son" class="progress-bar progress-bar-success"
												role="progressbar" aria-valuenow="60" aria-valuemin="0"
												aria-valuemax="100" style="width: 0%;">
												<span class="sr-only"></span>
											</div>
										</div>
										<div id="introduce_content"></div>
									</div>
									<div class="modal-footer">
										<button id="modal_stop" type="button" class="btn btn-danger"onclick="ajaxStop();">取消</button>
										<button id="modal_close" type="button" class="btn btn-default"
											data-dismiss="modal" onclick="click_close();"
											disabled="disabled">关闭</button>
									</div>
								</div>
							</div>
						</div>
					</section>
					<!-- 文件上传面板结束 -->
				</div>
			</div>
		</section>
	</section>


</body>
<script type="text/javascript">
	function click_close(){
		window.location.href="";
	
	}
	function change(){
		$("#from_submit").attr("disabled", false); 
		$('#filePath').val(getFileName($('input[id=lefile]').val()));
	}
	function getFileName(path){
		var pos1 = path.lastIndexOf('/');
		var pos2 = path.lastIndexOf('\\');
		var pos = Math.max(pos1, pos2);
		if( pos<0 )
			return path;
		else
			return path.substring(pos+1);
	}

function uploadFile(){
	// 获取上传文件，放到 formData对象里面
   	$("#modal_stop").attr("disabled",false);
	var file = $("#lefile").get(0).files[0];
	var f_introduce = $("#f_introduce").val();
	var d_number = $("#select_dept").val();
　　 	//var d_name = $("#select_dept option:selected").text();
	var formData = new FormData();
	formData.append("file" , file);   
	formData.append("f_introduce",f_introduce);
	formData.append("d_number",d_number);
	$.ajax({
		type: "POST",
		url: "upload.do",
		data: formData ,//这里上传的数据使用了formData 对象
		processData : false,  
		//必须false才会自动加上正确的Content-Type   
		contentType : false ,
		//这里我们先拿到jQuery产生的 XMLHttpRequest对象，为其增加 progress 事件绑定，然后再返回交给ajax使用
		xhr: function(){
			var xhr = $.ajaxSettings.xhr();
			if(onprogress && xhr.upload) {
				xhr.upload.addEventListener("progress" , onprogress, false);
				return xhr;
			}
		} 
	});
}
 function onprogress(evt){
        var loaded = evt.loaded;                  //已经上传大小情况 
        var tot = evt.total;                      //附件总大小 
        var per = Math.floor(100*loaded/tot);      //已经上传的百分比  
        if(per == 100){
        	$("#modal_close").attr("disabled", false); 
        	$("#modal_stop").attr("disabled",true);
        }
        $("#son").html( per +"%" );
        $("#son").css("width" , per +"%");
    }
 function ajaxStop(){
	 var xhr = $.ajaxSettings.xhr();
	 xhr.abort();
 }
</script>


</html>