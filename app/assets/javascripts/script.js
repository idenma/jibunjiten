$(function(){

//  タブを並べる
 var tag = $('.hidden').find('h4').text();
 var  choiseTag = 0;
 var tabNumber = $('.dictionary-single').length;
 var dictionarySingleTop = $('.dictionary-single').offset().top;
 var dictionarySingleLeft = $('.dictionary-single').offset().left;
 var choiseTagDepth = new Array(tabNumber);
 var tagStyle = new Array(tabNumber);


 for (var i = 0;i < tabNumber; i++) {
  var lineUpTag = $('.dictionary-single').eq(i).find('h6').text();
   tagStyle[i] = $('.dictionary-single').eq(i).find('h5').text();
  if ( lineUpTag == tag) {
      choiseTag += 10;
    }else {
      choiseTag = 0;
    }
    choiseTagDepth[i] = dictionarySingleTop + choiseTag;
   $('.dictionary-single').eq(i).offset({top: choiseTagDepth[i],left: dictionarySingleLeft + (i * 155)});

  if (tagStyle[i] == "1"){
      $('.dictionary-single').eq(i).css('background-color','#dddde4');
    } else
    if (tagStyle[i] == "0"){
      $('.dictionary-single').eq(i).css('background-color','#caafaf');
    } else {
      $('.dictionary-single').eq(i).css('background-color','#b0c4de');
    }
  }



//  タブを飛び上がらせる
  $('.dictionary-single').hover(
    function(){

 $(this).animate({
   top:"20px",
   height:"40px"
   },100);
  },
    function(){

      var dictionarySingleEq = $('.dictionary-single').index($(this));
      var choiseTagHeight = choiseTagDepth[dictionarySingleEq];
      $(this).animate({
        top:choiseTagHeight,
        height:"30px"
        },100);

    });

//  ログイン情報の表示
　$('.dictionary-heading').click(function(){
    $(this).find('.menu-bar').animate({'left':'0px'},100);

  });



  var contentWidth = $('.content-pack').innerWidth() ;//+  $('.child_content_2').innerWidth();
  $('.right-text').width(contentWidth);




var style = $('.display-hidden').find('p').text();

 if (style == 0){
   $('.display-base').removeClass('style-2').addClass('style-1');
 } else {
   $('.display-base ').removeClass('style-1').addClass('style-2');
 }

 $('.display-base').addClass('base-style');


$('.head-bar').offset({top:dictionarySingleTop + 30});



$('.edit-modal-open').click(function(){
$(this).find('.edit-modal').css("display","flex");
$('textarea').text().replace(/(\n)/, "&#13;");
});

$('.modal-close').click(function(){
  $('.edit-modal').fadeOut();
});



$('.submit').on('click', function(){
  if($('.input-dictionary').val() === ''){
    alert('検索項目を入力してください');
    $(this).focus();
    return false;
  }
});

$('.flash').fadeOut(3000);

$('.dictionaries_new_modal').find('.edit-modal').fadeIn();

 });

 $(window).load(function(){

});
