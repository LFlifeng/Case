// 1.当页面滚动的时候，获取页面滚动出去的距离
$(window).scroll(function () {
  // 获取页面滚动出去的距离
  var scrollTop = $(window).scrollTop();
  // console.log(scrollTop);
  // 判断页面滚动出去的距离 > 0  显示电梯导航，否则隐藏电梯导航
  if (scrollTop > 0) {
    $('.subnav').show();
  } else {
    $('.subnav').hide();
  }
  // 3.当页面滚动时，获取每一楼层在文档中纵坐标
  // 如果页面滚动出去的距离 > 对应楼层在文档中纵坐标
  // 则让电梯导航对应的项高亮显示，其它项取消高亮显示     (从高到低)
  if(scrollTop>=$('.mei').offset().top){
    $('.subnav li:eq(3)')
    .addClass('current')
    .siblings()
    .removeClass('current');
  }else if(scrollTop>=$('.fu').offset().top){
    $('.subnav li:eq(2)')
    .addClass('current')
    .siblings()
    .removeClass('current');
  }else if(scrollTop>=$('.dian').offset().top){
    $('.subnav li:eq(1)')
    .addClass('current')
    .siblings()
    .removeClass('current');
  }else if(scrollTop>=$('.jia').offset().top){
    $('.subnav li:eq(0)')
    .addClass('current')
    .siblings()
    .removeClass('current');
  }else{
    $('.subnav li').removeClass('current');
  }
});


// 2.点击返回按钮，以动画的方式，回到顶部
$('.subnav .back').click(function () {
  $('html,body').animate({
    scrollTop: 0
  }, 200);
});


// 4.点击电梯导航对应的项，让页面以动画的方式滚动到对应楼层的位置
$('.subnav li:eq(0)').click(function () {
  $('html,body').animate({
    scrollTop: $('.jia').offset().top
  }, 200);
});
$('.subnav li:eq(1)').click(function () {
  $('html,body').animate({
    scrollTop: $('.dian').offset().top
  }, 200);
});
$('.subnav li:eq(2)').click(function () {
  $('html,body').animate({
    scrollTop: $('.fu').offset().top
  }, 200);
});
$('.subnav li:eq(3)').click(function () {
  $('html,body').animate({
    scrollTop: $('.mei').offset().top
  }, 200);
});