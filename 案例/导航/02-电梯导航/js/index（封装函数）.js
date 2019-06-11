$(window).scroll(function () {
  console.log($(window).scrollTop());
  if ($(window).scrollTop() > 0){
    $('.subnav').show(400);
  }else{
    $('.subnav').hide(400);
  }
  if ($(window).scrollTop() + 2 >= getOffsetTop('.mei')){
    effect(3);
  } else if ($(window).scrollTop() + 2  >= getOffsetTop('.fu')){
    effect(2);
  } else if ($(window).scrollTop() + 2 >= getOffsetTop('.dian')){
    effect(1);
  } else if ($(window).scrollTop() + 2 >= getOffsetTop('.jia')){
    effect(0);
  } else {
    $('.subnav > ul > li').removeClass('current');
  }
});
btnClick(0 , '.jia');
btnClick(1 , '.dian');
btnClick(2 , '.fu');
btnClick(3 , '.mei');


function effect(index){ //为下标为index的元素添加currnet
  $('.subnav > ul > li').eq(index).addClass('current').siblings().removeClass('current');
};
function getOffsetTop(ele){  //获取元素的offsetTop
  return $(ele).offset().top;
}

function btnClick (index , ele) { //index 第几个按钮 ele->获取元素的offsettop
   $('.subnav > ul > li').eq(index).click(function (){
    $('html , body').animate({
      'scrollTop' : getOffsetTop(ele),
    })
  });
}

$('.back').click(function (){
  $('html , body').animate({
    'scroll-top' : 0
  });
});