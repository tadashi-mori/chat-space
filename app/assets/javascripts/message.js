$(function(){
  function buildHTML(message){
    var html = `<div class="middle__message.clearfix">
                   <div class="message__nickname">${message.user_name}</div>
                   <div class="message__date">${message.created_at}</div>
                </div>`

    if (message.body){
        html += `<div class="message__comment">${message.body}</div>`
    }

    if (message.image){
        html += `<div class="message__comment"><img src=${message.image}></div>`
    }

        html += `</div></div>`

    return html;
  }

  function appendHTML(html){
      $('.middle').append(html);
      $('.message').val('');
      $('.file').val('');
      $('.middle').animate({scrollTop: $('.middle')[0].scrollHeight}, 'fast');
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
    })

    .fail(function() {
      alert('error');
    });
    return false;
  });
});
