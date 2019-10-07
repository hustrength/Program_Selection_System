
function checkuserid(){
	var val=document.getElementById("userid").value;

	var ptn=/^[a-zA-Z][a-zA-Z0-9]{2,15}$/;
	
	if(val==null||val.trim().length==0||val==""){
		document.getElementById("s1").style.color="red";
		document.getElementById("s1").innerHTML="学号不能为空！";
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
