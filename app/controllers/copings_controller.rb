class CopingsController < ApplicationController
  before_action :set_coping_list, only: %i[index new create show]

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

  private

  def coping_params
    params.require(:coping).permit(:coping_name, :cost_amount, :time_amount, :emoji, :status)
  end

  def set_coping_list
    @coping_list = current_user.coping_lists.find(params[:coping_list_id])
  end
end
