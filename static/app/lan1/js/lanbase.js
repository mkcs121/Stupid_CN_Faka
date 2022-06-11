if (typeof(_theme_) == 'undefined') {
    _theme_ = 'default';
}

function selectcateid2(cateid) {
    $("[name=couponcode]").val("");
    $('#loading').show();
    $('#categorys .active').removeClass('active');
    $('#categorys .category-' + cateid).addClass('active');
    let html = '';
    if (cateid > 0) {
        $.post('/ajax/getgoodlist4', {
                cateid: cateid,
                type: 'json'
            },
            function (data) {
                if (data == '') {
                    $('#goodslist').html('');
                    $('[name="goodid"]').val('');
                    layer.msg('此分类下没有商品！');
                } else {
                //     data.forEach(item => {
                //         html += `
                //             <div class="item goods-${item.id}"   onclick="selectgoodid2(${item.id})">
                //                 <div class="pwd" style="display: ${item.visit_type == 1 ? 'block' : 'none'}">点击输入密码</div>
                //                 <div class="pwd-success" style="display: ${item.visit_type == 1 ? 'none' : 'block'}">
                //                     <div class="name">${item.name}</div>
                //                     <div id="price">
                //                         ￥<span class="number">${item.price}</span>
                //                     </div>
                //                     <img src="/static/newimg/icon_002.png" />
                //                 </div>
                //             </div>
                //             `;
                // });
                    $('#loading').hide();
                    $('#goodslist').html(data);
                    selectgoodid2(data[0].id);
                }
            });
    }
    getrate();
    $('.pinfo1').show();
    $('.pinfo2').hide();
    $('.pinfo3').hide();
}


function selectgoodid2(goodid) {
    $('#goodslist .item.active').removeClass('active');
    $('#goodslist .item.goods-' + goodid).addClass('active');
    $('#goodid').val(goodid);

    if ($("[name=couponcode]").val() != "") {
        checkCoupon();
    }
    $.post(
        "/ajax/getgoodinfo", {
            goodid: goodid
        },
        function (data) {
            if (data) {
                $("#price").val(data.price);
                $("#remark").html(data.remark);
                $("#gonggao").html(data.gonggao);
                // $('[name=feePayer]').val(data.fee_payer);
                $('.submit-bar .goods-name span').text($(`#goodslist .item.goods-${goodid} .name`).text());
                limit_quantity = data.limit_quantity;
                if (data.remark != "") {
                    $("#buy_border1").css("display", "block");
                }
                if (data.is_coupon == 0) {
                    //取消掉优惠券码
                    $("[name=couponcode]").val("");
                    $("#goodCoupon").hide();
                }
                if (data.is_coupon == 1) {
                    $("#goodCoupon").show();
                }
                if (data.is_pwdforsearch == 0) {
                    $("#pwdforsearch2").hide();
                    $("#pwdforsearch1").hide();
                }
                if (data.is_pwdforsearch == 1) {
                    $("#pwdforsearch2").hide();
                    $("#pwdforsearch1").show();
                }
                if (data.is_pwdforsearch == 2) {
                    $("#pwdforsearch1").hide();
                    $("#pwdforsearch2").show();
                }
                //显示批发价格
                if (data.is_discount == 1) {
                    $("#isdiscount").css("display", "inline");
                    var discountdetail2 = '';
                    $.ajax({
                        url: '/ajax/getdiscountdetails2',
                        data: {
                            goodid: goodid,
                        },
                        type: 'post',
                        dataType: 'json',
                        async: false,
                        success: function (data) {
                            // console.log(data);
                            $('#isdiscount_span').html(data);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            layer.msg('连接错误');
                        }
                    });
                    $("#isdiscount_span").css("display", "inline");
                    $("#discountdetail").css("display", "inline");
                }
                //隐藏批发价格标签
                if (data.is_discount == 0) {
                    $("#isdiscount_span").css("display", "none");
                    $("#discountdetail").css("display", "none");
                }
                if (data.limit_quantity > 0) {
                    $("[name=quantity]").val(data.limit_quantity);
                    $("[name=quantity]").attr({
                        title: "本商品最少购买数量为" + limit_quantity + "件！"
                    });
                    $("#limit_quantity_tip").show();
                } else {
                    $("[name=quantity]").val(1);
                    $("[name=quantity]").removeAttr("title");
                    $("#limit_quantity_tip").hide();
                }
                is_contact_limit = data.contact_limit;
                $('[name="is_contact_limit"]').val(data.contact_limit);
                $(".contact_limit_tip").text(data.contact_limit);
                $("[name=danjia]").val(data.price);
                // $("#goodInvent_"+goodid).html(data.goodinvent);
                $("#goodInvent").html(data.goodinvent);
                $("[name=is_discount]").val(data.is_discount);
                getrate();
                goodDiscount();
                $(".pinfo1").hide();
                $(".pinfo2").show();
                $(".pinfo3").hide();
                if (data.is_pwdforbuy == 1 && !$(`#goodslist .item.goods-${goodid}`).hasClass('validate-yet')) {
                    getPwdforbuy();
                }
            }
        },
        "json"
    );
}

