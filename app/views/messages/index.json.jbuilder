json.messages @messages.each do |message|
 json.body       message.body
 json.image      message.image.url
 json.user_name  message.user.name
 json.extract!   message, :created_at
 json.id         message.id

end
