class CopingsController < ApplicationController
  before_action :set_coping_list, only: %i[index new create show others copy]

  def index
    @copings = @coping_list.copings
  end

  def new
    @coping = @coping_list.copings.build
  end

  def create
    @coping = @coping_list.copings.build(coping_params)
    if @coping.save
      redirect_to coping_list_copings_path(@coping_list), notice: 'Coping was successfully created.'
    else
      render :new
    end
  end

  def show
    @coping = @coping_list.copings.find(params[:id])
  end

  def others
    @other_copings = Coping.eager_load(coping_list: :user).where.not(user: { id: current_user.id }).where.not(status: 'close').sample(10)
  end

  def copy
    @other_coping = Coping.find(params[:coping_id])
    @coping = @coping_list.copings.build(coping_name: @other_coping.coping_name, cost_amount: @other_coping.cost_amount, time_amount: @other_coping.time_amount, emoji: @other_coping.emoji)
    render :new
  end

  private

  def coping_params
    params.require(:coping).permit(:coping_name, :cost_amount, :time_amount, :emoji, :status)
  end

  def set_coping_list
    @coping_list = current_user.coping_lists.find(params[:coping_list_id])
  end
end
