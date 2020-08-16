// 現在の日時表示
function showClock() {
  let nowTime = new Date();
  let nowYear = nowTime.getFullYear();
  let nowMonth = nowTime.getMonth() + 1;
  let nowDate = nowTime.getDate();
  let week = ["日", "月", "火", "水", "木", "金", "土"]
  let wday = week[nowTime.getDay()];
  let nowHour = nowTime.getHours();
  let nowMin = nowTime.getMinutes();
  let nowSec = nowTime.getSeconds();
  let msg = "現在の日時は、" + nowYear + "年" + nowMonth + "月" + nowDate + "日" + "(" + wday + ")" + nowHour + "時" + nowMin + "分" + nowSec + "秒です。";
  document.getElementById("Realtime").innerHTML = msg;
}
setInterval('showClock()', 1000);

// フラッシュメッセージ表示時間設定
$(function() {
  setTimeout("$('.alert_message').fadeOut('slow')", 1500);
})

$(function() {
  setTimeout("$('#error_explanation').fadeOut('slow')", 5000);
})

$(function() {
  setTimeout("$('.error_explanation').fadeOut('slow')", 5000);
})

// top画面のアニメーション
// タイトル
window.onload = function() {
  scroll_effect();
  $('.fadein').hide().fadeIn(7000);

  $(window).scroll(function(){
   scroll_effect();
  });

  function scroll_effect(){
   $('.effect-fade').each(function(){
    var elemPos = $(this).offset().top;
    var scroll = $(window).scrollTop();
    var windowHeight = $(window).height();
    if (scroll > elemPos - windowHeight){
     $(this).addClass('effect-scroll');
    }
   });
   $('.effect-submit').each(function(){
    var elemPos = $(this).offset().top;
    var scroll = $(window).scrollTop();
    var windowHeight = $(window).height();
    if (scroll > elemPos - windowHeight){
     $(this).addClass('effect-scroll');
    }
   });
  }
};

// 説明文
