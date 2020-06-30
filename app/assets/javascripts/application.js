// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery/dist/jquery.js
//= require bootstrap/dist/js/bootstrap.min
//= require_tree .

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
