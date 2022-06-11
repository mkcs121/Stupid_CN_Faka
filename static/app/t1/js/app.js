$(function(){
	var height= $(document).height()
	$('header').css('height',height)
	$('.app_lf').addClass('animated bounceInLeft')
	$('.app_rg').addClass('animated bounceInRight')
	//1秒后移除动画  文本上有动画的时候会模糊字体，必须要去掉
	setTimeout(function(){
		$('.app_lf').removeClass('animated bounceInLeft')
		$('.app_rg').removeClass('animated bounceInRight')
	},1000)

})