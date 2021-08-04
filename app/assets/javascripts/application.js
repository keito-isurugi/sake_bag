//= require rails-ujs
//= require jquery
//= require bootstrap
$(document).on('turbolinks:load', function() {
  $('.jscroll').jscroll({
    nextSelector: 'a[rel=next].page-link', //次に表示させたいページのリンク先
    contentSelector: '.jscroll' //[jscroll]に追加表示させる
  });
});
