class RantsController < ApplicationController
  def index
    @rants = Rant.search(params[:search])
    if @rants.count < 1
      flash.now[:notice] = "These aren't droids you were looking for"
      render :index
    end
  end

  def new
    @rant = Rant.new
  end

  def create
    @rant = Rant.new(rant_params)
    @rant.user_id = current_user.id
    if @rant.save
      redirect_to rants_path, notice: "Rant Successfully Created!"
    else
      render :new
    end
  end

  def edit
    @rant = Rant.find(params[:id])
  end

  private

  def rant_params
    params.require(:rant).permit(:title, :body, :user_id)
  end
end
