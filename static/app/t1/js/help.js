$(function(){
	var height= $(document).height()
	$('header').css('height',height)
	$('.help_box li').hover(function(){
		$(this).find('h5').css('border','1px solid #2B7FF7')
		$(this).find('h5').addClass('animated jello')
		$(this).find('.help_tix_t').css('color','#2B7FF7')
	},function(){
		$(this).find('h5').css('border','1px solid #999')
		$(this).find('.help_tix_t').css('color','#333')
		$(this).find('h5').removeClass('animated jello')
	})
})