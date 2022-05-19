class HistoriesController < ApplicationController
  before_action :set_coping_list_and_coping, only: %i[index new create]

  def index
    @histories = @coping.histories.includes(:coping).order(created_at: :desc)
  end

  def new
    @history = History.new
  end

  def create
    @history = @coping.histories.build(history_params)
    if @history.save
      redirect_to(coping_list_coping_histories_path(@coping_list, @coping), notice: t('defaults.message.created', item: History.model_name.human))
    else
      flash[:alert] = t('defaults.message.not_created', item: History.model_name.human)
      render :new
    end
  end

  def destroy
    @history = History.find(params[:id])
    coping_list = CopingList.find(@history.coping.coping_list_id)
    @history.destroy
    redirect_to(histories_coping_list_path(coping_list), notice: t('defaults.message.deleted', item: History.model_name.human))
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