$(function(){
	//输入框焦点 变色换图
    $('.name').focus(function () {
        $('.name').css({
            'background': '#1E7AF6 url(/Skin/Home/YYSkin/images/name1.png) no-repeat',
            'background-size': '23px 23px',
            'background-position': '15px center',
            'color': '#fff'
        }).addClass('fff');
    });
    $('.name').blur(function () {
        $('.name').css({
            'background': '#F1F1F1 url(/Skin/Home/YYSkin/images/name.png) no-repeat',
            'background-size': '23px 23px',
            'background-position': '15px center',
            'color': '#333'
        }).removeClass('fff')
    });
    $('.password').focus(function () {
        $('.password').css({
            'background': '#1E7AF6 url(/Skin/Home/YYSkin/images/password.png) no-repeat',
            'background-size': '23px 23px',
            'background-position': '15px center',
            'color': "#fff"
        }).addClass('fff')
    });
    $('.password').blur(function () {
        $('.password').css({
            'background': '#F1F1F1 url(/Skin/Home/YYSkin/images/password1.png) no-repeat',
            'background-size': '23px 23px',
            'color': "#333",
            'background-position': '15px center'
        }).removeClass('fff')
    });
    $('.verifycode').focus(function () {
        $('.verifycode').css({
            'background': '#1E7AF6 url(/Skin/Home/YYSkin/images/password.png) no-repeat',
            'background-size': '23px 23px',
            'background-position': '15px center',
            'color': "#fff",
            'width':'160px'
        }).addClass('fff')
    });
    $('.verifycode').blur(function () {
        $('.verifycode').css({
            'background': '#F1F1F1 url(/Skin/Home/YYSkin/images/password1.png) no-repeat',
            'background-size': '23px 23px',
            'color': "#333",
            'background-position': '15px center',
            'width': '160px'
        }).removeClass('fff')
    });
	//动画  
	//banner 动画
	$('.banner h3').addClass('animated bounceInLeft')
	$('.banner p').addClass('animated bounceInRight')
	//1秒后移除动画  文本上有动画的时候会模糊字体，必须要去掉
	setTimeout(function(){
		$('.banner h3').removeClass('animated bounceInLeft')
		$('.banner p').removeClass('animated bounceInRight')
	},1000)
	$('.details').hover(function(){
		$(this).addClass('animated rubberBand')
	},function(){
		$(this).removeClass('animated rubberBand')		
	})
	$('.information p').hover(function(){
		$(this).addClass('animated swing')
	},function(){
		$(this).removeClass('animated swing')		
	})
	//优势
	$('.advantage li').hover(function(){
		$(this).find('img').addClass('animated flash')
	},function(){
		$(this).find('img').removeClass('animated flash')		
	})
})
