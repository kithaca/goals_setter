class GoalsController < ApplicationController

  before_action :require_logged_in!

  def index

  end

  def new

  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def show
    @goal = Goal.find_by_id(params[:id])
  end

  private
  def goal_params
    params.require(:goal).permit(:title, :details, :visible, :completed)
  end

end
