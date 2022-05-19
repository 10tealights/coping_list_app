module ApplicationHelper
  def page_title(page_title = '')
    base_title = "Copin'"
    page_title.empty? ? base_title : page_title + ' | ' + base_title
  end
  
  # 各ページの説明文　120文字前後
  def full_description(page_description = '')
    base_description = "Copin'(コーピン)はコーピングリストを簡単に、複数作成できるサービスです。コーピング(coping)とは「ストレス対処」のこと。ストレス対策や気分転換、気晴らしの方法をリスト化して、いつでも見られるようにしませんか？"
    if page_description.empty?
      base_description
    else
      page_description
    end
  end
  
  # 各ページの説明文 50文字前後
  def og_description(page_description = '')
    base_description = "Copin'はコーピング(ストレス対処)リストを簡単に複数作成できるサービスです。"
    if page_description.empty?
      base_description
    else
      page_description
    end
  end
  
  # 各ページのイメージ画像
  def og_image(page_image = '')
    base_image = image_url('copin_ogp.jpg')
    if page_image.empty?
      base_image
    else
      page_image
    end
  end
end