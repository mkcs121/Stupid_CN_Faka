jQuery(function($) {

//indexkefu	
    var _girls = {en: ['en_1', 'en_2', 'en_3', 'en_4'],
        de: ['de_1', 'de_2', 'de_3', 'de_4'],
        es: ['es_1', 'es_2', 'es_3', 'es_4'],
        ru: ['ru_1', 'ru_2', 'ru_3', 'ru_4'],
        fr: ['fr_1', 'fr_2', 'fr_3', 'fr_4'],
        it: ['it_1', 'it_2', 'it_3', 'it_4'],
        pl: ['pl_1', 'pl_2', 'pl_3', 'pl_4'],
        tr: ['tr_1', 'tr_2', 'tr_3', 'tr_4'],
        zh: ['cn_1', 'cn_2', 'cn_3', 'cn_4', 'cn_5'],
        pt: ['br_1', 'br_2', 'br_3', 'br_4', 'br_5']};
    var config = {
        lc_goToEnChat: '.js-go-to-en-chat',
        container: '.js-livechat-girl',
        girlImageHolder: '.js-girl-holder',
        girlImage: '.girl',
        girlImageHover: 'girl_hover',
        livechatBoard: '.js-live-chat-board',
        livechatBoardClose: '.js-lc-board-close',
        livechatGirlHint: '.js-livechat-hint',
        randomGirlName: ''
    };


function getRandomGirl(){
    var a = '/images/chat-girls/',
	b = 'zh', 
	c = 'en';
    b in _girls && (c = b);
    b = _girls[c];
    c = Math.floor(Math.random() * b.length);
    config.randomGirlName = b[c];
    return 'http://www.mobanvip.com' + a + b[c] + '.png'
};

    $(config.container).removeClass('js-none').delay(500).queue(function() {
        $(config.container).addClass('animated').dequeue()
    }.bind(this));
    var a = getRandomGirl()
      , b = $('<img/>', {
        'class': 'girl js-girl-image',
        'src': a
    });
    $(config.container).find(config.girlImageHolder).prepend(b);
	$(config.container).attr("id", "lc-girl-block-" + config.randomGirlName);
    startAnimation();
    $(config.container).on('mouseover', '.girl', function() {
        showHintMessage()
    }.bind(this)).on('mouseout', '.girl', function() {
        hideHintMessage()
    }.bind(this));
	
function changeImageOnHover() {
    var a = $(config.container).find(config.girlImage)
      , b = $(a).clone().addClass('girl_smiling')
      , c = config.girlImageHover;
    b.attr('src', function(a, b) {
        return b.replace('chat-presales', 'chat-presales/smile')
    });
    $(this.config.container).find(this.config.girlImageHolder).prepend(b);
    a.on('mouseover', a, function() {
        a.hasClass(c) || $(a).addClass(c)
    }
    .bind(this)).on('mouseleave', a, function() {
        a.hasClass(c) && $(a).removeClass(c)
    }
    .bind(this))
};
function startAnimation() {
    function a() {
        b.toggleClass('animated');
        return setInterval(function() {
            b.toggleClass('animated')
        }, 5E3)
    }
    var b = $('.js-animated-circles');
    setTimeout(function() {
        showHintMessage();
        setTimeout(function() {
            hideHintMessage();
            this.animaTimer0 = setTimeout(function() {
                this.animaTimer = a()
            }
            .bind(this), 1E4)
        }
        .bind(this), 5E3)
    }
    .bind(this), 1E3);
};
function showHintMessage() {
    var a = $(config.livechatGirlHint);
    this.hintHideTimer && clearTimeout(this.hintHideTimer);
    a.show();
    this.hintShowTimer = setTimeout(function() {
        a.removeClass('hide_hint').addClass('show_hint')
    }, 100)
};
function hideHintMessage() {
    var a = $(config.livechatGirlHint);
    this.hintShowTimer && clearTimeout(this.hintShowTimer);
    this.hintHideTimer = setTimeout(function() {
        a.addClass('hide_hint').delay(250).queue(function() {
            a.removeClass('show_hint').hide().dequeue()
        }
        .bind(this))
    }, 100)
};
//indexkefu end

});

//banner
var MU=function(){function a(){var a=window.particlesJS;a&&(a("banner",c))}var b=!!window.HTMLCanvasElement,c={particles:{number:{value:20,density:{enable:!0,value_area:1E3}},color:{value:"#e1e1e1"},shape:{type:"circle",stroke:{width:0,color:"#000000"},polygon:{nb_sides:5},image:{src:"img/github.svg",width:100,height:100}},opacity:{value:.5,random:!1,anim:{enable:!1,speed:1,opacity_min:.1,sync:!1}},size:{value:15,random:!0,anim:{enable:!1,
speed:180,size_min:.1,sync:!1}},line_linked:{enable:!0,distance:650,color:"#cfcfcf",opacity:.26,width:1},move:{enable:!0,speed:2,direction:"none",random:!0,straight:!1,out_mode:"out",bounce:!1,attract:{enable:!1,rotateX:600,rotateY:1200}}},interactivity:{detect_on:"canvas",events:{onhover:{enable:!1,mode:"repulse"},onclick:{enable:!1,mode:"push"},resize:!0},modes:{grab:{distance:400,line_linked:{opacity:1}},bubble:{distance:400,size:40,duration:2,opacity:8,speed:3},repulse:{distance:200,duration:.4},
push:{particles_nb:4},remove:{particles_nb:2}}},retina_detect:!0};(0,window.$)(function(){b&&window.$.ajax({url:"/mobanvip/default/js/particles.js",dataType:"script",cache:!0}).then(a)})};MU();

