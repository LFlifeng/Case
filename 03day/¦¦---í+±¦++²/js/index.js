// 1.点击 > 把左侧选中的option追加到右侧
$('#toRight').click(function(){
    var $left = $('#selLeft option:selected').prop('selected',true);
    $left.appendTo('#selRight').prop('selected',false);
});
// 2.点击< 把右侧选中的option追加到左侧
$('#toLeft').click(function(){
    var $right = $('#selRight option:selected').prop('selected',true);
    $right.appendTo('#selLeft').prop('selected',false);
});
// 3.点击>> 把右侧全选中的option追加到左侧
$('#allToRight').click(function(){
    var $left = $('#selLeft option').prop('selected',true);
    $left.appendTo('#selRight').prop('selected',false);
});
// 4.点击<< 把左侧全选中的option追加到右侧
$('#allToLeft').click(function(){
    var $right = $('#selRight option').prop('selected',true);
    $right.appendTo('#selLeft').prop('selected',false);
});