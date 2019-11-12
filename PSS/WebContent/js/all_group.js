
function apply(gno,gname,sno){
	 $.ajax({
	        url: "servlet/serInsertApply?action=apply&GNo="+gno+"&Gname="+gname,
	        type: "GET",
	        async: false,
	        dataType: "text",
	        cache: false,
	        success: function (text) {
	            if (text === "success") {
					alert("提交加入申请成功");
	            } 
	            else if(text=="applied") {
	            	alert("你已申请过该团队");
				}
	            else {
	            	alert("申请失败");
	            }
	        }
  })
}


