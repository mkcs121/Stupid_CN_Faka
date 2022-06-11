$(function(){
			$('.type_qh .lanco').click(function(){
				$('.type_qh .huico').css({'color':'#aaa'});
				$('.type_qh .huico').find('span').css({'width':'0'});
				$(this).css({'color':'#1b66ff'});
				$(this).find('span').css({'width':'93%'});
				$('#index .gong_gao .gong_leng').hide();
				$('#index .gong_gao .gong_leng:nth-child(-n+4)').show();
			})
			$('.type_qh .huico').click(function(){
				$('.type_qh .lanco').css({'color':'#aaa'});
				$('.type_qh .lanco').find('span').css({'width':'0'});
				$(this).css({'color':'#1b66ff'});
				$(this).find('span').css({'width':'93%'});
				$('#index .gong_gao .gong_leng').hide();
				$('#index .gong_gao .gong_leng:nth-child(n+5)').show();
				
			})
		})
