$(document).ready(function() {

    //屏幕宽度大于768px跳转至访问错误页面
    if ($(window).width() > 768) {
        window.location.href = '/;
    }

    //点击跳转
    $('.serv-btn').click(function() {
        var href = $(this).data('link');
        window.location.href = href;
    });
	
    //底部菜单
    $('.nav-item').click(function() {
        $(this).children('.footer-submenu').slideToggle(300).parents('.nav-item').siblings('.nav-item').children('.footer-submenu').hide();
    });
    $(document).click(function(e) {
        if (e.target.className != 'footer-menu-text' && e.target.className != 'footer-menu') {
            $('.footer-submenu').hide();
        }
    });

    //选择规格购买或加入购物车
    //增减购买数量
    var purchaseNumber = $('.purchase-number .quantity input[type="text"]'); //数量
    var minus = $('.purchase-number .quantity button[type="button"].minus'); //减少
    var plus = $('.purchase-number .quantity button[type="button"].plus'); //增加
    plus.click(function() {
        if (parseInt(purchaseNumber.val()) == 99) {
            plus.attr('disabled', true).addClass('disabled');
            return false;
        }
        purchaseNumber.val(parseInt(purchaseNumber.val()) + 1);
        minus.removeAttr('disabled').removeClass('disabled');
    });
    minus.click(function() {
        if (parseInt(purchaseNumber.val()) == 1) {
            minus.attr('disabled', true).addClass('disabled');
            return false;
        }
        purchaseNumber.val(parseInt(purchaseNumber.val()) - 1);
        plus.removeAttr('disabled').removeClass('disabled');
    });
    //打开弹出层
    var id = null; //ID
    var alias = null; //别名
    var goodsimg = null; //商品图片
    var title = null; //标题
    var price = null; //价格
    var postage = null; //邮费
    $('.buy-response-btn').on('click',
    function(event) {
        $('body').addClass('hidden');
        id = $(this).data('id'); //ID
        alias = $(this).data('alias'); //别名
        goodsimg = $(this).parents().find('.goodsimg').attr('src'); //商品图片
		if(!goodsimg){
			goodsimg = $(this).data('titlepic');
		}
        title = $(this).data('title'); //标题
        price = $(this).data('price'); //价格
        postage = $(this).data('postage'); //邮费
        $('.popup-goods-thumb').attr('src', goodsimg); //设置弹出层商品小图
        $('.popup-goods-title').html(title); //设置弹出层商品标题
        $('.popup-goods-price').html('<span class="price">￥' + price + '</span><span class="postage">运费' + '￥' + postage + '</span>'); //设置弹出层商品价格
        $('input[name="alias"]').val(alias); //设置弹出层商品别名
        $('input[name="goodsid"]').val(id); //设置弹出层商品ID
        event.preventDefault();
        $('.cd-popup').addClass('is-visible');
		$.post('/Goods/standard.html', {
			'id': id,
			'operation': 'standard'
		}, function (data) {
			$('.loader').fadeOut(500);
			$('.standard-list').html(data).fadeIn(1000);
		});
		$('.standard-ul label').click(function () {
			$('.popup-goods-price .price').html('￥' + $(this).data('price'));
		});
        return false;
    });
    //关闭弹出层
    $('.cd-popup').on('click',
    function(event) {
        if ($(event.target).is('.cd-popup-close') || $(event.target).is('.cd-popup')) {
            $('body').removeClass('hidden');
            event.preventDefault();
            $(this).removeClass('is-visible');
        }
    });
    $(document).keyup(function(event) {
        if (event.which == '27') {
            $('body').removeClass('hidden');
            $('.cd-popup').removeClass('is-visible');
        }
    });
});

//加入购物车
$('.addToCart').click(function (){
	$.post('/', {
		'id': $(this).data('id'),
		'operation': 'add'
	}, function () {
		alertFloat('加入购物车成功');
	});
});

//屏幕宽度改变时宽度大于768px跳转至访问错误页面
$(window).resize(function() {
    if ($(window).width() > 768) {
        window.location.href = '/';
    }
});

//弹出浮层
function alertFloat(title) {
	if (title) {
		$("#show_mes").html(title);
	}
	$('body').addClass('hidden');
	$("#alertFloat").show(0);
	setTimeout(function () {
		$("#alertFloat").hide(0);
		$('body').removeClass('hidden');
	}, 1500);
}

//省市县三级联动选择
function showLocation(province, city, town) {
    var loc = new Location();
    var title = ['省份', '地级市', '市、县、区'];
    $.each(title, function (k, v) {
        title[k] = '<option value="">' + v + '</option>';
    })
 
    $('#loc_province').append(title[0]);
    $('#loc_city').append(title[1]);
    $('#loc_town').append(title[2]);
 
 
    $('#loc_province').change(function () {
        $('#loc_city').empty();
        $('#loc_city').append(title[1]);
        loc.fillOption('loc_city', '0,' + $('#loc_province').val());
        $('#loc_town').empty();
        $('#loc_town').append(title[2]);
        //$('input[@name=location_id]').val($(this).val());
    })
 
    $('#loc_city').change(function () {
        $('#loc_town').empty();
        $('#loc_town').append(title[2]);
        loc.fillOption('loc_town', '0,' + $('#loc_province').val() + ',' + $('#loc_city').val());
        //$('input[@name=location_id]').val($(this).val());
    })
 
    $('#loc_town').change(function () {
        $('input[name=location_id]').val($(this).val());
    })
 
    if (province) {
        loc.fillOption('loc_province', '0', province);
 
        if (city) {
            loc.fillOption('loc_city', '0,' + province, city);
 
            if (town) {
                loc.fillOption('loc_town', '0,' + province + ',' + city, town);
            }
        }
 
    } else {
        loc.fillOption('loc_province', '0');
    }
}