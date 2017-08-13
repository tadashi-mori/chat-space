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
      flash[:notice] = "メッセージを送信しました。"
      redirect_to action: :index
    else
      flash[:alert] = "メッセージを入力してください"
      redirect_to action: :index
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
