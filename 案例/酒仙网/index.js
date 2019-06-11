// 1. 获取一组li
var lis = document.querySelectorAll('.tab-control li');
// 2. 获取一组div显示项
var divs = document.querySelectorAll('.tab-content-item');
// 3. for循环遍历给每一个li注册一个点击事件，给每一个li添加一个index属性，表示li的下标
for (var i = 0; i < lis.length; i++) {
  // 3.1 给每一个li添加一个index属性
  lis[i].index = i;
  // 3.2 注册事件
  lis[i].onclick = function () {
    // 4. 在事件处理程序中，① 切换li  ② 切换div
    // 4.1 循环遍历去掉所有li 和 所有div的类名active
    for (var j = 0; j < lis.length; j++) {
      lis[j].className = '';
      divs[j].className = 'tab-content-item';
    }
    // 4.2 给当前点击的li添加类名active
    this.className = 'active';
    // 4.3 获取当前点击的li的下标
    var num = this.index;
    // 找到对应的div项，显示
    divs[num].className = 'tab-content-item active';

  };
}
