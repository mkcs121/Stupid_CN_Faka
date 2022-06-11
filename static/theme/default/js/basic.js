/* 
* @Author: Administrator
* @Date:   2018-01-09 10:55:28
* @Last Modified by:   Administrator
* @Last Modified time: 2018-02-26 18:03:48
*/
// 页面初始化
$(function () {
	// 模拟 radio checkbox  样式
	proxyInput();
    // 登录页面
    oneScreen();
});
$(window).on('resize', function () {
    oneScreen();
})
function oneScreen () {
    var winH = $(window).height() - 35;
    if (winH<680) {
        $('#screen').css('height','680px');
    } else {
        $('#screen').css('height',winH+'px');
    }
}
/*模拟 radio checkbox  样式  注意label 的for属性 与  radio checkbox  一一对应； start*/
function proxyInput(){
    $('.proxyinput [type="radio"]').each(function(index, el) {
        if($(this).prop("checked")){
            var proxyinput=$(this).closest('.proxyinput');
            var radioArr=$(this).closest('.proxyinput-group');
            $('.proxyinput',radioArr).removeClass('checked');
            $(proxyinput).addClass('checked');
        }
    });
    $('.proxyinput [type="radio"]').off('click');
    $('.proxyinput [type="radio"]').on('click', function(event) {
        var proxyinput=$(this).closest('.proxyinput');
        var radioArr=$(this).closest('.proxyinput-group');
        var checkedcancel=$(this).hasClass('checkedcancel');
        if(!checkedcancel){
            if($(radioArr).hasClass('radiocancel')){
                //可取消radio radiocancel
                if($(proxyinput).hasClass('checked')){
                    $('.proxyinput',radioArr).removeClass('checked');
                    $(this).prop('checked',false);
                }else{
                    $('.proxyinput',radioArr).removeClass('checked');
                    $(proxyinput).addClass('checked');
                }
            }else{
                //普通radio
                $('.proxyinput',radioArr).removeClass('checked');
                $(proxyinput).addClass('checked');
            }
        }

    });
    $('.proxyinput [type="checkbox"]').each(function(index, el) {
        if($(this).prop("checked")){
            var proxyinput=$(this).closest('.proxyinput');
            $(proxyinput).addClass('checked');
        }

    });
    /*.proxyinput_group 可以设置 maxlength="3"*/
    $('.proxyinput [type="checkbox"]').off('click');
    $('.proxyinput [type="checkbox"]').on('click', function(event) {
        var checkboxArr=$(this).closest('.proxyinput-group');
        var proxyinput=$(this).closest('.proxyinput');
        var maxselectcount=$(checkboxArr).attr('maxselectcount');
        if($(this).prop("checked")){
            if(maxselectcount){
                maxselectcount=parseInt(maxselectcount);
                var checkCount=$('.proxyinput [type="checkbox"]:checked',checkboxArr).length;
                if(checkCount>maxselectcount){
                    $(this).prop("checked",false);
                    //小提示层;
                    validatePop({
                        "popconMsg":'最多选择'+maxselectcount+'个'
                    });
                }else{
                    $(proxyinput).addClass('checked');
                }
            }else{
                $(proxyinput).addClass('checked');
            }
        }else{
            $(proxyinput).removeClass('checked');
        }
    });
}