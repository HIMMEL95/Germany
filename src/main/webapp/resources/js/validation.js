checkOnlyKorEngNum = function(obj, pattern, nullNy, message, hide) {
	var reg = /^[ㄱ-ㅎ가-힣A-Za-z0-9]$/g;
}

checkOnlyEngNum = function(obj, pattern, nullNy, message, hide) {
	var reg = /^[a-zA-z0-9]$/g;
}

checkOnlyEng = function(obj, pattern, nullNy, message, hide) {
	var reg = /^[a-zA-z]$/g;
}

checkOnlyKorNum = function(obj, pattern, nullNy, message, hide) {
	var reg = /^[ㄱ-ㅎ가-힣0-9]$/g;
}

checkOnlyKor = function(obj, pattern, nullNy, message, hide) {
	var reg= /^[ㄱ-ㅎ가-힣]$/g;
}

checkOnlyNum = function(obj, pattern, nullNy, min, max, message, hide) {
	var reg = /^[0-9]$/g;
	var objValue = document.getElementById(obj).value.trim();
	
	if(objValue >= min && objValue <= max) {
		
	} else {
		return false;
	}
	
}

checkLogic = function(obj, pattern, nullNy, message, hide, reg) {
	var obj = document.getElementById(obj);
	var objValue = document.getElementById(obj).value.trim();
	
	if (nullNy == 0) {
		if (reg.test(objValue)) {
			
		}
	}
	
}
