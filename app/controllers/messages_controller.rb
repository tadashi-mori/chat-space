class MessagesController < ApplicationController

  before_action :group_content, only:[:index, :create]

  def index
    @groups = current_user.groups
    @message = Message.new
    @messages = @group.messages.includes(:user)
    respond_to do |format|
      format.html
      format.json {
        @messages = Message.where("id > ?", params[:id])
      }
    end
  end

  def create
    @groups = current_user.groups
    @message = current_user.messages.new(message_params)
    @messages = @group.messages.includes(:user)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, notice: "メッセージの作成に成功しました" }
        format.json
      end
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
