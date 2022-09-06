//checkNull = function(obj, value) {
//    if (value == "" || value == null) {
//        obj.focus();
//        return false;
//    } else {
//        return true;
//    }
//}
//
//checkNullWithoutFocus = function(obj, value) {
//    if (value == "" || value == null) {
//        alert(message);
//        return false;
//    } else {
//        return true;
//    }
//}
//
//cg_code_regex = function(obj, value, message, hide) {
//    const re = /^[A-Z0-9]*$/g;
//    if (!checkNull(obj, value)) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else if (!(re.test($.trim($(obj).val())))) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else {
//        hide.parent().removeClass('error')
//        hide.parent().addClass('success')
//        $(hide).text()
//        $(hide).hide()
//        return true;
//    }
//}
//
//ano_regex = function(obj, value, message, hide) {
//    const re = /^[A-Z0-9]*$/g;
//    if (!checkNull(obj, value)) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else if (!(re.test($.trim($(obj).val())))) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else {
//        hide.parent().removeClass('error')
//        hide.parent().addClass('success')
//        $(hide).text()
//        $(hide).hide()
//        return true;
//    }
//}
//
//ko_regex = function(obj, value, message, hide) {
//    const re = /^[ㄱ-ㅎ가-힣0-9]*$/g;
//    if (!checkNull(obj, value)) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else if (!(re.test($.trim($(obj).val())))) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else {
//        hide.parent().removeClass('error')
//        hide.parent().addClass('success')
//        $(hide).text()
//        $(hide).hide()
//        return true;
//    }
//}
//
//eng_regex = function(obj, value, message, hide) {
//    const re = /^[a-zA-Z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]*$/g;
//    if (!checkNull(obj, value)) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else if (!(re.test($.trim($(obj).val())))) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else {
//        hide.parent().removeClass('error')
//        hide.parent().addClass('success')
//        $(hide).text()
//        $(hide).hide()
//        return true;
//    }
//}
//
//use_regex = function(obj, value, message, hide) {
//    if (!checkNull(obj, value)) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else {
//        hide.parent().removeClass('error')
//        hide.parent().addClass('success')
//        $(hide).text()
//        $(hide).hide()
//        return true;
//    }
//}
//
//order_regex = function(obj, value, message, hide) {
//    const re = /^[0-9]{1,}$/g
//    if (!checkNull(obj, value)) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else if (!(re.test($.trim($(obj).val())))) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else {
//        hide.parent().removeClass('error')
//        hide.parent().addClass('success')
//        $(hide).text()
//        $(hide).hide()
//        return true;
//    }
//}
//
//ex_regex = function(obj, value, message, hide) {
//    const re = /^[a-zA-Z0-9ㄱ-ㅎ가-힣\s\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]*$/g;
//    if (!checkNull(obj, value)) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else if (!(re.test($.trim($(obj).val())))) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else {
//        hide.parent().removeClass('error')
//        hide.parent().addClass('success')
//        $(hide).text()
//        $(hide).hide()
//        return true;
//    }
//}
//
//del_regex = function(obj, value, message, hide) {
//    if (!checkNull(obj, value)) {
//        hide.parent().addClass('error')
//        $(hide).text(message)
//        $(hide).show()
//        return false;
//    } else {
//        hide.parent().removeClass('error')
//        hide.parent().addClass('success')
//        $(hide).text()
//        $(hide).hide()
//        return true;
//    }
//}


function checkOnlyKoreanEnglishNumber (objName, pattern, nullAllowedNy, message) {
// checkOnlyKoreanEnglishNumber = function(obj, value, message) {
    var regExp = /^[ㄱ-ㅎ가-힣A-Za-z0-9]+$/;
    return checkLogic (objName, pattern, nullAllowedNy, message, regExp);
}


function checkOnlyEnglishNumber (objName, pattern, nullAllowedNy, message) {
// checkOnlyEnglishNumber = function(obj, value, message) {
    var regExp = /^[A-Za-z0-9]+$/;
    return checkLogic (objName, pattern, nullAllowedNy, message, regExp);
}


function checkOnlyEnglish (objName, pattern, nullAllowedNy, message) {
// checkOnlyEnglish = function(obj, value, message) {
    var regExp = /^[A-Za-z]+$/;
	return checkLogic (objName, pattern, nullAllowedNy, message, regExp);
}


function checkOnlyKoreanNumber (objName, pattern, nullAllowedNy, message) {
// checkOnlyKoreanNumber = function(obj, value, message) {
    var regExp = /^[ㄱ-ㅎ가-힣0-9]+$/;
	return checkLogic (objName, pattern, nullAllowedNy, message, regExp);
}


function checkOnlyKorean (objName, pattern, nullAllowedNy, message) {
// checkOnlyKorean = function(obj, value, message) {
    var regExp = /^[ㄱ-ㅎ가-힣]+$/;
	return checkLogic (objName, pattern, nullAllowedNy, message, regExp);
}


function checkOnlyNumber (objName, pattern, nullAllowedNy, min, max, message) {
// checkOnlyNumber = function(obj, value, message) {
	var obj = document.getElementById(objName);
	var objValue = document.getElementById(objName).value.trim();
	var objFeedback = document.getElementById(objName+"Feedback");
    var regExp = /^[0-9]+$/;
	
	if(objValue >= min && objValue <= max) {
    	return checkLogic (objName, pattern, nullAllowedNy, message, regExp);
	} else {
		checkLogicExpression (obj, objFeedback, pattern, message);
		return fasle;
	}
}


function checkLogic (objName, pattern, nullAllowedNy, message, regExp) {
// checkLogic = function (obj, value, pattern, message, regExp) {
	
	var obj = document.getElementById(objName);
	var objValue = document.getElementById(objName).value.trim();
	var objFeedback = document.getElementById(objName+"Feedback");
	
	if(nullAllowedNy == 0) {
		if(regExp.test(objValue)){
			// obj.removeClass("is-invalid");
			obj.classList.remove('valid-feedback');
			return true;
		} else {
			checkLogicExpression (obj, objFeedback, pattern, message);
			return false;
		}
	} else if (nullAllowedNy == 1) {
		if(objValue != "" && objValue != null) {
			if(regExp.test(objValue)) {
				// obj.removeClass("is-invalid");
				obj.classList.remove('valid-feedback');
				return true;
			} else {
				checkLogicExpression (obj, objFeedback, pattern, message);
				return false;
			}			
		} else {
			obj.classList.remove('valid-feedback');
			return true;
		}
	} else {
		alert("error: param nullAllowedNy in checkLogic");
		return false;
	}
}


function checkLogicExpression (obj, objFeedback, pattern, message) {
	switch(pattern) {
	case 1:	
	// alert
		alert(message);
		obj.focus();
		break;
	case 2:
	// bootstrap validation
		//obj.addClass("is-invalid");
		obj.classList.add('valid-feedback');
		objFeedback.innerText = message;
		obj.focus();
		break;
	case 3:
	// bootstrap modal
		break;
	}
}