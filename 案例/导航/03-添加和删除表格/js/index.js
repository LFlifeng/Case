// 1.点击添加数据按钮，显示遮盖层和添加窗口
$('.btnAdd').click(function () {
  $('.mask').fadeIn();
  $('#j_formAdd').fadeIn();
});
// 2.点击 X 关闭遮盖层和添加窗口
$('#j_hideFormAdd').click(function () {
  $('.mask').fadeOut();
  $('#j_formAdd').fadeOut();
});
// 3.点击添加按钮
$('#j_btnAdd').click(function () {
  var lesson = $('#j_txtLesson').val();  //获取文本框的值
  var school = $('#j_txtBelSch').val();
  //判断文本框是否输入内容
  if (lesson === '' || school === '') {
    alert('请填完整数据');
  } else {
    // 动态创建tr
    var $tr = $(
      '<tr>' +
      '<td>' + lesson + '</td>' +
      '<td>' + school + '</td>' +
      '<td><a href="javascrip:;" class="get">delete</a></td>' +
      '</tr>'
    );// 将tr追加到表格中第一行，且隐藏遮盖层
    $tr.prependTo('#j_tb');
    // 触发事件
    $('#j_hideFormAdd').click();
    //清空文本框
    $('#j_txtLesson').val('');
    $('#j_txtBelSch').val('');
    $tr.find('.get').click(function () {
      $(this).parent().parent().remove();
      return false;
    });
  }
});



// 4.点击删除按钮，删除对应的行
$('.get').click(function () {
  $(this).parent().parent().remove();
  return false;
});
