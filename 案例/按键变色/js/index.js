$(document).keydown(function(e) {
    // 给span输入按下的键值
    $('#keyCodeSpan').text(e.keyCode);
    // 根据keycode的值的变化div的背景颜色随着变化
    switch(e.keyCode) {
    case 66: $('#bgChange').css('background-color', 'blue'); break;
    case 71: $('#bgChange').css('background-color', 'green'); break;
    case 82: $('#bgChange').css('background-color', 'red'); break;
    default : $('#bgChange').css('background-color', ''); break;
    }
});