$(document).ready((function(){$.ajaxSetup({headers:{"X-CSRF-TOKEN":$('meta[name="csrf-token"]').attr("content")}}),$(document).on("click",".btn-action-favorite-post",(function(t){t.preventDefault();var o=$(t.currentTarget);""!==o.data("login-id")&&void 0!==o.data("login-id")?$.ajax({type:"POST",cache:!1,url:o.data("url"),data:{post_id:o.data("post-id"),type:o.hasClass("post-bookmarked")?"remove":"add"},success:function(t){o.toggleClass("background8 post-bookmarked")},error:function(t){}}):window.showAlert("alert-success","Before you can add this post to your favorites, you must first log in!")}))}));
