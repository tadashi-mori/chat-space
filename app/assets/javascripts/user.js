$(function() {

  var users_list = $('#user-search-result');


// #インクリメンタルサーチのhtmlを定義
function searchUser(user) {
  var html = `<div class="chat-group-user clearfix">
               <p class="chat-group-user__name">${user.name}</p>
               <a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id=${user.id} data-user-name=${user.name}>追加</a>
              </div>`

  users_list.append(html);
}


 function message(message){
  var html = `<div class="chat-group-user clearfix">
               <p class="chat-group-user__name">${message}</p>
              </div>`

  users_list.append(html);
 }

// ＃インクルメンタルリサーチ
  $("#user-search-field").on("keyup", function() {
    var input = $("#user-search-field").val();


    $.ajax({
      type: 'GET',
      url: '/users/',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(users) {
      $("#user-search-result").empty();
      if (users.length !== 0) {
        users.forEach(function(user){
          var val = this[users];
          console.log(users, val);
          searchUser(user);
        });
      }
      else{
        message("一致するユーザーはいません");
      }
    })
    .fail(function(){
     alert("error")
    })
  });
});
