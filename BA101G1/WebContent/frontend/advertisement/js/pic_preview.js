function doFirst() {
	document.getElementById("upfile1").onchange = fileChange;
}
function fileChange() {
	var file = document.getElementById('upfile1').files[0];

	var readFile = new FileReader();
	readFile.readAsDataURL(file);
	readFile.addEventListener('load', function() {
		var image = document.getElementById('image')
		image.removeAttribute("src");
		image.src = this.result;
	}, false);
}

window.addEventListener('load', doFirst, false);