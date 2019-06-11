$(function () {
    $('#left > li').mouseover(function () {
      // 获取当前li的索引
      var index = $(this).index();
      $('#center > li:eq('+ index +')').show().siblings().hide();    //拼接字符串来获取索引
    });

    $('#right > li').mouseover(function () {
      var index = $(this).index() + $('#left > li').length;
      $('#center > li').eq(index).show().siblings().hide();
    })
  });