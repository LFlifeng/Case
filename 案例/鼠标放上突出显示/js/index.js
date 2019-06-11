$(function () {
    // 1.鼠标移入一个li标签，使其突出显示，其余li标签半透明
    $('.wrap>ul>li').mouseover(function () {
        $(this).css('opacity', 1).siblings('li').css('opacity', 0.5);
    });
    // 2.鼠标离开ul标签时，li标签均显示
    $('.wrap>ul').mouseout(function () {
        $(this).find('li').css('opacity', 1);
    });
});