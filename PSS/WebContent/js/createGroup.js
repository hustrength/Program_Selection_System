var flag=false;
function checkGnamerepeat() {
	var ele = document.getElementById("Gname");
	var val = ele.value;
	
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
	
	if(flag==false) return false;
	
	var group_project="stu/project_group.jsp";
	
    $.ajax({
    	url: "servlet/serInsertGPS?action=create",
        type: "post",
        async: false,
        data: $('#form_create').serialize(),
        dataType: "text",
        success: function (text) {
           if(text=="success"){
        	   alert("创建成功");
        	   $("#form_create").attr("action",group_project);
           }
           else{
        	   alert("创建失败");
           }
        }
    })
    
}
function show_remains(){
	var e = document.getElementById("remained_group");
	var pno = document.getElementById("PNo").value;
	
	$.ajax({
        url: "servlet/serDoQueryPro?action=getremain&PNo=" + pno,
        type: "GET",
        async: false,
        dataType: "text",
        cache: false,
        success: function (text) {
        	
            	e.innerText="剩余可选组数：" + text;
        }
    })
	
}
