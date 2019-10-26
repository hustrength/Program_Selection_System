
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
	            } else {
	            	alert("提交加入申请失败");
				}
	            
	        }
  })
}

function agree(applicant_sno){
	
	 $.ajax({
	        url: "servlet/serUpdateApply?action=agree&SNo="+applicant_sno,
	        type: "GET",
	        async: false,
	        dataType: "text",
	        cache: false,
	        success: function (text) {
	            if (text === "success") {
					alert("已同意");
	            } else {
	            	alert("操作失败");
				}
	            
	        }
 })
}