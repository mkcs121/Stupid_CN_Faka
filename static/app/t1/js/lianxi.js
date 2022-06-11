$(function(){
	var height= $(document).height()
	$('header').css('height',height)
	$('.help_box li').hover(function(){
		$(this).find('.lianxi_img').addClass('animated bounceIn')
	},function(){
		$(this).find('.lianxi_img').removeClass('animated bounceIn')
	})
	$('h3').addClass('animated bounceInDown')
	$('h6').addClass('animated bounceInDown')
	//1秒后移除动画  文本上有动画的时候会模糊字体，必须要去掉
	setTimeout(function(){
		$('h3').removeClass('animated bounceInDown')
		$('p').removeClass('animated bounceInDown')
	},1000)
})
