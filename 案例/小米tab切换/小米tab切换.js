//获取一组列表li
var lists = document.querySelectorAll('.box .list li');
//获取内容显示项
var contents = document.querySelectorAll('.box .content p');
//for循环遍历给每一个li注册一个点击事件，给每一个li添加一个index属性，表示li的下标
for (var i = 0; i < lists.length; i++) {
	//给每一个li添加一个index属性
	lists[i].index = i;
	//注册事件
	lists[i].onmouseenter = function () {
		//在事件处理程序中，① 切换li  ② 切换p内容
		//给当前的li添加类名active
		this.className = 'active';
		//获取当前点击的li的下标
		var num = this.index;
		// 找到对应的p内容项，显示
		contents[num].className = 'active';
	};
	lists[i].onmouseleave = function () {
		//在事件处理程序中，① 切换li  ② 切换p内容
		//给当前的li去除类名active
		this.className = '';
		//获取当前的li的下标
		var num = this.index;
		// 找到对应的p内容项，不显示
		contents[num].className = '';
	};
	contents[i].onmouseenter = function () {
		this.className = 'active';
		// var num = this.index;
		// lists[num].className = 'active';
	};
	contents[i].onmouseleave = function () {
		this.className = '';
	};
}





