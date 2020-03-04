$(function () {
    // 1.鼠标移入wrap时，显示左右箭头
    $('.wrap').mouseover(function () {
        $('.arrow').css('opacity', 1);
    });
    // 2.鼠标离开wrap时，隐藏左右箭头
    $('.wrap').mouseout(function () {
        $('.arrow').css('opacity', 0);
    });
    // 3.定义一个数组，存放图片类名
    var classAry = ['slide1', 'slide2', 'slide3', 'slide4', 'slide5'];
    // 找到需要切换的项
    var $list = $('.wrap>.slide>ul>li');
    // 4.上一张，点击左箭头
    $('#arrLeft').click(function () {
        // 4.1取出数组第一项
        var first = classAry.shift();
        // 4.2放到数组最后一项
        classAry.push(first);
        // 循环遍历需要切换的项，然后依次切换类名
        for (var i = 0; i < $list.length; i++) {
            $list[i].className = classAry[i];
        }
    });
    // 5.下一张，点击右箭头
    $('#arrRight').click(function () {
        // 5.1取出数组最后一项
        var last = classAry.pop();
        // 5.2放到数组第一项
        classAry.unshift(last);
        // 循环遍历需要切换的项，然后依次切换类名
        for (var i = 0; i < $list.length; i++) {
            // $list[i].className = classAry[i];
            $($list).eq(i).removeClass().addClass(classAry[i]);
        }
    });


    
});
