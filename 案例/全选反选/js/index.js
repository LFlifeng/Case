// $(function () {
//     // 1.点击全选，下面复选框均选中
//     $('#j_cbAll').click(function () {
//         $('#j_tb input[type]')
//             .prop('checked', $(this).prop('checked'));
//     });
//     // 2.点击下面复选框，控制全选框是否被选中
//     $('#j_tb input[type]').click(function(){
//         var length = $('#j_tb input[type=checkbox]').length;    //可以省略"=checkbox"
//         var ckLength = $('#j_tb input[type=checkbox]:checked').length;     //可以省略"=checkbox"
//         $('#j_cbAll')
//             .prop('checked',length == ckLength);
//     });
// });


$(function(){
    // 1.点击全选按钮，下面复选框均选中
    $('#j_cbAll').click(function () {
        console.log($("#j_tb input[type]"))
        $("#j_tb input[type]").prop('checked', $(this).prop('checked'));
    });
    // 2.点击复选框，控制全选框是否被选中
    $("#j_tb input[type]").click(function () {
        var length = $("#j_tb input[type=checkbox]").length;
        console.log(length)
        var cklength = $("#j_tb input[type=checkbox]:checked").length;
        console.log(cklength)
        $("#j_cbAll").prop('checked', length === cklength);
    });
});