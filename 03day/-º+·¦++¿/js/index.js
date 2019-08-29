// 后台数据
// 表头数据
var heads = ['姓名', '年龄', '学科', '分数'];
// 表体数据
var bodys = [
  { sName: '雷军', age: 20, subject: '语文', grade: 88 },
  { sName: '米尔', age: 21, subject: '语文', grade: 98 },
  { sName: '俊儿', age: 20, subject: '语文', grade: 89 },
  { sName: '雷尔', age: 19, subject: '语文', grade: 94 }
];

// 创建thead
var $thead = $('<thead></thead>');
var $headTr = $('<tr></tr>');
heads.forEach(function (item) {
  var $th = $('<th></th>');
  $th.text(item);
  $th.appendTo($headTr);
});
//将tr追加到thead里
$headTr.appendTo($thead);
$thead.appendTo($('table'));

// 创建tbody
var $tbody = $('<tbody></tbody>');
bodys.forEach(function (item) {
  var $bodyTr = $('<tr></tr>');
  
  for (key in item) {
    var $td = $('<td></td>');
    $td.text(item[key]);
    $td.appendTo($bodyTr);
  }
  //将tr追加到tbody里
  $bodyTr.appendTo($tbody);
});
$tbody.appendTo($('table'));
