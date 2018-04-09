function clickPosition() {
	var d_number = $("#d_number").val();
	if (d_number == "") {
		toastr.warning("请先选择部门");
	}
}
//添加员工验证
function judgeInput() {
	var u_email = $("#u_email").val();
	var u_phone = $("#u_phone").val();
	var u_salary = $("#u_salary").val();
	var u_password = $("#u_password").val();
	var u_name = $("#u_name").val();
	var position = $("#position").val();
	var role = $("#role").val();
	if (position == "") {
		toastr.warning("请选择员工部门和职位信息");
	} else if (role == "") {
		toastr.warning("请选择员工角色");
	} else if(u_name == ""){
		toastr.warning("请输入员工姓名");	
	}else if(u_password == ""){
		toastr.warning("请输入密码");	
	}else if(u_salary == ""){
		toastr.warning("请输入员工薪资");	
	}else if(u_phone == ""){
		toastr.warning("请输入员工联系方式");	
	}else if(u_email == ""){
		toastr.warning("请输入员工联系邮箱");	
	}else{
		$("#feedback_form").submit();
	}
}
//验证部门
function dept(){
	var d_name = $("#d_name").val();
	var d_phone = $("#d_phone").val();
	var d_introduction = $("#d_introduction").val();
	//部门名称正则表达式
	var name = /^[\u4E00-\u9FFF]+$/
	//电话表达式
	var phone = /^1[3|4|5|7|8][0-9]{9}$/
	if(d_introduction==""){
		toastr.warning("请填写部门介绍");
	}else if(!phone.test(d_phone)){
		toastr.warning("请填写正确的电话号码");
	}else if(!name.test(d_name)){
		toastr.warning("部门名称只能是汉字");
	}else{
		$("#feedback_form").submit();
	}
}
function leave(){
	var l_start = $("#l_start").val();
	var l_end = $("#l_end").val();
	var time =  /"^[0-9]*[1-9][0-9]*$"/;
	var time1 = $("#l_duration").val();
	var l_cause = $("#l_cause").val();
	if(l_start==""){
		toastr.warning("请选择开始时间");
	}else if(l_end==""){
		toastr.warning("请选择结束时间");
	}else if(time.test(time1)){
		toastr.warning("请假时长请填写正整数");
	}else if(l_cause==""){
		toastr.warning("请填写请假原因");
	}else{
		$("#feedback_form").submit();
	}
}
function overtime(){
	var o_start = $("#o_start").val();
	var o_end = $("#o_end").val();
	var time =  /"^[0-9]*[1-9][0-9]*$"/;
	var time1 = $("#o_duration").val();
	var o_cause = $("#o_cause").val();
	if(o_start==""){
		toastr.warning("请选择开始时间");
	}else if(o_end==""){
		toastr.warning("请选择结束时间");
	}else if(time.test(time1)){
		toastr.warning("加班时长请填写正整数");
	}else if(o_cause==""){
		toastr.warning("请填写加班原因");
	}else{
		$("#feedback_form").submit();
	}
}