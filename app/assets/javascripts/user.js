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

// #一致するユーザーはいませんの表示
function message(message){
  var html = `<div class="chat-group-user clearfix">
  <p class="chat-group-user__name">${message}</p>
  </div>`

  users_list.append(html);
}

// ＃追加するメンバーの表示
function addUser(user){
  var add_user    =$('#user_add_result');
  var delete_user =$('#user-search-result');
  var html = `<div class="chat-group-user clearfix js-chat-member" id="chat-group-user-${user.id}">
                <input name="group[user_ids][]" type="hidden" value="${user.id}">
                <p class="chat-group-user__name">${user.name}</p>
                <a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn">削除</a>
              </div>`

  add_user.append(html);
  delete_user.remove();
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


// ＃メンバーの追加機能
$(document).on('click', '.chat-group-user__btn--add',function(){
  var id = $(this).attr('data-user-id');
  var name =$(this).attr('data-user-name');
  var user = {
    id: id,
    name: name
  }
  addUser(user);
});
});
