$(function(){


  $('.dictionary-top').offset({top: 0,left: 0});


//タブをブラウザ幅に合わせて動かす考え方
//タブの幅　＊　タブの数で全タブの幅を計算
//ブラウザの幅が全タブの幅を超えた時に
//下の段に押しやる　

  var dictionarySingleTop = 0;





//  ログイン情報の表示
 $('.dictionary-heading').click(function(){
    $(this).find('.menu-bar').animate({'left':'0px'},100);

  });

//  postのiconを表示
  $('.icon-hanger').hover(
    function(){
      $(this).find('.icon-hanger-open').show();
    }
  //  function(){
  //    $(this).find('.icon-hanger-open').fadeOut(200);
  //  }hideするとモーダルが消えるバグあり
);

//　メニュー

var $menu = $('.menu');
var menuClick = false;

$menu.offset({
  top: -40,
  left:0
 });

 $menu.find('p').click(function(){
   if (menuClick == false) {
     $menu.offset({
       top: 0
     });
     menuClick = true;
   } else {
     $menu.offset({
       top: -40,
       left: 0
     });
     menuClick = false
   }
  });


//　ブラウザリサイズに影響するもの
$(window).on('load resize', function() {
  var windowWidth = window.innerWidth;
  var $searchForm = $('.search-form');
  var searchFormleft =  windowWidth -120;
  var searchFormClick = false;


//　検索フィールド
  $searchForm.offset({
    top: -30,
    left:searchFormleft
  });



  $searchForm.find('p').click(function(){
    if (searchFormClick == false) {
      $searchForm.offset({
        top: 0
      });
      searchFormClick = true;
    } else {
      $searchForm.offset({
        top: -30,
        left:searchFormleft
      });
      searchFormClick = false
    }
   });



//
   //  タブを並べる
    var rowTag = 0;//タグの列初期化
    var tag = $('.hidden').find('h4').text();//@Dictionaryを読み込む：選択している辞書
    var  choiseTag = 0;//選択しているタグ（辞書）用変数:初期化
    var tabNumber = $('.dictionary-single').length;//タブの数を数える
    dictionarySingleTop = $('.dictionary-single').offset().top;//タブの縦位置を取得
    var dictionarySingleLeft = $('.dictionary-single').offset().left;//タブの横位置を取得
    var choiseTagDepth = new Array(tabNumber);//タブの数だけ
    var tagStyle = new Array(tabNumber);//タグのスタイル取得用変数


//  if (windowWidth < dictionarySingleLeft + (tabNumber * 155)) {//タブに行を作るためのif文
//　/タブ数
  //}
//タブに行を作るためのfor文
    for (var i = 0;i < tabNumber; i++) {//タブを一つずつ並べる作業
     var lineUpTag = $('.dictionary-single').eq(i).find('h6').text();//
      tagStyle[i] = $('.dictionary-single').eq(i).find('h5').text();//タグのスタイル取得用変数
     if ( lineUpTag == tag) {//タグが選ばれたタグなら（選択中の辞書なら）
         choiseTag += 10;//タグの位置　+10下に　（タグが押し込まれてるように表示）
       }else {//選択されてないタグは
         choiseTag = 0;//タグの位置　デフォルト
       }
       choiseTagDepth[i] = dictionarySingleTop + choiseTag;//
      $('.dictionary-single').eq(i).offset({top: choiseTagDepth[i],left: dictionarySingleLeft + (i * 155)});//タグを並べている確信のコード

     if (tagStyle[i] == "1"){//タグのスタイルが１だった場合
         $('.dictionary-single').eq(i).css('background-color','#dddde4');//
       } else
       if (tagStyle[i] == "0"){//タグのスタイルが０だった場合
         $('.dictionary-single').eq(i).css('background-color','#caafaf');//
       } else {
         $('.dictionary-single').eq(i).css('background-color','#b0c4de');//
       }
     }
//タブに行を作るためのfor文終わり
//}//タブに行を作るためのif文終わり

       $('.head-bar').offset({top: dictionarySingleTop + 30,left: 0});//ここもタブ行ができれば変わる

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








});//　ブラウザリサイズに影響するもの終わり
　






var style = $('.display-hidden').find('p').text();

 if (style == 0){
   $('.display-base').removeClass('style-2').addClass('style-1');
 } else {
   $('.display-base ').removeClass('style-1').addClass('style-2');
 }

 $('.display-base').addClass('base-style');


$('.head-bar').offset({top:dictionarySingleTop + 50});
$('.display-base').offset({top:dictionarySingleTop + 30});
$('.main-table').offset({top:dictionarySingleTop + 60});




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
