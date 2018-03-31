/**
 * 检测邮箱地址是否合格
 * @param email
 * @returns {Boolean}
 */
function checkEmail(email) {
	var emailRegExp = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
	if (!emailRegExp.test(email) || email.indexOf('.') == -1 || email.indexOf('.') == (email.length - 1)) {
		return false;
	} else {
		return true;
	}
}

/**
 * 检测是否为非负整数
 * @param int
 * @returns
 */
function checkInt(int) {
	return /^\d+$/.test(int);
}

/**
 * 检测是否为正浮点数
 * @param float
 * @returns
 */
function checkFloat(float) {
	return new RegExp(/^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$/).test(float);
}

/**
 * 补0
 */
function fillZeros(value, length) {
	var length = arguments[1] ? arguments[1] : 2;
	var valueText = new String(value);
	while(valueText.length < length) {
		valueText = '0' + valueText;
	}
	return valueText;
}

//保留两位小数
//功能：将浮点数四舍五入，取小数点后2位
function toDecimal(x) {
    var f = parseFloat(x);
    if (isNaN(f)) {
        return;
    }
    f = Math.round(x*100)/100;
    return f;
}


//制保留2位小数，如：2，会在2后面补上00.即2.00
function toDecimal2(x) {
    var f = parseFloat(x);
    if (isNaN(f)) {
        return false;
    }
    var f = Math.round(x*100)/100;
    var s = f.toString();
    var rs = s.indexOf('.');
    if (rs < 0) {
        rs = s.length;
        s += '.';
    }
    while (s.length <= rs + 2) {
        s += '0';
    }
    return s;
}