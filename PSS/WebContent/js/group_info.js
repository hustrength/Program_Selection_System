function apply(i, sno){
	var tab=document.getElementById("list_group");
    var rows=tab.rows;
	alert(rows[i+1].cells[3].innerText);
	alert(sno);
}