// 设置li的背景图片
var ary = ['../img/fq1.jpg','../img/fq2.jpg','../img/fq3.jpg','../img/fq4.jpg','../img/fq5.jpg'];

// 遍历数组，取得每一个图片的路径，设置为对应li的背景图片
ary.forEach(function(item,index){
    $('#box li')
    .eq(index)
    .css('background','url(' + item + ')');
});


// 给所有的li注册mouseover事件
// 让当前的li的宽度为800，其他的为100
$('#box li').mouseover(function(){
    $(this).stop()
    .animate({
        width: 800
    })
    .siblings()
    .stop()
    .animate({
        width: 100
    });
});


// 给ul注册mouseout事件
// 让所有li宽度为240
$('#box ul').mouseout(function(){
    $('li',this).stop().animate({
        width: 240
    });
});