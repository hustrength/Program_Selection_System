function break_group(gno) {
	alert(gno);
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