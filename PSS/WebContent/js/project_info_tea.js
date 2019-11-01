function pro_edit() {
	
    $.ajax({
    	url: "servlet/serDoUpdatePro?action=update",
        type: "post",
        async: false,
        data: $('#form_pro').serialize(),
        cache: false,
        success: function (text) {
           if(text=="success"){
        	   alert("修改成功");
        	   $("#form_pro").attr("action","tea/project_info_tea.jsp");
        	   
           }
           else{
        	   alert("修改失败");
           }
        }
    })
}