var arr = ['.jia', '.dian', '.fu'];
arr.forEach(function(item, index) {
  $('.subnav ul li')
    .eq(index)
    .click(function() {
      // 让页面滚动到对应的楼层
      $('html,body').animate({
        scrollTop: $(item).offset().top
      });
    });
});
