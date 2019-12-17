function subtractQty(){
    if(document.getElementById("qty").value - 1 < 0)
        return;
    else
        document.getElementById("qty").value--;
}

function addQty(x) {
	if(document.getElementById("qty").value+1 > x)
		return;
	document.getElementById("qty").value++;
}

function checkQty(){
	if(document.getElementById("qty").value == 0){
		var node = document.createTextNode("Số lượng sản phẩm phải lớn hơn 0");
		var element = document.getElementById("alertQty");
		element.appendChild(node);
		return false;
	}
	return true;
}

function subtractQty1() {
    if(document.getElementById("qty1").value - 1 < 0)
        return;
    else
        document.getElementById("qty1").value--;
}

function subtractQty2() {
    if(document.getElementById("qty2").value - 1 < 0)
        return;
    else
        document.getElementById("qty2").value--;
}

function subtractQty3() {
    if(document.getElementById("qty3").value - 1 < 0)
        return;
    else
        document.getElementById("qty3").value--;
}

function subtractQty4() {
    if(document.getElementById("qty4").value - 1 < 0)
        return;
    else
        document.getElementById("qty4").value--;
}
