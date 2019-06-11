$(function(){
    // 1.鼠标进入一级菜单后，显示二级菜单
    $('.wrap>ul>li>a').mouseover(function(){
        $(this).siblings('ul').show();
    });
    // 2.鼠标离开一级菜单后，隐藏二级菜单
    $('.wrap>ul>li>a').mouseout(function(){
        $(this).next().hide();
    });
    // 3.鼠标进入二级菜单，显示二级菜单
    $('.wrap>ul>li>ul').mouseover(function(){
        $(this).show();
    });
    // 4.鼠标离开二级菜单，隐藏二级菜单
    $('.wrap>ul>li>ul').mouseout(function(){
        $(this).hide();
    });
});