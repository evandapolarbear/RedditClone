class SubsController < ApplicationController
  before_action :require_user, only: [:new, :create, :update, :edit]

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def edit

  end

  def update
    @sub = Sub.find(params[:id])
    @sub.update_attributes(sub_params)
    redirect_to sub_url(@sub)
  end


  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub.id) 
    else
      flash[:errors] = @sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end
end
