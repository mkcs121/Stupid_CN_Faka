var username_str = /^[a-zA-Z]{1}[a-zA-Z0-9_]{5,17}$/;
var phone_str = /^1(3|4|5|7|8)\d{9}$/;
var email_str = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
var qq_str = /^[1-9]{1}[0-9]{4,13}$/;
var url_str = /^(https?\:\/\/)?[\-\w]+(\.[\-\w]+)+(\:\d+)?(\/[a-zA-Z0-9+\/?&=%#._\-,]*)?$/;

$(document).ready(function() {
	bootbox.setDefaults('locale','zh_CN');
	$('input, textarea').placeholder();
	/*POST*/
	$('form').submit(function(e){
		var methods = $(this).attr('method'),
		ids = $(this).attr('id');
		if(typeof(ids)==='undefined'){
			if(typeof(methods)==='undefined'){
				methods = 'get';
			};
			if(methods.toLowerCase()=='post'){
				e.preventDefault();
				$.ajax({
					url : $(this).attr('action'),
					type : 'POST',
					dataType : 'json',
					data: $(this).serialize(),
					success : function(result){
					    if (result.Msg != '') {
							bootbox.alert(result.Msg);
						}
						if(result['Url']!=''  && typeof(result['Url'])!='undefined'){
							window.location.href = result['Url'];
						}
					}
				});
				return false;
			}
			return true;
		}
	});

	/*根据分辨率调整菜单*/
	if ($(this).width() < 769) {
		$('body').addClass('body-small')
	} else {
		$('body').removeClass('body-small')
	}

	/*左侧菜单*/
	$('.navbar-minimalize').click(function () {
		var body = $('body');
		body.toggleClass("mini-navbar");
		SmoothlyMenu();
	});

	$('.nav-second-level').each(function(){
		$(this).find('li.active').parent().addClass('in');
		$(this).find('li.active').parent().parent().addClass('active');
	});

	/*全选*/
	$(document).on('click', '#check-all', function() {
		var op = $(this).is(':checked');
		if(op==true){
			$('[type=checkbox]').prop('checked', true);
		} else {
			$('[type=checkbox]').prop('checked', false);
		}
	});

	/*table项目点击*/
	$(document).on('click', '.table tbody tr', function() {
		$('.table tbody tr').removeAttr('id');
		$(this).attr('id','clicked');
	});
});

$(window).bind("resize", function () {
	if ($(this).width() < 769) {
		$('body').addClass('body-small')
	} else {
		$('body').removeClass('body-small')
	}
});

/*单页显示条目*/
var page_size = function(){
	var u = window.location.href,
	sz = $('#sz').val(),
	url = '';

	if(u.indexOf('sz=') > 0 ) {
		url = u.replace(/sz=\d+/g, 'sz='+sz);
	} else {
		if(u.indexOf('=') > 0 ) {
			url = u + '&sz=' + sz;
		} else {
			url = u + '?sz=' + sz;
		}
	}
	//console.log(url);
	window.location.href = url;
}

/*删除和批量删除*/
var del_all=function(id,url){
	var ids = [];
	if(id>0){
		ids[0] = id;
	}else{
		var arr = $('input[name="id[]"]:checked');
		for (var i=0;i<arr.length;i++){
			ids[i] = arr[i].value;
		}
	}

	if(ids.length==0){
		bootbox.alert('请选择需要删除的条目');
		return false;
	}

	bootbox.confirm(
		'是否要删除选中的条目？',
		function(result){
			if (result) {
				window.location.href = url+ '?ids='+ ids;
				// $("#myModal").modal({
				// 	remote : url+ '?ids='+ ids
				// });
			}
		}
	);
};

function SmoothlyMenu() {
	if (!$('body').hasClass('mini-navbar') || $('body').hasClass('body-small')) {
		$('#side-menu').hide();
		setTimeout(
			function () {
				$('#side-menu').fadeIn(400);
			}, 200);
	} else if ($('body').hasClass('fixed-sidebar')) {
		$('#side-menu').hide();
		setTimeout(
			function () {
				$('#side-menu').fadeIn(400);
			}, 100);
	} else {
		$('#side-menu').removeAttr('style');
	}
}

$('.modal').on('hide.bs.modal', function(){
	$(this).removeData('bs.modal');
	$(this).find('.modal-content').html('');
})
.on('hidden.bs.modal', function () {
	$(this).removeData('bs.modal');
	$(this).find('.modal-content').html('');
})
.on('show.bs.modal', function () {
	//
})
.on('shown.bs.modal', function () {
	// $(this).find('.modal-dialog').dynamicDraggable({
	// 	handle: ".modal-header"
	// });
});

var Interval_control;
var timeout = 120;
var runtimeout = function() {
	if (timeout == 1) {
		$('#btn').removeClass('btn-default').addClass('btn-info').removeAttr('disabled').html('获取验证码');
		clearInterval(Interval_control);
		return false;
	}
	timeout = timeout - 1;
	$('#btn').html(timeout + ' 秒后重发');
}
var isrun = function() {
	$('#btn').removeClass('btn-info').addClass('btn-default').attr('disabled',true);
	Interval_control = window.setInterval(runtimeout, 1000);
}

var Interval_control2;
var timeout2 = 120;
var runtimeout2 = function () {
    if (timeout2 == 1) {
        $('#btn2').removeClass('btn-default').addClass('btn-info').removeAttr('disabled').html('获取验证码');
        clearInterval(Interval_control2);
        return false;
    }
    timeout2 = timeout2 - 1;
    $('#btn2').html(timeout2 + ' 秒后重发');
}
var isrun2 = function () {
    $('#btn2').removeClass('btn-info').addClass('btn-default').attr('disabled', true);
    Interval_control2 = window.setInterval(runtimeout2, 1000);
}

var SendSms = function(phone, act){
	$.ajax({
		url : '/User/User/SendSms',
		type : 'POST',
		dataType : 'json',
		data: {'phone':phone,'act':act},
		success: function (result) {
		    if (result.Status == true) {
		        bootbox.alert(result.Msg);
		        if (act == "change_phone2") {
		            timeout2 = 120;
		            isrun2();
		        } else {
		            timeout = 120;
		            isrun();
		        }
		    } else {
		        bootbox.alert(result.Msg);
		    }
		}
	});
}

var SendEmail = function (email, act) {
	$.ajax({
	    url: '/User/User/SendEmail',
		type : 'POST',
		dataType : 'json',
		data: {'email':email,'act':act},
		success : function(result){
		    if (result.Status == true) {
		        bootbox.alert(result.Msg);
				timeout = 120;
				isrun();
			}else{
		        bootbox.alert(result.Msg);
			}
		}
	});
}