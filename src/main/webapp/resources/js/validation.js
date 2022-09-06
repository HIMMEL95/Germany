checkNull = function(obj, value) {
    if (value == "" || value == null) {
        obj.focus();
        return false;
    } else {
        return true;
    }
}

checkNullWithoutFocus = function(obj, value) {
    if (value == "" || value == null) {
        alert(message);
        return false;
    } else {
        return true;
    }
}

cg_code_regex = function(obj, value, message, hide) {
    const re = /^[A-Z0-9]*$/g;
    if (!checkNull(obj, value)) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else if (!(re.test($.trim($(obj).val())))) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else {
        hide.parent().removeClass('error')
        hide.parent().addClass('success')
        $(hide).text()
        $(hide).hide()
        return true;
    }
}

ano_regex = function(obj, value, message, hide) {
    const re = /^[A-Z0-9]*$/g;
    if (!checkNull(obj, value)) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else if (!(re.test($.trim($(obj).val())))) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else {
        hide.parent().removeClass('error')
        hide.parent().addClass('success')
        $(hide).text()
        $(hide).hide()
        return true;
    }
}

ko_regex = function(obj, value, message, hide) {
    const re = /^[ㄱ-ㅎ가-힣0-9]*$/g;
    if (!checkNull(obj, value)) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else if (!(re.test($.trim($(obj).val())))) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else {
        hide.parent().removeClass('error')
        hide.parent().addClass('success')
        $(hide).text()
        $(hide).hide()
        return true;
    }
}

eng_regex = function(obj, value, message, hide) {
    const re = /^[a-zA-Z0-9\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]*$/g;
    if (!checkNull(obj, value)) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else if (!(re.test($.trim($(obj).val())))) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else {
        hide.parent().removeClass('error')
        hide.parent().addClass('success')
        $(hide).text()
        $(hide).hide()
        return true;
    }
}

use_regex = function(obj, value, message, hide) {
    if (!checkNull(obj, value)) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else {
        hide.parent().removeClass('error')
        hide.parent().addClass('success')
        $(hide).text()
        $(hide).hide()
        return true;
    }
}

order_regex = function(obj, value, message, hide) {
    const re = /^[0-9]{1,}$/g
    if (!checkNull(obj, value)) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else if (!(re.test($.trim($(obj).val())))) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else {
        hide.parent().removeClass('error')
        hide.parent().addClass('success')
        $(hide).text()
        $(hide).hide()
        return true;
    }
}

ex_regex = function(obj, value, message, hide) {
    const re = /^[a-zA-Z0-9ㄱ-ㅎ가-힣\s\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]*$/g;
    if (!checkNull(obj, value)) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else if (!(re.test($.trim($(obj).val())))) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else {
        hide.parent().removeClass('error')
        hide.parent().addClass('success')
        $(hide).text()
        $(hide).hide()
        return true;
    }
}

del_regex = function(obj, value, message, hide) {
    if (!checkNull(obj, value)) {
        hide.parent().addClass('error')
        $(hide).text(message)
        $(hide).show()
        return false;
    } else {
        hide.parent().removeClass('error')
        hide.parent().addClass('success')
        $(hide).text()
        $(hide).hide()
        return true;
    }
}
