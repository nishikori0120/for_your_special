$(window).on('load scroll', function(){
  if ($(window).scrollTop() > 200) {
    $('.cegJMn').fadeIn(300);
   } else {
    $('.cegJMn').fadeOut(300);
   }

});

$(function() {
  var nav = $('.nav');
  //表示位置
  var navTop = nav.offset().top+600;
  //ナビゲーションの高さ（シャドウの分だけ足してます）
  var navHeight = nav.height()+10;
  var showFlag = false;
  nav.css('top', -navHeight+'px');
  //ナビゲーションの位置まできたら表示
  $(window).on('load scroll', function () {
      var winTop = $(this).scrollTop();
      if (winTop >= navTop) {
          if (showFlag == false) {
              showFlag = true;
              nav
                  .addClass('fixed')
                  .stop().animate({'top' : '0px'}, 200);
          }
      } else if (winTop <= navTop) {
          if (showFlag) {
              showFlag = false;
              nav.stop().animate({'top' : -navHeight+'px'}, 200, function(){
                  nav.removeClass('fixed');
              });
          }
      }
  });
});