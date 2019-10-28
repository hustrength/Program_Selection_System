function break_group(gno) {
	
    $.ajax({
    	url: "servlet/serDeleteGPS?action=break&GNo="+gno,
        type: "GET",
        async: false,
        dataType: "text",
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("解散成功");
        	   location.reload();
           }
           else{
        	   alert("解散失败");
           }
        }
    })
}

function remove_member(gno,sno){
	$.ajax({
    	url: "servlet/serUpdateGPS?action=remove&GNo="+gno+"&SNo="+sno,
        type: "GET",
        async: false,
        dataType: "text",
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("踢出成功");
        	   location.reload();
           }
           else{
        	   alert("踢出失败");
           }
        }
    })
}

function transfer_leader(gno,sno){
	$.ajax({
    	url: "servlet/serUpdateGPS?action=transfer&GNo="+gno+"&SNo="+sno,
        type: "GET",
        async: false,
        dataType: "text",
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("转让成功");
        	   location.reload();
           }
           else{
        	   alert("转让失败");
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
					alert("已同意");
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