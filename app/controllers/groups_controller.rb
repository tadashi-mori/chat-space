class GroupsController < ApplicationController

  before_action :group_content, only:[:edit, :update]

  def index
    @groups = current_user.groups
    @message = Message.new
  end

  def new
    @group = Group.new
  end

  def create
    @groups = Group.new(group_params)
    if @groups.save
      redirect_to :root, notice: "グループを作成しました。"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @group.update(group_params)
      redirect_to :root, notice: "グループを編集しました。"
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name,{user_ids:[]})
  end

  def group_content
     @group = Group.find(params[:id])
  end

end
