class SelectionsController < CopingsController
  before_action :set_coping_list

  # 全項目から5つコーピング項目をランダムで抽出する
  def shuffle
    @selected_copings = @coping_list.copings.sample(5)
    render :select
  end

  # 履歴より評価値の平均値を計算、平均値の高い順に5つコーピング項目を抽出する
  def high_rate
    high_rate_copings = Coping.joins(:histories).where(coping_list_id: @coping_list.id).group(:id).limit(5).order('average_evaluation desc').average(:evaluation).keys
    @selected_copings = @coping_list.copings.find(high_rate_copings)
    render :select
  end

  # 履歴がひとつもないコーピング項目から5つランダムで抽出する
  def never_done
    @selected_copings = @coping_list.copings.left_joins(:histories).where(histories: { id: nil }).sample(5)
    if @selected_copings.empty?
      redirect_to shuffle_coping_list_copings_path(@coping_list), notice: '全て実行済みのため全項目からランダムで表示しました'
    else
      render :select
    end
  end
end