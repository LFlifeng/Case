
function getTime(S, E) {
    // 获取开始时间
    var start = S;
    // 获取结束时间
    var end = E;
    // 计算时间差（毫秒差）
    var num = end - start;
    // 换算时间
    // 1.小时
    var h = parseInt(num / 1000 / 60 / 60);
    h = h < 10 ? '0' + h : h;
    // 2.分钟
    var m = parseInt(num / 1000 / 60 % 60);
    m = m < 10 ? '0' + m : m;
    // 3.秒
    var s = parseInt(num / 1000 % 60);
    s = s < 10 ? '0' + s : s;
    return { hour: h, minute: m, seconds: s };
};
var S = new Date();
var E = new Date('2018/9/19 18:0:0');
var o = getTime(S, E);


// 1.获取一组div元素
var divs = document.querySelectorAll('div');
// 2.把计算好的时间差的时分秒分别赋值给每一个div的内容
divs[0].innerText = o.hour;
divs[1].innerText = o.minute;
divs[2].innerText = o.seconds;
// 3.产生一个定时器
var tmp = setInterval(function () {
    // 3.1重新计算
    var S = new Date();
    var E = new Date('2018/9/19 18:0:0');
    var o = getTime(S, E);

    // 3.2重新赋值
    divs[0].innerText = o.hour;
    divs[1].innerText = o.minute;
    divs[2].innerText = o.seconds;
    // 3.3到达时间后，停止定时器
    if (o.hour == '00' && o.minute == '00' && o.seconds == '00') {
        clearInterval(tmp);
    }
}, 1000);
