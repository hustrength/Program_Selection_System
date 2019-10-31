function pro_release() {
	
    $.ajax({
    	url: "servlet/serDoInsertPro?action=create",
        type: "post",
        async: false,
        data: $('#form_pro').serialize(),
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("发布成功");
        	   location.reload();
           }
           else{
        	   alert("发布失败");
           }
        }
    })
}