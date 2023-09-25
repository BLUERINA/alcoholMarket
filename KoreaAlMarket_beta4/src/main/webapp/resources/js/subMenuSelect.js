function price() {
		var price = document.getElementById('price');
		alert("가격:" + price.options[price.selectedIndex].value);
	}
	
	function degree() {
		var degree = document.getElementById('degree');
		alert("도수:" + degree.options[degree.selectedIndex].value);
	}
	
	function volume() {
		var volume = document.getElementById('volume');
		alert("용량:" + volume.options[volume.selectedIndex].value);
	}
	
	function star() {
		var star = document.getElementById('star');
		alert("별점:" + star.options[star.selectedIndex].value);
	}