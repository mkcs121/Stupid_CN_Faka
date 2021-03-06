/**
 * 
 */
var code;



function postFromData(postfrom) {
    $.ajax({
        url: $(postfrom).attr('action'),
        type: 'post',
        dataType: 'json',
        data: $(postfrom).serialize(),
        success: function (result) {
            if (result.Status) {
                alert(result.Msg);
                if (result['Url'] != '' && typeof (result['Url']) != 'undefined') {
                    window.location.href = result['Url'];
                    //window.location.href = "/";
                }
            } else {
                alert(result.Msg);
                $('#VerifyCode').val('');
                $(".imgcode").click();
            }
        }
    });
}

function postData() {
    $.ajax({
        url: $('#RegisterForm').attr('action'),
        type: 'post',
        dataType: 'json',
        data: $('#RegisterForm').serialize(),
        success: function (result) {
            if (result.Status) {
                alert(result.Msg);
                if (result['Url'] != '' && typeof (result['Url']) != 'undefined') {
                    //window.location.href = result['Url'];
                    window.location.href = "/";
                }
            } else {
                alert(result.Msg);
                $('#VerifyCode').val('');
                $(".imgcode").click();
            }
        }
    });
}

function postLoginData() {
    $.ajax({
        url: $('#loginFrom').attr('action'),
        type: 'post',
        dataType: 'json',
        data: $('#loginFrom').serialize(),
        success: function (result) {
            if (result.Status) {
                if (result['Url'] != '' && typeof (result['Url']) != 'undefined') {
                    window.location.href = result['Url'];
                }
            }
            else {
                alert(result.Msg);
                $('#VerifyCode').val('');
                $(".imgcode").click();
            }
            /*bootbox.alert({
                   buttons: {
                       ok: {label: '确定'}
                   },
                   message: result.Msg,
                   callback: function () {
                       if (result['Url'] != '' && typeof (result['Url']) != 'undefined') {
                           window.location.href = result['Url'];
                       }
                   },
                   title: "提示"
               });*/
        }
    });
}

function switchClass(idName, styleStr) {
    $("#" + idName).removeClass();
    $("#" + idName).addClass("reg_span2").addClass(styleStr);
}

var Interval_control;
var timeout = 60;
var runtimeout = function () {
    if (timeout == 1) {
        $('#sendEmail').removeClass('btn_disable').addClass('btn_default').removeAttr('disabled').val('获取校验码');
        clearInterval(Interval_control);
        return false;
    }
    timeout = timeout - 1;
    $('#sendEmail').val(timeout + ' 秒后重发');
}
var isrun = function () {
    $('#sendEmail').addClass('btn_disable').attr('disabled', true);
    Interval_control = window.setInterval(runtimeout, 1000);
}

var sendCode = function () {
    var email = $.trim($("#userEmail").val());
    if (isEmail(email)) {
        $.ajax({
            url: '/Register/SendEmail',
            type: 'POST',
            dataType: 'json',
            data: { 'email': email },
            success: function (result) {
                if (result.Status == true) {
                    alert("验证码已发送至您的邮箱，请查收！");
                    isrun();
                } else {
                    alert(result.Msg);
                    isrun();
                }
            }
        });
    } else {
        alert("请输入合法邮箱！");
    }
}
function changeBank(bank) {
    if (bank == "1") {
        $("#div_openingBank1").css("display", "none");
    }
    else if (bank == "2") {
        $("#div_openingBank1").css("display", "none");
    }
    else {
        $("#div_openingBank1").css("display", "block");
    }
}

function IsURL(str_url) {
    var strRegex = "^((https|http)?://)"
			+ "?(([0-9a-z_!~*'().&=+$%-]+: )?[0-9a-z_!~*'().&=+$%-]+@)?" // ftp的user@
			+ "(([0-9]{1,3}\.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
			+ "|" // 允许IP和DOMAIN（域名）
			+ "([0-9a-z_!~*'()-]+\.)*" // 域名- www.
			+ "([0-9a-z][0-9a-z-]{0,61})?[0-9a-z]\." // 二级域名
			+ "[a-z]{2,6})" // first level domain- .com or .museum
			+ "(:[0-9]{1,4})?" // 端口- :80
			+ "((/?)|" // a slash isn't required if there is no file name
			+ "(/[0-9a-z_!~*'().;?:@&=+$,%#-]+)+/?)$";
    var re = new RegExp(strRegex);
    // re.test()
    if (re.test(str_url)) {
        return (true);
    } else {
        return (false);
    }
}

// 校验手机号码
function isMobil(s) {
    var patrn = /^13[0-9]{9}$|14[0-9]{9}$|15[0-9]{9}$|16[0-9]{9}$|17[0-9]{9}$|18[0-9]{9}$|19[0-9]{9}$/;
    if (!patrn.exec(s))
        return false
    return true
}

