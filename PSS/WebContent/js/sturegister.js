
function checkidrepeat(val,ele){
	$.ajax({
        url:"servlet/serRegisterStu?action=checkuserid&userid="+val,
        type:"GET",
        async:false,
        dataType: "text",
        cache:false,
        success:function(text){
        	
        	if(text=="true"){
        		
        		ele.style.color="blue";
				ele.innerHTML="该学号可用！";
        	}
        	else {
        		ele.style.color="red";
				ele.innerHTML="该学号已被注册！";
        	}
            console.log(1);
        },
    })
	
	
}
function checkuserid(){
	var val=document.getElementById("userid").value;

	var ptn=/^[A-Z][0-9]{1,15}$/;
	
	if(val==null||val.trim().length==0||val==""){
		document.getElementById("s1").style.color="red";
		document.getElementById("s1").innerHTML="学号不能为空！";
	}
	else if(!ptn.exec(val)){
		document.getElementById("s1").style.color="red";
		document.getElementById("s1").innerHTML="学号格式不正确！";
	}
	else{
		document.getElementById("s1").style.color="red";
		document.getElementById("s1").innerHTML="";
		var ele=document.getElementById("s1");
		checkidrepeat(val,ele);
	}
	
}
function checkpassword(){
	
}
function recheckpassword(){
	
}
function checkusername(){
	
}
function checksex(){
	
}
function checkclass(){
	
}
