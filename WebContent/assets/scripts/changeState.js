$(".changeState").click(function(){
	var name = $(this).next(":input").val();
	var flag = confirm("确定变更 "+ name +" 的状态？");
	var $a = $(this);
	var $state = $a.parent().parent().prev().find("span");
	if(flag){
		var url = this.href;
		var args = {"time":new Date()}
		$.post(url,args,function(data){
			if(data == "1"){
				if($a.text() == "启用"){
					$a.text("禁用");
					$state.text("启用");
					$a.parent().attr("class","label label-danger");
					$state.attr("class","label label-success");
				}else{
					$a.text("启用");
					$state.text("禁用");
					$a.parent().attr("class","label label-success");
					$state.attr("class","label label-danger");
				}
				//系统消息提醒
				
			}else{
				alert("修改失败");
				}
			});
		}
	return false;
})