// 验证邮箱格式
function isEmail(str) {
    var email_str = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;///^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!email_str.test(str)) {
        return false;
    }
    return true;
}

// 验证身份证（严格）
function validateIdCard(idCard) {
    //15位和18位身份证号码的正则表达式
    var regIdCard = /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/;

    //如果通过该验证，说明身份证格式正确，但准确性还需计算
    if (regIdCard.test(idCard)) {
        if (idCard.length == 18) {
            var idCardWi = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2); //将前17位加权因子保存在数组里
            var idCardY = new Array(1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2); //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            var idCardWiSum = 0; //用来保存前17位各自乖以加权因子后的总和
            for (var i = 0; i < 17; i++) {
                idCardWiSum += idCard.substring(i, i + 1) * idCardWi[i];
            }

            var idCardMod = idCardWiSum % 11;//计算出校验码所在数组的位置
            var idCardLast = idCard.substring(17);//得到最后一位身份证号码

            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            if (idCardMod == 2) {
                if (idCardLast == "X" || idCardLast == "x") {
                    return true;
                } else {
                    return false;
                }
            } else {
                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if (idCardLast == idCardY[idCardMod]) {
                    return true;
                } else {
                    return false;
                }
            }
        }
    } else {
        return false;
    }
}

// 验证QQ号码5-12位
function isQQ(qq) {
    var filter = /^\s*[.0-9]{5,12}\s*$/;
    if (!filter.test(qq)) {
        return false;
    } else {
        return true;
    }
}

// 验证收款人姓名
function isUserName(name) {
    var filter = /^[\u4E00-\u9FA5\uf900-\ufa2d]{1,6}$/;
    if (!filter.test(name)) {
        return false;
    } else {
        return true;
    }
}

// 验证邮箱验证码
function isCode(code) {
    var filter = /^\s*[.0-9]{6}\s*$/;
    if (!filter.test(code)) {
        return false;
    } else {
        return true;
    }
}

function isBankNo(code) {
    var filter = /^[0-9]*$/;
    if (!filter.test(code)) {
        return false;
    } else {
        return true;
    }
}

/* 验证数据并提示信息 -- 开始 */
function errorInfo(id, errid, errinfo) {
    alert(errinfo);
}

function successInfo(id, succid, succinfo) {
    
}

function checkemail(str) {
    if (str == "") {
        errorInfo('checkEmail', 'emailErrorInfo', '请填写电子邮箱');
        return false;
    }
    if (!isEmail(str)) {
        errorInfo('checkEmail', 'emailErrorInfo', '电子邮箱格式不正确！');
        return false;
    }
    else {
        successInfo('checkEmail', 'emailErrorInfo', 'ok');
        return true;
    }
}

function checkuserpass(str) {
    if (str == "" || str.length < 6) {
        errorInfo('checkUserPass', 'userPassErrorInfo', '请输入密码');
        return false;
    }
    else if (!/^[a-zA-Z]\w{5,15}$/.test(str)) {
        errorInfo('checkUserPass', 'userPassErrorInfo', '请输入6-16位,字母+数字,首位为字母!');
        return false;
    }
    else {
        successInfo('checkUserPass', 'userPassErrorInfo', 'ok');
        return true;
    }
}

function checkconfirmpassword(str) {
    var pwd = $("#userPass").val();
    if (str == "" || str != pwd) {
        errorInfo('checkConfirmPassword', 'confirmPasswordErrorInfo', '两次密码输入不一致!');
        return false;
    }

    else {
        successInfo('checkConfirmPassword', 'confirmPasswordErrorInfo', 'ok');
        return true;
    }
}

function checkmobile(str) {
    if (str == "" || !isMobil(str)) {
        errorInfo('checkMobile', 'mobileErrorInfo', '请输入合法的手机号码!');
        return false;
    }
    else {
        successInfo('checkMobile', 'mobileErrorInfo', 'ok');
        return true;
    }
}

function checkqq(str) {
    if (str == "" || !isQQ(str)) {
        errorInfo('checkQQ', 'qqErrorInfo', '请输入5-12位合法的QQ号!');
        return false;
    }
    else {
        successInfo('checkQQ', 'qqErrorInfo', 'ok');
        return true;
    }
}

function checkidcard(str) {
    if (str == "" || !validateIdCard(str)) {
        errorInfo('checkIdCard', 'idCardErrorInfo', '请输入合法的身份证号!');
        return false;
    }
    else {
        successInfo('checkIdCard', 'idCardErrorInfo', 'ok');
        return true;
    }
}

