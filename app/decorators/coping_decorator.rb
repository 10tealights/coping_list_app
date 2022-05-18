class CopingDecorator < Draper::Decorator
  delegate_all

  # 金額をカンマありの表示にする
  def cost_with_comma
    cost_amount.to_s(:delimited) if cost_amount.present?
  end
end