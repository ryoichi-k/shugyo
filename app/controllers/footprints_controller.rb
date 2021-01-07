class FootprintsController < ApplicationController
  def new
    @footprint = Footprint.new
  end

  def show

  end

  #足跡の新規登録
  def create
    @footprint = Footprint.new(footprint_params.merge(user_id: current_user.id))
    if @footprint.save
      redirect_to @footprint, notice: "タスク「足跡を登録しました。」"
    else
      redirect_to "#", notice: "タスク「足跡を登録できませんでした。」"  
    end
  end

  private
  def footprint_params
    params.require(:footprint).permit(:content,:references)
  end
end