function checkbankno(str) {
    var bankno = $("#BankInfoId").val();
    if (str == "") {
        errorInfo('checkbankNo', 'bankNoErrorInfo', '请输入正确的收款账号!');
        return false;
    } else if (bankno != '1' && bankno != '2') {
        if(!isBankNo(str)){
            errorInfo('checkbankNo', 'bankNoErrorInfo', '请输入正确的银行卡号!');
            return false;
        }else{
            successInfo('checkbankNo', 'bankNoErrorInfo', 'ok');
            return true;
        }
    }
    else {
        successInfo('checkbankNo', 'bankNoErrorInfo', 'ok');
        return true;
    }
}

function checkusername(str) {
    if (str == "" || !isUserName(str)) {
        errorInfo('checkUserName', 'userNameErrorInfo', '请输入真实姓名!');
        return false;
    }
    else {
        successInfo('checkUserName', 'userNameErrorInfo', 'ok');
        return true;
    }
}


function checkbankaddress(str) {
    if (str == "" ) {
        errorInfo('checkBankAddress', 'bankAddressErrorInfo', '请输入开户行地址!');
        return false;
    }
    else {
        successInfo('checkBankAddress', 'bankAddressErrorInfo', 'ok');
        return true;
    }
}

function checksafecode(str) {
    if (str == "") {
        errorInfo('checkSafeCode', 'safeCodeErrorInfo', '请输入邮箱验证码!');
        return false;
    }
    else {
        successInfo('checkSafeCode', 'safeCodeErrorInfo', 'ok');
        return true;
    }
}
/* 验证数据并提示信息 -- 结束 */

function validate_form(thisform) {

	// 邮箱验证
	var email = $("#userEmail").val();
	if (!checkemail(email)) {
	    $("#userEmail").focus();
		return false;
	}
	// 密码验证
	var pwd = $("#userPass").val();
	if (pwd == '') {
	    alert('请输入密码！');
		$("#userPass").focus();
		return false;
	}
	// 确认密码
	var conPwd = $("#ConfirmPassword").val();
	if (!checkconfirmpassword(conPwd)) {
		$("#ConfirmPassword").focus();
		return false;
	}

	// 手机号码
	var telephone = $("#mobile").val();
	if (!checkmobile(telephone)) {
		$("#mobile").focus();
		return false;
	}
	// QQ号码
	var qq = $("#qq").val();
	if (!checkqq(qq)) {
		$("#qq").focus();
		return false;
	}
    // 身份证
	var idcard = $("#idCard").val();
	if (!checkidcard(idcard)) {
	    $("#idCard").focus();
	    return false;
	}
	// 收款账号
	var bankno = $("#bankNo").val();
	if (!checkbankno(bankno)) {
		$("#bankNo").focus();
		return false;
	} 
	// 收款人姓名
	var username = $("#userName").val();
	if (!checkusername(username)) {
		$("#userName").focus();
		return false;
	}
	// 开户行地址
	if ($("#div_openingBank").css("display") == "table-row") {
		var bankAddr = $("#bankAddress").val();
		if (!checkbankaddress(bankAddr)) {
			$("#bankAddress").focus();
			return false;
		}
	}

	//	邮箱校验码
	var randomCode = $("#safeCode").val();
	if ($("#div_openingBank").css("display") == "table-row") {
	    if (!checksafecode()) {
	        $("#safeCode").focus();
	        return false;
	    }
	}

	if ($("#VerifyCode").val() == "") {
	    alert("请输入验证码");
	    $("#VerifyCode").focus();
	    return false;
	}
	/*if($("#check_ServiceAgree").is(":checked") == false){
		alert('请阅读我们的服务协议并同意（勾选）。');	
		return false;
	}*/

	postFromData(thisform);
	return false;
}


function login_validate_form(thisform) {
    // 邮箱验证
    var email = $("#userEmail").val();
    if (!checkemail(email)) {
        $("#userEmail").focus();
        return false;
    }
    // 密码验证
    var pwd = $("#userPass").val();
    if (pwd == '') {
        alert('请输入密码！');
        $("#userPass").focus();
        return false;
    }
    var code = $("#VerifyCode").val();
    if (code == "")
    {
        alert('请输入验证码！');
        return false;
    }
    postLoginData();
    return false;
}

function findpwd_validate_form(thisform) {
    // 邮箱验证
    var email = $("#userEmail").val();
    if (!checkemail(email)) {
        $("#userEmail").focus();
        return false;
    }
    // 密码验证
    var pwd = $("#idCard").val();
    if (!checkidcard(pwd)) {
        $("#idCard").focus();
        return false;
    }
    var code = $("#VerifyCode").val();
    if (code == "") {
        alert('请输入验证码！');
        $("#VerifyCode").focus();
        return false;
    }

    postFromData(thisform);
    return false;
} 