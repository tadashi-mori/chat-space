class GroupsController < ApplicationController

  def index
    @group = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to :root, notice: "グループを作成しました。"
    else
      render :new
    end
  end

  def edit
    @group = Group.find_by(params[:id])
  end

  def update
    @group = Group.find_by(params[:id])
    if @group.save
      redirect_to :root, notice: "グループを編集しました。"
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name,{user_ids: []})
  end

end
