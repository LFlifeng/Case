var arr = ['.jia', '.dian', '.fu'];
arr.forEach(function(item, index) {
  $('.subnav ul li')
    .eq(index)
    .click(function() {
      // ��ҳ���������Ӧ��¥��
      $('html,body').animate({
        scrollTop: $(item).offset().top
      });
    });
});
