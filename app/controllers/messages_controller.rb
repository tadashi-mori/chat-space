class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.where("group_id")
  end

  def create
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @messages = Message.where("group_id")
    @message = Message.new(message_params)
    if @message.save
      redirect_to action: :index, notice: "メッセージを送信しました"
    else
      render :index, notice: "メッセージを入力してください"
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
