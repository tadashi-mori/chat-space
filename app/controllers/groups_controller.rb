class GroupsController < ApplicationController

  before_action :hoge, only:[:edit, :update]

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


  def hoge
     @group = Group.find_by(params[:id])
  end

  def edit

  end

  def update
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
