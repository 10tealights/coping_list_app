class CopingListsController < ApplicationController
  before_action :set_coping_list, only: %i[edit destroy histories]

  def index
    @coping_lists = current_user.coping_lists
  end

  def new
    @coping_list = CopingList.new
  end

  def create
    @coping_list = current_user.coping_lists.build(coping_list_params)
    if @coping_list.save
      redirect_to(coping_lists_url, notice: t('defaults.message.created', item: CopingList.model_name.human))
    else
      flash[:alert] = t('defaults.message.not_created', item: CopingList.model_name.human)
      render :new
    end
  end

  def edit; end

  def destroy
    @coping_list.destroy
    redirect_to(coping_lists_path, notice: t('defaults.message.deleted', item: CopingList.model_name.human))
  end

  def histories
    @histories = History.joins(:coping).where(copings: { coping_list_id: @coping_list.id }).order(created_at: :desc)
  end

  private

  def coping_list_params
    params.require(:coping_list).permit(:list_name)
  end

  def set_coping_list
    @coping_list = current_user.coping_lists.find(params[:id])
  end
end