checkOnlyKorEngNum = function(objName, pattern, nullNy, message, hide) {
	var reg = /^[ㄱ-ㅎ가-힣A-Za-z0-9]$/g;
	return checkLogic(objName, pattern, nullNy, message, hide, reg);
}

checkOnlyEngNum = function(objName, pattern, nullNy, message, hide) {
	var reg = /^[a-zA-z0-9]$/g;
	return checkLogic(objName, pattern, nullNy, message, hide, reg);
}

checkOnlyEng = function(objName, pattern, nullNy, message, hide) {
	var reg = /^[a-zA-z]$/g;
	return checkLogic(objName, pattern, nullNy, message, hide, reg);
}

checkOnlyKorNum = function(objName, pattern, nullNy, message, hide) {
	var reg = /^[ㄱ-ㅎ가-힣0-9]$/g;
	return checkLogic(objName, pattern, nullNy, message, hide, reg);
}

checkOnlyKor = function(objName, pattern, nullNy, message, hide) {
	var reg= /^[ㄱ-ㅎ가-힣]$/g;
	return checkLogic(objName, pattern, nullNy, message, hide, reg);
}

checkOnlyNum = function(objName, pattern, nullNy, min, max, message, hide) {
	var reg = /^[0-9]$/g;
	var objValue = document.getElementById(obj).value.trim();
	const hideFeedback = document.getElementById(hide + "_msg");
	
	if(objValue >= min && objValue <= max) {
		return checkLogic(objName, pattern, nullNy, message, hide, reg);
	} else {
		checkLogicExpression(obj, hideFeedback, pattern, message, hide);
		return false;
	}
	
}

checkLogic = function(objName, pattern, nullNy, message, hide, reg) {
	var obj = document.getElementById(objName);
	var objValue = document.getElementById(objName).value.trim();
	const hideFeedback = document.getElementById(hide + "_msg");
	
	if (nullNy == 0) {
		if (reg.test(objValue)) {
			document.getElementById(hide).parentElement.classList.remove('error');
			document.getElementById(hide).parentElement.classList.add('success');
			return true;
		} else {
			checkLoginExpression(obj, message, pattern, hide);
			return false;
		}
	} else if (nullNy == 1) {
		if (objValue != "" &&  objValue != null) {
			if (reg.test(objValue)) {
				document.getElementById(hide).parentElement.classList.remove('error');
				document.getElementById(hide).parentElement.classList.add('success');
				return true;
			} else {
				checkLogicExpression(obj, message, pattern, hide);
				return false;
			}
		} else {
			document.getElementById(hide).parentElement.classList.add('error');
			document.getElementById(hide).innerText = message;
			document.getElementById(hide).style.display = "";
			document.getElementById(objName).focus();
			return true;
		}
	} else {
		alert("error: param nullBy in checkLogic");
		return false;
	}
}

checkLogicExpression = function(obj, hideFeedback, pattern, message, hide) {
	switch(pattern) {
		case 1:
		// alert
			alert(message);
			obj.focus();
			break;
		case 2:
		//bootstrap validation
			document.getElementById(hide).parentElement.classList.add('error');
			hideFeedback.innerText = message;
			obj.focus();
			break;
		case 3:
		// bootstrap modal 
			break;			
	}
}

/* document.getElementById("cg_code_msg").parentElement.classList.add('error');
$('#cg_code_msg').parent().addClass('error'); */
