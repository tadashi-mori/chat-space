class MessagesController < ApplicationController

  before_action :group_content, only:[:index, :create]

  def index
    @groups = current_user.groups
    @message = Message.new
    @messages = @group.messages.includes(:user)
  end

  def create
    @groups = current_user.groups
    @message = current_user.messages.new(message_params)
    @messages = @group.messages.includes(:user)
    if @message.save
      redirect_to action: :index, notice: "メッセージを送信しました"
    else
      render :index, notice: "メッセージを入力してください"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

  def group_content
    @group = Group.find(params[:group_id])
  end
end
