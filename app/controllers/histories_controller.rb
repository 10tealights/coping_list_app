class HistoriesController < ApplicationController
  before_action :set_coping_list_and_coping

  def index
    @histories = @coping.histories.includes(:coping).order(created_at: :desc)
  end

  def new
    @history = History.new
  end

  def create
    @history = @coping.histories.build(history_params)
    if @history.save
      redirect_to coping_list_coping_histories_path(@coping_list, @coping), notice: 'History is successfully created.'
    else
      render :new
    end

  end

  private

  def history_params
    params.require(:history).permit(:change_amount, :evaluation, :note)
  end

  def set_coping_list_and_coping
    @coping_list = current_user.coping_lists.find(params[:coping_list_id])
    @coping = @coping_list.copings.find(params[:coping_id])
  end
end
