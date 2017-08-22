$(function(){
  function buildHTML(message){
    // var insertHTML = '';
    var html = `<div class="middle__message clearfix" data-id="${message.id}">
                   <div class="message__nickname">${message.user_name}</div>
                   <div class="message__date">${message.created_at}</div>
                `
    if (message.body){
        html += `<div class="message__comment">${message.body}</div>`
    }
    if (message.image){
        html += `<div class="message__comment"><img src=${message.image}></div>`
    }
    html += '</div>'
    return html;
  }

  function appendHTML(html){

      $('.middle').animate({scrollTop: $('.middle')[0].scrollHeight}, 'fast');
  }

  function flash() {
    var html =
      `<p class="alert alert-notice">メッセージを送信しました</p>`
    $('.alert').append(html);
    $('.alert-notice').fadeIn(500).fadeOut(2000);
    setTimeout(function(){
     $('.alert-notice').remove();
    },2500);
  }

 $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')

    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })

    .done(function(data){
      var html = buildHTML(data);
      appendHTML(html);
      $('.middle').append(html);
      $('#new_message')[0].reset();
      flash();
    })

    .fail(function() {
      alert('error');
    });
    return false;
  });

 // #メッセージの自動更新
 if(window.location.href.match(/messages/)){
  setInterval(function(){
    var last_id = $('.middle__message').last().data("id");
    $.ajax({
      type: 'GET',
      url: window.location.href,
      data: {id: last_id},
      dataType : 'json'
    })

    .done(function(data) {
      console.log(data);
      data.messages.forEach(function(message){
        if(message.id > last_id){
          var insertHTML = '';
          insertHTML += buildHTML(message);
        }
        $('.middle').append(insertHTML);
         $('.middle').animate({scrollTop: $('.middle')[0].scrollHeight}, 'fast');
      });
    })

    .fail(function(data){
      alert('自動更新に失敗しました');
    });
  }, 5000);
 }

});
