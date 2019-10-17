
function apply(gno, sno){
	 $.ajax({
	        url: "servlet/serInsertApply?action=apply&GNo="+gno+"&SNo="+sno,
	        type: "GET",
	        async: false,
	        dataType: "text",
	        cache: false,
	        success: function (text) {
	            if (text === "success") {
					alert("提交加入申请成功");
	            } else {
	            	alert("提交加入申请失败");
				}
	            
	        }
  })
}