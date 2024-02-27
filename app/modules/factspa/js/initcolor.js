// JavaScript Document
var colourPicker1;
window.onload = function() {
	if (document.getElementById('FSPAsubmitUpdate') != null)
	{						
		var boton = document.getElementById('FSPAsubmitUpdate');
		var color = document.getElementById('color').value;
		var colorText = document.getElementById('colorText').value;
		var colorTitle = document.getElementById('colorTitle').value;
		colourPicker1 = new ColourPicker(document.getElementById('colourPicker'),'../modules/factspa/js/',new RGBColour(hexToRgb(color).r,hexToRgb(color).g,hexToRgb(color).b));
		colourPicker2 = new ColourPicker(document.getElementById('colourPicker01'),'../modules/factspa/js/',new RGBColour(hexToRgb(colorText).r,hexToRgb(colorText).g,hexToRgb(colorText).b));
		colourPicker3 = new ColourPicker(document.getElementById('colourPicker02'),'../modules/factspa/js/',new RGBColour(hexToRgb(colorTitle).r,hexToRgb(colorTitle).g,hexToRgb(colorTitle).b));
		boton.onclick = guardar;	
	}
}

function componentToHex(c) {
    var hex = c.toString(16);
    return hex.length == 1 ? "0" + hex : hex;
}

function hexToRgb(hex) {
    var result = /^#?([a-f\d]{2})([a-f\d]{2})([a-f\d]{2})$/i.exec(hex);
    return result ? {
        r: parseInt(result[1], 16),
        g: parseInt(result[2], 16),
        b: parseInt(result[3], 16)
    } : null;
}

function guardar()
{
	var color = colourPicker1.getColour();
	var colorText = colourPicker2.getColour();
	var colorTitle = colourPicker3.getColour();
	document.getElementById('color').value = color.getCSSHexadecimalRGB();
	document.getElementById('colorText').value = colorText.getCSSHexadecimalRGB();
	document.getElementById('colorTitle').value = colorTitle.getCSSHexadecimalRGB();
}