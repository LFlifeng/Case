// 1.当页面滚动的时候，获取页面滚动出去的距离
$(window).scroll(function () {
    // 获取页面滚动出去的距离
    var scrollTop = $(window).scrollTop();
    // 当滚动出去的距离 >0 让header添加fixed样式，且让回到顶部按钮显示
    if(scrollTop > 0){
        $('.header').addClass('fixed');
        $('.to-top').show();
    }else{
    // 当滚动出去的距离 =0 让header移除fixed样式，且让回到顶部按钮隐藏
        $('.header').removeClass('fixed');
        $('.to-top').hide();
    }
});

// 2.点击回到顶部按钮，让文档以动画的方式回到顶部
$('.to-top').click(function(){
    $('html,body').animate({       //html、body  与window的区别？？？？
    },300);
});
