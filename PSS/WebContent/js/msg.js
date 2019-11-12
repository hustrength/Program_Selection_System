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
					$("#msg").load(location.href+" #msg");
	            } 
	            else if(text=="ismember") {
	            	alert("该同学已加入别的组");
				}
	            else {
	            	alert("操作失败")
	            }
	        }
})
}

function refuse(applicant_sno){
	 $.ajax({
	        url: "servlet/serUpdateApply?action=refuse&SNo="+applicant_sno,
	        type: "GET",
	        async: false,
	        dataType: "text",
	        cache: false,
	        success: function (text) {
	            if (text === "success") {
					alert("已拒绝");
					$("#msg").load(location.href+" #msg");
	            } 
	            else if(text=="ismember") {
	            	alert("该同学已加入别的组");
				}
	            else {
	            	alert("操作失败")
	            }
	        }
})
}