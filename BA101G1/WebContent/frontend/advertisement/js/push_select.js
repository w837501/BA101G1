
function selectChange() {
	var content =document.getElementById("ad_push_content");
	if(document.getElementById("push_select").value=="1"){
		content.disabled=false;
	}else
		content.disabled=true;
}
