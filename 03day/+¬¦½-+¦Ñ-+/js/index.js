// 记录当前的索引，默认为0
var index = 0;
// 找到图片最大的索引值
var max = $('.slider li').length - 1;

// 下一张
// 找到当前图片，让当前图片fadeout，找到下一张fadein
// 给右侧箭头注册点击事件
$('.arrow-right').click(function(){
  $('.slider li')
  .eq(index)
  .fadeOut();  //当前的淡出
  if(index < max){
    index++;
  }else{
    index = 0;
  }
  $('.slider li')
  .eq(index)
  .fadeIn();   //下一张淡入
});


// 上一张
// 给左侧箭头注册点击事件
$('.arrow-left').click(function(){
  $('.slider li')
  .eq(index)
  .fadeOut();  //当前的淡出
  if(index > 0){
    index--;
  }else{
    index = max;
  }
  $('.slider li')
  .eq(index)
  .fadeIn();   //下一张淡入
});