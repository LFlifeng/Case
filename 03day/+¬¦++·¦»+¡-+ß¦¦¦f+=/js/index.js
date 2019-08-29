$('button').click(function(){
    $('#bottom').animate({
        bottom: -105
    },function(){
        $('#bottom').addClass('active');
    });
    $('#top').animate({
        bottom: 0
    }).animate({
        right: -325
    },function(){
        $('#top').addClass('active');
    });
    $(this).addClass('tmp');
    
});