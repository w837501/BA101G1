
function selectChange() {
	var content =document.getElementById("input");
	if($('.error1_content').text()==' '&&$('.error1_phone').text()==' '&&$('.error1_name').text()==' '&&$('.error1_pw1').text()==' '&&$('.error1_pw').text()==' '&&$('.error1_acc').text()==' '){
		content.disabled=false;
	}else
		content.disabled=true;
}
