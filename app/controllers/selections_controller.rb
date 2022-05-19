class SelectionsController < CopingsController
  before_action :set_coping_list

  # 全項目から5つコーピング項目をランダムで抽出する
  def shuffle
    @selected_copings = @coping_list.copings.sample(5)
    render :select
  end

  # 履歴より評価値の平均値を計算、平均値の高い順に5つコーピング項目を抽出する
  # 抽出されたものがなかった場合は全項目からシャッフルする処理へリダイレクトする
  def high_rate
    high_rate_copings = Coping.high_avarage_rate(@coping_list).keys
    @selected_copings = @coping_list.copings.find(high_rate_copings)
    if @selected_copings.empty?
      redirect_to coping_list_shuffle_path(@coping_list), notice: '履歴がないため全項目からランダムで表示しました'
    else
      render :select
    end
  end

  # 履歴がひとつもないコーピング項目から5つランダムで抽出する
  # 抽出されたものがなかった場合は全項目からシャッフルする処理へリダイレクトする
  def never_done
    @selected_copings = @coping_list.copings.no_histories
    if @selected_copings.empty?
      redirect_to coping_list_shuffle_path(@coping_list), notice: '全て実行済みのため全項目からランダムで表示しました'
    else
      render :select
    end
  end
end