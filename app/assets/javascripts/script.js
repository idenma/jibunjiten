$(function(){


  //$('.dictionary-top').offset({top: 0,left: 0});


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

/*

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
*/

//　ブラウザリサイズに影響するもの
$(window).on('load resize', function() {
  var windowWidth = window.innerWidth;
  var $searchForm = $('.search-form');
  var searchFormleft =  windowWidth -120;
  var searchFormClick = false;


//　検索フィールド

/*
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
*/

//
   //  タブを並べる
    var rowTag = 0;//タグの列初期化
    var tag = $('.hidden').find('h4').text();//@Dictionaryを読み込む：選択している辞書
    var  choiseTag = 0;//選択しているタグ（辞書）用変数:初期化
  var tabNumber = $('.dictionary-single').length + 1;//タブの数を数える(+1はnew)
    var choiseTagDepth = new Array(tabNumber);//タブの数だけ
    var tagStyle = new Array(tabNumber);//タグのスタイル取得用変数

    for (var i = 0;i < tabNumber; i++) {//タブを一つずつ並べる作業

     var lineUpTag = $('.dictionary-single').eq(i).find('h6').text();//
      tagStyle[i] = $('.dictionary-single').eq(i).find('h5').text();//タグのスタイル取得用変数
//       tagWidth[i] = $('.dictionary-single').eq(i).width();
     if ( lineUpTag == tag) {//タグが選ばれたタグなら（選択中の辞書なら）
         //choiseTag += 10;//タグの位置　+10下に　（タグが押し込まれてるように表示）
       }else {//選択されてないタグは
        // choiseTag = 0;//タグの位置　デフォルト
       }

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



       //  タブを飛び上がらせる
         $('.dictionary-single').hover(
           function(){
             $(this).find('h6').css("color","red");
         },
           function(){
            // if (tagStyle[i] == "1"){//タグのスタイルが１だった場合
            //     $(this).css('background-color','#dddde4');//
            //   } else
            //   if (tagStyle[i] == "0"){//タグのスタイルが０だった場合
            //     $(this).css('background-color','#caafaf');//
            //   } else {
            //     $(this).css('background-color','#b0c4de');//
            //   }

                       $(this).find('h6').css("color","black");
           });








});//　ブラウザリサイズに影響するもの終わり
　





var style = $('.display-hidden').find('p').text();


 $('.display-base').addClass('base-style');







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