function goodDiscount() {
    var is_discount = $("[name=is_discount]").val();
    var quantity = parseInt($.trim($("[name=quantity]").val()));
    var goodid = $("#goodid").val();
    if (is_discount == 1) {
        $.post(
            "/ajax/getdiscount", {
                goodid: goodid,
                quantity: quantity
            },
            function(data) {
                if (data > 0) {
                    $("#price").val(data);
                    $(`#goodslist .item.goods-${goodid} .price .number`).text(data);
                    $("[name=danjia]").val(data);
                    goodschk();
                }
            }
        );
    }
}

function changequantity2() {
    goodDiscount();
    goodschk();
    var quantity = $("input[name='quantity']").val();
    var kucun = $("input[name='kucun']").val();
    if (quantity < 1) {
        layer.msg('您忘了输入购买数量！');
        return false;
    } else if ((quantity - kucun) > 0) {
        layer.msg('您输入的购买数量超过库存数量，请重新输入！');
        $('[name=quantity]').focus();
    }
}

function goodschk() {
    var dprice = parseFloat($("#price").val()) || 0;
    var quantity = parseInt($.trim($("[name=quantity]").val()));
    var rate = parseFloat(
        $(".rate")
            .first()
            .text()
    );
    var tprice = parseFloat(((dprice * quantity) / rate) * 100);

    //判断是否需要买家承担费率
    var feePayer = parseInt($('[name=feePayer]').val()) || 1;
    var feePrice = 0;
    if (2 === feePayer) {
        //加上买方需要承担的费率
        var feeRate = parseFloat($('[name=fee_rate]').val()) || 0;
        feePrice = parseFloat(feeRate * tprice);
        var minPrice = parseFloat($('[name=min_fee]').val()) || 0;
        if (minPrice > feePrice) feePrice = minPrice;
        tprice += feePrice;
    }

    var gprice = parseFloat(dprice * quantity);
    var coupon_ctype = $("[name=coupon_ctype]").val();
    var coupon_value = $("[name=coupon_value]").val();
    if (coupon_ctype == 1) {
        tprice = tprice - coupon_value;
    } else if (coupon_ctype == 100) {
        tprice = parseFloat(tprice - (tprice * coupon_value) / 100);
    }
    var sms_price = $("[name=sms_price]").val();
    tprice = tprice + parseFloat(sms_price);
    tprice = $("#card").attr("checked") ?
        Math.ceil(tprice.toFixed(2)) :
        tprice.toFixed(2);
    gprice = $("#card").attr("checked") ?
        Math.ceil(gprice.toFixed(2)) :
        gprice.toFixed(2);
    if (2 === feePayer) {
        $('#tfee').remove();
        var node = '<i id="tfee">(含手续费: ' + parseFloat(feePrice).toFixed(2) + '元)</i>';
        $('.tprice').parent().append(node);
    } else {
        $('#tfee').remove();
    }
    $(".tprice").html(tprice);
    $(".gprice").html(gprice);
    $("[name=paymoney]").val(tprice);
}

function goodDiscount() {
    var is_discount = $("[name=is_discount]").val();
    var quantity = parseInt($.trim($("[name=quantity]").val()));
    var goodid = $("#goodid").val();
    if (is_discount == 1) {
        $.post(
            "/ajax/getdiscount", {
                goodid: goodid,
                quantity: quantity
            },
            function(data) {
                if (data > 0) {
                    $("#price").val(data);
                    $("[name=danjia]").val(data);
                    goodschk();
                }
            }
        );
    }
}
function verify_pwdforbuy() {
    var goodid = $("#goodid").val();
    $(`#goodslist .item.goods-${goodid} .pwd-success`).show();
    $(`#goodslist .item.goods-${goodid} .pwd`).hide();
    $(`#goodslist .item.goods-${goodid}`).addClass('validate-yet');

    var pwdforbuy = $.trim($("[name=pwdforbuy]").val());
    if (pwdforbuy == "") {
        alert("请填写验证码！");
        $("[name=pwdforbuy]").focus();
        return false;
    }
    var reg = /^([a-z0-9A-Z]+){6,20}$/;
    if (!reg.test(pwdforbuy)) {
        alert("验证码格式为6-20个长度，数字、大小写字母或组合！");
        $("[name=pwdforbuy]").focus();
        return false;
    }
    $("#verify_pwdforbuy").attr("disabled", true);
    $("#verify_pwdforbuy_msg").show();
    $.post(
        "/ajax/checkpwdforbuy", {
            pwdforbuy: pwdforbuy,
            goodid: goodid,
            t: new Date().getTime()
        },
        function(data) {
            if (data == "ok") {
                $("#verify_pwdforbuy_msg").hide();
                alert("验证成功，请继续购买！");
                parent.$.nyroModalRemove();
            } else {
                $("#verify_pwdforbuy_msg").hide();
                alert(data);
                $("#verify_pwdforbuy").attr("disabled", false);
                return false;
            }
        }
    );
}