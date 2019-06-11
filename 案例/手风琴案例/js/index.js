$(function () {
    $('.parentWrap>.menuGroup>.groupTitle').click(function () {
        $(this).next().show();
        $(this).parent().siblings().children('div').hide();
    });
});