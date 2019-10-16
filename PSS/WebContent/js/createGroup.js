var flag=false;
function checkGnamerepeat() {
	var ele = document.getElementById("Gname");
	var val = v.value;
	
    $.ajax({
        url: "servlet/serQueryGPS?action=checkGname&Gname=" + val,
        type: "GET",
        async: false,
        dataType: "text",
        cache: false,
        success: function (text) {
            if (text === "true") {
				flag=true;
            } else {
            	flag=false;
				ele.setCustomValidity("团队名已被注册");
			}
           
        }
    })
}

function create_group() {
	//if(flag==false) return false;
    $.ajax({
    	url: "servlet/serInsertGPS?action=create&",
        type: "post",
        async: false,
        data: $('#form_create').serialize(),
        dataType: "text",
        success: function (text) {
           if(text=="success"){
        	   alert("创建成功");
           }
           else{
        	   alert("创建失败");
           }
        }
    })
}

