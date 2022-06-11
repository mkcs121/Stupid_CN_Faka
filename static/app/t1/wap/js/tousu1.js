// 验证QQ号码5-12位
function isQQ(qq) {
    var filter = /^\s*[.0-9]{5,12}\s*$/;
    if (!filter.test(qq)) {
        return false;
    } else {
        return true;
    }
}

// 校验手机号码
function isMobil(s) {
    var patrn = /^(13[0-9]{9})|(14[0-9]{9})|(15[0-9]{9})|(17[0-9]{9})|(18[0-9]{9})$/;
    if (!patrn.exec(s))
        return false
    return true
}

function formSubmit(thisform) {
    if ($('#orderNo').val() == '') {
        layer.msg('请填写要投诉订单号！', { icon: 2 });
        $('#orderNo').focus();
        return false;
    }
    if ($('#complaintPwd').val() == '') {
        layer.msg('请填写投诉密码！', { icon: 2 });
        $('#complaintPwd').focus();
        return false;
    }
    if ($('#complaintType').val() == '') {
        layer.msg('请选择投诉原因！', { icon: 2 });
        return false;
    }
    if ($('#contactQQ').val() == '' || !isQQ($('#contactQQ').val())) {
        layer.msg('请填写您的常用QQ！', { icon: 2 });
        $('#contactQQ').focus();
        return false;
    }
    if ($('#contactTel').val() == '' || !isMobil($('#contactTel').val())) {
        layer.msg('请填写您的常用联系手机！', { icon: 2 });
        $('#contactTel').focus();
        return false;
    }
    if ($('#reasons').val() == '') {
        layer.msg('请填写具体遇到的问题！', { icon: 2 });
        $('#reasons').focus();
        return false;
    }

    var orderno = $('#orderNo').val();
    var complaintpwd = $('#complaintPwd').val();

    layer.confirm('您确定要投诉该订单吗？<br/><font style="color:#3498DB;">如果没有还未联系卖家，请先在购买页面联系卖家QQ处理。</font>', {
        html: true,
        btn: ['确定', '取消'] //按钮
    }, function () {
        $.ajax({
            url: $(thisform).attr('action'),
            type: 'post',
            dataType: 'json',
            data: $(thisform).serialize(),
            success: function (result) {
                if (result.Status) {
                    layer.msg(result.Msg, {
			time:10000,
                        btn: ['确定']
                    }, function () {
                        if (result['Url'] != '' && typeof (result['Url']) != 'undefined') {
                            window.location.href = result['Url'];
                        } else {
                            window.location.href = '/complaint/query?orderNo=' + orderno + '&complaintPwd=' + complaintpwd
                        }
                    })
                }
                else {
                    layer.msg(result.Msg, { icon: 2 });
                }
            }
        })
    })

    return false;
}

var Remoke = function () {
    layer.confirm('您确定要撤销投诉吗？', {
        btn: ['确定', '取消'] //按钮
    }, function () {
        var orderno = $('#orderNo').val();
        var complaintpwd = $('#complaintPwd').val();
        if (orderno == '' || complaintpwd == '') {
            alert('订单号或密码为空！');
            return;
        }
        else {
            $.ajax({
                type: 'post',
                url: '/Complaint/Revoke',
                dataType: 'json',
                data: { orderNo: orderno, complaintPwd: complaintpwd },
                success: function (result) {
                    if (result.Status) {
                        layer.msg(result.Msg, {
			    time:10000,
                            btn: ['确定']
                        }, function () {
                            window.location.reload();
                        });
                        
                        //$('#btn_ts').attr('disabled', 'disabled');
                    } else {
                        layer.msg(result.Msg, { icon: 2 });
                    }
                }
            })
        }

    });
}