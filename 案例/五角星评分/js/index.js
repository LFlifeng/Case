var wjx_k = '☆';
var wjx_s = '★';
$('.comment li').hover(function(){
    // 鼠标经过，让当前li和之前的li 都设置为实星星, 当前li之后的所有li 设置为空星星
    $(this)
    .text(wjx_s)
    .prevAll()
    .text(wjx_s)
    .end()
    .nextAll()
    .text(wjx_k);
},function(){
    // 鼠标离开，让所有li都设置为 空星星
    $('.comment li').text(wjx_k);
    // 设置标记class的项，和之前的项都为实星星
    $('.now')
    .text(wjx_s)
    .prevAll()
    .text(wjx_s);
});
// 鼠标点击时
$('.comment li').click(function(){
    // 记录当前li，设置一个自定义的类样式(作为标识)
    $(this)
    .addClass('now')
    .siblings()
    .removeClass('now');
});